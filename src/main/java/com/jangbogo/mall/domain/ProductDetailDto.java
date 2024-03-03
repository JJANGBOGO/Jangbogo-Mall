package com.jangbogo.mall.domain;

import java.util.List;
import java.util.Objects;

public class ProductDetailDto {
    // iv
    //상품테이블
    private Integer price; //PRC
    private String name; //NAME
    private String image_path; //UPLOAD_PATH
    private String content; //CTENT
    private String cate_idx; //CATE_IDX
    private Integer dc_rate; //DC_RATE
    private Integer dc_state; //DC_STATE_CD
    private String f_cate_idx; //카테고리 아이디중 대분류 아이디 저장변수
    private String seler_idx;  // 판매자 아이디

    //상품상세테이블
    private Integer prod_idx; //PROD_IDX
    private String guid; //GUID
    private String origin; //ORPLC
    private String unit; //SLE_UNIT
    private String weight; //WEIGHT
    private String warn; //WARN
    private Integer keepingType;  //SFKP_TP_STATE_CD

    //카테고리테이블
    private Integer dlvry_method; //DLVRY_EDI_IDX

    // 배송방식테이블
    private Integer idx; // IDX
    private Integer dlvry_type; //DLVRY_TYPE_CD
    private Integer packing_type; //PACK_STATE_CD
    private String dlvry_warn; //WARN
    //판매자테이블


    private String brandName; // CPNM

    // constructor

    public ProductDetailDto() {}  // 기본 생성자

    public ProductDetailDto(Integer price, String name, String image_path, String content, String cate_idx, Integer dc_rate, Integer dc_state, String f_cate_idx, Integer prod_idx, String guid, String origin, String unit, String weight, String warn, Integer keepingType, Integer dlvry_method, Integer idx, Integer dlvry_type, Integer packing_type, String dlvry_warn, String brandName) {
        this.price = price;
        this.name = name;
        this.image_path = image_path;
        this.content = content;
        this.cate_idx = cate_idx;
        this.dc_rate = dc_rate;
        this.dc_state = dc_state;
        this.f_cate_idx = f_cate_idx;
        this.prod_idx = prod_idx;
        this.guid = guid;
        this.origin = origin;
        this.unit = unit;
        this.weight = weight;
        this.warn = warn;
        this.keepingType = keepingType;
        this.dlvry_method = dlvry_method;
        this.idx = idx;
        this.dlvry_type = dlvry_type;
        this.packing_type = packing_type;
        this.dlvry_warn = dlvry_warn;
        this.brandName = brandName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductDetailDto that = (ProductDetailDto) o;
        return Objects.equals(price, that.price) && Objects.equals(name, that.name) && Objects.equals(image_path, that.image_path) && Objects.equals(content, that.content) && Objects.equals(cate_idx, that.cate_idx) && Objects.equals(dc_rate, that.dc_rate) && Objects.equals(dc_state, that.dc_state) && Objects.equals(f_cate_idx, that.f_cate_idx) && Objects.equals(prod_idx, that.prod_idx) && Objects.equals(guid, that.guid) && Objects.equals(origin, that.origin) && Objects.equals(unit, that.unit) && Objects.equals(weight, that.weight) && Objects.equals(warn, that.warn) && Objects.equals(keepingType, that.keepingType) && Objects.equals(dlvry_method, that.dlvry_method) && Objects.equals(idx, that.idx) && Objects.equals(dlvry_type, that.dlvry_type) && Objects.equals(packing_type, that.packing_type) && Objects.equals(dlvry_warn, that.dlvry_warn) && Objects.equals(brandName, that.brandName) && Objects.equals(seler_idx, that.seler_idx);
    }

    @Override
    public int hashCode() {
        return Objects.hash(price, name, image_path, content, cate_idx, dc_rate, dc_state, f_cate_idx, prod_idx, guid, origin, unit, weight, warn, keepingType, dlvry_method, idx, dlvry_type, packing_type, dlvry_warn, brandName, seler_idx);
    }

    // toString
    @Override
    public String toString() {
        return "ProductDetailDto{" +
                "price=" + price +
                ", name='" + name + '\'' +
                ", image_path='" + image_path + '\'' +
                ", content='" + content + '\'' +
                ", cate_idx='" + cate_idx + '\'' +
                ", dc_rate=" + dc_rate +
                ", dc_state=" + dc_state +
                ", f_cate_idx='" + f_cate_idx + '\'' +
                ", seler_idx='" + seler_idx + '\'' +
                ", prod_idx=" + prod_idx +
                ", guid='" + guid + '\'' +
                ", origin='" + origin + '\'' +
                ", unit='" + unit + '\'' +
                ", weight='" + weight + '\'' +
                ", warn='" + warn + '\'' +
                ", keepingType=" + keepingType +
                ", dlvry_method=" + dlvry_method +
                ", idx=" + idx +
                ", dlvry_type=" + dlvry_type +
                ", packing_type=" + packing_type +
                ", dlvry_warn='" + dlvry_warn + '\'' +
                ", brandName='" + brandName + '\'' +
                '}';
    }

    // getter & setter
    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCate_idx() {
        return cate_idx;
    }

    public void setCate_idx(String cate_idx) {
        this.cate_idx = cate_idx;
    }

    public Integer getDc_rate() {
        return dc_rate;
    }

    public void setDc_rate(Integer dc_rate) {
        this.dc_rate = dc_rate;
    }

    public Integer getDc_state() {
        return dc_state;
    }

    public void setDc_state(Integer dc_state) {
        this.dc_state = dc_state;
    }

    public String getF_cate_idx() {
        return f_cate_idx;
    }

    public void setF_cate_idx(String f_cate_idx) {
        this.f_cate_idx = f_cate_idx;
    }

    public String getSeler_idx() {
        return seler_idx;
    }

    public void setSeler_idx(String seler_idx) {
        this.seler_idx = seler_idx;
    }

    public Integer getProd_idx() {
        return prod_idx;
    }

    public void setProd_idx(Integer prod_idx) {
        this.prod_idx = prod_idx;
    }

    public String getGuid() {
        return guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
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

    public String getWarn() {
        return warn;
    }

    public void setWarn(String warn) {
        this.warn = warn;
    }

    public Integer getKeepingType() {
        return keepingType;
    }

    public void setKeepingType(Integer keepingType) {
        this.keepingType = keepingType;
    }

    public Integer getDlvry_method() {
        return dlvry_method;
    }

    public void setDlvry_method(Integer dlvry_method) {
        this.dlvry_method = dlvry_method;
    }

    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) {
        this.idx = idx;
    }

    public Integer getDlvry_type() {
        return dlvry_type;
    }

    public void setDlvry_type(Integer dlvry_type) {
        this.dlvry_type = dlvry_type;
    }

    public Integer getPacking_type() {
        return packing_type;
    }

    public void setPacking_type(Integer packing_type) {
        this.packing_type = packing_type;
    }

    public String getDlvry_warn() {
        return dlvry_warn;
    }

    public void setDlvry_warn(String dlvry_warn) {
        this.dlvry_warn = dlvry_warn;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }
}
