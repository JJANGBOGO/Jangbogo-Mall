package com.jangbogo.mall.controller;


import com.jangbogo.mall.dao.AuthDao;
import com.jangbogo.mall.dao.UserDao;
import com.jangbogo.mall.domain.*;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.jangbogo.mall.service.UserService;
import com.jangbogo.mall.utils.Utils;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject; //json.simple이어야 한다.
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

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

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    @Autowired
    Utils utils;

    @Autowired
    AuthDao authDao;

    @Autowired
    UserDao userDao;

    //회원탈퇴뷰
    @GetMapping("/user/withdraw")
    public String withdrawUserView(HttpSession session, Model m, RedirectAttributes rattr) {
        try {
            int idx = (int) session.getAttribute("idx");
            User user = userService.selectUser(idx);
            m.addAttribute("user", user);
            return "/user/withdraw";

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/";
        }
    }

    //회원탈퇴
    @PostMapping("/user/withdraw")
    public ResponseEntity<String> withdrawUser(int idx, String email, HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
        try {
            if (userService.withdrawUser(idx, email) != 1)
                throw new Exception("withdraw failed");

            return ResponseEntity.ok().body("SUCCESS");

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("FAILED");
        }
    }

    //로그인뷰
    @RequestMapping("/user/login") //꼭 requestMapping
    public String loginUserView(HttpServletRequest req, Model m, HttpSession session, Authentication authentication) {

        String uri = req.getHeader("Referer");
        if (authentication != null) return "redirect:/";

        if (uri != null && !(uri.contains("/user/login") || uri.contains("/user/login_check")))
            req.getSession().setAttribute("prevPage", uri);

        String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
        m.addAttribute("urlKakao", kakaoAuthUrl);

        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        m.addAttribute("urlNaver", naverAuthUrl);

        return "/user/login";
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
            User user = userService.getUserByEmail(email);

            if (user == null) { //신규
                final int KAKAO = 2;

                user = User.builder()
                        .email(email)
                        .nick_nm(crtNickName())
                        .login_tp_cd(KAKAO)
                        .build();

                int idx = userService.regSocialUser(user);
                user = userService.selectUser(idx);
            } else {
                log.info("이미 존재하는 이메일입니다.");
                if (user.getState_cd() == 3) blockSocialUser(user.getState_cd(), rattr); //탈퇴회원의 경우 블락 처리
                userService.updateLoginTm(user.getIdx(), user.getEmail());
            }

            if (makeAuth(user)) {
                session.setAttribute("loginService", "kakao"); // 최종 로그인 서비스타입 명시. 같은 이메일, 다른 서비스 로그인 구별
                crtSession(session, user);
                return "redirect:/";
            } else throw new Exception("auth failed");
        } catch (Exception e) {
            rattr.addFlashAttribute("msg", "LOGIN_ERR"); //로그인 에러
            return "redirect:/user/login";
        }
    }

    public String crtNickName() { //랜덤 문자열 생성, 소셜 닉네임 생성
        return "뉴비_" + utils.createRandomStr();
    }

    //카카오 로그아웃
    @GetMapping("/social/kakao_logout")
    public String kakaoLogout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        return "redirect:/general/logout";
    }

    //네이버 로그인
    @GetMapping("/social/naver")
    public String naverLogin(HttpSession session, String code, String state, RedirectAttributes rattr) {
        try {
            oauthToken = naverLoginBO.getAccessToken(session, code, state);
            apiResult = naverLoginBO.getUserProfile(oauthToken);

            jsonObj = getParsedApiResult(apiResult);
            JSONObject response_obj = (JSONObject) jsonObj.get("response");

            String email = (String) response_obj.get("email");

            User user = userService.getUserByEmail(email);

            if (user == null) { //신규
                final int NAVER = 3;

                user = User.builder()
                        .email(email)
                        .nick_nm(crtNickName())
                        .login_tp_cd(NAVER)
                        .build();

                int idx = userService.regSocialUser(user);
                user = userService.selectUser(idx);
            } else {
                log.info("이미 존재하는 이메일입니다.");
                if (user.getState_cd() == 3) blockSocialUser(user.getState_cd(), rattr); //탈퇴회원의 경우 블락 처리
                userService.updateLoginTm(user.getIdx(), user.getEmail()); //ok
            }

            if (makeAuth(user)) {
                session.setAttribute("loginService", "naver"); // 최종 로그인 서비스타입 명시. 같은 이메일, 다른 서비스 로그인 구별
                crtSession(session, user);
                return "redirect:/";
            } else throw new Exception("auth failed");
        } catch (Exception e) {
            rattr.addFlashAttribute("msg", "LOGIN_ERR"); //로그인 에러
            return "redirect:/user/login";
        }
    }

    //TODO:: 네이버 로그아웃


    //탈퇴한 소셜회원 블락
    public String blockSocialUser(int state, RedirectAttributes rattr) {
        rattr.addFlashAttribute("msg", "UNABLE");
        return "redirect:/";
    }

    public JSONObject getParsedApiResult(String apiResult) throws Exception {
        JSONParser jsonParser = new JSONParser();
        return (JSONObject) jsonParser.parse(apiResult);
    }

    // 인증 생성
    public boolean makeAuth(User user) throws Exception {
        UserDetailsDto dto = userDao.getUserDetailsDto(user.getEmail());

        if (dto == null) return false;
        dto.setAuthority((ArrayList<String>) authDao.getAuthList(user.getAuth_idx()));
        if (dto.getAuthorities() == null) return false; //인증 실패시 null

        Authentication authentication =
                new UsernamePasswordAuthenticationToken(user, null, dto.getAuthorities()); //userDetailsDto.getAuthorities()식으로 권한을 추가해야 함

        log.info("인증..." + authentication + "...." + dto.getAuthorities());
        SecurityContext securityContext = SecurityContextHolder.getContext();
        securityContext.setAuthentication(authentication);
        return true;
    }

    //가입화면
    @GetMapping("/user/register")
    public String registerUserView() {
        return "/user/register";
    }

    //가입처리
    @PostMapping("/user/register")
    public String registerUser(User user, Address addr, RedirectAttributes rattr) {
        log.info("user...." + user);
        log.info("addr...." + addr);

        try {
            if (userService.registerUser(user, addr) != 1)
                throw new Exception("register failed");

            rattr.addFlashAttribute("msg", "REG_OK");
            return "redirect:/user/login";

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR"); //가입 도중 에러
            return "redirect:/user/register";
        }
    }

    //이메일 중복 체크
    @PostMapping("/user/duplicate/email")
    public ResponseEntity<String> chkDuplicateEmail(String email) {
        try {
            String msg = userService.getUserByEmail(email) == null ? "OK" : "DUPLICATE";
            return ResponseEntity.ok().body(msg);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("ERROR");
        }
    }

    //닉네임 중복 체크
    @PostMapping("/user/duplicate/nickname")
    public ResponseEntity<String> chkDuplicateNick(String nick_nm) {
        try {
            String msg = !userService.isNickDuplicated(nick_nm) ? "OK" : "DUPLICATE";
            return ResponseEntity.ok().body(msg);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("ERROR");
        }
    }

    //회원인증뷰
    @GetMapping("/user/info")
    public String verifyUserView(HttpServletRequest req, HttpSession session, Model m) {
        m.addAttribute("mypageUrl", req.getRequestURI());

        String serviceType = (String) session.getAttribute("loginService");
        if (serviceType == "naver" || serviceType == "kakao")
            return "/user/verifySocial";

        session.setAttribute("modify", "OK");
        return "/user/verify";
    }

    //회원수정전 인증
    @PostMapping("/user/info")
    public String verifyUser(String email, String pwd, RedirectAttributes rattr) {
        try {
            if (userService.verifyUser(email, pwd)) return "redirect:/user/modify";
            else {
                //회원 존재X
                rattr.addFlashAttribute("msg", "NOT_FOUND_ERR");
                return "redirect:/user/info";
            }

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/user/info";
        }

    }

    //회원수정뷰
    @GetMapping("/user/modify")
    public String modifyUserView(HttpServletRequest req, HttpSession session, Model m, RedirectAttributes rattr) {
        m.addAttribute("mypageUrl", req.getRequestURI());

        if (session.getAttribute("modify") != "OK") {
            return "redirect:/user/info";
        }
        try {
            int idx = (int) session.getAttribute("idx");
            User user = userService.selectUser(idx);
            m.addAttribute("user", user);
            return "user/modify";

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/";
        }
    }

    @PostMapping("/user/modify")
    public String modifyUser(User user, HttpSession session, RedirectAttributes rattr) {
        try {
            user.setIdx((int) session.getAttribute("idx"));
            if (userService.updateUser(user) != 1)
                throw new Exception("modify failed");

            session.removeAttribute("modify"); //수정 성공시 해당 세션도 삭제
            rattr.addFlashAttribute("msg", "MOD_OK"); // 수정완료 메세지
            return "redirect:/user/info";

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/user/info";
        }
    }

    //세션 저장
    public void crtSession(HttpSession session, User user) {
        session.setAttribute("idx", user.getIdx());
        session.setAttribute("email", user.getEmail());
        session.setAttribute("nickName", user.getNick_nm());
    }

    //이메일 찾기
    @PostMapping("/user/find/email")
    public String findUserEmail(String nick_nm, String pwd, RedirectAttributes rattr) {
        try {
            String email = userService.findUserEmail(nick_nm, pwd);
            if (email == null) {
                rattr.addFlashAttribute("msg", "NOT_FOUND_ERR");
                return "redirect:/find/email";
            }
            rattr.addFlashAttribute("userEmail", email);
            return "redirect:/find/email/success?member=user"; //성공

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/find/email";
        }
    }

    //비번 찾기
    @PostMapping("/user/find/pwd")
    public String findUserPwd(String nick_nm, String email, RedirectAttributes rattr) {
        try {
            if (!userService.isUserPresent(nick_nm, email)) {
                rattr.addFlashAttribute("msg", "NOT_FOUND_ERR");
                return "redirect:/find/pwd";
            }

            if (userService.sendPwdEmail(nick_nm, email) != 1)
                throw new Exception("send mail failed");

            rattr.addFlashAttribute("toEmail", email);
            return "redirect:/find/pwd/success?member=user";

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/find/pwd";
        }
    }
}
