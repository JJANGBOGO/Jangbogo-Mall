package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.OrderDto;
import com.jangbogo.mall.domain.PaymentDto;

public interface OrderDao {
    // 메서드명 : insertPayment
    // 기   능 : '결제'(SETL) 테이블에 데이터를 삽입(insert)하는 메서드
    // 반환타입 : int
    // 매개변수 : PaymentDto paymentDto
    int insertPayment(PaymentDto paymentDto);

    // 메서드명 : getPayment
    // 기   능 : '결제'(SETL) 테이블에 저장된 특정 데이터를 조회(select)하는 메서드
    // 반환타입 : PaymentDto
    // 매개변수 : String tid
    PaymentDto getPayment(String tid);

    // 메서드명 : insertOrder
    // 기   능 : '주문'(ORD) 테이블에 데이터를 삽입(insert)하는 메서드
    // 반환타입 : int
    // 매개변수 : OrderDto orderDto
    int insertOrder(OrderDto orderDto);

    // 메서드명 : getOrder
    // 기   능 : 주문번호가 #{idx}인 주문을 조회하는 메서드
    // 반환타입 : OrderDto
    // 매개변수 : Integer idx
    OrderDto getOrder(Integer idx);

    // 메서드명 : updateCanceledSetl
    // 기   능 : 결제고유번호가 #{tid}인 결제 데이터를 '승인' 에서 '취소' 상태로 변경하는 메서드
    // 반환타입 : int
    // 매개변수 : String tid
    int updateCanceledSetl(String tid);
}
