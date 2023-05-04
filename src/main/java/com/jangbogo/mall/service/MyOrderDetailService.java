package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.MyOrderDetailDto;

import java.util.List;

public interface MyOrderDetailService {
    List<MyOrderDetailDto> getlist(Integer ord_idx) throws Exception;

    int updateReviewState(Integer ord_dtl_idx) throws Exception;

    int updateOrdState(Integer idx) throws Exception;
    int updateOrdDetailState(Integer ord_idx) throws Exception;
    int insertOrdHistState(List<MyOrderDetailDto> orderDetails) throws Exception;
    int updateSetlStateCanceled(String tid) throws Exception;
}

