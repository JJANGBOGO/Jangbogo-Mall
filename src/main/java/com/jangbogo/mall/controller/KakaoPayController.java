package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.KakaoApproveResponseDto;
import com.jangbogo.mall.domain.KakaoReadyResponseDto;
import com.jangbogo.mall.service.KakaoPayService;
import com.jangbogo.mall.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
public class KakaoPayController {

    @Autowired
    KakaoPayService kakaoPayService;

    @Autowired
    OrderService orderService;

    // 메서드명 : readyToKakaoPay
    // 기   능 : 결제 준비 처리
    // 반환타입 : KakaoReadyResponseDto
    @PostMapping("/payment/kakao/ready")
    @ResponseBody
    public KakaoReadyResponseDto readyToKakaoPay() {
        return kakaoPayService.kakaoPayReady();
    }

    // 메서드명 : afterPayRequest
    // 기   능 : 결제 승인 처리
    // 반환타입 : String
    @GetMapping("/payment/kakao/approve")
    public ResponseEntity afterPayRequest(@RequestParam("pg_token") String pg_token) {
        KakaoApproveResponseDto kakaoApproveResponseDto = kakaoPayService.approveResponse(pg_token);

        return new ResponseEntity<>(kakaoApproveResponseDto, HttpStatus.OK);
    }

    // 메서드명 : cancel
    // 기   능 : 결제 진행 중 취소 처리
    // 반환타입 : void
    @GetMapping("/payment/kakao/cancel")
    public void cancel() throws Exception {
        throw new Exception("결제 취소");
    }

    // 메서드명 : fail
    // 기   능 : 결제 실패 처리
    // 반환타입 : void
    @GetMapping("/payment/kakao/fail")
    public void fail() throws Exception {
        throw new Exception("결제 실패");
    }
}
