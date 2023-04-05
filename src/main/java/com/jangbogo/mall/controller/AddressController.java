package com.jangbogo.mall.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AddressController {

    @GetMapping("/mypage/address")
    public String myPageAddrView(HttpServletRequest req, Model m) {
        m.addAttribute("mypageUrl", req.getRequestURI());
        return "user/addrList";
    }
}
