package com.jangbogo.mall.controller;


import com.jangbogo.mall.domain.Seller;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
public class SellerController {

    @GetMapping("/seller/login")
    public String loginSellerView () {
        return "/seller/login";
    }

    //판매자가입 뷰
    @GetMapping("/seller/register")
    public String regSellerView () {
        return "/seller/register";
    }

    //판매자가입 처리
    @PostMapping("/seller/register")
    public String regSeller (Seller seller, Model m) {
        log.info("seller..." + seller);
        return "seller/register";
    }

    //마이셀러 브랜드수정 뷰
    @GetMapping("/seller/modify/brnd")
    public String chgBrndView (HttpServletRequest req, Model m) {
        m.addAttribute("mySellerUrl", req.getRequestURI());
        return "/seller/modifyBrnd";
    }

    //판매자수정 인증 뷰
    @GetMapping("/seller/info")
    public String verifySeller (HttpServletRequest req, Model m) {
        m.addAttribute("mySellerUrl", req.getRequestURI());
        return "/seller/verify";
    }

    //판매자수정 뷰
    @GetMapping("/seller/modify")
    public String chgSellerView (HttpServletRequest req, Model m) {
        m.addAttribute("mySellerUrl", req.getRequestURI());
        return "/seller/modifySeller";
    }
}
