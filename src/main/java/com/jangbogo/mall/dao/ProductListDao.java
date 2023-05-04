package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.ProductListDto;

import java.util.List;

public interface ProductListDao {
    List<ProductListDto> ffloorSelect(String f_cate_idx) throws Exception;
    List<ProductListDto> allffloorSelect() throws Exception;
    Integer reviewNumSelect(Integer prod_idx) throws Exception;
    List<ProductListDto> allProductInfoSelect() throws Exception;
}
