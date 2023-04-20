package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.ProductDetailDto;

public interface ProductDetailService {
    ProductDetailDto read(Integer prod_idx) throws Exception;
}
