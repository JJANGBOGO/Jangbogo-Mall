package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.ProductListDto;

import java.util.List;

public interface ProductListDao {
    List<ProductListDto> allProductInfoSelect(ProductListDto productListDto) throws Exception;
}
