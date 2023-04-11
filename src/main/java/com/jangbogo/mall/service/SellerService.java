package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.Seller;

public interface SellerService {

    //판매자 탈퇴
    int withdrawSeller(Integer idx, String email) throws Exception;

    Seller getSellerByIdx (Integer idx) throws Exception;
}
