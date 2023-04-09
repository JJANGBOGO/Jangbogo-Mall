package com.jangbogo.mall.controller;

import com.jangbogo.mall.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
@Controller
public class MemberController { //회원, 판매자 공통작업 수행

    @Autowired
    UserService userService;

    @GetMapping("/find/email") //이메일찾기화면
    public String findEmailView() {
        return "findEmail";
    }

    @PostMapping("/find/email")
    public String findEmail(String nick_nm, String pwd, String type, RedirectAttributes rattr) {

        if (nick_nm == "" || pwd == "") { //유효성 검사
            rattr.addFlashAttribute("msg", "EMPTY_ERR");
            return "redirect:/find/email";
        }

        String email = null;
//        if (type == "user") {
        try {
            email = userService.findUserEmail(nick_nm, pwd);
            if (email == null) {
                rattr.addFlashAttribute("msg", "NOT_FOUND_ERR");
                return "redirect:/find/email";
            }
            log.info("email = " + email);

            rattr.addFlashAttribute("findEmail", email); //성공페이지에 뿌리기
            return "redirect:/find/email/success"; //성공
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/find/email";
        }

//        }
        /**
         * 절대 성공케이스를 try-catch 바깥에 짜지 말것. 항상 성공처리가 된다.
         * 지금 if type 분기처리는 seller 추가시 부활 예정. seller도 회원과 동일하게 try-catch 삽질 그만하고 짜라.
         * try-catch 내부에서 모든 return 케이스를 처리해라.
         */
    }

    @GetMapping("/find/pwd") //비번찾기화면
    public String findPwdView() {
        return "findPwd";
    }

    @PostMapping("/find/pwd")
    public String findPwd(String nick_nm, String email, String type, RedirectAttributes rattr) {

        if (nick_nm == "" || email == "") { //유효성 검사
            rattr.addFlashAttribute("msg", "EMPTY_ERR");
            return "redirect:/find/pwd";
        }

        boolean userChk = false;
//        if (type == "user") {
        try {
            userChk = userService.isUserPresent(nick_nm, email);
            if (!userChk) {
                rattr.addFlashAttribute("msg", "NOT_FOUND_ERR");
                return "redirect:/find/email";
            } else { //회원 존재
                int result = userService.sendPwdEmail(nick_nm, email);
                if (result == 1) { //성공
                    rattr.addFlashAttribute("toEmail", email);
                    return "redirect:/find/pwd/success"; //성공
                } else {
                    rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
                    return "redirect:/find/pwd";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/find/pwd";
        }
//        } else { //seller
//        }
    }

    @GetMapping("/find/{type}/success")
    public String findSuccessView(@PathVariable String type, RedirectAttributes rattr) {
        rattr.addAttribute("type", type);
        return "findSuccess";
        //TODO:: 새로 고침시 성공 페이지 진입 불가
    }

    //회원가입안내
    @GetMapping("/register/intro")
    public String regIntroView() {
        return "registerIntro";
    }




}
