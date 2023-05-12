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

    @Override
    public int updateOrdState(Integer idx) throws Exception{
        return session.update(namespace+"updateOrdState",idx);
    }

    @Override
    public int updateOrdDetailState(Integer ord_idx) throws Exception{
        return session.update(namespace+"updateOrdDetailState",ord_idx);
    }

    @Override
    public int insertOrdHistState(List<MyOrderDetailDto> orderDetails) throws Exception{
        return session.insert(namespace+"insertOrdHistState", orderDetails);
    }

    @Override
    public int updateSetlCanceled(String tid) throws Exception {
        return session.update(namespace+"updateSetlCanceled", tid);
    }

    @Override
    public List<Integer> getProdsIdx(Integer ord_idx) throws Exception{
        return session.selectList(namespace+"getProdsIdx",ord_idx);
    }


}
