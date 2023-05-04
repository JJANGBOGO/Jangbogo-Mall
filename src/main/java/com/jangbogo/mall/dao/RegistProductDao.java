package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.ProductFileDto;
import com.jangbogo.mall.domain.RegistProductDto;

import java.util.List;

public interface RegistProductDao {
    int getProdIdx(RegistProductDto registProductDto) throws Exception;

    int insertProduct(RegistProductDto registProductDto) throws Exception;

    int insertProductDetail(RegistProductDto registProductDto) throws Exception;

    int insertProductFile(ProductFileDto files) throws Exception;
    int checkSellerProdCd(RegistProductDto registProductDto) throws Exception;
    List<RegistProductDto> getProductList(Integer seler_idx) throws Exception;
}
