package com.jangbogo.mall.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDao {
    // SqlSession 자동 주입
    @Autowired
    SqlSession session;
}
