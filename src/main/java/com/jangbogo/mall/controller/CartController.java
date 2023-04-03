package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.CartDto;
import com.jangbogo.mall.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartController {

    @Autowired
    CartService cartService;

    // 메서드명 : goToCard
    // 기   능 : 장바구니 페이지로 이동한다.
    // 반환타입 : String
    // 매개변수 :
    @GetMapping("/cart")
    public String goToCart(Model model, HttpServletRequest request) {
        // 1. 로그인 확인
        try {
            List<CartDto> list = cartService.getList();
            model.addAttribute("list", list);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        // 2. 로그인 확인 시, cart로 이동
        return "/cart/cart";
    }
}