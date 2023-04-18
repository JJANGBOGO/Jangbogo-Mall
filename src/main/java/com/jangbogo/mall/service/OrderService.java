package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.CartDao;
import com.jangbogo.mall.dao.OrderDao;
import com.jangbogo.mall.domain.OrderDto;
import com.jangbogo.mall.domain.PaymentDto;
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
    // 반환타입 :
    // 매개변수 : OrderDto orderDto
    public int addOrder(OrderDto orderDto) throws Exception {
        return orderDao.addOrder(orderDto);
    }

    // 메서드명 : getOrderDto
    // 기   능 : OrderDao의 getPaymentDto메서드 호출
    // 매개변수 : Integer idx
    // 반환타입 : String
    public OrderDto getOrderDto(Integer idx) {
        System.out.println("ord_idx = " + idx);
        return orderDao.getOrderDto(idx);
    }

    // 메서드명 : getPaymentDto
    // 기   능 : OrderDao의 getOrderDto메서드 호출
    // 매개변수 : Integer idx
    // 반환타입 : String
    public PaymentDto getPaymentDto(Integer idx) {
        System.out.println("ord_idx = " + idx);
        return orderDao.getPaymentDto(idx);
    }
}
