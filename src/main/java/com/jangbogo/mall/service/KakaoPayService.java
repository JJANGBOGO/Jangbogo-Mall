package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.KakaoApproveResponseDto;
import com.jangbogo.mall.domain.KakaoReadyResponseDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Service
@RequiredArgsConstructor
@Transactional
public class KakaoPayService {

    // iv, cv
    static final String CID = "TC0ONETIME"; // 가맹점 테스트 코드
    static final String ADMIN_KEY = "4319c284b87b726f5f038d839ad6bbd2"; // 공개 조심! 본인 애플리케이션의 어드민 키를 넣어주세요
    private KakaoReadyResponseDto kakaoReadyResponseDto;
    private KakaoApproveResponseDto kakaoApproveResponseDto;

    // 메서드명 : kakaoPayReady
    // 기   능 : 결제 준비 승인 - 카카오페이 결제를 시작하기 위해 상세 정보를 카카오페이 서버에 전달하고 결제 고유 번호(TID)를 받는 단계
    // 매개변수 : String pg_token
    // 반환타입 : KakaoApproveResponseDto
    // POST /v1/payment/ready HTTP/1.1
    // Host: kapi.kakao.com
    // Authorization: KakaoAK ${APP_ADMIN_KEY}
    // Content-type: application/x-www-form-urlencoded;charset=utf-8
    public KakaoReadyResponseDto kakaoPayReady() {

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();                               // 1. Body 만들기 - 카카오페이 서버에 보낼 요청 양식

        params.add("cid", CID);                                                                        // 2. 파라미터(Body)에 값 저장
        params.add("partner_order_id", "partner_order_id");                                             // 가맹점 주문번호, 최대 100자
        params.add("partner_user_id", "partner_user_id");                                               // 가맹점 회원 id, 최대 100자
        params.add("item_name", "[곰표x콜린스그린] 그래놀라 요거트");                                           // 상품명, 최대 100자
        params.add("quantity", "1");                                                                    // 상품 수량
        params.add("total_amount", "2900");                                                             // 상품 총액
        params.add("tax_free_amount", "0");                                                             // 상품 비과세 금액
        params.add("approval_url", "http://localhost:8080/payment/kakao/approve");                      // 결제 성공 시 redirect url, 최대 255자
        params.add("cancel_url", "http://localhost:8080/payment/kakao/cancel");                         // 결제 취소 시 redirect url, 최대 255자
        params.add("fail_url", "http://localhost:8080/payment/kakao/fail");                             // 결제 실패 시 redirect url, 최대 255자

        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, this.getHeaders());   // 3. 요청하기 위해 헤더(Header)와 데이터(Body)를 엔티티(Entity)에 합치기

        RestTemplate rt = new RestTemplate();                                                             // 4. POST 요청하기

        kakaoReadyResponseDto = rt.postForObject(
                "https://kapi.kakao.com/v1/payment/ready",                                                // 요청할 서버 주소
                entity,                                                                                       // 요청할 때 보낼 데이터
                KakaoReadyResponseDto.class                                                                   // 요청시 반환되는 데이터 타입
        );
        return kakaoReadyResponseDto;

    }

    // 메서드명 : approveResponse
    // 기   능 : 결제 완료 승인
    // 매개변수 : String pg_token
    // 반환타입 : KakaoApproveResponseDto
    // POST /v1/payment/approve HTTP/1.1
    // Host: kapi.kakao.com
    // Authorization: KakaoAK ${APP_ADMIN_KEY}
    // Content-type: application/x-www-form-urlencoded;charset=utf-8
    public KakaoApproveResponseDto approveResponse(String pg_token) {
        // 카카오페이 요청 양식
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();                               // 1. Body 만들기

        // 파라미터
        params.add("cid", CID);
        params.add("tid", kakaoReadyResponseDto.getTid());
        params.add("partner_order_id", "partner_order_id");
        params.add("partner_user_id", "partner_user_id");
        params.add("pg_token", pg_token);

        // 파라미터, 헤더
        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, this.getHeaders());


        // 외부에 보낼 url
        RestTemplate restTemplate = new RestTemplate();

        kakaoApproveResponseDto = restTemplate.postForObject(
                "https://kapi.kakao.com/v1/payment/approve",
                entity,
                KakaoApproveResponseDto.class);

        return kakaoApproveResponseDto;
    }

    // 메서드명 : getHeaders
    // 기   능 : 카카오페이 API가 요구하는 헤더값 저장
    // 반환타입 : HttpHeaders
    private HttpHeaders getHeaders() {
        HttpHeaders httpHeaders = new HttpHeaders();

        String auth = "KakaoAK " + ADMIN_KEY;
        httpHeaders.set("Authorization", auth);
        httpHeaders.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        return httpHeaders;
    }
}
