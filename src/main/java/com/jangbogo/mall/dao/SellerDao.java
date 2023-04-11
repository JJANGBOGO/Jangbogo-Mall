package com.jangbogo.mall.dao;

public interface SellerDao {

    //판매자 탈퇴
    int deleteSeller (int idx, String email) throws Exception;
}
