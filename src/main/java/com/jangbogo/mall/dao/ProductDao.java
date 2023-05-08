package com.jangbogo.mall.dao;


import com.jangbogo.mall.domain.ProductDtl;
import com.jangbogo.mall.domain.ProductDto;
import com.jangbogo.mall.domain.ProductFile;

import java.util.List;

public interface ProductDao {

    //판매자별 상품리스트 조회
    List<ProductDto> getListBySeller (Integer seller_idx) throws Exception;

   //카테고리별 상품리스트 조회
    List<ProductDto> getListByCategory (String category) throws Exception;

    //상품 검색
    List<ProductDto> searchProductList (String keyword) throws Exception;

    //판매자 탈퇴 시 상품 판매 중지
    int stopSale (Integer idx) throws Exception;
}

