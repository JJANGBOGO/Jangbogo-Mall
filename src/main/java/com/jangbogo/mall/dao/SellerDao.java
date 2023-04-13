package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.Seller;
import com.jangbogo.mall.domain.SellerDtl;

public interface SellerDao {

    //판매자 삭제(탈퇴)
    int deleteSeller (Integer idx, String email) throws Exception;

    //판매자 조회
    Seller getSellerByIdx (Integer idx) throws Exception;

    //판매자 수정
    int updateSeller (Seller seller) throws Exception;

    //판매자 상세 수정
    int updateSellerDtl (SellerDtl detail) throws Exception;

    //판매자 상세 추가
    int insertSellerDtl (SellerDtl detail) throws Exception;

    //판매자 상세 조회
    SellerDtl getSellerDtl (Integer seler_idx) throws Exception;

    //판매자 추가
    int insertSeller (Seller seller) throws Exception;

    //브랜드 수정
    int updateSellerBrnd (Seller seller) throws Exception;

    //브랜드명 중복 체크
    Seller getSellerByCpnm (String cpnm) throws Exception;

    //이메일 중복 체크
    Seller getSellerByEmail (String email) throws Exception;
}
