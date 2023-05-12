package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.OrderDao;
import com.jangbogo.mall.domain.*;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;

@Service
@RequiredArgsConstructor
@Transactional
public class KakaoPayServiceImpl implements KakaoPayService {

    @Autowired OrderDao orderDao;                                                                                       // 빈 자동 주입
    // iv, cv
    static final String CID = "TC0ONETIME";                                                                              // 상수명 : CID - 가맹점 테스트 코드
    static final String ADMIN_KEY = "4319c284b87b726f5f038d839ad6bbd2";                                                  // 상수명 : ADMIN_KEY - 본인 애플리케이션의 어드민 키(공개 조심!)
    private KakaoReadyResponseDto kakaoReadyResponseDto;
    private KakaoApproveResponseDto kakaoApproveResponseDto;
    private KakaoCancelResponseDto kakaoCancelResponseDto;

    // 메서드명 : kakaoPayReady
    // 기   능 : 결제 준비 승인 - 카카오페이 결제를 시작하기 위해 상세 정보를 카카오페이 서버에 전달하고 결제 고유 번호(TID)를 받는 단계
    // 매개변수 : String pg_token
    // 반환타입 : KakaoApproveResponseDto
    // POST /v1/payment/ready HTTP/1.1
    // Host: kapi.kakao.com
    // Authorization: KakaoAK ${APP_ADMIN_KEY}
    // Content-type: application/x-www-form-urlencoded;charset=utf-8
    @Override
    public KakaoReadyResponseDto kakaoPayReady(KakaoReadyRequestDto kakaoReadyRequestDto) {
        String item_name = kakaoReadyRequestDto.getItem_name();
        String quantity = kakaoReadyRequestDto.getQuantity().toString();
        String total_amount = kakaoReadyRequestDto.getTotal_amount().toString();
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();                                             // 1. Body 만들기 - 카카오페이 서버에 보낼 요청 양식
                                                                                                                        // 2. 파라미터(Body)에 값 저장
        params.add("cid", CID);                                                                                      // 가맹점 코드, 10자
        params.add("partner_order_id", "partner_order_id");                                                       // 가맹점 주문번호, 최대 100자
        params.add("partner_user_id", "partner_user_id");                                                         // 가맹점 회원 id, 최대 100자
        params.add("item_name", item_name);                                                                          // 상품명, 최대 100자
        params.add("quantity", quantity);                                                                            // 상품 수량
        params.add("total_amount", total_amount);                                                                    // 상품 총액
        params.add("tax_free_amount", "0");                                                                       // 상품 비과세 금액
        params.add("approval_url", "http://localhost:8080/payment/kakao/approve");                                // 결제 성공 시 redirect url, 최대 255자
        params.add("cancel_url", "http://localhost:8080/payment/kakao/cancel");                                   // 결제 취소 시 redirect url, 최대 255자
        params.add("fail_url", "http://localhost:8080/payment/kakao/fail");                                       // 결제 실패 시 redirect url, 최대 255자

        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, this.getHeaders());                 // 3. 요청하기 위해 헤더(Header)와 데이터(Body)를 엔티티(Entity)에 합치기

        RestTemplate restTemplate = new RestTemplate();                                                                 // 4. POST 요청하기
        try {
            kakaoReadyResponseDto = restTemplate.postForObject(
                    "https://kapi.kakao.com/v1/payment/ready",                                                      // 요청할 서버 주소
                    entity,                                                                                             // 요청할 때 보낼 데이터
                    KakaoReadyResponseDto.class                                                                         // 요청시 반환되는 데이터 타입
            );
        } catch(HttpStatusCodeException e) {
            e.printStackTrace();
        }
        return kakaoReadyResponseDto;
    }

    // 메서드명 : approveResponse
    // 기   능 : 결제 승인 처리
    // 매개변수 : String pg_token
    // 반환타입 : KakaoApproveResponseDto
    // POST /v1/payment/approve HTTP/1.1
    // Host: kapi.kakao.com
    // Authorization: KakaoAK ${APP_ADMIN_KEY}
    // Content-type: application/x-www-form-urlencoded;charset=utf-8
    @Override
    public KakaoApproveResponseDto approveResponse(String pg_token) {
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();                                             // 1. Body 만들기 - 카카오페이 서버에 보낼 요청 양식
        String tid = kakaoReadyResponseDto.getTid();                                                                    // 2. 파라미터(Body)에 값 저장
        params.add("cid", CID);                                                                                      // 가맹점 코드, 10자
        params.add("tid", kakaoReadyResponseDto.getTid());                                                           // 결제 고유 번호
        params.add("partner_order_id", "partner_order_id");                                                       // 가맹점 주문번호, 최대 100자
        params.add("partner_user_id", "partner_user_id");                                                         // 가맹점 회원 id, 최대 100자
        params.add("pg_token", pg_token);                                                                            // 결제승인 요청을 인증하는 토큰 - 사용자 결제 수단 선택 완료 시, approval_url로 redirection해줄 때 pg_token을 query string으로 전달

        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, this.getHeaders());                 // 3. 요청하기 위해 헤더(Header)와 데이터(Body)를 엔티티(Entity)에 합치기

        // 외부에 보낼 url
        RestTemplate restTemplate = new RestTemplate();                                                                 // 4. POST 요청하기
        try {
            kakaoApproveResponseDto = restTemplate.postForObject(
                    "https://kapi.kakao.com/v1/payment/approve",                                                    // 요청할 서버 주소
                    entity,                                                                                             // 요청할 때 보낼 데이터
                    KakaoApproveResponseDto.class);                                                                     // 요청시 반환되는 데이터 타입
        } catch (HttpStatusCodeException e) {
            e.printStackTrace();
            ResponseEntity.status(e.getRawStatusCode())
                    .headers(e.getResponseHeaders())
                    .body(e.getResponseBodyAsString()); // **** 한글이 안깨진다!
        }
        return kakaoApproveResponseDto;
    }

    // 메서드명 : refundResponse
    // 기   능 : 결제 취소 처리
    // 반환타입 : KakaoCancelResponseDto
    // 매개변수 : String tid - 결제고유번호
    // POST /v1/payment/cancel HTTP/1.1
    // Host: kapi.kakao.com
    // Authorization: KakaoAK ${APP_ADMIN_KEY}
    // Content-type: application/x-www-form-urlencoded;charset=utf-8
    @Override
    public KakaoCancelResponseDto refundResponse(String tid) {                                                                    // TODO : 주문 내역 구현 이후 기능 구현
                                                                                                                        // 카카오페이 요청 양식
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();                                             // 1. Body 만들기
        PaymentDto paymentDto = orderDao.getPayment(tid);
        String cancel_amount = paymentDto.getOrd_tot_amt().toString();
                                                                                                                        // 2. 파라미터에 K/V값 담기
        params.add("cid", CID);                                                                                      // 파라미터에 가맹점 코드("cid", CID) K/V 값 저장
        params.add("tid", tid);                                                                                      // 파라미터에 결제 고유 번호("tid", tid) K/V 값 저장
        params.add("cancel_amount", cancel_amount);                                                                  // 파라미터에 취소 금액("cancel_amount", cancel_amount) K/V 값 저장
        params.add("cancel_tax_free_amount", "0");                                                                // 파라미터에 취소 비과세 금액("cancel_tax_free_amount", "0") K/V 값 저장

        HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(params, this.getHeaders());                 // 3. 요청하기 위해 헤더(Header)와 데이터(Body)를 엔티티(Entity)에 합치기
        RestTemplate restTemplate = new RestTemplate();                                                                 // 4. POST 요청하기

        try {
            kakaoCancelResponseDto = restTemplate.postForObject(
                    "https://kapi.kakao.com/v1/payment/cancel",                                                     // 요청할 서버 주소
                    entity,                                                                                             // 요청할 때 보낼 데이터
                    KakaoCancelResponseDto.class);                                                                      // 요청시 반환되는 데이터 타입
        } catch (HttpStatusCodeException e) {                                                                           // 예외가 발생할 경우,
            e.printStackTrace();                                                                                        // 1) 예외 정보 출력
            ResponseEntity.status(e.getRawStatusCode())                                                                 // 2)
                    .headers(e.getResponseHeaders())
                    .body(e.getResponseBodyAsString());                                                                 // 한글이 안깨진다!
        }
        return kakaoCancelResponseDto;
    }
    
    // 메서드명 : getHeaders
    // 기   능 : 카카오페이 API가 요구하는 헤더값 저장
    // 반환타입 : HttpHeaders
    public HttpHeaders getHeaders() {
        HttpHeaders httpHeaders = new HttpHeaders();

        String auth = "KakaoAK " + ADMIN_KEY;
        httpHeaders.set("Authorization", auth);
        httpHeaders.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        return httpHeaders;
    }
}
