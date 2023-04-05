package com.jangbogo.mall.controller;


import com.jangbogo.mall.domain.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/mypage")
@Slf4j
public class MyPageController {

    @GetMapping("/info") //개인 정보 인증.
    public String info (Model model ) {
        model.addAttribute("userDto", new User());
        return "/mypage/validateUser";
    }

    @PostMapping("/info")
    public String verifyPwd (@Valid @ModelAttribute("userDto") User user, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "/mypage/validateUser";
        } else {
            //유저 찾기
        }
        return "redirect:/mypage/modify"; //성공 시 수정 페이지로 이동
    }

    @GetMapping("/modify") //개인 정보 수정.
    public String infoModify() { return "/mypage/modifyUser"; }


//    소셜회원인지 유형 체크
    @PostMapping("/check/isSocial")
    @ResponseBody
    public String checkSocialUser (@RequestBody String nickname) {
//        닉네임으로 회원의 유형을 검색
//      if() {
//    }
        return "";
    }

    @GetMapping("/info/link") //일반과 소셜 연동.
    public String linkView(Model model) {
        model.addAttribute("mode", "new");
        return "/mypage/modifyUser";
    };

}
