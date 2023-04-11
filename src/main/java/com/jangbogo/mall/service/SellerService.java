package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.Seller;
import com.jangbogo.mall.domain.SellerDtl;

public interface SellerService {

    //판매자 탈퇴
    int withdrawSeller(Integer idx, String email) throws Exception;

    //판매자조회
    Seller getSellerByIdx (Integer idx) throws Exception;

    //판매자 수정
    int updateSeller (Seller seller) throws Exception;

    //판매자 상세 수정
    int updateSellerDtl (SellerDtl detail) throws Exception;
}
