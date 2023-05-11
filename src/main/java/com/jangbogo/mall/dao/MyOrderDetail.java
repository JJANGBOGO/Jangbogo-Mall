package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.MyOrderDetailDto;

import java.util.List;

public interface MyOrderDetail {
    List<MyOrderDetailDto> getlist(Integer ord_idx) throws Exception;

    int updateReviewState(Integer ord_dtl_idx) throws Exception;
    int updateOrdState(Integer idx) throws Exception;
    int updateOrdDetailState(Integer ord_idx) throws Exception;
    int insertOrdHistState(List<MyOrderDetailDto> orderDetails) throws Exception;

    int updateSetlCanceled(String tid) throws Exception;

    List<Integer> getProdsIdx(Integer ord_idx) throws Exception;
}
