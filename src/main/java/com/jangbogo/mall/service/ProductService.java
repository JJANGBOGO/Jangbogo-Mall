package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.ProductDto;

import java.util.List;

public interface ProductService {

    //판매자별 상품리스트 조회
    List<ProductDto> getListBySeller (Integer seler_idx) throws Exception;
}
