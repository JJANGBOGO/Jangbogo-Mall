//package com.jangbogo.mall.controller;
//
//
//import com.jangbogo.mall.domain.User;
//import com.jangbogo.mall.security.LoginService;
//import com.jangbogo.mall.service.SignUpService;
//import com.jangbogo.mall.domain.KakaoLoginBo;
//import com.jangbogo.mall.domain.NaverLoginBo;
//import com.github.scribejava.core.model.OAuth2AccessToken;
//import lombok.extern.slf4j.Slf4j;
//import org.json.simple.JSONObject; //json.simple이어야 한다.
//import org.json.simple.parser.JSONParser;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContext;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//@Controller
//@Slf4j
//public class UserController {
//
//    @Autowired
//    private SignUpService signUpService;
//
//    @Autowired
//    private LoginService loginService;
//
//    @Autowired
//    NaverLoginBo naverLoginBO;
//
//    @Autowired
//    KakaoLoginBo kakaoLoginBO;
//
//    OAuth2AccessToken oauthToken;
//    JSONObject jsonObj;
//    private String apiResult = null;
//
//    @RequestMapping("/user/login")
//    public String login(Model model, HttpSession session, HttpServletRequest request, Authentication authentication) {
//
//        String uri = request.getHeader("Referer");
//
//        if (authentication != null) return "redirect:/"; //중복 로그인 방지
//
//        if (uri != null && !(uri.contains("/login") || uri.contains("/login_check")))
//            request.getSession().setAttribute("prevPage", uri);
//
//        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//        model.addAttribute("urlNaver", naverAuthUrl);
//
//        String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session);
//        model.addAttribute("urlKakao", kakaoAuthUrl);
//
//        return "user/login";
//    }
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
//        if (loginService.loadUserByUsername(name) == null) {
//            signUpService.insertUserInfo(name, ""); //빈 문자열도 인코딩해서 비번 막 생긴다.
//        } else {
//            log.info("이미 가입된 사용자입니다.");
//        }
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
//        if (loginService.loadUserByUsername(name) == null) {
//            signUpService.insertUserInfo(name, ""); //빈 문자열도 인코딩해서 비번 막 생긴다.
//        } else {
//            log.info("이미 가입된 사용자입니다.");
//        }
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
//        boolean isInserted = signUpService.insertUserInfo(request.getParameter("id"), request.getParameter("password"));
//
//        if (isInserted) return "user/login";
//        else return "signUpView";
//    }
//
//    // 아이디 찾기
//    @GetMapping("/user/find/id")
//    public String findIdView() {
//        return "/user/findId";
//    }
//
//    @PostMapping("/user/find/id/{verityType}")
//    public String findId(@PathVariable String verityType, User user, RedirectAttributes rattr) {
//
//        try {
////        if(certificate == "email") {
////                mailService.sendEmail(user.getEmail());
////        } else {
////                smsService.sendSms(user.getPhone());
////        }
//        } catch(Exception e) {
//            rattr.addFlashAttribute("msg", "SEND_ERR");
//            return "/user/findId";
//        }
//        return "redirect:/find/id/success/" + verityType;
//    }
//
//    @PostMapping("/user/find/pwd/{verityType}")
//    public String findPwd(@PathVariable String verityType, User user, RedirectAttributes rattr) {
//        try {
////        if(certificate == "email") {
////                mailService.sendEmail(user.getEmail());
////        } else {
////                smsService.sendSms(user.getPhone());
////        }
//        } catch(Exception e) {
//            rattr.addFlashAttribute("msg", "SEND_ERR");
//            return "/user/findId";
//        }
//        return "redirect:/find/id/success/" + verityType;
//    }
//
//    //    비번 찾기
//    @GetMapping("/user/find/pwd")
//    public String findPwdView() {
//        return "/user/findPwd";
//    }
//
//    // 아이디/비번 찾기 인증 성공
//    @GetMapping("/user/find/{findType}/success/{verifyType}")
//    public String findUserSuccessView(@PathVariable String findType, @PathVariable String verifyType, Model model) {
//        model.addAttribute("findType", findType);
//        model.addAttribute("verifyType", verifyType);
//        return "/user/findSuccess";
//    }
//}
