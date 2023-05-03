package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.KakaoApproveResponseDto;
import com.jangbogo.mall.domain.KakaoCancelResponseDto;
import com.jangbogo.mall.domain.KakaoReadyRequestDto;
import com.jangbogo.mall.domain.KakaoReadyResponseDto;
import org.springframework.http.HttpHeaders;

public interface KakaoPayService {
    // 메서드명 : kakaoPayReady
    // 기   능 : 결제 준비 승인 - 카카오페이 결제를 시작하기 위해 상세 정보를 카카오페이 서버에 전달하고 결제 고유 번호(TID)를 받는 단계
    // 매개변수 : String pg_token
    // 반환타입 : KakaoApproveResponseDto
    // POST /v1/payment/ready HTTP/1.1
    // Host: kapi.kakao.com
    // Authorization: KakaoAK ${APP_ADMIN_KEY}
    // Content-type: application/x-www-form-urlencoded;charset=utf-8
    KakaoReadyResponseDto kakaoPayReady(KakaoReadyRequestDto kakaoReadyRequestDto);

    // 메서드명 : approveResponse
    // 기   능 : 결제 승인 처리
    // 매개변수 : String pg_token
    // 반환타입 : KakaoApproveResponseDto
    // POST /v1/payment/approve HTTP/1.1
    // Host: kapi.kakao.com
    // Authorization: KakaoAK ${APP_ADMIN_KEY}
    // Content-type: application/x-www-form-urlencoded;charset=utf-8
    KakaoApproveResponseDto approveResponse(String pg_token);

    // 메서드명 : refundResponse
    // 기   능 : 결제 취소 처리
    // 반환타입 : KakaoCancelResponseDto
    // 매개변수 : String tid - 결제고유번호
    // POST /v1/payment/cancel HTTP/1.1
    // Host: kapi.kakao.com
    // Authorization: KakaoAK ${APP_ADMIN_KEY}
    // Content-type: application/x-www-form-urlencoded;charset=utf-8
    KakaoCancelResponseDto refundResponse(String tid);
}
