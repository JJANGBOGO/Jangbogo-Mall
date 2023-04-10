package com.jangbogo.mall.controller;

import com.jangbogo.mall.service.CartService;
import com.jangbogo.mall.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {
    // CartService 자동 주입
    @Autowired
    OrderService orderService;

    // 메서드명 : goToOrderForm
    // 기   능 : 주문서 작성 페이지로 이동
    // 반환타입 : String
    // 요청URL : /order/checkout
    @GetMapping("/order/checkout")
    public String goToOrderForm() { return "/order/orderForm"; }
}
