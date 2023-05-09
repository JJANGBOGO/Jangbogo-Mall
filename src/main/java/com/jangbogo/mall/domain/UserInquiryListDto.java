package com.jangbogo.mall.domain;

import java.util.Date;

public class UserInquiryListDto {

    // 회원문의(USER_INQRY)
    private Integer idx; // 회원문의번호
    private Integer user_idx; // 회원번호
    private Integer id;  // 문의유형아이디
    private String title; // 회원문의제목
    private String ctent; // 회원문의내용
    private String writer; // 회원문의작성자
    private Date wrt_tm; // 회원문의작성일자
    private Integer resp_state_cd; // 회원문의답변상태코드
    private Integer state_cd; // 회원문의상태코드
    private String resp_infom_yn; // 답변알림여부
    private Date crt_tm; // 최초등록일자
    private Date crt_idx; // 최초등록일자식별번호
    private Date upt_tm; // 최종수정일자
    private Date upt_idx; // 최종수정일자식별번호

    // 문의유형(INQRY_TYPE)
    private Integer upp_floor; // 상위문의유형
    private String name; // 문의유형이름(자식)
    private String parents_name; // 문의유형이름(부모)



    // 생성자(Constructor)
    public UserInquiryListDto(){}


    //Getter and Setter
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Integer getResp_state_cd() {
        return resp_state_cd;
    }

    public void setResp_state_cd(Integer resp_state_cd) {
        this.resp_state_cd = resp_state_cd;
    }

    public Integer getState_cd() {
        return state_cd;
    }

    public void setState_cd(Integer state_cd) {
        this.state_cd = state_cd;
    }

    public String getResp_infom_yn() {
        return resp_infom_yn;
    }

    public void setResp_infom_yn(String resp_infom_yn) {
        this.resp_infom_yn = resp_infom_yn;
    }

    public Date getCrt_tm() {
        return crt_tm;
    }

    public void setCrt_tm(Date crt_tm) {
        this.crt_tm = crt_tm;
    }

    public Date getCrt_idx() {
        return crt_idx;
    }

    public void setCrt_idx(Date crt_idx) {
        this.crt_idx = crt_idx;
    }

    public Date getUpt_tm() {
        return upt_tm;
    }

    public void setUpt_tm(Date upt_tm) {
        this.upt_tm = upt_tm;
    }

    public Date getUpt_idx() {
        return upt_idx;
    }

    public void setUpt_idx(Date upt_idx) {
        this.upt_idx = upt_idx;
    }

    public Integer getUpp_floor() {
        return upp_floor;
    }

    public void setUpp_floor(Integer upp_floor) {
        this.upp_floor = upp_floor;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getParents_name() {
        return parents_name;
    }

    public void setParents_name(String parents_name) {
        this.parents_name = parents_name;
    }

    // toString()
    @Override
    public String toString() {
        return "UserInquiryListDto{" +
                "idx=" + idx +
                ", user_idx=" + user_idx +
                ", id=" + id +
                ", title='" + title + '\'' +
                ", ctent='" + ctent + '\'' +
                ", writer='" + writer + '\'' +
                ", wrt_tm=" + wrt_tm +
                ", resp_state_cd=" + resp_state_cd +
                ", state_cd=" + state_cd +
                ", resp_infom_yn='" + resp_infom_yn + '\'' +
                ", crt_tm=" + crt_tm +
                ", crt_idx=" + crt_idx +
                ", upt_tm=" + upt_tm +
                ", upt_idx=" + upt_idx +
                ", upp_floor=" + upp_floor +
                ", name='" + name + '\'' +
                ", parents_name='" + parents_name + '\'' +
                '}';
    }
}
