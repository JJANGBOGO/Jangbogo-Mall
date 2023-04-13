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

    @GetMapping("/find/pwd") //비번찾기화면
    public String findPwdView() {
        return "findPwd";
    }

    @PostMapping("/find/pwd")
    public String findPwd(String nick_nm, String email, String type, RedirectAttributes rattr, Model m) {

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
                    m.addAttribute("userEmail", email);
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
    public String findSuccessView(@PathVariable String type, String member, Model m) {
        m.addAttribute("type", type);
        m.addAttribute("member", member); //새로고침 시 진입불가가 어려워서 m으로 대체
        return "findSuccess";
    }

    //회원가입안내
    @GetMapping("/register/intro")
    public String regIntroView() {
        return "registerIntro";
    }




}
