package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.Seller;
import com.jangbogo.mall.domain.SellerDtl;

public interface SellerService {

    //판매자 탈퇴
    boolean withdrawSeller(Integer idx, String email) throws Exception;

    //판매자조회
    Seller getSellerByIdx (Integer idx) throws Exception;

    //판매자 수정
    int updateSeller (Seller seller, SellerDtl dtl) throws Exception;

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

    //판매자 이메일 찾기
    String findSellerEmail (String cpnm, String pwd) throws Exception;

    //비번찾기용 회원 인증
    boolean isSellerPresent (String cpnm, String email) throws Exception;

    //임시비번 메일 전송
    int sendPwdEmail (String cpnm, String toEmail) throws Exception;

    //비번변경 날짜 수정
    int updatePwdUptTm (Integer idx, String email) throws Exception;

    //이메일, 비번 일치 여부 확인
    boolean verifySeller (String email, String pwd) throws Exception;
}
