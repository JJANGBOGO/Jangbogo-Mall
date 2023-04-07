package com.jangbogo.mall.controller;


import com.jangbogo.mall.domain.Address;
import com.jangbogo.mall.domain.KakaoLoginBo;
import com.jangbogo.mall.domain.NaverLoginBo;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.jangbogo.mall.domain.User;
import com.jangbogo.mall.service.UserService;
import lombok.Builder;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject; //json.simple이어야 한다.
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class UserController {

    @Autowired
    NaverLoginBo naverLoginBO;

    @Autowired
    KakaoLoginBo kakaoLoginBO;

    OAuth2AccessToken oauthToken;
    JSONObject jsonObj;
    private String apiResult = null;

    @Autowired
    UserService userService;

    //회원탈퇴뷰
    @GetMapping("/withdraw/user")
    public String withdrawUserView(HttpSession session, Model m, Authentication auth) {
        if (auth == null) return "redirect:/login/user";
        m.addAttribute("user", session.getAttribute("user"));
        return "/user/withdraw";
    }

    //회원탈퇴
    @PostMapping("/withdraw/user")
    @ResponseBody
    public String withdrawUser(int idx, String email) {
        String msg = "";
        try {
            log.info("result= " + idx + email);
            if (userService.withdrawUser(idx, email) != 0) {
                msg = "SUCCESS";
            }
        } catch (Exception e) {
            msg = "FAILED";
        }
        return msg;
    }

    //로그인뷰
    @RequestMapping("/login") //꼭 requestMapping
    public String loginUserView(Model m, HttpSession session) {

        String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
        m.addAttribute("urlKakao", kakaoAuthUrl);

        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        m.addAttribute("urlNaver", naverAuthUrl);

        return "login";
    }

    //카카오 로그인
    @GetMapping("/social/kakao")
    public String buildKaKao(HttpSession session, String code, String state, RedirectAttributes rattr) {

        try {
            oauthToken = kakaoLoginBO.getAccessToken(session, code, state);
            apiResult = kakaoLoginBO.getUserProfile(oauthToken);

            jsonObj = getParsedApiResult(apiResult);
            JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");

            String email = (String) response_obj.get("email");

            log.info("email....." + email);

            User user = userService.chkDuplicateEmail(email);

            if (user == null) { //신규
                final int KAKAO = 2;

                user = User.builder()
                        .email(email)
                        .nick_nm(crtNickName())
                        .login_tp_cd(KAKAO)
                        .build();

                log.info("뉴비...." + user);
                int idx = userService.regSocialUser(user);
                user = userService.selectUser(idx);
            } else {
                log.info("이미 존재하는 이메일입니다.");
                userService.updateLoginTm(user.getIdx(), user.getEmail());
            }

            makeAuth(email);
            session.setAttribute("loginService", "kakao"); // 최종 로그인 서비스타입 명시. 같은 이메일, 다른 서비스 로그인 구별
            crtSession(session, user);
            return "redirect:/";
        } catch (Exception e) {
//            예외 발생
            rattr.addFlashAttribute("msg", "LOGIN_ERR"); //로그인 에러
            return "redirect:/login";
        }
    }

    public String crtNickName() { //랜덤 문자열 생성, 소셜 닉네임 생성
        String uuid = "";

        for (int i = 0; i < 12; i++) { // TODO:: 나중에 공통으로 묶기
            uuid += (char) ((Math.random() * 26) + 97);
        }
        return "뉴비_" + uuid;
    }

    //카카오 로그아웃
    @GetMapping("/social/kakao_logout")
    public String kakaoLogout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        session.invalidate();
        deleteAuth(request, response); //인증 삭제
        return "redirect:/";
    }

    @GetMapping("/social/naver")
    public String naverLogin(HttpSession session, String code, String state, RedirectAttributes rattr) {
        try {
            oauthToken = naverLoginBO.getAccessToken(session, code, state);
            apiResult = naverLoginBO.getUserProfile(oauthToken);

            jsonObj = getParsedApiResult(apiResult);
            JSONObject response_obj = (JSONObject) jsonObj.get("response");

            String email = (String) response_obj.get("email");

            log.info("email....." + email);

            User user = userService.chkDuplicateEmail(email);

            if (user == null) { //신규
                final int NAVER = 3;

                user = User.builder()
                        .email(email)
                        .nick_nm(crtNickName())
                        .login_tp_cd(NAVER)
                        .build();

                log.info("뉴비...." + user);
                int idx = userService.regSocialUser(user);
                user = userService.selectUser(idx);
            } else {
                log.info("이미 존재하는 이메일입니다.");
                userService.updateLoginTm(user.getIdx(), user.getEmail()); //ok
            }

            makeAuth(email);
            session.setAttribute("loginService", "naver"); // 최종 로그인 서비스타입 명시. 같은 이메일, 다른 서비스 로그인 구별
            crtSession(session, user);
            return "redirect:/";
        } catch (Exception e) {
//            예외 발생
            rattr.addFlashAttribute("msg", "LOGIN_ERR"); //로그인 에러
            return "redirect:/login";
        }
    }

    //TODO:: 네이버 로그아웃


    public JSONObject getParsedApiResult(String apiResult) throws Exception {
        JSONParser jsonParser = new JSONParser();
        return (JSONObject) jsonParser.parse(apiResult);
    }

    // 인증 생성
    public void makeAuth(Object obj) {
        Authentication authentication =
                new UsernamePasswordAuthenticationToken(obj, null);
        SecurityContext securityContext = SecurityContextHolder.getContext();
        securityContext.setAuthentication(authentication);
    }

    // 로그아웃시 인증 삭제
    public void deleteAuth(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
    }

    // 일반 회원 로그아웃
    @GetMapping("/security_logout")
    public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        session.invalidate();
        deleteAuth(request, response);
        return "redirect:/";
    }

    //가입화면
    @GetMapping("/register/user")
    public String registerUserView() {
        return "/user/register";
    }

    //가입처리
    @PostMapping("/register/user")
    public String registerUser(User user, Address addr, RedirectAttributes rattr) { //validator 추가 TODO
        log.info("user...." + user);
        log.info("addr...." + addr);

        try {
            return "redirect:/login";

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR"); //가입 도중 에러
            return "redirect:/register/user";
        }
    }

    //이메일 중복 체크
    @PostMapping("/chk/duplicate/email")
    @ResponseBody
    public String chkDuplicateEmail(String email) {
        log.info("email...." + email);
        String msg = "DUPLICATE";
        try {
            User user = userService.chkDuplicateEmail(email);
            if (user == null) {
                msg = "OK";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }

    //닉네임 중복 체크
    @PostMapping("/chk/duplicate/nickname")
    @ResponseBody
    public String chkDuplicateNick(String nick_nm) {
        log.info("nick...." + nick_nm);
        String msg = "DUPLICATE";
        try {
            User user = userService.chkDuplicateNick(nick_nm);
            if (user == null) {
                msg = "OK";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }

    @GetMapping("/test/login")
    public String testLogin(HttpSession session) throws Exception {
        User user = userService.selectUser(26);
        session.setAttribute("loginService", "jangbogo");
        crtSession(session, user);
        return "";
    }

    //회원수정전 인증
    @GetMapping("/mypage/user/info")
    public String verifyUserView(HttpSession session) {
        log.info("loginService..." + session.getAttribute("loginService"));
        if (session.getAttribute("loginService") != "jangbogo")
            //일반 로그인이 아닌 경우
            return "/user/verifySocial";

        return "/user/verify";
    }

    //회원수정전 인증
    @PostMapping("/mypage/user/info")
    public String verifyUser(String pwd) {

//        비번이 일치하지 않으면 error와 함께 redirect
//        validator 대신 == ""  비교로 백 유효성 체크
//        일치하면 return "redirect:/mypage/user";
        return "redirect:/mypage/user/info";
    }

    //회원수정뷰
    @GetMapping("/mypage/user")
    public String modifyUserView(HttpSession session) {
        if (session.getAttribute("modify") == null) {
            return "redirect:/mypage/user/info";
        }
        return "user/modfiy";
    }

    //세션 저장
    public void crtSession(HttpSession session, User user) {
        session.setAttribute("idx", user.getIdx());
        session.setAttribute("email", user.getEmail());
        session.setAttribute("nickName", user.getNick_nm());
    }

}
