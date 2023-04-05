package com.jangbogo.mall.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
public class SellerController {

    //판매자가입 뷰
    @GetMapping("/register/seller")
    public String regSellerView () {
        return "/seller/register";
    }

    //마이셀러 브랜드수정 뷰
    @GetMapping("/myseller/modify/brnd")
    public String chgBrndView (HttpServletRequest req, Model m) {
        m.addAttribute("mySellerUrl", req.getRequestURI());
        return "/seller/modifyBrnd";
    }

    //마이셀러 판매자수정 뷰
    @GetMapping("/myseller/modify/seller")
    public String chgSellerView (HttpServletRequest req, Model m) {
        return "seller/modifySeller";
    }
}
