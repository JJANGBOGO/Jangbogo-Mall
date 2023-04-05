package com.jangbogo.mall.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class SellerController {

    @GetMapping("/register/seller")
    public String regSellerView () {
        return "/seller/register";
    }
}
