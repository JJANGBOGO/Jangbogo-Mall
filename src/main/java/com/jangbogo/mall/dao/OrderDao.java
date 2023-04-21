package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.KakaoApproveResponseDto;
import com.jangbogo.mall.domain.OrderDto;
import com.jangbogo.mall.domain.PaymentDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class OrderDao {
    // SqlSession 자동 주입
    @Autowired
    SqlSession session;

    private static String namespace="com.jangbogo.mall.dao.OrderMapper."; // 대소문자 구분X

    public int insertPayment(String tid, Integer ord_idx, Integer total_amount) {
        Map map = new HashMap();
        map.put("tid", tid);
        map.put("ord_idx", ord_idx);
        map.put("total_amount", total_amount);
        return session.insert(namespace + "insertPayment", map);
    }

    public PaymentDto getPayment(String tid) {
        return session.selectOne(namespace + "selectPayment", tid);
    }



    public int insertOrder(OrderDto orderDto) {
        return session.insert(namespace + "insertOrder", orderDto);
    }

    public OrderDto getOrderDto(Integer idx) {
        return session.selectOne(namespace + "selectOrder", idx);
    }

    public int updateApprovedSetl(KakaoApproveResponseDto kakaoApproveResponseDto) {
        return session.update(namespace + "updateApprovedSetl", kakaoApproveResponseDto);
    }

    public int updateCanceledSetl (String tid) {
        return session.update(namespace + "updateCanceledSetl", tid);
    }
}

