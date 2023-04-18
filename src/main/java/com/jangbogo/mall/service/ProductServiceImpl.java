package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.ProductDao;
import com.jangbogo.mall.domain.ProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService{

    @Autowired
    ProductDao dao;

    @Override
    public List<ProductDto> getListBySeller (Integer seler_idx) throws Exception{
        return dao.getListBySeller(seler_idx);
    }

}