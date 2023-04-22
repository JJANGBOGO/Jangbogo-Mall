package com.jangbogo.mall.domain;

import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public class PaymentDto {                                                                                               // 결제(SETL) - TABLE NAME
    // iv
    private Integer idx;                                                                                                // 결제일련번호(IDX) - PK
    private Integer ord_idx;                                                                                            // 주문번호(ORD_IDX) - FK
    private Integer dlvry_mthd_idx;                                                                                     // 배송방식번호(DLVRY_MTHD_IDX) - FK
    private String  aprv_idx;                                                                                           // 카드사승인번호(APRV_IDX)
    private String  setl_idx;                                                                                           // 결제고유번호(SETL_IDX)
    private Integer ord_tot_amt;                                                                                        // 주문총금액(ORD_TOT_AMT)
    private Integer amt;                                                                                                // 실결제금액(AMT)
    private Integer coupn_use_amt;                                                                                      // 쿠폰사용금액(COUPN_USE_AMT)
    private Integer mn_cd;                                                                                              // 결제수단코드(MN_CD)
    private Integer state_cd;                                                                                           // 결제상태코드(STATE_CD)
    private Date deal_tm;                                                                                               // 거래일자(DEAL_TM)
    private Date crt_tm;                                                                                                // 최초등록일자(CRT_TM)
    private Integer crt_idx;                                                                                            // 최초등록자식별번호(CRT_IDX)
    private Date upt_tm;                                                                                                // 최종등록일자(UPT_TM)
    private Integer upt_idx;                                                                                            // 최종등록자식별번호(UPT_IDX)

    // constructor
    public PaymentDto() {}                                                                                              // 기본 생성자

    public PaymentDto(String setl_idx, Integer ord_tot_amt, Integer amt, String aprv_idx, Integer ord_idx) {
        this.setl_idx = setl_idx;
        this.ord_tot_amt = ord_tot_amt;
        this.amt = amt;
        this.aprv_idx = aprv_idx;
        this.ord_idx = ord_idx;
    }

    // getter & setter
    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) {
        this.idx = idx;
    }

    public Integer getOrd_idx() {
        return ord_idx;
    }

    public void setOrd_idx(Integer ord_idx) {
        this.ord_idx = ord_idx;
    }

    public Integer getDlvry_mthd_idx() {
        return dlvry_mthd_idx;
    }

    public void setDlvry_mthd_idx(Integer dlvry_mthd_idx) {
        this.dlvry_mthd_idx = dlvry_mthd_idx;
    }

    public String getAprv_idx() {
        return aprv_idx;
    }

    public void setAprv_idx(String aprv_idx) {
        this.aprv_idx = aprv_idx;
    }

    public String getSetl_idx() {
        return setl_idx;
    }

    public void setSetl_idx(String setl_idx) {
        this.setl_idx = setl_idx;
    }

    public Integer getOrd_tot_amt() {
        return ord_tot_amt;
    }

    public void setOrd_tot_amt(Integer ord_tot_amt) {
        this.ord_tot_amt = ord_tot_amt;
    }

    public Integer getAmt() {
        return amt;
    }

    public void setAmt(Integer amt) {
        this.amt = amt;
    }

    public Integer getCoupn_use_amt() {
        return coupn_use_amt;
    }

    public void setCoupn_use_amt(Integer coupn_use_amt) {
        this.coupn_use_amt = coupn_use_amt;
    }

    public Integer getMn_cd() {
        return mn_cd;
    }

    public void setMn_cd(Integer mn_cd) {
        this.mn_cd = mn_cd;
    }

    public Integer getState_cd() {
        return state_cd;
    }

    public void setState_cd(Integer state_cd) {
        this.state_cd = state_cd;
    }

    public Date getDeal_tm() {
        return deal_tm;
    }

    public void setDeal_tm(Date deal_tm) {
        this.deal_tm = deal_tm;
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
                ", dlvry_mthd_idx=" + dlvry_mthd_idx +
                ", aprv_idx=" + aprv_idx +
                ", setl_idx=" + setl_idx +
                ", ord_tot_amt=" + ord_tot_amt +
                ", amt=" + amt +
                ", coupn_use_amt=" + coupn_use_amt +
                ", mn_cd=" + mn_cd +
                ", state_cd=" + state_cd +
                ", deal_tm=" + deal_tm +
                ", crt_tm=" + crt_tm +
                ", crt_idx=" + crt_idx +
                ", upt_tm=" + upt_tm +
                ", upt_idx=" + upt_idx +
                '}';
    }
}
