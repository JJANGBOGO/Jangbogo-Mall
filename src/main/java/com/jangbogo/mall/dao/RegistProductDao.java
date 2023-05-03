package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.ProductFileDto;
import com.jangbogo.mall.domain.RegistProductDto;

import java.util.List;

public interface RegistProductDao {
    Integer getProdIdx(RegistProductDto registProductDto) throws Exception;

    Integer insertProduct(RegistProductDto registProductDto) throws Exception;

    Integer insertProductDetail(RegistProductDto registProductDto) throws Exception;

    Integer insertProductFile(ProductFileDto files) throws Exception;
    Integer checkSellerProdCd(RegistProductDto registProductDto) throws Exception;
    List<RegistProductDto> getProductList(Integer seler_idx) throws Exception;
}
