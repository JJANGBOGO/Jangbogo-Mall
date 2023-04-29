package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.*;

import java.util.Date;
import java.util.List;

public interface OrderDao {
    // 메서드명 : insertPayment
    // 기   능 : '결제'(SETL) 테이블에 데이터를 삽입(insert)하는 메서드
    // 반환타입 : int
    // 매개변수 : PaymentDto paymentDto
    public int insertPayment(PaymentDto paymentDto);

    // 메서드명 : getPayment
    // 기   능 : '결제'(SETL) 테이블에 저장된 특정 데이터를 조회(select)하는 메서드
    // 반환타입 : PaymentDto
    // 매개변수 : String tid
    public PaymentDto getPayment(String tid);

    // 메서드명 : insertOrder
    // 기   능 : '주문'(ORD) 테이블에 데이터를 삽입(insert)하는 메서드
    // 반환타입 : int
    // 매개변수 : OrderDto orderDto
    public int insertOrder(OrderDto orderDto);

    // 메서드명 : getOrder
    // 기   능 : 주문번호가 #{idx}인 주문을 조회하는 메서드
    // 반환타입 : OrderDto
    // 매개변수 : Integer idx
    public OrderDto getOrder(Integer idx);

    // 메서드명 : updateCanceledSetl
    // 기   능 : 결제고유번호가 #{tid}인 결제 데이터를 '승인' 에서 '취소' 상태로 변경하는 메서드
    // 반환타입 : int
    // 매개변수 : String tid
    public int updateCanceledSetl(String tid);

    // 메서드명 : addOrderDetail
    // 기   능 : '주문상세'(ORD_DTL) 테이블에 회원번호, 주문상품이름, 주문상품개수가 각각 #{user_idx}, #{prod_nm}, #{prod_cnt}인 데이터를 삽입(insert)하는 메서드
    // 반환타입 : int
    // 매개변수 : OrderDto orderDto, CartDto cartDto
    public int insertOrderDetail(OrderDto orderDto, CartDto cartDto);

    // 메서드명 : getOrderDetailDto
    // 기   능 : 주문번호가 #{idx}인 주문의 '주문상세' 데이터를 조회하는 메서드
    // 반환타입 : OrderDetailDto orderDetailDto
    // 매개변수 : OrderDto orderDto, CartDto cartDto
    public List<OrderDetailDto> getOrderDetailDto(OrderDto orderDto);

    // 메서드명 : insertOrderHistory
    // 기   능 : '주문이력'(ORD_HIST)
    // 반환타입 : int
    // 매개변수 : List<OrderDetailDto> orderDetails
    public int insertOrderHistory(List<OrderDetailDto> orderDetails);

    // 메서드명 : getOrderHistoryDto
    // 기   능 : '주문이력' 데이터를 조회하는 메서드
    // 반환타입 : List<OrderHistoryDto>
    // 매개변수 : List<OrderDetailDto> orderDetails
    public List<OrderHistoryDto> getOrderHistoryDto(List<OrderDetailDto> orderDetails);
}
