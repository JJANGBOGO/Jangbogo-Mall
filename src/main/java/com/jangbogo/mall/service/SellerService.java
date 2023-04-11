package com.jangbogo.mall.service;

public interface SellerService {

    //판매자 탈퇴
    int withdrawSeller (int idx, String email) throws Exception;
}
