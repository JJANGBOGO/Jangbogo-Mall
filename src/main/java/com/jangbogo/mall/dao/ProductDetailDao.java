package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.ProductDetailDto;

public interface ProductDetailDao {
    ProductDetailDto select(Integer prod_idx) throws Exception;
}
