package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.Seller;

public interface SellerDao {

    //판매자 탈퇴
    int deleteSeller (Integer idx, String email) throws Exception;

    Seller getSellerByIdx (Integer idx) throws Exception;
}
