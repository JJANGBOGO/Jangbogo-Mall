package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.OrderDao;
import com.jangbogo.mall.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderDao orderDao;                                                                                                  // OrderDao 자동 주입

    // 메서드명 : addPayment
    // 기   능 : OrderDao의 saveKakaoPayment메서드 호출
    // 반환타입 : int
    // 매개변수 : PaymentDto paymentDto{String tid, Integer ord_idx, Integer total_amount}
    @Override
    public int addPayment(PaymentDto paymentDto) throws Exception {
        return orderDao.insertPayment(paymentDto);
    }

    // 메서드명 : addOrder
    // 기   능 : OrderDao의 addOrder메서드 호출
    // 반환타입 : int
    // 매개변수 : OrderDto orderDto
    @Override
    public int addOrder(OrderDto orderDto) throws Exception {
        return orderDao.insertOrder(orderDto);
    }

    // 메서드명 : getOrder
    // 기   능 : OrderDao의 getPaymentDto메서드 호출
    // 반환타입 : OrderDto
    // 매개변수 : Integer idx
    @Override
    public OrderDto getOrderDto(Integer idx) {
        return orderDao.getOrder(idx);
    }


    // 메서드명 : addOrderDetail
    // 기   능 : OrderDao의 addOrderDetail메서드 호출
    // 반환타입 : int
    // 매개변수 : OrderDto orderDto, CartDto cartDto
    @Override
    public int addOrderDetail(OrderDto orderDto, CartDto cartDto) {
        return orderDao.insertOrderDetail(orderDto, cartDto);
    }

    // 메서드명 : getOrderDetail
    // 기   능 : OrderDao의 getOrderDetailDto메서드 호출
    // 반환타입 : OrderDetailDto
    // 매개변수 : OrderDto orderDto
    @Override
    public List<OrderDetailDto> getOrderDetail(OrderDto orderDto) {
        return orderDao.getOrderDetailDto(orderDto);
    }

    // 메서드명 : addOrderHistory
    // 기   능 : OrderDao의 insertOrderHistory메서드 호출
    // 반환타입 : int
    // 매개변수 : OrderDetailDto orderDetailDto
    @Override
    public int addOrderHistory(List<OrderDetailDto> orderDetails) {
        return orderDao.insertOrderHistory(orderDetails);
    }


    // 메서드명 : getOrderHistory
    // 기   능 : OrderDao의 getOrderHistoryDto메서드 호출
    // 반환타입 : int
    // 매개변수 : List<OrderDetailDto> orderDetails
    @Override
    public List<OrderHistoryDto> getOrderHistory(List<OrderDetailDto> orderDetails) {
        return orderDao.getOrderHistoryDto(orderDetails);
    }

    // 메서드명 : addDelivery
    // 기   능 : OrderDao의 addDeliveryDto메서드 호출
    // 반환타입 : int
    // 매개변수 : DeliveryDto deliveryDto
    @Override
    public int addDelivery(DeliveryDto deliveryDto) {
        return orderDao.insertDelivery(deliveryDto);
    }
}
