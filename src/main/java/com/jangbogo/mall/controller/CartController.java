package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.CartDto;
import com.jangbogo.mall.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
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
//        String email = "djdu@gmail.com";
        CartDto cartDto = null;  // 장바구니 상품 목록을 저장할 변수 list 선언 및 null로 초기화
        try {
//            cartDto = cartService.getUserIdx(email);
//            System.out.println("cartDto = " + cartDto);
//            model.addAttribute("email", email);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "cart/cart";
    }

    // 메서드명 : getList
    // 기   능 : 장바구니 목록을 불러오는 ajax요청을 처리한다.
    // 반환타입 :
    // 매개변수 :
    // 요청URL :
    @GetMapping("/cart/list")
    public ResponseEntity<List<CartDto>> list(Integer user_idx) {
        List<CartDto> list = null; // list 배열 초기화
        try {
            list = cartService.getList(user_idx);
            return new ResponseEntity<List<CartDto>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<CartDto>>(list, HttpStatus.BAD_REQUEST);
        }
    }
    // 메서드명 : deleteCartProduct
    // 기   능 : 장바구니에서 선택된 상품을 삭제한다.
    // 반환타입 : String
    // 매개변수 : Integer prod_idx, Integer user_idx
    // 요청URL : /cart/remove?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx} GET
    @DeleteMapping("/cart/remove")
    public ResponseEntity<String> remove(Integer prod_idx, Integer user_idx) {
        int rowCnt = 0;  // 영향 받은 테이블의 행을 저장할 변수 rowCnt 선언 및 0으로 초기화
        try {
            rowCnt = cartService.remove(prod_idx, user_idx);
            if(rowCnt != 1) {
                throw new Exception("delete failed");
            }
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
        }
    }



    // 메서드명 : deleteCartProduct
    // 기   능 : 장바구니에서 선택된 상품을 삭제한다.
    // 반환타입 : String
    // 매개변수 : Integer prod_idx, Integer user_idx
    // 요청URL : /cart/remove?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx} GET
//    @GetMapping("/remove")
//    public String deleteCartProduct(Integer prod_idx, Integer user_idx) {
//        try {
//            // 1. cartService의 remove메서드 호출 결과, DB에서 영향 받은 행의 개수를 변수 rowCnt에 저장
//            int rowCnt = cartService.remove(prod_idx, user_idx);
//            // 2. rowCnt가 0인 경우, 에러 발생시키기
//            if(rowCnt != 1) {
//                throw new Exception("delete failed");
//            }
//        } catch (Exception e) {
//            // 3. 에러 처리
//            e.printStackTrace();
//        }
//        // 4. 장바구니 페이지로 리다이렉트 이동
//        return  "redirect:/cart/cart";
//    }

    // 메서드명 : addProductCnt
    // 기   능 : 장바구니 상품 개수를 1 증가시킨다.
    // 반환타입 : String
    // 요청URL : /cart/addCnt?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx} GET
//    @GetMapping("/addCnt")
//    public String addProductCnt(Integer prod_idx, Integer user_idx) {
//
//        try {
//            int rowCnt = cartService.addCount(prod_idx, user_idx);
//            if(rowCnt != 1) {
//                throw new Exception("addCount failed");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return "redirect:/cart/cart";
//    }

    // 메서드명 : subtractProductCnt
    // 기   능 : 장바구니 상품 개수를 1 감소시킨다.
    // 반환타입 : String
    // 요청URL : /cart/subtractCnt?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx} GET
//    @GetMapping("/subtractCnt")
//    public String subtractProductCnt(Integer prod_idx, Integer user_idx, Integer prod_cnt) {
//        try {
//            // 삼품 개수가 1보다 큰 경우
//            if(prod_cnt > 1) {
//                int rowCnt = cartService.subtractCount(prod_idx, user_idx);
//                if (rowCnt != 1) {
//                    throw new Exception("addCount failed");
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return "redirect:/cart/cart";
//    }
}