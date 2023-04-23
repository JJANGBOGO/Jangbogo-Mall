package com.jangbogo.mall.domain;

import java.util.Date;
import java.util.Objects;

public class ProductFileDto {
    private Integer PROD_IDX;
    private String UUID;
    private String name;
    private String UPLOAD_PATH;
    private Integer TYPE;
    private Integer STATE_CD;
    private Integer SORT_ODR;
    private Date CRT_TM;
    private Integer CRT_IDX;
    private Date UPT_TM;
    private Integer UPT_IDX;
    //constructor
    public ProductFileDto() {}

    public ProductFileDto(Integer PROD_IDX, String UUID, String name, String UPLOAD_PATH, Integer TYPE, Integer STATE_CD, Integer SORT_ODR) {
        this.PROD_IDX = PROD_IDX;
        this.UUID = UUID;
        this.name = name;
        this.UPLOAD_PATH = UPLOAD_PATH;
        this.TYPE = TYPE;
        this.STATE_CD = STATE_CD;
        this.SORT_ODR = SORT_ODR;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductFileDto that = (ProductFileDto) o;
        return Objects.equals(PROD_IDX, that.PROD_IDX) && Objects.equals(UUID, that.UUID) && Objects.equals(name, that.name) && Objects.equals(UPLOAD_PATH, that.UPLOAD_PATH) && Objects.equals(TYPE, that.TYPE) && Objects.equals(STATE_CD, that.STATE_CD) && Objects.equals(SORT_ODR, that.SORT_ODR) && Objects.equals(CRT_TM, that.CRT_TM) && Objects.equals(CRT_IDX, that.CRT_IDX) && Objects.equals(UPT_TM, that.UPT_TM) && Objects.equals(UPT_IDX, that.UPT_IDX);
    }

    @Override
    public int hashCode() {
        return Objects.hash(PROD_IDX, UUID, name, UPLOAD_PATH, TYPE, STATE_CD, SORT_ODR, CRT_TM, CRT_IDX, UPT_TM, UPT_IDX);
    }

    @Override
    public String toString() {
        return "ProductFileDto{" +
                "PROD_IDX=" + PROD_IDX +
                ", UUID='" + UUID + '\'' +
                ", name='" + name + '\'' +
                ", UPLOAD_PATH='" + UPLOAD_PATH + '\'' +
                ", TYPE=" + TYPE +
                ", STATE_CD=" + STATE_CD +
                ", SORT_ODR=" + SORT_ODR +
                ", CRT_TM=" + CRT_TM +
                ", CRT_IDX=" + CRT_IDX +
                ", UPT_TM=" + UPT_TM +
                ", UPT_IDX=" + UPT_IDX +
                '}';
    }

    public Integer getPROD_IDX() {
        return PROD_IDX;
    }

    public void setPROD_IDX(Integer PROD_IDX) {
        this.PROD_IDX = PROD_IDX;
    }

    public String getUUID() {
        return UUID;
    }

    public void setUUID(String UUID) {
        this.UUID = UUID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Date getCRT_TM() {
        return CRT_TM;
    }

    public void setCRT_TM(Date CRT_TM) {
        this.CRT_TM = CRT_TM;
    }

    public Integer getCRT_IDX() {
        return CRT_IDX;
    }

    public void setCRT_IDX(Integer CRT_IDX) {
        this.CRT_IDX = CRT_IDX;
    }

    public Date getUPT_TM() {
        return UPT_TM;
    }

    public void setUPT_TM(Date UPT_TM) {
        this.UPT_TM = UPT_TM;
    }

    public Integer getUPT_IDX() {
        return UPT_IDX;
    }

    public void setUPT_IDX(Integer UPT_IDX) {
        this.UPT_IDX = UPT_IDX;
    }
}
