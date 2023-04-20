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
    // 매개변수 : KakaoReadyRequestDto kakaoReadyRequestDto
    @PostMapping("/payment/kakao/ready")
    @ResponseBody
    public KakaoReadyResponseDto readyToKakaoPay(@RequestBody KakaoReadyRequestDto kakaoReadyRequestDto) {
        return kakaoPayService.kakaoPayReady(kakaoReadyRequestDto);
    }

    // 메서드명 : afterPayRequest
    // 기   능 : 결제 승인 처리
    // 반환타입 : String
    // 매개변수 : String pg_token, Model model
    @GetMapping("/payment/kakao/approve")
    public String afterPayRequest(@RequestParam("pg_token") String pg_token, Model model) throws Exception {
        KakaoApproveResponseDto kakaoApproveResponseDto = kakaoPayService.approveResponse(pg_token);                     // 카카오페이 서버로부터 받은 응답 데이터 KakaoApproveResponseDto를 변수에 저장

        int rowCnt = 0;                                                                                                  // 변수명 : rowCnt - update처리된 '결제' 테이블의 특정 행의 개수를 저장
        // 결제 정보 저장
        try {
            rowCnt = orderService.updateApprovedSetl(kakaoApproveResponseDto);                                           // 변수 rowCnt에 update처리된 '결제' 테이블의 특정 행의 개수를 저장
            if(rowCnt == 0) {                                                                                            // 변수 rowCnt에 0이 저장된 경우, 즉 update처리가 실패한 경우
                throw new Exception("update Approved Setl data failure");                                                // 예외 발생시키기 - "update Approved Setl data failure"
            }
            model.addAttribute("model", kakaoApproveResponseDto);                                           // update에 성공한 경우 모델에 KakaoApproveResponseDto를 저장 - 뷰에서 출력하기 위함
            return "order/orderSuccess";                                                                                 // 뷰 이름 반환 - order/orderSuccess.jsp
        } catch(Exception e) {                                                                                           // 에러가 발생한 경우,
            e.printStackTrace();                                                                                         // e.printStackTrace() - 예외발생 당시의 호출스택(Call Stack)에 있었던 메서드의 정보와 예외 메시지를 화면에 출력
            throw new Exception("update Error");                                                                         // 예외 발생시키기 - "update Error"
        }
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
