package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.*;

import java.util.Date;
import java.util.List;

public interface OrderService {
    // 메서드명 : addPayment
    // 기   능 : OrderDao의 saveKakaoPayment메서드 호출
    // 반환타입 : int
    // 매개변수 : PaymentDto paymentDto{String tid, Integer ord_idx, Integer total_amount}
    public int addPayment(PaymentDto paymentDto) throws Exception;

    // 메서드명 : addOrder
    // 기   능 : OrderDao의 addOrder메서드 호출
    // 반환타입 : int
    // 매개변수 : OrderDto orderDto
    public int addOrder(OrderDto orderDto) throws Exception;

    // 메서드명 : getOrder
    // 기   능 : OrderDao의 getPaymentDto메서드 호출
    // 반환타입 : OrderDto
    // 매개변수 : Integer idx
    public OrderDto getOrderDto(Integer idx);

    // 메서드명 : addOrderDetail
    // 기   능 : OrderDao의 addOrderDetail메서드 호출
    // 반환타입 : int
    // 매개변수 : OrderDto orderDto, CartDto cartDto
    public int addOrderDetail(OrderDto orderDto, CartDto cartDto);

    // 메서드명 : getOrderDetail
    // 기   능 : OrderDao의 getOrderDetailDto메서드 호출
    // 반환타입 : OrderDetailDto
    // 매개변수 : OrderDto orderDto
    public List<OrderDetailDto> getOrderDetail(OrderDto orderDto);

    // 메서드명 : addOrderHistory
    // 기   능 : OrderDao의 addOrderHistory메서드 호출
    // 반환타입 : int
    // 매개변수 : List<OrderDetailDto> orderDetails
    public int addOrderHistory(List<OrderDetailDto> orderDetails);

    // 메서드명 : getOrderHistory
    // 기   능 : OrderDao의 getOrderHistoryDto메서드 호출
    // 반환타입 : int
    // 매개변수 : List<OrderDetailDto> orderDetails
    public List<OrderHistoryDto> getOrderHistory(List<OrderDetailDto> orderDetails);

    // 메서드명 : addDelivery
    // 기   능 : OrderDao의 addDeliveryDto메서드 호출
    // 반환타입 : int
    // 매개변수 : DeliveryDto deliveryDto
    public int addDelivery(DeliveryDto deliveryDto);
}
