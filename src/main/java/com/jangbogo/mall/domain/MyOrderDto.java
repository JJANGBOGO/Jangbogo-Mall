package com.jangbogo.mall.domain;

import org.springframework.stereotype.Repository;

import java.util.Date;


public class MyOrderDto {
    // iv
        // ... 주문내역에 필요한 데이터(주문번호, 주문품목총계, 결제금액, 주문날짜, 주문상태코드)
        // MyOrderDtlDto myOrderDtlDto;(주문상품명, 주문상품이미지URL, 결제방법 + '주문상세에 필요한 iv...' )

    Integer idx;                                                                                                        // 주문번호  IDX
    String ordr_nm;                                                                                                     // 주문자이름 ORDR_NM
    String mpno;                                                                                                        // 주문자휴대전화번호 MPNO
    Integer user_idx;                                                                                                   // 회원번호  USER_IDX
    Integer tot_amt;                                                                                                    // 주문총금액 TOT_AMT
    Integer gtot;                                                                                                       // 주문총수량 GTOT
    Integer plist_tot;                                                                                                  // 주문품목총계 PLIST_TOT
    Date ord_tm;                                                                                                        // 주문날짜 ORD_TM
    Integer state_cd;                                                                                                      // 주문상태코드 STATE_CD
    Date crt_tm;                                                                                                        // 최초등록일자 CRT_TM
    Integer crt_idx;                                                                                                    // 최초등록자식별번호 CRT_IDX
    Date upt_tm;                                                                                                        // 최종수정일자 UPT_TM
    Integer upt_idx;                                                                                                    // 최종수정자식별번호 UPT_IDX


    String upload_path;
    Integer ord_idx;
    String prod_nm;
    Integer setl_mn_cd;


    // constructor
    public MyOrderDto(){}

    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) {
        this.idx = idx;
    }

    public String getOrdr_nm() {
        return ordr_nm;
    }

    public void setOrdr_nm(String ordr_nm) {
        this.ordr_nm = ordr_nm;
    }

    public String getMpno() {
        return mpno;
    }

    public void setMpno(String mpno) {
        this.mpno = mpno;
    }

    public Integer getUser_idx() {
        return user_idx;
    }

    public void setUser_idx(Integer user_idx) {
        this.user_idx = user_idx;
    }

    public Integer getTot_amt() {
        return tot_amt;
    }

    public void setTot_amt(Integer tot_amt) {
        this.tot_amt = tot_amt;
    }

    public Integer getGtot() {
        return gtot;
    }

    public void setGtot(Integer gtot) {
        this.gtot = gtot;
    }

    public Integer getPlist_tot() {
        return plist_tot;
    }

    public void setPlist_tot(Integer plist_tot) {
        this.plist_tot = plist_tot;
    }

    public Date getOrd_tm() {
        return ord_tm;
    }

    public void setOrd_tm(Date ord_tm) {
        this.ord_tm = ord_tm;
    }

    public Integer getState_cd() {
        return state_cd;
    }

    public void setState_cd(Integer state_cd) {
        this.state_cd = state_cd;
    }

    public Date getCrt_tm() {
        return crt_tm;
    }

    public void setCrt_tm(Date crt_tm) {
        this.crt_tm = crt_tm;
    }

    public Integer getCrt_idx() {
        return crt_idx;
    }

    public void setCrt_idx(Integer crt_idx) {
        this.crt_idx = crt_idx;
    }

    public Date getUpt_tm() {
        return upt_tm;
    }

    public void setUpt_tm(Date upt_tm) {
        this.upt_tm = upt_tm;
    }

    public Integer getUpt_idx() {
        return upt_idx;
    }

    public void setUpt_idx(Integer upt_idx) {
        this.upt_idx = upt_idx;
    }

    public String getUpload_path() {
        return upload_path;
    }

    public void setUpload_path(String upload_path) {
        this.upload_path = upload_path;
    }

    public Integer getOrd_idx() {
        return ord_idx;
    }

    public void setOrd_idx(Integer ord_idx) {
        this.ord_idx = ord_idx;
    }

    public String getProd_nm() {
        return prod_nm;
    }

    public void setProd_nm(String prod_nm) {
        this.prod_nm = prod_nm;
    }

    public Integer getSetl_mn_cd() {
        return setl_mn_cd;
    }

    public void setSetl_mn_cd(Integer setl_mn_cd) {
        this.setl_mn_cd = setl_mn_cd;
    }

    @Override
    public String toString() {
        return "MyOrderDto{" +
                "idx=" + idx +
                ", ordr_nm='" + ordr_nm + '\'' +
                ", mpno='" + mpno + '\'' +
                ", user_idx=" + user_idx +
                ", tot_amt=" + tot_amt +
                ", gtot=" + gtot +
                ", plist_tot=" + plist_tot +
                ", ord_tm=" + ord_tm +
                ", state_cd=" + state_cd +
                ", crt_tm=" + crt_tm +
                ", crt_idx=" + crt_idx +
                ", upt_tm=" + upt_tm +
                ", upt_idx=" + upt_idx +
                ", upload_path='" + upload_path + '\'' +
                ", ord_idx=" + ord_idx +
                ", prod_nm='" + prod_nm + '\'' +
                ", setl_mn_cd=" + setl_mn_cd +
                '}';
    }
}

// 주문완료(=결제완료) -> 주문 테이블에 데이터 저장, 결제 테이블에 데이터 저장 + '주문상세 데이터 추가'
// 주문 내역 페이지에 들어가면 getList() -> 주문 ~ 주문상세