package com.jangbogo.mall.domain;

import java.util.Date;
import java.util.Objects;

public class JoinProdInqryDto {

    private Integer idx;
    private Integer prod_idx;
    private Integer user_idx;
    private String title;
    private String ctent;
    private String writer;
    private Integer res_state_cd;
    private String opub_yn;
    private Date wrt_tm;
    private String ans_content;
    private String ans_writer;
    private Date ans_write_time;

    public JoinProdInqryDto() {}

    public JoinProdInqryDto(Integer idx, Integer prod_idx, Integer user_idx, String title, String ctent, String writer, Integer res_state_cd, String opub_yn, String ans_content, String ans_writer) {
        this.idx = idx;
        this.prod_idx = prod_idx;
        this.user_idx = user_idx;
        this.title = title;
        this.ctent = ctent;
        this.writer = writer;
        this.res_state_cd = res_state_cd;
        this.opub_yn = opub_yn;
        this.ans_content = ans_content;
        this.ans_writer = ans_writer;
    }

    @Override
    public String toString() {
        return "JoinProdInqryDto{" +
                "idx=" + idx +
                ", prod_idx=" + prod_idx +
                ", user_idx=" + user_idx +
                ", title='" + title + '\'' +
                ", ctent='" + ctent + '\'' +
                ", writer='" + writer + '\'' +
                ", res_state_cd=" + res_state_cd +
                ", opub_yn='" + opub_yn + '\'' +
                ", wrt_tm=" + wrt_tm +
                ", ans_content='" + ans_content + '\'' +
                ", ans_writer='" + ans_writer + '\'' +
                ", ans_write_time=" + ans_write_time +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        JoinProdInqryDto that = (JoinProdInqryDto) o;
        return Objects.equals(idx, that.idx) && Objects.equals(prod_idx, that.prod_idx) && Objects.equals(user_idx, that.user_idx) && Objects.equals(title, that.title) && Objects.equals(ctent, that.ctent) && Objects.equals(writer, that.writer) && Objects.equals(res_state_cd, that.res_state_cd) && Objects.equals(opub_yn, that.opub_yn) && Objects.equals(ans_content, that.ans_content) && Objects.equals(ans_writer, that.ans_writer);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idx, prod_idx, user_idx, title, ctent, writer, res_state_cd, opub_yn, ans_content, ans_writer);
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

    public Integer getRes_state_cd() {
        return res_state_cd;
    }

    public void setRes_state_cd(Integer res_state_cd) {
        this.res_state_cd = res_state_cd;
    }

    public String getOpub_yn() {
        return opub_yn;
    }

    public void setOpub_yn(String opub_yn) {
        this.opub_yn = opub_yn;
    }

    public Date getWrt_tm() {
        return wrt_tm;
    }

    public void setWrt_tm(Date wrt_tm) {
        this.wrt_tm = wrt_tm;
    }

    public String getAns_content() {
        return ans_content;
    }

    public void setAns_content(String ans_content) {
        this.ans_content = ans_content;
    }

    public String getAns_writer() {
        return ans_writer;
    }

    public void setAns_writer(String ans_writer) {
        this.ans_writer = ans_writer;
    }

    public Date getAns_write_time() {
        return ans_write_time;
    }

    public void setAns_write_time(Date ans_write_time) {
        this.ans_write_time = ans_write_time;
    }
}
