package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.ProductFileDto;
import com.jangbogo.mall.domain.RegistProductDto;

import java.util.List;

public interface RegistProductService {
    Integer getProdIdx(RegistProductDto registProductDto) throws Exception;

    Integer insertProduct(RegistProductDto registProductDto) throws Exception;

    Integer insertProductDetail(RegistProductDto registProductDto) throws Exception;

    Integer insertProductFile(List<ProductFileDto> files, Integer prod_idx) throws Exception;
    Integer checkSellerProdCd(RegistProductDto registProductDto) throws Exception;
    List<RegistProductDto> getProductList(Integer seler_idx) throws Exception;
}
