package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.ProductDetailDao;
import com.jangbogo.mall.domain.ProductDetailDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductDetailServiceImpl implements ProductDetailService {

    @Autowired
    ProductDetailDao productDetailDao;

    @Override
    public ProductDetailDto read(Integer prod_idx) throws Exception {
        return productDetailDao.select(prod_idx);
    }
}
