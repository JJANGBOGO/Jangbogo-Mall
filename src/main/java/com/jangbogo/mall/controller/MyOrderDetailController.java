package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.MyOrderDetailDto;
import com.jangbogo.mall.domain.MyOrderDto;
import com.jangbogo.mall.domain.ProdReviewDto;
import com.jangbogo.mall.service.MyOrderDetailService;
import com.jangbogo.mall.service.MyOrderService;
import com.jangbogo.mall.service.ProdReviewService;
import com.jangbogo.mall.service.WishlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/mypage")
public class MyOrderDetailController {
    @Autowired
    MyOrderDetailService myOrderDetailService;

    @Autowired
    WishlistService wishlistService;

    @Autowired
    ProdReviewService prodReviewService;

    // 주문 내역 상세 페이지 이동
    @GetMapping("/order/list/{ord_idx}")
    public String orderDetailPage(@PathVariable Integer ord_idx, Model m) { //  idx(주문번호)
        System.out.println("idx = " + ord_idx);
        m.addAttribute("idx",ord_idx); // 주문번호

        return "myOrderDetail";
    }

    // 지정된 주문 내역 (상세) 목록을 가져오는 메서드
    @GetMapping("/order/detail/{ord_idx}") // /order/detail/1  GET
    public ResponseEntity<List<MyOrderDetailDto>> orderDetailList(@PathVariable Integer ord_idx) { // idx(주문번호)
        System.out.println("idx = " + ord_idx);
        List<MyOrderDetailDto> list = null;
        try {
            list = myOrderDetailService.getlist(ord_idx);
            return new ResponseEntity<List<MyOrderDetailDto>>(list, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<MyOrderDetailDto>>(HttpStatus.INTERNAL_SERVER_ERROR);

        }
    }
    // 장바구니에 상품 존재 확인 하고 추가하는 메서드
    @PostMapping("/order/detail/insertCart") // order/detail/insertCart?prod_idx=1&prod_cnt=1 POST
    public ResponseEntity<String> insertCart(Integer prod_idx, Integer prod_cnt, HttpSession session, RedirectAttributes ratt){
        int user_idx = (int) session.getAttribute("idx");

        try {
            int CartCnt = wishlistService.checkCart(prod_idx, user_idx); // 장바구니에 이 상품이 있는지 확인
            if (CartCnt == 0) { // 0 or 1
                int cnt = wishlistService.insertCart(prod_idx, user_idx, prod_cnt);    // 2-1 상품번호,회원번호,개수를 넣어주면 장바구니에 담긴다
                return new ResponseEntity<>("INSERT_OK1", HttpStatus.OK);
            } else {
                int cnt = wishlistService.updateCartCnt(prod_idx, user_idx, prod_cnt); // 2-1 상품번호,회원번호,개수를 넣어주면 장바구니에 담긴다
                return new ResponseEntity<>("INSERT_OK2", HttpStatus.OK);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("INSERT_ERR", HttpStatus.INTERNAL_SERVER_ERROR);

        }

    }

    // 상품후기 작성(추가), 주문상세(후기작성상태코드)-> 3(작성완료) 업데이트 메서드
    @PostMapping("/order/detail/insertReview") // order/detail/insertReview POST
    public ResponseEntity<String> insertReview(@RequestBody ProdReviewDto prodReviewDto, Integer ord_dtl_idx, HttpSession session) {
        int user_idx = (int) session.getAttribute("idx");            // 세션에서 회원번호를 가져온다
        String nickName = (String) session.getAttribute("nickName"); // 세션에서 닉네임(작성자)를 가져온다
        prodReviewDto.setUser_idx(user_idx); // Dto 에 회원번호 추가
        prodReviewDto.setWriter(nickName);   // Dto 에 작성자(닉네임) 추가

        try {
            if (prodReviewService.insert(prodReviewDto) != 1) throw new Exception("Write failed"); // 상품 후기 테이블에 작성(insert)이 성공되었으면 ↓
            myOrderDetailService.updateReviewState(ord_dtl_idx);
            return new ResponseEntity<>("INSERT_OK", HttpStatus.OK);                         // 주문상세 테이블 후기 작성 상태 업데이트(후기 작성 완료)
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("INSERT_ERR", HttpStatus.INTERNAL_SERVER_ERROR);
//
        }


    }


    // 주문 취소
    // 주문, 주문상세, 주문이력 테이블들의 주문상태 -> 5(취소완료)로 변경
    @PatchMapping("/order/detail/stateUpdate/{idx}") // order/detail/stateUpdate/1  PATCH
    public ResponseEntity<String> stateUpdate(@PathVariable Integer idx,  HttpSession session){ // 주문번호를 받아온다
        int user_idx = (int) session.getAttribute("idx");
        System.out.println("idx = " + idx);
        try {
            myOrderDetailService.updateOrdState(idx); // 주문테이블에서 주문번호를 가진 행의 주문상태를 변경(취소완료)
            myOrderDetailService.updateOrdDetailState(idx); // 주문상세테이블에서 해당 주문번호를 가진 행의 주문상태를 변경(취소완료)
            myOrderDetailService.updateOrdHistState(idx); // 주문이력테이블에서 해당 주문번호를 가진 행의 주문상태를 변경(취소완료)
            return new ResponseEntity<>("UPDATE_OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("UPDATE_ERR", HttpStatus.INTERNAL_SERVER_ERROR);

        }

    }


//
//    @GetMapping("/order/detail/{idx}") // 주문 내역 (상세) 목록 GET
//    public ResponseEntity<List<>> orderDetailList(@PathVariable Integer idx) { // idx(주문번호)
//        System.out.println("idx = " + idx);
//
//
//        try {
//            return new ResponseEntity<List<>>(list, HttpStatus.OK);
//
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//            return new ResponseEntity<List<>>(HttpStatus.INTERNAL_SERVER_ERROR);
//
//        }
//    }
//
//    @GetMapping("/order/setl/{idx}") // 주문 내역 (결제) 목록 GET
//    public ResponseEntity<List<>> orderSetlList(@PathVariable Integer idx) { // idx(주문번호)
//        System.out.println("idx = " + idx);
//
//
//        try {
//            return new ResponseEntity<List<>>(list, HttpStatus.OK);
//
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//            return new ResponseEntity<List<>>(HttpStatus.INTERNAL_SERVER_ERROR);
//
//        }
//    }
//
//    @GetMapping("/order/ord/{idx}") // 주문 내역 (주문) 목록 GET
//    public ResponseEntity<List<>> orderList(@PathVariable Integer idx) { // idx(주문번호)
//        System.out.println("idx = " + idx);
//
//
//        try {
//            return new ResponseEntity<List<>>(list, HttpStatus.OK);
//
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//            return new ResponseEntity<List<>>(HttpStatus.INTERNAL_SERVER_ERROR);
//
//        }
//    }
//
//    @GetMapping("/order/dlvry/{idx}") // 주문 내역 (배송) 목록 GET
//    public ResponseEntity<List<>> orderDlvryList(@PathVariable Integer idx) { // idx(주문번호)
//        System.out.println("idx = " + idx);
//
//
//        try {
//            return new ResponseEntity<List<>>(list, HttpStatus.OK);
//
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//            return new ResponseEntity<List<>>(HttpStatus.INTERNAL_SERVER_ERROR);
//
//        }
//    }





    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("idx")!=null;
//        return true;  // 일단 (하드코딩) true 박기
    }


}