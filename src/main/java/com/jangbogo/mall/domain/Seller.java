package com.jangbogo.mall.domain;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@Builder
public class Seller {

    public Seller() {} //기본 생성자

    private Integer idx; //번호 . 상품 => 판매자 조회페이지로 갈 때 /seller/1 식일 수 있다. 1이 없을 경우 null에러 방지하려고
    private int auth_idx; //권한번호 1:사용자, 2:판매자 3:관리자

    private String email; //이메일
    private String cpnm; //회사이름
    private String repr_nm; //대표이름

    private String pwd; //비밀번호

    private String mpno; //휴대전화
    private String repr_tellno; //회사대표전화

    private int biz_type; //사업자유형 1:개인사업, 2:법인사업

    private String brno; //사업자번호
    private String sle_biz_no; //통신판매업신고번호

    private String bsplc_zpcd; //우편번호
    private String bsplc_base; //기본주소
    private String bsplc_dtl; //상세주소

    private String acc_bank; //은행이름
    private String acc_no; //계좌번호
    private String acc_nm; //주인이름

    private boolean seler_agre_yn; //판매자동의여부

    private String brnd_bnr_upload_path;  //브랜드배너파일경로
    private String brnd_upload_path;  //브랜드프로필파일경로

    private String brnd_cn;  //브랜드내용

    private int subs_cnt; //팔로워수

    private int state_cd;  //상태코드; MemberState

    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date reg_tm; //등록날짜
    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date aprv_tm; //승인날짜
    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date chg_tm; //수정날짜
    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date pwd_upt_tm;  //비번변경날짜
    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date last_login_tm;  //최종로그인날짜

}
