package com.jangbogo.mall.domain;

import org.springframework.stereotype.Repository;

@Repository
public class OrderDto {
    // iv 선언
    Integer idx;                                                                    // 주문번호  IDX
    String ordr_nm = "";                                                            // 주문자이름 ORDR_NM
    String mpno = "";                                                               // 주문자휴대전화번호 MPNO
    Integer user_idx = 0;                                                           // 회원번호  USER_IDX

    // Constructor
    public OrderDto() {}                                                            // 기본 생성자

    public OrderDto(Integer idx, String ordr_nm, String mpno, Integer user_idx) {   // 매개변수 있는 생성자
        this.idx = idx;
        this.ordr_nm = ordr_nm;
        this.mpno = mpno;
        this.user_idx = user_idx;
    }

    // Getter & Setter
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

    // toString()
    @Override
    public String toString() {
        return "{" +
                "idx=" + idx +
                ", ordr_nm='" + ordr_nm + '\'' +
                ", mpno='" + mpno + '\'' +
                ", user_idx=" + user_idx +
                '}';
    }
}
