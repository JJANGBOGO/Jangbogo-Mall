package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.*;
import com.jangbogo.mall.service.CartService;
import com.jangbogo.mall.service.KakaoPayService;
import com.jangbogo.mall.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class KakaoPayController {

    @Autowired
    KakaoPayService kakaoPayService;                                                                                    // Bean 자동 주입 - KakaoPayService
    @Autowired OrderService orderService;                                                                               // Bean 자동 주입 - OrderService
    @Autowired CartService cartService;                                                                                 // Bean 자동 주입 - CartService

    private KakaoReadyRequestDto kakaoReadyRequestDto;                                                                  // 저장값 : 요청URL(/payment/kakao/ready)에 POST요청 시 전달되는 Request Body 데이터
    private KakaoReadyResponseDto kakaoReadyResponseDto;                                                                // 저장값 : 카카오페이 서버에 '준비' 요청 시, 서버로부터 받을 응답 데이터
    private KakaoApproveResponseDto kakaoApproveResponseDto;                                                            // 저장값 : 카카오페이 서버에 '승인' 요청 시, 서버로부터 받을 응답 데이터
    private KakaoCancelResponseDto kakaoCancelResponseDto;                                                              // 저장값 : 카카오페이 서버에 '취소' 요청 시, 서버로부터 받을 응답 데이터

    // 메서드명 : readyToKakaoPay
    // 기   능 : 카카오페이 결제 준비 요청 처리
    // 반환타입 : KakaoReadyResponseDto
    // 매개변수 : KakaoReadyRequestDto kakaoReadyRequestDto
    @PostMapping("/payment/kakao/ready")
    @ResponseBody
    public KakaoReadyResponseDto readyToKakaoPay(@RequestBody KakaoReadyRequestDto kakaoReadyRequestDto, HttpSession session) {
        session.setAttribute("orderDto", kakaoReadyRequestDto.getOrderDto());                                           // 1. 세션에 주문 데이터 객체(orderDto) 저장
        session.setAttribute("deliveryDto", kakaoReadyRequestDto.getDeliveryDto());
        kakaoReadyResponseDto = kakaoPayService.kakaoPayReady(kakaoReadyRequestDto);                                    // 2. 카카오페이 서버로부터 받은 KakaoReadyResponseDto 형식의 응답 데이터를 변수에 저장
        return kakaoReadyResponseDto;                                                                                   // 3. 응답 데이터 반환
    }

    // 메서드명 : approveKakaoPayRequest
    // 기   능 : 카카오페이 결제 승인 요청 처리
    // 반환타입 : String
    // 매개변수 : @RequestParam("pg_token") String pg_token, RedirectAttributes rattr, HttpSession session
    @GetMapping("/payment/kakao/approve")
    public String approveKakaoPayRequest(@RequestParam("pg_token") String pg_token, RedirectAttributes rattr, HttpSession session) throws Exception {
        OrderDto orderDto = (OrderDto)session.getAttribute("orderDto");                                                 // 변수명 : orderDto - 저장값 : 세션에 저장되어 있는 주문 데이터 객체(orderDto)
        DeliveryDto deliveryDto = (DeliveryDto)session.getAttribute("deliveryDto");

        int insertOrderDtoRowCnt = 0;                                                                                   // 변수명 : insertOrderDtoRowCnt - 저장값 : '주문' 테이블 데이터
        int insertPaymentDtoRowCnt = 0;                                                                                 // 변수명 : insertPaymentDtoRowCnt - 저장값 : '결제' 테이블 데이터
        int insertDeliveryDtoRowCnt = 0;                                                                                // 변수명 : insertDeliveryDtoRowCnt - 저장값 : '배송' 테이블 데이터
        int insertOrderHistoryRowCnt = 0;                                                                               // 변수명 : insertOrderHistoryRowCnt - 저장값: '주문이력' 테이블 데이터

        PaymentDto paymentDto = null;                                                                                   // 변수명 : paymentDto - 저장값 : 생성된 PaymentDto 객체
        List<OrderDetailDto> orderDetails = null;                                                                       // 변수명 : orderDetails - 저장값 : '주문상세' 테이블에 데이터 리스트 저장
        List<OrderHistoryDto> orderHistories = null;                                                                    // 변수명 : orderHistories - 저장값 : '주문이력' 테이블에 데이터 저장

        try {

            KakaoApproveResponseDto kakaoApproveResponseDto = kakaoPayService.approveResponse(pg_token);                // 카카오페이 서버로부터 받은 응답 데이터 KakaoApproveResponseDto를 변수에 저장

            insertOrderDtoRowCnt = orderService.addOrder(orderDto);                                                     // '주문완료' 처리된 주문 데이터를 '주문' 테이블에 저장(C)
            if(insertOrderDtoRowCnt == 0) throw new Exception("insert orderDto to 'ORD' Table failed!");                // 데이터 저장 실패 시, 예외 발생

            paymentDto = new PaymentDto(kakaoApproveResponseDto.getTid(),                                               // PaymentDto 매개변수 있는 생성자
                    kakaoApproveResponseDto.getAmount().getTotal(), kakaoApproveResponseDto.getAmount().getTotal(),     // 매개변수    - 결제고유번호(SETL_IDX), 주문총금액(ORD_TOT_AMT), 실결제금액(AMT),
                    kakaoApproveResponseDto.getAid(), orderDto.getIdx()                                                 // 매개변수(2) - 카드사승인번호(APRV_IDX), 주문번호(ORD_IDX) - FK
            );

            insertPaymentDtoRowCnt = orderService.addPayment(paymentDto);                                               // '결제승인' 처리된 결제 데이터를 '결제' 테이블에 저장(C)
            if(insertPaymentDtoRowCnt == 0) throw new Exception("insert PaymentDto to 'SETL' Table failed!");           // 데이터 저장 실패 시, 예외 발생

            List list = cartService.getList(orderDto.getUser_idx());                                                    // 변수명 : list - 저장값 : 특정 회원번호를 가지는 회원의 주문상품목록
            Iterator it = list.iterator();                                                                              // 변수명 : it - 저장값 : list에 저장된 CartDto들을 읽어오는 Iterator 구현한 객체
            while(it.hasNext()) {                                                                                       // 다음 CartDto가 존재하는 경우,
                CartDto cartDto = (CartDto)it.next();                                                                   // 변수명: cartDto - 저장값 : list에 저장된 cartDto
                orderDto = orderService.getOrderDto(orderDto.getIdx());                                                 // '주문' 테이블에 저장된 OrderDto 중 특정 #{idx}에 해당하는 orderDto에 재할당
                orderService.addOrderDetail(orderDto, cartDto);                                                         // '주문상세' 데이터를 '주문상세' 테이블에 저장(C)
                orderDetails = orderService.getOrderDetail(orderDto);
            }
            insertOrderHistoryRowCnt = orderService.addOrderHistory(orderDetails);                                      // '주문이력' 데이터를 '주문이력' 테이블에 저장(C)
            if(insertOrderHistoryRowCnt == 0) throw new Exception("insert OrderHistoryDto to 'ORD_HIST' Table failed!");// 데이터 저장 실패 시, 예외 발생
            orderHistories = orderService.getOrderHistory(orderDetails);                                                // 변수명 : orderHistories - 저장값 : 주문이력 데이터
            deliveryDto.setOrd_idx(orderDto.getIdx());
            insertDeliveryDtoRowCnt = orderService.addDelivery(deliveryDto);                                            // '배송' 데이터를 '배송' 테이블에 저장(C)
            if(insertDeliveryDtoRowCnt == 0) throw new Exception("insert DeliveryDto to 'DLVRY' Table failed!");        // 데이터 저장 실패 시, 예외 발생

            cartService.removeAll(orderDto.getUser_idx());                                                              // '주문완료' 처리 시, 장바구니 목록 초기화

            rattr.addFlashAttribute("model", kakaoApproveResponseDto);                                                  // 뷰에 전달할 데이터를 RedirectAttributes 객체에 저장
            rattr.addFlashAttribute("orderDto", orderDto);                                                              // 뷰에 전달할 데이터를 RedirectAttributes 객체에 저장

            session.removeAttribute("orderDto");                                                                        // 세션에 저장되어 있는 주문 데이터 객체(orderDto) 삭제
            session.removeAttribute("paymentDto");                                                                      // 세션에 저장되어 있는 결제 데이터 객체(paymentDto) 삭제
            session.removeAttribute("deliveryDto");                                                                     // 세션에 저장되어 있는 결제 데이터 객체(deliveryDto) 삭제

            return "redirect:/order/checkout/success";                                                                  // 주문 성공 페이지 이동 메서드의 매핑 경로로 리다이렉트
        } catch (Exception e) {                                                                                         // 예외 처리
            e.printStackTrace();                                                                                        // 예외 정보 출력
            return "redirect:/order/checkout";                                                                          // 주문 실패 시, 주문서 작성 페이지 이동 메서드의 매핑 경로로 리다이렉트
        }
    }

    // 메서드명 : cancel
    // 기   능 : 결제 승인 처리 이전 결제 취소 요청 처리
    // 반환타입 : String
    @GetMapping("/payment/kakao/cancel")
    public String cancel() throws Exception {
        return "order/orderCancel";
    }

    // 메서드명 : fail
    // 기   능 : 결제 승인 처리 중 결제 실패 요청 처리
    // 반환타입 : String
    @GetMapping("/payment/kakao/fail")
    public String fail() throws Exception {
        return "order/orderFailure";
    }

    // 메서드명 : refund                                                                                                  // TODO : 주문 내역 및 상세 구현 이후 개발 예정
    // 기   능 : 결제 승인 처리 이후 결제 취소 요청 처리
//    @GetMapping("/payment/kakao/refund")
//    public String refund() throws Exception {
        // TODO: 1. KakaoCancelResponseDto를 받아온다.
        // TODO: 2. KakaoCancelResponseDto의 값들로 결제 테이블에서 수정할 컬럼들의 값을 수정한다.
        // TODO: 2.1 결제 취소 처리 완료 시, '결제' 테이블의 데이터 상태코드를 2(결제취소)로 바꿔야 한다.
        // TODO: 2.2 결제 취소 처리 완료 시, '결제' 테이블의 데이터 처리시각을 #{canceled_at}으로 바꿔야 한다.

//        kakaoCancelResponseDto = kakaoPayService.refundResponse();                                                    // 카카오페이 서버로부터 받은 응답 데이터 KakaoCancelResponseDto를 변수에 저장
//        return "";
//    }
}
