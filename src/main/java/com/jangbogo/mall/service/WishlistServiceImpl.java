package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.WishlistDao;
import com.jangbogo.mall.domain.ProductDto;
import com.jangbogo.mall.domain.WishlistDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WishlistServiceImpl implements WishlistService {
    @Autowired
    private WishlistDao wishlistDao;


    @Override
    public List<WishlistDto> getlist(int idx) throws Exception {
        return wishlistDao.getlist(idx);
    }

    @Override
    public int delete(Integer prod_idx, Integer user_idx) throws Exception {
        return wishlistDao.delete(prod_idx, user_idx);
    }
    @Override
    public int insertCart(Integer prod_idx, Integer user_idx, Integer prod_cnt) throws Exception{
        return wishlistDao.insertCart(prod_idx,user_idx,prod_cnt);
    }

    @Override
    public int updateCartCnt(Integer prod_idx, Integer user_idx, Integer cnt) throws Exception{
        return wishlistDao.updateCartCnt(prod_idx,user_idx,cnt);
    }

    @Override
    public int checkCart(Integer prod_idx, Integer user_idx) throws Exception{
        return wishlistDao.checkCart(prod_idx,user_idx);
    }
    @Override
    public List<ProductDto> getProduct(Integer[] prodArr) throws Exception{
        return wishlistDao.getProduct(prodArr);
    }

}
