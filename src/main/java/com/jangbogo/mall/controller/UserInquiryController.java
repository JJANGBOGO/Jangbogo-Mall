package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.UserInquiryDto;
import com.jangbogo.mall.service.UserInquiryService;
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
    UserInquiryService userInquiryService;

    // 회원 문의 리스트 페이지 이동
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
    public String inquiryinsert(UserInquiryDto userInquiryDto, HttpSession session) {
//        System.out.println("userInquiryDto = " + userInquiryDto);

        Integer user_idx = (Integer)session.getAttribute("idx");
        String nickName = (String) session.getAttribute("nickName");
        userInquiryDto.setUser_idx(user_idx);
        userInquiryDto.setWriter(nickName);
        System.out.println("userInquiryDto = " + userInquiryDto);


//        if(!loginCheck(request)) return "redirect:/user/login?toURL="+request.getRequestURL();
        return "redirect:/mypage/inquiry";
    }








    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("idx")!=null;
//        return true;  // 일단 (하드코딩) true 박기
    }


}