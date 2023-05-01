package com.jangbogo.mall.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.Objects;

public class RegistProductDto {
    //상품테이블
    private Integer prod_idx; //IDX //상품번호
    private Integer seler_idx; //SELER_IDX //판매자번호, session에서 가져옴
    private Integer cate_idx; //배송방식 지정을 위한 상위카테고리층 번호
    private String cate_idx2; //CATE_IDX
    private Integer seler_prod_cd; //SELER_PROD_CD
    private String name; //NAME
    private String content; //CTENT
    private Integer prc; //PRC
    private String upload_path; //UPLOAD_PATH  //대표이미지
    private Integer dc_state_cd; //DC_STATE_CD
    private Integer dc_rate; //DC_RATE
    private Integer dsply_state_cd; //DSPLY_STATE_CD
    private float ascr;

    // 상품상세테이블
    private String orplc; //ORPLC
    private String sle_unit; //SLE_UNIT
    private String weight; //WEIGHT
    private Integer sle_date_type; //판매시작일자와 종료일자에 null값이 들어가야 하느냐 마느냐 결정
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date mft_tm; //MFT_TM
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date distb_tlmt; //DISTB_TLMT
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date sle_start_tm; //SLE_START_TM
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date sle_end_tm; //SLE_END_TM

    private Integer state; //SFKP_TP_STATE_CD
    private Integer max_sle_quty; //MAX_SLE_QUTY
    private Integer inv_quty; //INV_QUTY
    private String warn; //WARN
    private String guid; //GUID
    private Integer reg_state_cd; //REG_STATE_CD

    //상품상세첨부파일
    private String products; //UPLOAD_PATH
    private String UUID; //UUID //파일일련번호
    private String NAME; //NAME //파일이름
    private Integer TYPE; //TYPE //파일유형
    private Integer STATE_CD; //STATE_CD //파일상태코드
    private Integer SORT_ODR; //SORT_ODR //파일정렬순서

    public RegistProductDto() {}

    public RegistProductDto(Integer prod_idx, Integer seler_idx, Integer cate_idx, String cate_idx2, Integer seler_prod_cd, String name, String content, Integer prc, String upload_path, Integer dc_state_cd, Integer dc_rate, Integer dsply_state_cd, float ascr, String orplc, String sle_unit, String weight, Integer sle_date_type, Date mft_tm, Date distb_tlmt, Date sle_start_tm, Date sle_end_tm, Integer state, Integer max_sle_quty, Integer inv_quty, String warn, String guid, Integer reg_state_cd, String products, String UUID, String NAME, Integer TYPE, Integer STATE_CD, Integer SORT_ODR) {
        this.prod_idx = prod_idx;
        this.seler_idx = seler_idx;
        this.cate_idx = cate_idx;
        this.cate_idx2 = cate_idx2;
        this.seler_prod_cd = seler_prod_cd;
        this.name = name;
        this.content = content;
        this.prc = prc;
        this.upload_path = upload_path;
        this.dc_state_cd = dc_state_cd;
        this.dc_rate = dc_rate;
        this.dsply_state_cd = dsply_state_cd;
        this.ascr = ascr;
        this.orplc = orplc;
        this.sle_unit = sle_unit;
        this.weight = weight;
        this.sle_date_type = sle_date_type;
        this.mft_tm = mft_tm;
        this.distb_tlmt = distb_tlmt;
        this.sle_start_tm = sle_start_tm;
        this.sle_end_tm = sle_end_tm;
        this.state = state;
        this.max_sle_quty = max_sle_quty;
        this.inv_quty = inv_quty;
        this.warn = warn;
        this.guid = guid;
        this.reg_state_cd = reg_state_cd;
        this.products = products;
        this.UUID = UUID;
        this.NAME = NAME;
        this.TYPE = TYPE;
        this.STATE_CD = STATE_CD;
        this.SORT_ODR = SORT_ODR;
    }

    @Override
    public String toString() {
        return "RegistProductDto{" +
                "prod_idx=" + prod_idx +
                ", seler_idx=" + seler_idx +
                ", cate_idx=" + cate_idx +
                ", cate_idx2='" + cate_idx2 + '\'' +
                ", seler_prod_cd=" + seler_prod_cd +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                ", prc=" + prc +
                ", upload_path='" + upload_path + '\'' +
                ", dc_state_cd=" + dc_state_cd +
                ", dc_rate=" + dc_rate +
                ", dsply_state_cd=" + dsply_state_cd +
                ", ascr=" + ascr +
                ", orplc='" + orplc + '\'' +
                ", sle_unit='" + sle_unit + '\'' +
                ", weight='" + weight + '\'' +
                ", sle_date_type=" + sle_date_type +
                ", mft_tm=" + mft_tm +
                ", distb_tlmt=" + distb_tlmt +
                ", sle_start_tm=" + sle_start_tm +
                ", sle_end_tm=" + sle_end_tm +
                ", state=" + state +
                ", max_sle_quty=" + max_sle_quty +
                ", inv_quty=" + inv_quty +
                ", warn='" + warn + '\'' +
                ", guid='" + guid + '\'' +
                ", reg_state_cd=" + reg_state_cd +
                ", products='" + products + '\'' +
                ", UUID='" + UUID + '\'' +
                ", NAME='" + NAME + '\'' +
                ", TYPE=" + TYPE +
                ", STATE_CD=" + STATE_CD +
                ", SORT_ODR=" + SORT_ODR +
                '}';
    }

    public Integer getProd_idx() {
        return prod_idx;
    }

    public void setProd_idx(Integer prod_idx) {
        this.prod_idx = prod_idx;
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

    public String getCate_idx2() {
        return cate_idx2;
    }

    public void setCate_idx2(String cate_idx2) {
        this.cate_idx2 = cate_idx2;
    }

    public Integer getSeler_prod_cd() {
        return seler_prod_cd;
    }

    public void setSeler_prod_cd(Integer seler_prod_cd) {
        this.seler_prod_cd = seler_prod_cd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getPrc() {
        return prc;
    }

    public void setPrc(Integer prc) {
        this.prc = prc;
    }

    public String getUpload_path() {
        return upload_path;
    }

    public void setUpload_path(String upload_path) {
        this.upload_path = upload_path;
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

    public float getAscr() {
        return ascr;
    }

    public void setAscr(float ascr) {
        this.ascr = ascr;
    }

    public String getOrplc() {
        return orplc;
    }

    public void setOrplc(String orplc) {
        this.orplc = orplc;
    }

    public String getSle_unit() {
        return sle_unit;
    }

    public void setSle_unit(String sle_unit) {
        this.sle_unit = sle_unit;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public Integer getSle_date_type() {
        return sle_date_type;
    }

    public void setSle_date_type(Integer sle_date_type) {
        this.sle_date_type = sle_date_type;
    }

    public Date getMft_tm() {
        return mft_tm;
    }

    public void setMft_tm(Date mft_tm) {
        this.mft_tm = mft_tm;
    }

    public Date getDistb_tlmt() {
        return distb_tlmt;
    }

    public void setDistb_tlmt(Date distb_tlmt) {
        this.distb_tlmt = distb_tlmt;
    }

    public Date getSle_start_tm() {
        return sle_start_tm;
    }

    public void setSle_start_tm(Date sle_start_tm) {
        this.sle_start_tm = sle_start_tm;
    }

    public Date getSle_end_tm() {
        return sle_end_tm;
    }

    public void setSle_end_tm(Date sle_end_tm) {
        this.sle_end_tm = sle_end_tm;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getMax_sle_quty() {
        return max_sle_quty;
    }

    public void setMax_sle_quty(Integer max_sle_quty) {
        this.max_sle_quty = max_sle_quty;
    }

    public Integer getInv_quty() {
        return inv_quty;
    }

    public void setInv_quty(Integer inv_quty) {
        this.inv_quty = inv_quty;
    }

    public String getWarn() {
        return warn;
    }

    public void setWarn(String warn) {
        this.warn = warn;
    }

    public String getGuid() {
        return guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    public Integer getReg_state_cd() {
        return reg_state_cd;
    }

    public void setReg_state_cd(Integer reg_state_cd) {
        this.reg_state_cd = reg_state_cd;
    }

    public String getProducts() {
        return products;
    }

    public void setProducts(String products) {
        this.products = products;
    }

    public String getUUID() {
        return UUID;
    }

    public void setUUID(String UUID) {
        this.UUID = UUID;
    }

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME;
    }

    public Integer getTYPE() {
        return TYPE;
    }

    public void setTYPE(Integer TYPE) {
        this.TYPE = TYPE;
    }

    public Integer getSTATE_CD() {
        return STATE_CD;
    }

    public void setSTATE_CD(Integer STATE_CD) {
        this.STATE_CD = STATE_CD;
    }

    public Integer getSORT_ODR() {
        return SORT_ODR;
    }

    public void setSORT_ODR(Integer SORT_ODR) {
        this.SORT_ODR = SORT_ODR;
    }
}
