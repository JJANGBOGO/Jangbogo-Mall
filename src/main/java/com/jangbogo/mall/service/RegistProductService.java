package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.RegistProductDto;

import java.util.List;

public interface RegistProductService {
    int getProdIdx(RegistProductDto registProductDto) throws Exception;

    int insertProduct(RegistProductDto registProductDto) throws Exception;

    int insertProductDetail(RegistProductDto registProductDto) throws Exception;

    int insertProductFile(RegistProductDto registProductDto) throws Exception;
    int checkSellerProdCd(RegistProductDto registProductDto) throws Exception;
    List<RegistProductDto> getProductList(Integer seler_idx) throws Exception;
}
