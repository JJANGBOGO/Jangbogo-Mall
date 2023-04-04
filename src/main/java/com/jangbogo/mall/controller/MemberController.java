package com.jangbogo.mall.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Slf4j
@Controller
public class MemberController {

    //회원, 판매자 공통작업 수행

    @GetMapping("/find/email") //이메일찾기화면
    public String findEmailView () {
        return "findEmail";
    }

    @PostMapping("/find/email")
    public String findEmail (String nick_nm, String pwd, String type) {
        log.info(nick_nm + pwd + type + "::: jinvicky");
        String email = "";
        if(type == "user") { //회원찾기

        }else { //판매자찾기

        }
//        예외처리
        return "";
    }

    @GetMapping("/find/pwd") //비번찾기화면
    public String findPwdView () {
        return  "findPwd";
    }

    @PostMapping("/find/pwd")
    public String findPwd (String nick_nm, String email, String type) {
        log.info(nick_nm + email + type + "::: jinvicky");
        if(type == "user") {

        }else {

        }
        //        예외처리
        return "";
    }
}
