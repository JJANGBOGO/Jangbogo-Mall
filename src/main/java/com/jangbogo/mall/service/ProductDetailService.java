package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.ProductDetailDto;
import com.jangbogo.mall.domain.ProductFileDto;

import java.util.List;

public interface ProductDetailService {
    ProductDetailDto read(Integer prod_idx) throws Exception;

    Integer findDlvry(Integer cate_idx) throws Exception;

    ProductDetailDto dlvryInfo(Integer dlvry_method) throws Exception;
    ProductDetailDto findBrand(Integer prod_idx) throws Exception;

    List<ProductFileDto> findProdFile(Integer prod_idx) throws Exception;
}
