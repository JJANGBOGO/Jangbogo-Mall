package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.OrderDao;
import com.jangbogo.mall.domain.KakaoApproveResponseDto;
import com.jangbogo.mall.domain.OrderDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
    // CartDao 자동 주입
    @Autowired
    OrderDao orderDao;

    // 메서드명 : saveKakaoPayment
    // 기   능 : OrderDao의 saveKakaoPayment메서드 호출
    // 반환타입 :
    // 매개변수 : String tid
    public int addCountsaveKakaoPayment(String tid, Integer ord_idx) throws Exception {
        return orderDao.saveKakaoPayment(tid, ord_idx);
    }

    // 메서드명 : addOrder
    // 기   능 : OrderDao의 addOrder메서드 호출
    // 반환타입 : int
    // 매개변수 : OrderDto orderDto
    public int addOrder(OrderDto orderDto) throws Exception {
        return orderDao.addOrder(orderDto);
    }

    // 메서드명 : getOrderDto
    // 기   능 : OrderDao의 getPaymentDto메서드 호출
    // 반환타입 : OrderDto
    // 매개변수 : Integer idx
    public OrderDto getOrderDto(Integer idx) {
        return orderDao.getOrderDto(idx);
    }

    // 메서드명 : updateApprovedSetl
    // 기   능 : orderDao의 updateApproveSetl() 호출 - '결제' 테이블에 승인 처리 된 결제 정보 업데이트
    // 반환타입 : int
    // 매개변수 : KakaoApproveResponseDto kakaoApproveResponseDto
    public int updateApprovedSetl(KakaoApproveResponseDto kakaoApproveResponseDto) {
        return orderDao.updateApprovedSetl(kakaoApproveResponseDto);
    }
}
