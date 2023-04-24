package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.OrderDto;
import com.jangbogo.mall.domain.ProductDto;
import com.jangbogo.mall.service.WishlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/mypage")
public class MyOrderController {
    @Autowired
    WishlistService wishlistService;

    // 주문내역 페이지 이동
    @GetMapping("/order/list")
    public String wishlistPage(HttpServletRequest request) {
        if(!loginCheck(request)) return "redirect:/user/login?toURL="+request.getRequestURL();
        return "myOrderList";
    }

//    // 지정된 위시리스트 목록을 가져오는 메서드
//    @GetMapping("/order/lists") // /wishlists GET
//    public ResponseEntity<List<OrderDto>> list(HttpSession session){
//        List<OrderDto> list = null;
//        Integer user_idx = (Integer)session.getAttribute("idx");
//        try {
//            list = wishlistService.getlist(user_idx);
//            return new ResponseEntity<List<ProductDto>>(list, HttpStatus.OK);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<List<ProductDto>>(HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//
//    }
//
//    @DeleteMapping("/wishlists/{prod_idx}") // DELETE /wishlists/1  <-- 삭제할 상품 번호
//    public ResponseEntity<String> remove(@PathVariable Integer prod_idx, HttpSession session){
//        Integer user_idx = (Integer) session.getAttribute("idx");
//        int rowCnt = 0;
//        System.out.println("user_idx = " + user_idx);
//        System.out.println("prod_idx = " + prod_idx);
//        try {
//            rowCnt = wishlistService.delete(prod_idx,user_idx);
//            if(rowCnt != 1) {
//                throw new Exception("Delete Failed");
//            }
//            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<>("DEL_ERR", HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }
//    // 장바구니에 상품 존재 확인 메서드
//    @PostMapping("/wishlists") //wishlists?prod_idx=1&prod_cnt=1 POST
//    public ResponseEntity<String> insert(Integer prod_idx, Integer prod_cnt,HttpSession session,RedirectAttributes ratt){
//        int user_idx = (int) session.getAttribute("idx");
//
//        try {
//            int CartCnt = wishlistService.checkCart(prod_idx, user_idx); // 장바구니에 이 상품이 있는지 확인
//            if (CartCnt == 0) { // 0 or 1
//                int cnt = wishlistService.insertCart(prod_idx, user_idx, prod_cnt);    // 2-1 상품번호,회원번호,개수를 넣어주면 장바구니에 담긴다
//                return new ResponseEntity<>("DEL_OK1", HttpStatus.OK);
//            } else {
//                int cnt = wishlistService.updateCartCnt(prod_idx, user_idx, prod_cnt); // 2-1 상품번호,회원번호,개수를 넣어주면 장바구니에 담긴다
//                return new ResponseEntity<>("DEL_OK2", HttpStatus.OK);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<>("DEL_ERR", HttpStatus.INTERNAL_SERVER_ERROR);
//
//        }
//
//
//    }

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("idx")!=null;
//        return true;  // 일단 (하드코딩) true 박기
    }


}