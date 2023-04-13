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

    //판매자 상세 추가
    int insertSellerDtl (SellerDtl detail) throws Exception;

    //판매자 상세 조회
    SellerDtl getSellerDtl (Integer seler_idx) throws Exception;

    //판매자 추가
    int registerSeller (Seller seller) throws Exception;

    //판매자 브랜드 수정
    int updateSellerBrnd (Seller seller) throws Exception;

    //브랜드명 중복 검사
    boolean isCpnmDuplicated (String cpnm) throws Exception;

    //이메일 중복 검사
    boolean isEmailDuplicated (String email) throws Exception;
}
