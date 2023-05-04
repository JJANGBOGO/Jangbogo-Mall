package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.ProductListDao;
import com.jangbogo.mall.domain.ProductListDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductListServiceImpl implements ProductListService {

    @Autowired
    ProductListDao productListDao;

    @Override
    public List<ProductListDto> allProductInfoSelect(ProductListDto productListDto) throws Exception {
        return productListDao.allProductInfoSelect(productListDto);
    }
}
