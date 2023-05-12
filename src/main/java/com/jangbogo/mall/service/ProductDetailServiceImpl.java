package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.ProductDetailDao;
import com.jangbogo.mall.domain.ProductDetailDto;
import com.jangbogo.mall.domain.ProductFileDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductDetailServiceImpl implements ProductDetailService {

    @Autowired
    ProductDetailDao productDetailDao;

    @Override
    public ProductDetailDto read(Integer prod_idx) throws Exception {
        return productDetailDao.selectProd(prod_idx);
    }

    public Integer findDlvry(String cate_idx) throws Exception {
        return productDetailDao.findDlvry(cate_idx);
    }

    public ProductDetailDto dlvryInfo(Integer dlvry_method) throws Exception {
        return productDetailDao.dlvryInfo(dlvry_method);
    }

    public ProductDetailDto findBrand(Integer prod_idx) throws Exception {
        return productDetailDao.selectBrand(prod_idx);
    }

    public List<ProductFileDto> findProdFile(Integer prod_idx) throws Exception {
        return productDetailDao.selectProdFile(prod_idx);
    }

    public Integer checkWishlist(Integer prod_idx, Integer user_idx) throws Exception {
        return productDetailDao.checkWishlist(prod_idx, user_idx);
    }

    public Integer insertWishlist(Integer prod_idx, Integer user_idx) throws Exception {
        return productDetailDao.insertWishlist(prod_idx, user_idx);
    }

    public Integer deleteWishList(Integer prod_idx, Integer user_idx) throws Exception {
        return productDetailDao.deleteWishList(prod_idx, user_idx);
    }
}
