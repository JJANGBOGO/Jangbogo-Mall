package com.jangbogo.mall.domain;

import javax.xml.crypto.Data;
import java.util.Date;

public class OrderDto {
    private Integer idx;
    private Integer user_idx;
    private String ordr_nm;
    private String mpno;
    private Integer tot_amt;
    private Integer gtot;
    private Integer plist_tot;
    private Date ord_tml;
    private Integer state_cd;
    private Date crt_tm;
    private Integer crt_idx;
    private Date upt_tm;
    private Integer utp_idx;

    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) {
        this.idx = idx;
    }

    public Integer getUser_idx() {
        return user_idx;
    }

    public void setUser_idx(Integer user_idx) {
        this.user_idx = user_idx;
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

    public Date getOrd_tml() {
        return ord_tml;
    }

    public void setOrd_tml(Date ord_tml) {
        this.ord_tml = ord_tml;
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

    public Integer getUtp_idx() {
        return utp_idx;
    }

    public void setUtp_idx(Integer utp_idx) {
        this.utp_idx = utp_idx;
    }

    @Override
    public String toString() {
        return "OrderDto{" +
                "idx=" + idx +
                ", user_idx=" + user_idx +
                ", ordr_nm='" + ordr_nm + '\'' +
                ", mpno='" + mpno + '\'' +
                ", tot_amt=" + tot_amt +
                ", gtot=" + gtot +
                ", plist_tot=" + plist_tot +
                ", ord_tml=" + ord_tml +
                ", state_cd=" + state_cd +
                ", crt_tm=" + crt_tm +
                ", crt_idx=" + crt_idx +
                ", upt_tm=" + upt_tm +
                ", utp_idx=" + utp_idx +
                '}';
    }
}
