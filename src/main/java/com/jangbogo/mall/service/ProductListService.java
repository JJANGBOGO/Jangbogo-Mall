package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.ProductListDto;

import java.util.List;

public interface ProductListService {
    List<ProductListDto> ffloorSelect(String f_cate_idx) throws Exception;
    List<ProductListDto> allffloorSelect() throws Exception;
    Integer reviewNumSelect(Integer prod_idx) throws Exception;
    ProductListDto getModalInfo(ProductListDto productListDto) throws Exception;
    List<ProductListDto> allProductInfoSelect() throws Exception;
}
