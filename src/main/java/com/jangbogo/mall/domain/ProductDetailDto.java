package com.jangbogo.mall.domain;

import java.util.Objects;

public class ProductDetailDto {
    // iv
    private Integer price;
    private String name;
    private String content;
    private String upload_path;
    private Integer dc_rate;
    private Integer dc_state;
    private Integer productNum;
    private String guid;
    private String origin;
    private String unit;
    private String weight;
    private String warn;
    private Integer packingType;

    // constructor

    public ProductDetailDto() {}  // 기본 생성자
    public ProductDetailDto(String guid, Integer price, String name, String content, String upload_path, Integer dc_rate, Integer dc_state, Integer productNum, String origin, String unit, String weight, String warn, Integer packingType) {
        this.guid = guid;
        this.price = price;
        this.name = name;
        this.content = content;
        this.upload_path = upload_path;
        this.dc_rate = dc_rate;
        this.dc_state = dc_state;
        this.productNum = productNum;
        this.origin = origin;
        this.unit = unit;
        this.weight = weight;
        this.warn = warn;
        this.packingType = packingType;
    }
    // getter & setter
    public String getGuid() {
        return guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUpload_path() {
        return upload_path;
    }

    public void setUpload_path(String upload_path) {
        this.upload_path = upload_path;
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

    public Integer getProductNum() {
        return productNum;
    }

    public void setProductNum(Integer productNum) {
        this.productNum = productNum;
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

    public Integer getPackingType() {
        return packingType;
    }

    public void setPackingType(Integer packingType) {
        this.packingType = packingType;
    }
    // toString

    @Override
    public String toString() {
        return "{" +
                "price=" + price +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                ", upload_path='" + upload_path + '\'' +
                ", dc_rate=" + dc_rate +
                ", dc_state=" + dc_state +
                ", productNum=" + productNum +
                ", guid='" + guid + '\'' +
                ", origin='" + origin + '\'' +
                ", unit='" + unit + '\'' +
                ", weight='" + weight + '\'' +
                ", warn='" + warn + '\'' +
                ", packingType=" + packingType +
                '}';
    }

    // equals & hashCode
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductDetailDto that = (ProductDetailDto) o;
        return Objects.equals(price, that.price) && Objects.equals(name, that.name) && Objects.equals(content, that.content) && Objects.equals(upload_path, that.upload_path) && Objects.equals(dc_rate, that.dc_rate) && Objects.equals(dc_state, that.dc_state) && Objects.equals(productNum, that.productNum) && Objects.equals(origin, that.origin) && Objects.equals(unit, that.unit) && Objects.equals(weight, that.weight) && Objects.equals(warn, that.warn) && Objects.equals(packingType, that.packingType);
    }

    @Override
    public int hashCode() {
        return Objects.hash(price, name, content, upload_path, dc_rate, dc_state, productNum, origin, unit, weight, warn, packingType);
    }


}
