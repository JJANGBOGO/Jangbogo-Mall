package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.MyOrderDto;
import com.jangbogo.mall.domain.MyOrderDetailDto;
import com.jangbogo.mall.domain.OrderDto;
import com.jangbogo.mall.domain.ProductDto;
import com.jangbogo.mall.service.MyOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/mypage")
public class MyOrderController {
    @Autowired
    MyOrderService myOrderService;

    // 주문내역 페이지 이동
    @GetMapping("/order/list")
    public String orderPage(HttpServletRequest request, HttpSession session, Model m) {
        m.addAttribute("mypageUrl", request.getRequestURI());
//        if(!loginCheck(request)) return "redirect:/user/login?toURL="+request.getRequestURL();
        Integer user_idx = (Integer)session.getAttribute("idx");
        try {
            List<MyOrderDto> list = myOrderService.getlist(user_idx);
//            System.out.println("ㅇㄴㅇㅁㄴㅇ = " + list);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "myOrderList";
    }

    // 지정된 주문 내역 목록을 가져오는 메서드
    @GetMapping("/order/lists") // /order/lists  GET
    public ResponseEntity<List<MyOrderDto>> orderLists(HttpSession session){
        List<MyOrderDto> list = null;
        Integer user_idx = (Integer)session.getAttribute("idx");
        try {
            list = myOrderService.getlist(user_idx);
            return new ResponseEntity<List<MyOrderDto>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<MyOrderDto>>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }


    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("idx")!=null;
//        return true;  // 일단 (하드코딩) true 박기
    }


}