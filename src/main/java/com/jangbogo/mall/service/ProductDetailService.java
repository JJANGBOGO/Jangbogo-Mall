package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.ProductDetailDto;

public interface ProductDetailService {
    ProductDetailDto read(Integer prod_idx) throws Exception;

    Integer findDlvry(Integer cate_idx) throws Exception;

    ProductDetailDto dlvryInfo(Integer dlvry_method) throws Exception;
}
