package com.jangbogo.mall.controller;


import com.jangbogo.mall.domain.KakaoLoginBo;
import com.jangbogo.mall.domain.NaverLoginBo;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.jangbogo.mall.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject; //json.simple이어야 한다.
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    private final String apiResult = null;

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

    //가입
    @GetMapping("/register/user")
    public String registerUserView () {
        return "/user/register";
    }

    //로그인뷰
    @GetMapping("/login/user")
    public String loginUserView() {
        return "login";
    }

    //로그인
    @PostMapping("/login/user")
    public String loginUser() {
//        TODO:: 세션에 유저 정보 저장 필수
        return "redirect:/";
    }
//
//
//    @GetMapping("/social/kakao") //경로 나중에 수정
//    public String buildKaKao(HttpSession session, String code, String state) throws Exception {
//
//        oauthToken = kakaoLoginBO.getAccessToken(session, code, state);
//        apiResult = kakaoLoginBO.getUserProfile(oauthToken);
//
//        jsonObj = getParsedApiResult(apiResult);
//        JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");
//        JSONObject response_obj2 = (JSONObject) response_obj.get("profile");
//
//        String email = (String) response_obj.get("email");
//        String name = (String) response_obj2.get("nickname");
//
////        if (loginService.loadUserByUsername(name) == null) {
////            signUpService.insertUserInfo(name, ""); //빈 문자열도 인코딩해서 비번 막 생긴다.
////        } else {
////            log.info("이미 가입된 사용자입니다.");
////        }
//        makeAuth(name);
//        session.setAttribute("login_type", "kakao");
//        return "redirect:/";
//    }
//
//    @GetMapping("/social/naver")
//    public String callbackNaver(String code, String state, HttpSession session) throws Exception {
//
//        oauthToken = naverLoginBO.getAccessToken(session, code, state);
//        apiResult = naverLoginBO.getUserProfile(oauthToken);
//
//        jsonObj = getParsedApiResult(apiResult);
//        JSONObject response_obj = (JSONObject) jsonObj.get("response");
//
//        String email = (String) response_obj.get("email");
//        String name = (String) response_obj.get("name");
//
////        if (loginService.loadUserByUsername(name) == null) {
////            signUpService.insertUserInfo(name, ""); //빈 문자열도 인코딩해서 비번 막 생긴다.
////        } else {
////            log.info("이미 가입된 사용자입니다.");
////        }
//        makeAuth(name);
//
//        session.setAttribute("login_type", "naver");
//        return "redirect:/";
//    }
//
//    //카카오 로그아웃
//    @GetMapping("/social/kakao_logout")
//    public String kakaoLogout(HttpServletRequest request, HttpServletResponse response) {
//        deleteAuth(request, response);
//        return "redirect:/";
//    }
//
//    public JSONObject getParsedApiResult(String apiResult) throws Exception {
//        JSONParser jsonParser = new JSONParser();
//        return (JSONObject) jsonParser.parse(apiResult);
//    }
//
//    // 인증 생성
//    public void makeAuth(Object obj) {
//        Authentication authentication =
//                new UsernamePasswordAuthenticationToken(obj, null);
//        SecurityContext securityContext = SecurityContextHolder.getContext();
//        securityContext.setAuthentication(authentication);
//    }
//
//    // 로그아웃시 인증 삭제
//    public void deleteAuth(HttpServletRequest request, HttpServletResponse response) {
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        if (auth != null) {
//            new SecurityContextLogoutHandler().logout(request, response, auth);
//        }
//    }
//
//    // 일반 회원 로그아웃
//    @GetMapping("/security_logout")
//    public String logout(HttpServletRequest request, HttpServletResponse response) {
//        deleteAuth(request, response);
//        return "redirect:/";
//    }
//
//    @GetMapping("/user/signup")
//    public String userSignupView() {
//        return "/user/signup";
//    }
//
//    // 회원가입
//    @RequestMapping("/signUpView")
//    public String signUpView(Model model) {
//        return "signUpView";
//    }
//
//    @RequestMapping("/signUp")
//    public String signUp(HttpServletRequest request, Model model) {
////        boolean isInserted = signUpService.insertUserInfo(request.getParameter("id"), request.getParameter("password"));
//        boolean isInserted = true;
//        if (isInserted) return "user/login";
//        else return "signUpView";
//    }
}
