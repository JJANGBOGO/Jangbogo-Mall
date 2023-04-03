package com.jangbogo.mall.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class MemberController {

    @GetMapping("/find/member/email")
    public String findMemberEmailView () {
        return "member/findEmail";
    }

    @GetMapping("/find/member/pwd")
    public String findMemberPwdView () {
        return "member/findPwd";
    }

    @GetMapping("/find/member/success")
    public String findMemberSuccessView () {
        return "/user/findSuccess";
    }
}
