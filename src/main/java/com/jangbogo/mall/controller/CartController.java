package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.CartDto;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

public interface CartController {
    // 메서드명 : goToCard
    // 기   능 : 장바구니 페이지로 이동한다.
    // 반환타입 : String
    // 매개변수 : Model model
    // 요청URL : /cart/cart GET
    @GetMapping("/cart")
    String goToCart(Model model);

    // 메서드명 : getList
    // 기   능 : 장바구니 목록을 불러오는 ajax요청을 처리한다.
    // 반환타입 : ResponseEntity<List<CartDto>>
    // 매개변수 : Integer user_idx
    // 요청URL : /cart/list?user_idx=1234 GET
    @GetMapping("/cart/list")
    ResponseEntity<List<CartDto>> list(Integer user_idx);

    // 메서드명 : deleteCartProduct
    // 기   능 : 장바구니에서 선택된 상품을 삭제한다.
    // 반환타입 : String
    // 매개변수 : Integer prod_idx, Integer user_idx
    // 요청URL : /cart/remove?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx} GET
    @DeleteMapping("/cart/remove")
    ResponseEntity<String> remove(Integer prod_idx, Integer user_idx);

    // 메서드명 : subtractProductCnt
    // 기   능 : 장바구니 상품 개수를 1 감소시킨다.
    // 반환타입 : String
    // 요청URL : /cart/subtractCnt?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx}&prod_cnt=${prod_cnt} GET
    @GetMapping("/cart/subtractCnt")
    String subtractProductCnt(Integer prod_idx, Integer user_idx, Integer prod_cnt);

    // 메서드명 : addProductCnt
    // 기   능 : 장바구니 상품 개수를 1 증가시킨다.
    // 반환타입 : String
    // 요청URL : /cart/addCnt?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx} GET
    @GetMapping("/cart/addCnt")
    ResponseEntity<String> addProductCnt(Integer prod_idx, Integer user_idx) throws Exception;
}
