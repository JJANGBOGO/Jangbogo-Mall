package com.jangbogo.mall.domain;

import java.util.Date;

public class OrderDetailDto {
    // iv
    private Integer idx;                                                                                                // 주문상세번호 IDX
    private Integer ord_idx;                                                                                            // 주문번호 ORD_IDX
    private Integer prod_idx;                                                                                           // 상품번호 PROD_IDX
    private Integer prod_opt_idx;                                                                                       // 세부상품번호 PROD_OPT_DIX
    private String prod_nm;                                                                                             // 주문상품이름 PROD_NM
    private Integer prod_prc;                                                                                           // 주문상품가격 PROD_PRC
    private Integer prod_qty;                                                                                           // 주문상품수량 PROD_QTY
    private Integer rtng_qty;                                                                                           // 주문반품수량 RTNG_QTY
    private Integer prod_tot_amt;                                                                                       // 주문상품총금액 PROD_TOT_AMT
    private Integer prod_sfkp_type_cd;                                                                                  // 주문상품배송유형코드 PROD_SFKP_TYPE_CD
    private Integer setl_mn_cd;                                                                                         // 결제수단코드 SETL_MN_CD
    private Integer ord_state_cd;                                                                                       // 주문상태코드 ORD_STATE_CD
    private Integer prod_late_state_cd;                                                                                 // 후기작성상태코드 PROD_LATE_STATE_CD
    private Integer cncl_posbl_state_cd;                                                                                // 주문취소가능상태코드 CNCL_POSBL_STATE_CD
    private Date ord_tm;                                                                                                // 주문일자 ORD_TM
    private Date setl_cmpl_tm;                                                                                          // 결제완료일자 SETL_CMPL_TM
    private Date setl_cncl_tm;                                                                                          // 결제취소일자 SETL_CNCL_TM
    private Date dlvry_start_tm;                                                                                        // 배송출발일자 DLVRY_START_TM
    private Date dlvry_cmpl_tm;                                                                                         // 배송완료일자 DLVRY_CMPL_TM
    private Date rtng_rqst_tm;                                                                                          // 반품신청일자 RTNG_RQST_TM
    private Date rtng_cmpl_tm;                                                                                          // 반품완료일자 RTNG_CMPL_TM
    private Date excng_rqst_tm;                                                                                         // 교환신청일자 EXCNG_RQST_TM
    private Date excng_cmpl_tm;                                                                                         // 교환완료일자 EXCNG_CMPL_TM
    private Date excng_rcpt_tm;                                                                                         // 환불접수일자 EXCNG_RCPT_TM
    private Date rfnd_cmpl_tm;                                                                                          // 환불완료일자 RFND_CMPL_TM
    private Date crt_tm;                                                                                                // 최초등록일자 CRT_TM
    private Integer crt_idx;                                                                                            // 최초등록자식별번호 CRT_IDX
    private Date upt_tm;                                                                                                // 최종수정일자 UPT_TM
    private Integer upt_idx;                                                                                            // 최종수정자식별번호 UPT_IDX

    // contructor
    public OrderDetailDto() {}                                                                                          // 기본생성자

    // getter & setter
    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) { this.idx = idx; }

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

    public Integer getProd_opt_idx() {
        return prod_opt_idx;
    }

    public void setProd_opt_idx(Integer prod_opt_idx) {
        this.prod_opt_idx = prod_opt_idx;
    }

    public String getProd_nm() {
        return prod_nm;
    }

    public void setProd_nm(String prod_nm) {
        this.prod_nm = prod_nm;
    }

    public Integer getProd_prc() {
        return prod_prc;
    }

    public void setProd_prc(Integer prod_prc) {
        this.prod_prc = prod_prc;
    }

    public Integer getProd_qty() {
        return prod_qty;
    }

    public void setProd_qty(Integer prod_qty) {
        this.prod_qty = prod_qty;
    }

    public Integer getRtng_qty() {
        return rtng_qty;
    }

    public void setRtng_qty(Integer rtng_qty) {
        this.rtng_qty = rtng_qty;
    }

    public Integer getProd_tot_amt() {
        return prod_tot_amt;
    }

    public void setProd_tot_amt(Integer prod_tot_amt) {
        this.prod_tot_amt = prod_tot_amt;
    }

    public Integer getProd_sfkp_type_cd() {
        return prod_sfkp_type_cd;
    }

    public void setProd_sfkp_type_cd(Integer prod_sfkp_type_cd) {
        this.prod_sfkp_type_cd = prod_sfkp_type_cd;
    }

    public Integer getSetl_mn_cd() {
        return setl_mn_cd;
    }

    public void setSetl_mn_cd(Integer setl_mn_cd) {
        this.setl_mn_cd = setl_mn_cd;
    }

    public Integer getOrd_state_cd() {
        return ord_state_cd;
    }

    public void setOrd_state_cd(Integer ord_state_cd) {
        this.ord_state_cd = ord_state_cd;
    }

    public Integer getProd_late_state_cd() {
        return prod_late_state_cd;
    }

    public void setProd_late_state_cd(Integer prod_late_state_cd) {
        this.prod_late_state_cd = prod_late_state_cd;
    }

    public Integer getCncl_posbl_state_cd() {
        return cncl_posbl_state_cd;
    }

    public void setCncl_posbl_state_cd(Integer cncl_posbl_state_cd) {
        this.cncl_posbl_state_cd = cncl_posbl_state_cd;
    }

    public Date getOrd_tm() {
        return ord_tm;
    }

    public void setOrd_tm(Date ord_tm) {
        this.ord_tm = ord_tm;
    }

    public Date getSetl_cmpl_tm() {
        return setl_cmpl_tm;
    }

    public void setSetl_cmpl_tm(Date setl_cmpl_tm) {
        this.setl_cmpl_tm = setl_cmpl_tm;
    }

    public Date getSetl_cncl_tm() {
        return setl_cncl_tm;
    }

    public void setSetl_cncl_tm(Date setl_cncl_tm) {
        this.setl_cncl_tm = setl_cncl_tm;
    }

    public Date getDlvry_start_tm() {
        return dlvry_start_tm;
    }

    public void setDlvry_start_tm(Date dlvry_start_tm) {
        this.dlvry_start_tm = dlvry_start_tm;
    }

    public Date getDlvry_cmpl_tm() {
        return dlvry_cmpl_tm;
    }

    public void setDlvry_cmpl_tm(Date dlvry_cmpl_tm) {
        this.dlvry_cmpl_tm = dlvry_cmpl_tm;
    }

    public Date getRtng_rqst_tm() {
        return rtng_rqst_tm;
    }

    public void setRtng_rqst_tm(Date rtng_rqst_tm) {
        this.rtng_rqst_tm = rtng_rqst_tm;
    }

    public Date getRtng_cmpl_tm() {
        return rtng_cmpl_tm;
    }

    public void setRtng_cmpl_tm(Date rtng_cmpl_tm) {
        this.rtng_cmpl_tm = rtng_cmpl_tm;
    }

    public Date getExcng_rqst_tm() {
        return excng_rqst_tm;
    }

    public void setExcng_rqst_tm(Date excng_rqst_tm) {
        this.excng_rqst_tm = excng_rqst_tm;
    }

    public Date getExcng_cmpl_tm() {
        return excng_cmpl_tm;
    }

    public void setExcng_cmpl_tm(Date excng_cmpl_tm) {
        this.excng_cmpl_tm = excng_cmpl_tm;
    }

    public Date getExcng_rcpt_tm() {
        return excng_rcpt_tm;
    }

    public void setExcng_rcpt_tm(Date excng_rcpt_tm) {
        this.excng_rcpt_tm = excng_rcpt_tm;
    }

    public Date getRfnd_cmpl_tm() {
        return rfnd_cmpl_tm;
    }

    public void setRfnd_cmpl_tm(Date rfnd_cmpl_tm) {
        this.rfnd_cmpl_tm = rfnd_cmpl_tm;
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
        return "{" +
                "idx=" + idx +
                ", ord_idx=" + ord_idx +
                ", prod_idx=" + prod_idx +
                ", prod_opt_idx=" + prod_opt_idx +
                ", prod_nm='" + prod_nm + '\'' +
                ", prod_prc=" + prod_prc +
                ", prod_qty=" + prod_qty +
                ", rtng_qty=" + rtng_qty +
                ", prod_tot_amt=" + prod_tot_amt +
                ", prod_sfkp_type_cd=" + prod_sfkp_type_cd +
                ", setl_mn_cd=" + setl_mn_cd +
                ", ord_state_cd=" + ord_state_cd +
                ", prod_late_state_cd=" + prod_late_state_cd +
                ", cncl_posbl_state_cd=" + cncl_posbl_state_cd +
                ", ord_tm=" + ord_tm +
                ", setl_cmpl_tm=" + setl_cmpl_tm +
                ", setl_cncl_tm=" + setl_cncl_tm +
                ", dlvry_start_tm=" + dlvry_start_tm +
                ", dlvry_cmpl_tm=" + dlvry_cmpl_tm +
                ", rtng_rqst_tm=" + rtng_rqst_tm +
                ", rtng_cmpl_tm=" + rtng_cmpl_tm +
                ", excng_rqst_tm=" + excng_rqst_tm +
                ", excng_cmpl_tm=" + excng_cmpl_tm +
                ", excng_rcpt_tm=" + excng_rcpt_tm +
                ", rfnd_cmpl_tm=" + rfnd_cmpl_tm +
                ", crt_tm=" + crt_tm +
                ", crt_idx=" + crt_idx +
                ", upt_tm=" + upt_tm +
                ", upt_idx=" + upt_idx +
                '}';
    }
}