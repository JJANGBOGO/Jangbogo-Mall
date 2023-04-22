package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.ProductDetailDto;

public interface ProductDetailDao {
    ProductDetailDto selectProd(Integer prod_idx) throws Exception;

    Integer findDlvry(Integer cate_idx) throws Exception;

    ProductDetailDto dlvryInfo(Integer dlvry_method) throws Exception;
}
