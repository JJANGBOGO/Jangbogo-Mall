package com.jangbogo.mall.domain;

import java.util.Date;
import java.util.Objects;

public class RegistProductDto {
    //상품테이블
    private Integer prod_idx; //IDX
    private Integer seler_idx; //SELER_IDX
    private String cate_idx; //CATE_IDX
    private Integer prod_cd_val; //SELER_PROD_CD //판매자상품코드
    private String r_img; //UPLOAD_PATH
    private String name; //NAME
    private String content; //CTENT
    private Integer price; //PRC
    private Integer dc_state; //DC_STATE_CD
    private Integer dc_rate; //DC_RATE
    private Integer isShow; //DSPLY_STATE_CD

    // 상품상세테이블
    private String origin; //ORPLC
    private String unit; //SLE_UNIT
    private String weight; //WEIGHT
    private Date mft_tm; //MFT_TM
    private Date delivery_tm; //DISTB_TLMT
    private String warn; //WARN
    private Integer selling_quantity; //MAX_SLE_QUTY
    private Integer keepingType; //SFKP_TP_STATE_CD
    private Date sle_start_tm; //SLE_START_TM
    private Date sle_end_tm; //SLE_END_TM
    private Integer stock_quantity; //INV_QUTY
    private String guid; //GUID

    //상품상세첨부테이블
    private String UUID; //UUID
    private String file_NAME; //NAME
    private String UPLOAD_PATH; //UPLOAD_PATH
    private Integer TYPE; //TYPE
    private Integer STATE_CD; //STATE_CD
    private Integer SORT_ODR; //SORT_ODR



    //constructor
    public RegistProductDto() {}

    public RegistProductDto(Integer prod_idx, Integer seler_idx, String cate_idx, Integer prod_cd_val, String r_img, String name, String content, Integer price, Integer dc_state, Integer dc_rate, Integer isShow, String origin, String unit, String weight, Date mft_tm, Date delivery_tm, String warn, Integer selling_quantity, Integer keepingType, Date sle_start_tm, Date sle_end_tm, Integer stock_quantity, String guid) {
        this.prod_idx = prod_idx;
        this.seler_idx = seler_idx;
        this.cate_idx = cate_idx;
        this.prod_cd_val = prod_cd_val;
        this.r_img = r_img;
        this.name = name;
        this.content = content;
        this.price = price;
        this.dc_state = dc_state;
        this.dc_rate = dc_rate;
        this.isShow = isShow;
        this.origin = origin;
        this.unit = unit;
        this.weight = weight;
        this.mft_tm = mft_tm;
        this.delivery_tm = delivery_tm;
        this.warn = warn;
        this.selling_quantity = selling_quantity;
        this.keepingType = keepingType;
        this.sle_start_tm = sle_start_tm;
        this.sle_end_tm = sle_end_tm;
        this.stock_quantity = stock_quantity;
        this.guid = guid;
    }

    public RegistProductDto(String UUID, String file_NAME, String UPLOAD_PATH, Integer TYPE, Integer STATE_CD, Integer SORT_ODR) {

        this.UUID = UUID;
        this.file_NAME = file_NAME;
        this.UPLOAD_PATH = UPLOAD_PATH;
        this.TYPE = TYPE;
        this.STATE_CD = STATE_CD;
        this.SORT_ODR = SORT_ODR;
    }

    @Override
    public String toString() {
        return "RegistProductDto = {" +
                "prod_idx=" + prod_idx +
                ", seler_idx=" + seler_idx +
                ", cate_idx='" + cate_idx + '\'' +
                ", prod_cd_val=" + prod_cd_val +
                ", r_img='" + r_img + '\'' +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                ", price=" + price +
                ", dc_state=" + dc_state +
                ", dc_rate=" + dc_rate +
                ", isShow=" + isShow +
                ", origin='" + origin + '\'' +
                ", unit='" + unit + '\'' +
                ", weight='" + weight + '\'' +
                ", mft_tm=" + mft_tm +
                ", delivery_tm=" + delivery_tm +
                ", warn='" + warn + '\'' +
                ", selling_quantity=" + selling_quantity +
                ", keepingType=" + keepingType +
                ", sle_start_tm=" + sle_start_tm +
                ", sle_end_tm=" + sle_end_tm +
                ", stock_quantity=" + stock_quantity +
                ", guid='" + guid + '\'' +
                ", UUID='" + UUID + '\'' +
                ", file_NAME='" + file_NAME + '\'' +
                ", UPLOAD_PATH='" + UPLOAD_PATH + '\'' +
                ", TYPE=" + TYPE +
                ", STATE_CD=" + STATE_CD +
                ", SORT_ODR=" + SORT_ODR +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        RegistProductDto that = (RegistProductDto) o;
        return Objects.equals(prod_idx, that.prod_idx) && Objects.equals(seler_idx, that.seler_idx) && Objects.equals(cate_idx, that.cate_idx) && Objects.equals(prod_cd_val, that.prod_cd_val) && Objects.equals(r_img, that.r_img) && Objects.equals(name, that.name) && Objects.equals(content, that.content) && Objects.equals(price, that.price) && Objects.equals(dc_state, that.dc_state) && Objects.equals(dc_rate, that.dc_rate) && Objects.equals(isShow, that.isShow) && Objects.equals(origin, that.origin) && Objects.equals(unit, that.unit) && Objects.equals(weight, that.weight) && Objects.equals(mft_tm, that.mft_tm) && Objects.equals(delivery_tm, that.delivery_tm) && Objects.equals(warn, that.warn) && Objects.equals(selling_quantity, that.selling_quantity) && Objects.equals(keepingType, that.keepingType) && Objects.equals(sle_start_tm, that.sle_start_tm) && Objects.equals(sle_end_tm, that.sle_end_tm) && Objects.equals(stock_quantity, that.stock_quantity) && Objects.equals(guid, that.guid) && Objects.equals(UUID, that.UUID) && Objects.equals(file_NAME, that.file_NAME) && Objects.equals(UPLOAD_PATH, that.UPLOAD_PATH) && Objects.equals(TYPE, that.TYPE) && Objects.equals(STATE_CD, that.STATE_CD) && Objects.equals(SORT_ODR, that.SORT_ODR);
    }

    @Override
    public int hashCode() {
        return Objects.hash(prod_idx, seler_idx, cate_idx, prod_cd_val, r_img, name, content, price, dc_state, dc_rate, isShow, origin, unit, weight, mft_tm, delivery_tm, warn, selling_quantity, keepingType, sle_start_tm, sle_end_tm, stock_quantity, guid, UUID, file_NAME, UPLOAD_PATH, TYPE, STATE_CD, SORT_ODR);
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
    public String getR_img() {
        return r_img;
    }

    public void setR_img(String r_img) {
        this.r_img = r_img;
    }

    public String getCate_idx() {
        return cate_idx;
    }

    public void setCate_idx(String cate_idx) {
        this.cate_idx = cate_idx;
    }

    public Integer getProd_cd_val() {
        return prod_cd_val;
    }

    public void setProd_cd_val(Integer prod_cd_val) {
        this.prod_cd_val = prod_cd_val;
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

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getDc_state() {
        return dc_state;
    }

    public void setDc_state(Integer dc_state) {
        this.dc_state = dc_state;
    }

    public Integer getDc_rate() {
        return dc_rate;
    }

    public void setDc_rate(Integer dc_rate) {
        this.dc_rate = dc_rate;
    }

    public Integer getIsShow() {
        return isShow;
    }

    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public Date getMft_tm() {
        return mft_tm;
    }

    public void setMft_tm(Date mft_tm) {
        this.mft_tm = mft_tm;
    }

    public Date getDelivery_tm() {
        return delivery_tm;
    }

    public void setDelivery_tm(Date delivery_tm) {
        this.delivery_tm = delivery_tm;
    }

    public String getWarn() {
        return warn;
    }

    public void setWarn(String warn) {
        this.warn = warn;
    }

    public Integer getSelling_quantity() {
        return selling_quantity;
    }

    public void setSelling_quantity(Integer selling_quantity) {
        this.selling_quantity = selling_quantity;
    }

    public Integer getKeepingType() {
        return keepingType;
    }

    public void setKeepingType(Integer keepingType) {
        this.keepingType = keepingType;
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

    public Integer getStock_quantity() {
        return stock_quantity;
    }

    public void setStock_quantity(Integer stock_quantity) {
        this.stock_quantity = stock_quantity;
    }

    public String getGuid() {
        return guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    public String getUUID() {
        return UUID;
    }

    public void setUUID(String UUID) {
        this.UUID = UUID;
    }

    public String getFile_NAME() {
        return file_NAME;
    }

    public void setFile_NAME(String file_NAME) {
        this.file_NAME = file_NAME;
    }

    public String getUPLOAD_PATH() {
        return UPLOAD_PATH;
    }

    public void setUPLOAD_PATH(String UPLOAD_PATH) {
        this.UPLOAD_PATH = UPLOAD_PATH;
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

    //getter, setter
}
