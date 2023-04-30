package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.MyOrderDetailDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MyOrderDetailImpl implements MyOrderDetail {
    @Autowired
    SqlSession session;

    String namespace="com.jangbogo.mall.dao.MyOrderDetailMapper.";

    @Override
    public List<MyOrderDetailDto> getlist(Integer ord_idx) throws Exception{
        return session.selectList(namespace+"selectAll",ord_idx);
    }

    @Override
    public int updateReviewState(Integer ord_dtl_idx) throws Exception{
        return session.update(namespace+"updateReviewState",ord_dtl_idx);
    }



}
