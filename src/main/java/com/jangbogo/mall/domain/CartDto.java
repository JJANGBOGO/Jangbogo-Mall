package com.jangbogo.mall.domain;

import org.springframework.stereotype.Repository;

import java.util.Date;

public class CartDto {
    // iv
    private Integer prod_idx;                                                                                           // 상품번호  PROD_IDX
    private Integer user_idx;                                                                                           // 회원번호 USER_IDX
    private String prod_name;                                                                                           // 상품이름 PROD_NAME;
    private Integer prod_price;                                                                                         // 상품가격 PRODUCT.PRC
    private Integer dc_rate;                                                                                            // 상품할인율 PRODUCT.DC_RATE
    private Integer prod_cnt;                                                                                           // 장바구니상품수량 CART.PROD_CNT
    private String upload_path;                                                                                         // 이미지파일경로 PRODUCT.UPLOAD_PATH
    private Date reg_tm;                                                                                                // 장바구니상품등록일자 CART.REG_TM
    private Date crt_tm;                                                                                                // 최초등록일자 CRT_TM
    private Date upt_tm;                                                                                                // 최종수정일자 UPT_TM

    // contructor
    public CartDto() {}                                                                                                 // 기본생성자

    public CartDto(Integer prod_idx, Integer user_idx, String prod_name, Integer prod_price, Integer prod_cnt, String upload_path) { // 매개변수 있는 생성자
        this.prod_idx = prod_idx;
        this.user_idx = user_idx;
        this.prod_name = prod_name;
        this.prod_price = prod_price;
        this.prod_cnt = prod_cnt;
        this.upload_path = upload_path;
    }

    // getter and setter
    public Integer getProd_idx() {
        return prod_idx;
    }

    public void setProd_idx(Integer prod_idx) {
        this.prod_idx = prod_idx;
    }

    public Integer getUser_idx() {
        return user_idx;
    }

    public void setUser_idx(Integer user_idx) {
        this.user_idx = user_idx;
    }

    public String getProd_name() {
        return prod_name;
    }

    public void setProd_name(String prod_name) {
        this.prod_name = prod_name;
    }

    public Integer getProd_price() {
        return prod_price;
    }

    public void setProd_price(Integer prod_price) {
        this.prod_price = prod_price;
    }

    public Integer getDc_rate() {
        return dc_rate;
    }

    public void setDc_rate(Integer dc_rate) {
        this.dc_rate = dc_rate;
    }

    public Integer getProd_cnt() {
        return prod_cnt;
    }

    public void setProd_cnt(Integer prod_cnt) {
        this.prod_cnt = prod_cnt;
    }

    public String getUpload_path() {
        return upload_path;
    }

    public void setUpload_path(String upload_path) {
        this.upload_path = upload_path;
    }

    public Date getReg_tm() {
        return reg_tm;
    }

    public void setReg_tm(Date reg_tm) {
        this.reg_tm = reg_tm;
    }

    public Date getCrt_tm() {
        return crt_tm;
    }

    public void setCrt_tm(Date crt_tm) {
        this.crt_tm = crt_tm;
    }

    public Date getUpt_tm() {
        return upt_tm;
    }

    public void setUpt_tm(Date upt_tm) {
        this.upt_tm = upt_tm;
    }

    // toString
    @Override
    public String toString() {
        return "CartDto{" +
                "prod_idx=" + prod_idx +
                ", user_idx=" + user_idx +
                ", prod_name='" + prod_name + '\'' +
                ", prod_price=" + prod_price +
                ", dc_rate=" + dc_rate +
                ", prod_cnt=" + prod_cnt +
                ", upload_path='" + upload_path + '\'' +
                ", reg_tm=" + reg_tm +
                ", crt_tm=" + crt_tm +
                ", upt_tm=" + upt_tm +
                '}';
    }
}
