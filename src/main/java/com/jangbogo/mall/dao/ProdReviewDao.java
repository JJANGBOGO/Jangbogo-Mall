package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.OrderDto;
import com.jangbogo.mall.domain.ProdReviewDto;

import java.util.List;
import java.util.Map;

public interface ProdReviewDao {
    List<ProdReviewDto> selectAll(Integer prod_idx) throws Exception;
    Integer update(ProdReviewDto prodReviewDto) throws Exception;
    Integer insert(ProdReviewDto prodReviewDto) throws Exception;
//    List<OrderDto> get_ord_idx(Integer user_idx, Integer prod_idx) throws Exception;

    List<ProdReviewDto> selectPage(Map map) throws Exception;
    Integer getCount(Integer prod_idx) throws Exception;


}
