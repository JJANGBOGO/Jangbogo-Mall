package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.RegistProductDto;

public interface RegistProductService {
    int getProdIdx(Integer prod_cd_val) throws Exception;

    int insertProduct(RegistProductDto registProductDto) throws Exception;

    int insertProductDetail(RegistProductDto registProductDto) throws Exception;

    int insertProductFile(RegistProductDto registProductDto) throws Exception;
}
