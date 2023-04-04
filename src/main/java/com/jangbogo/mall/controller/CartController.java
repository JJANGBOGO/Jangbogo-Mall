package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.CartDto;
import com.jangbogo.mall.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    CartService cartService;

    // 메서드명 : goToCard
    // 기   능 : 장바구니 페이지로 이동한다.
    // 반환타입 : String
    // 매개변수 : Model model
    // 요청URL : /cart/cart GET
    @GetMapping("/cart")
    public String goToCart(Model model) {
        try {
            // 1. 장바구니 목록 리스트를 DB에서 불러오는 getList메서드를 호출 후, 반환값음 변수 list에 저장
            List<CartDto> list = cartService.getList();
            // 2. 모델에 list를 저장
            model.addAttribute("list", list);
        } catch (Exception e) {
            // 3. 에러 처리
            throw new RuntimeException(e);
        }
        // 4. 장바구니 페이지로 이동
        return "/cart/cart";
    }

    // 메서드명 : deleteCartProduct
    // 기   능 : 장바구니에서 선택된 상품을 삭제한다.
    // 반환타입 : String
    // 매개변수 : Integer prod_idx, Integer user_idx
    // 요청URL : /cart/remove GET
    @GetMapping("/remove")
    public String deleteBoard(Integer prod_idx, Integer user_idx) {
        try {
            // 1. cartService의 remove메서드 호출 결과, DB에서 영향 받은 행의 개수를 변수 rowCnt에 저장
            int rowCnt = cartService.remove(prod_idx, user_idx);
            // 2. rowCnt가 0인 경우, 에러 발생시키기
            if(rowCnt != 1) {
                throw new Exception("delete failed");
            }
        } catch (Exception e) {
            // 3. 에러 처리
            e.printStackTrace();
        }
        // 4. 장바구니 페이지로 리다이렉트 이동
        return  "redirect:/cart/cart";
    }
}