package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.CartDao;
import com.jangbogo.mall.dao.OrderDao;
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
    // 매개변수 :
    public int addCountsaveKakaoPayment(String tid) throws Exception {
        return orderDao.saveKakaoPayment(tid);
    }
}
