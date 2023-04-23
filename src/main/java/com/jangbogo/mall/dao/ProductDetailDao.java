package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.ProductDetailDto;
import com.jangbogo.mall.domain.ProductFileDto;

import java.util.List;

public interface ProductDetailDao {
    ProductDetailDto selectProd(Integer prod_idx) throws Exception;

    Integer findDlvry(Integer cate_idx) throws Exception;

    ProductDetailDto dlvryInfo(Integer dlvry_method) throws Exception;

    ProductDetailDto selectBrand(Integer prod_idx) throws Exception;

    List<ProductFileDto> selectProdFile(Integer prod_idx) throws Exception;
}
