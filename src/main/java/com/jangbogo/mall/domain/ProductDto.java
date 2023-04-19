package com.jangbogo.mall.domain;

import java.util.Date;
import java.util.Objects;

public class ProductDto {
    private Integer idx;
    private Integer seler_idx;
    private Integer cate_idx;
    private Integer seler_prod_cd;
    private String upload_path;
    private String name;
    private String ctent;
    private Integer prc;
    private Integer dc_state_cd;
    private Integer dc_rate;
    private Integer dsply_state_cd;
    private Integer ascr;
    private String resv_photo_upload_path;
    private Date crt_tm;
    private Integer crt_idx;
    private Date upt_tm;
    private Integer upt_idx;

    public ProductDto(){}



    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) {
        this.idx = idx;
    }

    public Integer getSeler_idx() {
        return seler_idx;
    }

    public void setSeler_idx(Integer seler_idx) {
        this.seler_idx = seler_idx;
    }

    public Integer getCate_idx() {
        return cate_idx;
    }

    public void setCate_idx(Integer cate_idx) {
        this.cate_idx = cate_idx;
    }

    public Integer getSeler_prod_cd() {
        return seler_prod_cd;
    }

    public void setSeler_prod_cd(Integer seler_prod_cd) {
        this.seler_prod_cd = seler_prod_cd;
    }

    public String getUpload_path() {
        return upload_path;
    }

    public void setUpload_path(String upload_path) {
        this.upload_path = upload_path;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCtent() {
        return ctent;
    }

    public void setCtent(String ctent) {
        this.ctent = ctent;
    }

    public Integer getPrc() {
        return prc;
    }

    public void setPrc(Integer prc) {
        this.prc = prc;
    }

    public Integer getDc_state_cd() {
        return dc_state_cd;
    }

    public void setDc_state_cd(Integer dc_state_cd) {
        this.dc_state_cd = dc_state_cd;
    }

    public Integer getDc_rate() {
        return dc_rate;
    }

    public void setDc_rate(Integer dc_rate) {
        this.dc_rate = dc_rate;
    }

    public Integer getDsply_state_cd() {
        return dsply_state_cd;
    }

    public void setDsply_state_cd(Integer dsply_state_cd) {
        this.dsply_state_cd = dsply_state_cd;
    }

    public Integer getAscr() {
        return ascr;
    }

    public void setAscr(Integer ascr) {
        this.ascr = ascr;
    }

    public String getResv_photo_upload_path() {
        return resv_photo_upload_path;
    }

    public void setResv_photo_upload_path(String resv_photo_upload_path) {
        this.resv_photo_upload_path = resv_photo_upload_path;
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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductDto that = (ProductDto) o;
        return Objects.equals(idx, that.idx) && Objects.equals(seler_idx, that.seler_idx) && Objects.equals(cate_idx, that.cate_idx) && Objects.equals(seler_prod_cd, that.seler_prod_cd) && Objects.equals(upload_path, that.upload_path) && Objects.equals(name, that.name) && Objects.equals(ctent, that.ctent) && Objects.equals(prc, that.prc) && Objects.equals(dc_state_cd, that.dc_state_cd) && Objects.equals(dc_rate, that.dc_rate) && Objects.equals(dsply_state_cd, that.dsply_state_cd) && Objects.equals(ascr, that.ascr) && Objects.equals(resv_photo_upload_path, that.resv_photo_upload_path) && Objects.equals(crt_tm, that.crt_tm) && Objects.equals(crt_idx, that.crt_idx) && Objects.equals(upt_tm, that.upt_tm) && Objects.equals(upt_idx, that.upt_idx);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idx, seler_idx, cate_idx, seler_prod_cd, upload_path, name, ctent, prc, dc_state_cd, dc_rate, dsply_state_cd, ascr, resv_photo_upload_path, crt_tm, crt_idx, upt_tm, upt_idx);
    }

    @Override
    public String toString() {
        return "ProductDto{" +
                "idx=" + idx +
                ", seler_idx=" + seler_idx +
                ", cate_idx=" + cate_idx +
                ", seler_prod_cd=" + seler_prod_cd +
                ", upload_path='" + upload_path + '\'' +
                ", name='" + name + '\'' +
                ", ctent='" + ctent + '\'' +
                ", prc=" + prc +
                ", dc_state_cd=" + dc_state_cd +
                ", dc_rate=" + dc_rate +
                ", dsply_state_cd=" + dsply_state_cd +
                ", ascr=" + ascr +
                ", resv_photo_upload_path='" + resv_photo_upload_path + '\'' +
                ", crt_tm=" + crt_tm +
                ", crt_idx=" + crt_idx +
                ", upt_tm=" + upt_tm +
                ", upt_idx=" + upt_idx +
                '}';
    }
}