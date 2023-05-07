package com.jangbogo.mall.controller;

import com.jangbogo.mall.service.WishlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage")
public class UserInquiryController {
    @Autowired
    WishlistService wishlistService;

    @GetMapping("/inquiry/list")
    public String inquiryListPage(HttpServletRequest req, Model m) {

//        if(!loginCheck(request)) return "redirect:/user/login?toURL="+request.getRequestURL();
        return "inquiry/inquiryList";
    }

    // 회원 문의 작성 페이지로 이동
    @GetMapping("/inquiry")
    public String inquiryPage(HttpServletRequest req, Model m) {

//        if(!loginCheck(request)) return "redirect:/user/login?toURL="+request.getRequestURL();
        return "inquiry/inquiry";
    }


    // 회원 문의 등록 메서드
    @PostMapping("/inquiry")
    public String inquiryinsert(Integer inqry_idx, Integer inqry_idx2, String inqry_title,String inqry_textarea) {

        System.out.println("inqry_idx = " + inqry_idx);
        System.out.println("inqry_idx2 = " + inqry_idx2);
        System.out.println("inqry_title = " + inqry_title);
        System.out.println("inqry_textarea = " + inqry_textarea);
//        if(!loginCheck(request)) return "redirect:/user/login?toURL="+request.getRequestURL();
        return "inquiry/inquiry";
    }








    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("idx")!=null;
//        return true;  // 일단 (하드코딩) true 박기
    }


}