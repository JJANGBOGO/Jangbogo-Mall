package com.jangbogo.mall.domain;

import java.util.Date;
import java.util.Objects;

public class WishlistDto {
    private Integer prod_idx;
    private Integer user_idx;
    private Date reg_tm;
    private Date crt_tm;
    private Integer crt_idx;
    private Date upt_tm;
    private Integer upt_idx;
    // 생성자와 equals and hashcode 안만들었음

    public WishlistDto(){

    }


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

    @Override
    public String toString() {
        return "WishlistDto{" +
                "prod_idx=" + prod_idx +
                ", user_idx=" + user_idx +
                ", reg_tm=" + reg_tm +
                ", crt_tm=" + crt_tm +
                ", crt_idx=" + crt_idx +
                ", upt_tm=" + upt_tm +
                ", upt_idx=" + upt_idx +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        WishlistDto that = (WishlistDto) o;
        return Objects.equals(prod_idx, that.prod_idx) && Objects.equals(user_idx, that.user_idx) && Objects.equals(reg_tm, that.reg_tm) && Objects.equals(crt_tm, that.crt_tm) && Objects.equals(crt_idx, that.crt_idx) && Objects.equals(upt_tm, that.upt_tm) && Objects.equals(upt_idx, that.upt_idx);
    }

    @Override
    public int hashCode() {
        return Objects.hash(prod_idx, user_idx, reg_tm, crt_tm, crt_idx, upt_tm, upt_idx);
    }
}
