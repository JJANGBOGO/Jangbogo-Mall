package com.jangbogo.mall.dao;

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

    public int saveKakaoPayment(String tid) {
        return session.insert(namespace + "saveKakaoPayment", tid);
    }
}

