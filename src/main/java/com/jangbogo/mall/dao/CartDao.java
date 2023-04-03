package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.CartDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CartDao {

    @Autowired
    SqlSession session;

    private static String namespace="com.jangbogo.mall.dao.CartMapper."; // 대소문자 구분X

    public List<CartDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }
}
