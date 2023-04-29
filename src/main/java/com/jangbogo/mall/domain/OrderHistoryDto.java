package com.jangbogo.mall.domain;

import java.util.Date;

public class OrderHistoryDto {
    // iv
    private Integer idx;                                                                                                // 주문이력번호 IDX(PK)
    private Integer ord_dtl_idx;                                                                                        // 주문상세정보 ORD_DTL_IDX(FK)
    private Integer ord_idx;                                                                                            // 주문번호 ORD_IDX(FK)
    private Integer prod_idx;                                                                                           // 상품번호 PROD_IDX
    private String prod_nm;                                                                                            // 주문상품이름 PROD_NM
    private Integer ord_state_cd;                                                                                       // 주문상태코드 ORD_STATE_CD
    private Date chg_tm;                                                                                             // 주문이력변경일시 CHG_TM
    private Date crt_tm;                                                                                                // 최초등록일자 CRT_TM
    private Integer crt_idx;                                                                                            // 최초등록자식별번호 CRT_IDX
    private Date upt_tm;                                                                                                // 최종수정일자 UPT_TM
    private Integer upt_idx;                                                                                            // 최종수정자식별번호 UPT_IDX

    // constructor
    public OrderHistoryDto() {}                                                                                         // 기본생성자

    // getter & setter
    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) {
        this.idx = idx;
    }

    public Integer getOrd_dtl_idx() {
        return ord_dtl_idx;
    }

    public void setOrd_dtl_idx(Integer ord_dtl_idx) {
        this.ord_dtl_idx = ord_dtl_idx;
    }

    public Integer getOrd_idx() {
        return ord_idx;
    }

    public void setOrd_idx(Integer ord_idx) {
        this.ord_idx = ord_idx;
    }

    public Integer getProd_idx() {
        return prod_idx;
    }

    public void setProd_idx(Integer prod_idx) {
        this.prod_idx = prod_idx;
    }

    public String getProd_nm() {
        return prod_nm;
    }

    public void setProd_nm(String prod_nm) {
        this.prod_nm = prod_nm;
    }

    public Integer getOrd_state_cd() {
        return ord_state_cd;
    }

    public void setOrd_state_cd(Integer ord_state_cd) {
        this.ord_state_cd = ord_state_cd;
    }

    public Date getChg_tm() {
        return chg_tm;
    }

    public void setChg_tm(Date chg_tm) {
        this.chg_tm = chg_tm;
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

    // toString
    @Override
    public String toString() {
        return "OrderHistoryDto{" +
                "idx=" + idx +
                ", ord_dtl_idx=" + ord_dtl_idx +
                ", ord_idx=" + ord_idx +
                ", prod_idx=" + prod_idx +
                ", prod_nm=" + prod_nm +
                ", ord_state_cd=" + ord_state_cd +
                ", chg_tm=" + chg_tm +
                ", crt_tm=" + crt_tm +
                ", crt_idx=" + crt_idx +
                ", upt_tm=" + upt_tm +
                ", upt_idx=" + upt_idx +
                '}';
    }
}
