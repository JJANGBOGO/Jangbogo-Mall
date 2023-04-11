package com.jangbogo.mall.service;

import com.jangbogo.mall.dao.SellerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellerServiceImpl implements SellerService{

    @Autowired
    SellerDao dao;

    @Override
    public int withdrawSeller (int idx, String email) throws Exception {
        return dao.deleteSeller(idx, email);
    }




}
