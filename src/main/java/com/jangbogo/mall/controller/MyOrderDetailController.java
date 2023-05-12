package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.*;
import com.jangbogo.mall.service.*;
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

    @Autowired
    KakaoPayService kakaoPayService;

    @Autowired
    OrderService orderService;

    // 주문 내역 상세 페이지 이동
    @GetMapping("/order/list/{ord_idx}")
    public String orderDetailPage(@PathVariable Integer ord_idx, Model m, HttpServletRequest request) { //  idx(주문번호)
        m.addAttribute("mypageUrl", request.getRequestURI());
        m.addAttribute("idx",ord_idx); // 주문번호

        return "myOrderDetail";
    }

    // 지정된 주문 내역 (상세) 목록을 가져오는 메서드
    @GetMapping("/order/detail/{ord_idx}") // /order/detail/1  GET
    public ResponseEntity<List<MyOrderDetailDto>> orderDetailList(@PathVariable Integer ord_idx) { // idx(주문번호)
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
        int user_idx = (int) session.getAttribute("idx"); // 세션에서 회원번호 회득

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


    // 장바구니에 (전체)상품 존재 확인 하고 추가하는 메서드
    @PostMapping("/order/detail/insertCartAll/{idx}") // order/detail/insertCart?prod_idx=1&prod_cnt=1 POST
    public ResponseEntity<String> insertCartAll(@PathVariable Integer idx, Integer prod_cnt, HttpSession session, RedirectAttributes ratt){
        int user_idx = (int) session.getAttribute("idx");                    // 세션에서 회원번호를 가저온다
        List<Integer> list = null; //
        try {
            list = myOrderDetailService.getProdsIdx(idx);                           // 해당 주문번호의 상품번호들을 가저온다
            int totalCnt = list.size();                                             // 상품번호들 총 개수

            for (int i = 0; i < totalCnt; i++) {                                    // 각 상품들이 회원의 장바구니에 존재하는지 확인한다
                int prod_idx = list.get(i);
                if(wishlistService.checkCart(prod_idx,user_idx)==0){                // 1-1) 존재하지 않으면
                    wishlistService.insertCart(prod_idx,user_idx,1);        // 장바구니에 추가 (1개)
                }else{                                                              // 1-2) 존재하면
                    wishlistService.updateCartCnt(prod_idx,user_idx,1);         // 장바구니 수량 업데이트 (1개)
                }
            }
            return new ResponseEntity<>("CART_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("CART_ERR", HttpStatus.INTERNAL_SERVER_ERROR);
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

        List<MyOrderDetailDto> orderDetails = null;                                                                     // 변수명 : orderDetails - 저장값 : '주문상세' 테이블의 데이터 목록
        PaymentDto paymentDto = null;
        String tid = "";
        int updateSetlRowCnt = 0;
        int updateOrdStateRowCnt = 0;
        int updateOrdDetailStateRowCnt = 0;
        int insertOrdHistStateRowCnt = 0;
        try {
            // 1. 카카오API 결제 취소 - 필요한 값들 - tid, pg_token
            paymentDto = orderService.getPaymentDto(idx);
            tid = paymentDto.getSetl_idx();
            KakaoCancelResponseDto kakaoCancelResponseDto = kakaoPayService.refundResponse(tid);
            if(kakaoCancelResponseDto == null) throw new Exception("refundResponse Failed");
            System.out.println("kakaoCancelResponseDto = " + kakaoCancelResponseDto);

            // 2. 결제 테이블 주문상태코드 2로 변경
            updateSetlRowCnt = myOrderDetailService.updateSetlStateCanceled(tid);
            // 3. 주문, 주문상세, 주문이력 테이블 변경
            updateOrdStateRowCnt = myOrderDetailService.updateOrdState(idx);                                            // 주문테이블에서 주문번호를 가진 행의 주문상태를 변경(취소완료)
            if(updateOrdStateRowCnt == 0) throw new Exception("updateOrdState Failed");

            updateOrdDetailStateRowCnt = myOrderDetailService.updateOrdDetailState(idx);                                // 주문상세테이블에서 해당 주문번호를 가진 행의 주문상태를 변경(취소완료)
            if(updateOrdDetailStateRowCnt == 0) throw new Exception("updateOrdDetailState Failed");

            orderDetails = myOrderDetailService.getlist(idx);
            insertOrdHistStateRowCnt = myOrderDetailService.insertOrdHistState(orderDetails);                           // 주문이력테이블에서 해당 주문번호를 가진 행의 주문상태를 변경(취소완료)
            if(insertOrdHistStateRowCnt == 0) throw new Exception("insertOrdHistState Failed");
            return new ResponseEntity<>("UPDATE_OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("UPDATE_ERR", HttpStatus.INTERNAL_SERVER_ERROR);

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