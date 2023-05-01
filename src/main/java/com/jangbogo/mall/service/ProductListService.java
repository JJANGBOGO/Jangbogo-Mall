package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.ProductListDto;

import java.util.List;

public interface ProductListService {
    List<ProductListDto> allProductInfoSelect(ProductListDto productListDto) throws Exception;
}
