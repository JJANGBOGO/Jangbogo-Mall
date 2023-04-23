package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.OrderDao;
import com.jangbogo.mall.domain.OrderDto;
import com.jangbogo.mall.domain.PaymentDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
