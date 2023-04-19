package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.KakaoApproveResponseDto;
import com.jangbogo.mall.domain.KakaoReadyRequestDto;
import com.jangbogo.mall.domain.KakaoReadyResponseDto;
import com.jangbogo.mall.service.KakaoPayService;
import com.jangbogo.mall.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
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
    public KakaoReadyResponseDto readyToKakaoPay(@RequestBody KakaoReadyRequestDto kakaoReadyRequestDto) {
        return kakaoPayService.kakaoPayReady(kakaoReadyRequestDto);
    }

    // 메서드명 : afterPayRequest
    // 기   능 : 결제 승인 처리
    // 반환타입 : String
    @GetMapping("/payment/kakao/approve")
    public String afterPayRequest(@RequestParam("pg_token") String pg_token, Model model) {
        KakaoApproveResponseDto kakaoApproveResponseDto = kakaoPayService.approveResponse(pg_token);
        // 결제 정보 저장
        System.out.println("kakaoApproveResponseDto = " + kakaoApproveResponseDto);
        model.addAttribute("model", kakaoApproveResponseDto);
        return "order/orderSuccess";
    }

    // 메서드명 : cancel
    // 기   능 : 결제 진행 중 취소 처리
    // 반환타입 : String
    @GetMapping("/payment/kakao/cancel")
    public String cancel() throws Exception {
        return "redirect:/cart";
    }

    // 메서드명 : fail
    // 기   능 : 결제 실패 처리
    // 반환타입 : String
    @GetMapping("/payment/kakao/fail")
    public String fail() throws Exception {
        return "redirect:/cart";
    }
}
