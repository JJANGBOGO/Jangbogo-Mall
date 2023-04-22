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
        return productDetailDao.selectProd(prod_idx);
    }

    public Integer findDlvry(Integer cate_idx) throws Exception {
        return productDetailDao.findDlvry(cate_idx);
    }

    public ProductDetailDto dlvryInfo(Integer dlvry_method) throws Exception {
        return productDetailDao.dlvryInfo(dlvry_method);
    }

    public ProductDetailDto findBrand(Integer prod_idx) throws Exception {
        return productDetailDao.selectBrand(prod_idx);
    }
}
