package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.ProdReviewDto;

import java.util.List;

public interface ProdReviewService {
    List<ProdReviewDto> getList(Integer prod_idx) throws Exception;
    Integer update(ProdReviewDto prodReviewDto) throws Exception;
    Integer insert(ProdReviewDto prodReviewDto) throws Exception;
}
