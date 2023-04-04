package com.jangbogo.mall.domain;

import java.util.Date;
import java.util.Objects;

public class ProdInqryDto {

    private Integer idx;
    private Integer prod_idx;
    private Integer user_idx;
    private String title;
    private String ctent;
    private String writer;
    private Date wrt_tm;
    private Integer res_state_cd;

    public ProdInqryDto() {}

    public ProdInqryDto(String title, String ctent, String writer, Integer res_state_cd) {
        this.title = title;
        this.ctent = ctent;
        this.writer = writer;
        this.res_state_cd = res_state_cd;
    }

    @Override
    public String toString() {
        return "ProdInqryDto{" +
                "idx=" + idx +
                ", prod_idx=" + prod_idx +
                ", user_idx=" + user_idx +
                ", title='" + title + '\'' +
                ", ctent='" + ctent + '\'' +
                ", writer='" + writer + '\'' +
                ", wrt_tm=" + wrt_tm +
                ", res_state_cd=" + res_state_cd +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProdInqryDto that = (ProdInqryDto) o;
        return Objects.equals(idx, that.idx) && Objects.equals(prod_idx, that.prod_idx) && Objects.equals(user_idx, that.user_idx) && Objects.equals(title, that.title) && Objects.equals(ctent, that.ctent) && Objects.equals(writer, that.writer) && Objects.equals(wrt_tm, that.wrt_tm) && Objects.equals(res_state_cd, that.res_state_cd);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idx, prod_idx, user_idx, title, ctent, writer, wrt_tm, res_state_cd);
    }

    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) {
        this.idx = idx;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCtent() {
        return ctent;
    }

    public void setCtent(String ctent) {
        this.ctent = ctent;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public Date getWrt_tm() {
        return wrt_tm;
    }

    public void setWrt_tm(Date wrt_tm) {
        this.wrt_tm = wrt_tm;
    }

    public Integer getRes_state_cd() {
        return res_state_cd;
    }

    public void setRes_state_cd(Integer res_state_cd) {
        this.res_state_cd = res_state_cd;
    }
}
