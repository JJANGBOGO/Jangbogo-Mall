package com.jangbogo.mall.controller;

import com.jangbogo.mall.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Slf4j
@Controller
public class MemberController {

    @Autowired
    UserService userService;

    //회원, 판매자 공통작업 수행

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
        if (type == "user") {
            try {
                email = userService.findUserEmail(nick_nm, pwd);
                if (email == null) {
                    rattr.addFlashAttribute("msg", "NOT_FOUND_ERR");
                    return "redirect:/find/email";
                } else {
//                    userService.sendPwdEmail(nick_nm,pwd );
                }
            } catch (Exception e) {
                e.printStackTrace();
                rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
                return "redirect:/find/email";
            }
        } else { //seller
            try {
                email = userService.findUserEmail(nick_nm, pwd); //seller로 수정할 것
                if (email == null) {
                    rattr.addFlashAttribute("msg", "NOT_FOUND_ERR");
                    return "redirect:/find/email";
                } else {
//                    userService.sendPwdEmail(nick_nm,pwd );
                }
            } catch (Exception e) {
                e.printStackTrace();
                rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
                return "redirect:/find/email";
            }
        }

        rattr.addFlashAttribute("find_email", email); //성공페이지에 뿌리기
        return "redirect:/find/email/success"; //성공
    }

    @GetMapping("/find/pwd") //비번찾기화면
    public String findPwdView() {
        return "findPwd";
    }

    @PostMapping("/find/pwd")
    public String findPwd(String nick_nm, String email, String type, RedirectAttributes rattr) {
        log.info(nick_nm + email + type + "::: jinvicky");
        boolean userChk = false;

        if (nick_nm == "" || email == "") { //유효성 검사
            rattr.addFlashAttribute("msg", "EMPTY_ERR");
            return "redirect:/find/pwd";
        }

        if (type == "user") {
            try {
                userChk = userService.isUserPresent(nick_nm, email);
                if (!userChk) {
                    rattr.addFlashAttribute("msg", "NOT_FOUND_ERR");
                    return "redirect:/find/email";
                } else {
                }
            } catch (Exception e) {
                e.printStackTrace();
                rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
                return "redirect:/find/email";
            }
        } else { //seller
            try {
                userChk = userService.isUserPresent(nick_nm, email);
                if (!userChk) {
                    rattr.addFlashAttribute("msg", "NOT_FOUND_ERR");
                    return "redirect:/find/email";
                }
            } catch (Exception e) {
                e.printStackTrace();
                rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
                return "redirect:/find/email";
            }
        }
        return "redirect:/find/pwd/success"; //성공
    }

    @GetMapping("/find/{type}/success")
    public String findSuccessView(@PathVariable String type, RedirectAttributes rattr) {
        rattr.addAttribute("type", type);
        //TODO:: 새로 고침시 성공 페이지 진입 불가
        return "findSuccess";
    }

    //회원가입안내
    @GetMapping("/register/intro")
    public String regIntroView () {
        return "registerIntro";
    }
}
