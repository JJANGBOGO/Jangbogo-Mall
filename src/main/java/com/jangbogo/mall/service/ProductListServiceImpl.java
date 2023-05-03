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

    public List<ProductListDto> ffloorSelect(String f_cate_idx) throws Exception {
        return productListDao.ffloorSelect(f_cate_idx);
    }

    public List<ProductListDto> allffloorSelect() throws Exception {
        return productListDao.allffloorSelect();
    }

    public Integer reviewNumSelect(Integer prod_idx) throws Exception {
        return productListDao.reviewNumSelect(prod_idx);
    }

    @Override
    public List<ProductListDto> allProductInfoSelect( ) throws Exception {
        return productListDao.allProductInfoSelect();
    }
}
