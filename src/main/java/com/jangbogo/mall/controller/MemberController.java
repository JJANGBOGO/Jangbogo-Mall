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
public class MemberController { //회원, 판매자 공통화면

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

    @GetMapping("/find/{type}/success")
    public String findSuccessView(@PathVariable String type, String member, Model m) {
        m.addAttribute("type", type);
        m.addAttribute("member", member);
        return "findSuccess";
    }

    //회원가입안내
    @GetMapping("/register/intro")
    public String regIntroView() {
        return "registerIntro";
    }


}
