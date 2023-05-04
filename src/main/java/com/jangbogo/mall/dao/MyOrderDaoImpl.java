package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.MyOrderDto;
import com.jangbogo.mall.domain.OrderDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MyOrderDaoImpl implements MyOrderDao {
    @Autowired
    SqlSession session;

    String namespace="com.jangbogo.mall.dao.MyOrderMapper.";

    @Override
    public List<MyOrderDto> getlist(Integer user_idx) throws Exception{
        return session.selectList(namespace+"selectAll",user_idx);
    }



}
