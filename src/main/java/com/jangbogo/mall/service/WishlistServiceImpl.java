package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.WishlistDao;
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
}
