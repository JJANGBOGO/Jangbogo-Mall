package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.Seller;
import com.jangbogo.mall.domain.SellerDtl;

public interface SellerDao {

    //판매자 탈퇴
    int deleteSeller (Integer idx, String email) throws Exception;

    //판매자 조회
    Seller getSellerByIdx (Integer idx) throws Exception;

    //판매자 수정
    int updateSeller (Seller seller) throws Exception;

    //판매자 상세 수정
    int updateSellerDtl (SellerDtl detail) throws Exception;
}
