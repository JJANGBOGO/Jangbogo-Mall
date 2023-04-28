package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.RegistProductDto;

public interface RegistProductDao {
    int getProdIdx(Integer prod_cd_val) throws Exception;

    int insertProduct(RegistProductDto registProductDto) throws Exception;

    int insertProductDetail(RegistProductDto registProductDto) throws Exception;

    int insertProductFile(RegistProductDto registProductDto) throws Exception;
}
