package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.OrderDto;
import com.jangbogo.mall.domain.PaymentDto;

public interface OrderService {
    // 메서드명 : addPayment
    // 기   능 : OrderDao의 saveKakaoPayment메서드 호출
    // 반환타입 : int
    // 매개변수 : PaymentDto paymentDto{String tid, Integer ord_idx, Integer total_amount}
    int addPayment(PaymentDto paymentDto) throws Exception;

    // 메서드명 : addOrder
    // 기   능 : OrderDao의 addOrder메서드 호출
    // 반환타입 : int
    // 매개변수 : OrderDto orderDto
    int addOrder(OrderDto orderDto) throws Exception;

    // 메서드명 : getOrder
    // 기   능 : OrderDao의 getPaymentDto메서드 호출
    // 반환타입 : OrderDto
    // 매개변수 : Integer idx
    OrderDto getOrderDto(Integer idx);
}
