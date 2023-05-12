package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.MyOrderDetail;
import com.jangbogo.mall.domain.MyOrderDetailDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyOrderDetailServiceImpl implements MyOrderDetailService {
    @Autowired
    private MyOrderDetail myOrderDetail;

    @Override
    public List<MyOrderDetailDto> getlist(Integer ord_idx) throws Exception {
        return myOrderDetail.getlist(ord_idx);

    }
    @Override
    public int updateReviewState(Integer ord_dtl_idx) throws Exception {
        return myOrderDetail.updateReviewState(ord_dtl_idx);

    }

    @Override
    public int updateOrdState(Integer idx) throws Exception {
        return myOrderDetail.updateOrdState(idx);
    }

    @Override
    public int updateOrdDetailState(Integer ord_idx) throws Exception {
        return myOrderDetail.updateOrdDetailState(ord_idx);
    }

    @Override
    public int insertOrdHistState(List<MyOrderDetailDto> orderDetails) throws Exception {
        return myOrderDetail.insertOrdHistState(orderDetails);
    }

    @Override
    public int updateSetlStateCanceled(String tid) throws Exception {
        return myOrderDetail.updateSetlCanceled(tid);
    }

    @Override
    public List<Integer> getProdsIdx(Integer ord_idx) throws Exception {
        return myOrderDetail.getProdsIdx(ord_idx);

    }


}
