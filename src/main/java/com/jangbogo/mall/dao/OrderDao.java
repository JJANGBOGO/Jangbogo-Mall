package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.KakaoApproveResponseDto;
import com.jangbogo.mall.domain.OrderDto;
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

    public int saveKakaoPayment(String tid, Integer ord_idx) {
        Map map = new HashMap();
        map.put("tid", tid);
        map.put("ord_idx", ord_idx);
        return session.insert(namespace + "saveKakaoPayment", map);
    }

    public int addOrder(OrderDto orderDto) {
        return session.insert(namespace + "addOrder", orderDto);
    }

    public OrderDto getOrderDto(Integer idx) {
        return session.selectOne(namespace + "selectOrderDto", idx);
    }

    public int updateApprovedSetl(KakaoApproveResponseDto kakaoApproveResponseDto) {
        return session.update(namespace + "updateApprovedSetl", kakaoApproveResponseDto);
    }
}

