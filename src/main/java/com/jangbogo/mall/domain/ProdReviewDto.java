package com.jangbogo.mall.domain;

import java.util.Date;

public class ProdReviewDto {
    private Integer idx; // 상품후기일련번호
    private Integer ord_idx; // 주문번호
    private Integer prod_idx; // 상품번호
    private Integer user_idx; // 회원번호
    private String ctent; // 상품후기내용
    private String writer; // 상품후기작성자
    private Integer ascr; // 상품평점
    private Integer like_cnt; // 좋아요개수
    private Date reg_tm; // 상품후기등록일자
    private Date chg_tm; // 상품후기수정일자
    private Integer rnk_cd; // 상품후기등급코드
    private String opub_yn; // 상품후기공개여부
    private Integer decl_cnt; // 상품후기신고개수
    private Date crt_tm; // 최초등록일자
    private Integer crt_idx; // 최초등록자식별번호
    private Date upt_tm; // 최종수정일자
    private Integer upt_idx; // 최종수정자식별번호
    private String name; // 상품이름
    private String resv_photo_upload_path;

    // 생성자와 equals and hashcode 안만들었음


    public ProdReviewDto(){};
    public ProdReviewDto(Integer idx, String ctent, String writer) {
        this.idx = idx;
        this.ctent = ctent;
        this.writer = writer;
    }

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

    public Integer getAscr() {
        return ascr;
    }

    public void setAscr(Integer ascr) {
        this.ascr = ascr;
    }

    public Integer getLike_cnt() {
        return like_cnt;
    }

    public void setLike_cnt(Integer like_cnt) {
        this.like_cnt = like_cnt;
    }

    public Date getReg_tm() {
        return reg_tm;
    }

    public void setReg_tm(Date reg_tm) {
        this.reg_tm = reg_tm;
    }

    public Date getChg_tm() {
        return chg_tm;
    }

    public void setChg_tm(Date chg_tm) {
        this.chg_tm = chg_tm;
    }

    public Integer getRnk_cd() {
        return rnk_cd;
    }

    public void setRnk_cd(Integer rnk_cd) {
        this.rnk_cd = rnk_cd;
    }

    public String getOpub_yn() {
        return opub_yn;
    }

    public void setOpub_yn(String opub_yn) {
        this.opub_yn = opub_yn;
    }

    public Integer getDecl_cnt() {
        return decl_cnt;
    }

    public void setDecl_cnt(Integer decl_cnt) {
        this.decl_cnt = decl_cnt;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getResv_photo_upload_path() {
        return resv_photo_upload_path;
    }

    public void setResv_photo_upload_path(String resv_photo_upload_path) {
        this.resv_photo_upload_path = resv_photo_upload_path;
    }

    @Override
    public String toString() {
        return "ProdReviewDto{" +
                "idx=" + idx +
                ", ord_idx=" + ord_idx +
                ", prod_idx=" + prod_idx +
                ", user_idx=" + user_idx +
                ", ctent='" + ctent + '\'' +
                ", writer='" + writer + '\'' +
                ", ascr=" + ascr +
                ", like_cnt=" + like_cnt +
                ", reg_tm=" + reg_tm +
                ", chg_tm=" + chg_tm +
                ", rnk_cd=" + rnk_cd +
                ", opub_yn='" + opub_yn + '\'' +
                ", decl_cnt=" + decl_cnt +
                ", crt_tm=" + crt_tm +
                ", crt_idx=" + crt_idx +
                ", upt_tm=" + upt_tm +
                ", upt_idx=" + upt_idx +
                ", name='" + name + '\'' +
                ", resv_photo_upload_path='" + resv_photo_upload_path + '\'' +
                '}';
    }
}
