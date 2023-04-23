package com.jangbogo.mall.dao;


import com.jangbogo.mall.domain.ProductDtl;
import com.jangbogo.mall.domain.ProductDto;

import java.util.List;

public interface ProductDao {

    //판매자별 상품리스트 조회
    List<ProductDto> getListBySeller (Integer seller_idx) throws Exception;

    //상품 insert
    int insertProduct (ProductDto productDto) throws Exception;

    //상품 상세 insert
    int insertProductDtl (ProductDtl productDtl) throws Exception;
}

