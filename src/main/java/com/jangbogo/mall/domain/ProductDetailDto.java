package com.jangbogo.mall.domain;

import java.util.List;
import java.util.Objects;

public class ProductDetailDto {
    // iv
    private Integer price;
    private String name;
    private String image_path; //상품 - UPLOAD_PATH
    private String content;
    private Integer cate_idx; //상품 - CATE_IDX
    private String upload_path;
    private Integer dc_rate;
    private Integer dc_state;
    private Integer prod_idx;
    private String guid; //상품 안내사항

    private int max_sle_quty; //1회 최대 구매 수량

    private int inv_quty; //상품 재고 수량

    private String origin;
    private String unit;
    private String weight;
    private String warn; //상품상세 - 상품주의사항
    private Integer keepingType;  //상품상세 - 보관유형 상태코드
    private Integer dlvry_method; //카테고리 - 배송방식번호
    private Integer idx; // 배송방식 - 배송방식번호
    private Integer dlvry_type; //배송방식 - 배송유형코드
    private Integer packing_type; //배송방식 - 배송포장코드
    private String dlvry_warn; //배송방식 - 배송주의사항

    private List<ProductFile> file_list; //상세첨부파일 리스트


    // constructor

    public ProductDetailDto() {}  // 기본 생성자

    public ProductDetailDto(Integer price, String name, String image_path, String content, String upload_path, Integer dc_rate, Integer dc_state, Integer prod_idx, String guid, String origin, String unit, String weight, String warn, Integer keepingType, Integer cate_idx, Integer dlvry_method, Integer idx, Integer dlvry_type, Integer packing_type, String dlvry_warn) {
        this.price = price;
        this.name = name;
        this.image_path = image_path;
        this.content = content;
        this.upload_path = upload_path;
        this.dc_rate = dc_rate;
        this.dc_state = dc_state;
        this.prod_idx = prod_idx;
        this.guid = guid;
        this.origin = origin;
        this.unit = unit;
        this.weight = weight;
        this.warn = warn;
        this.keepingType = keepingType;
        this.cate_idx = cate_idx;
        this.dlvry_method = dlvry_method;
        this.idx = idx;
        this.dlvry_type = dlvry_type;
        this.packing_type = packing_type;
        this.dlvry_warn = dlvry_warn;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductDetailDto that = (ProductDetailDto) o;
        return Objects.equals(price, that.price) && Objects.equals(name, that.name) && Objects.equals(image_path, that.image_path) && Objects.equals(content, that.content) && Objects.equals(cate_idx, that.cate_idx) && Objects.equals(upload_path, that.upload_path) && Objects.equals(dc_rate, that.dc_rate) && Objects.equals(dc_state, that.dc_state) && Objects.equals(prod_idx, that.prod_idx) && Objects.equals(guid, that.guid) && Objects.equals(origin, that.origin) && Objects.equals(unit, that.unit) && Objects.equals(weight, that.weight) && Objects.equals(warn, that.warn) && Objects.equals(keepingType, that.keepingType) && Objects.equals(dlvry_method, that.dlvry_method) && Objects.equals(idx, that.idx) && Objects.equals(dlvry_type, that.dlvry_type) && Objects.equals(packing_type, that.packing_type) && Objects.equals(dlvry_warn, that.dlvry_warn);
    }

    @Override
    public int hashCode() {
        return Objects.hash(price, name, image_path, content, cate_idx, upload_path, dc_rate, dc_state, prod_idx, guid, origin, unit, weight, warn, keepingType, dlvry_method, idx, dlvry_type, packing_type, dlvry_warn);
    }

    @Override
    public String toString() {
        return "ProductDetailDto = {" +
                "price=" + price +
                ", name='" + name + '\'' +
                ", image_path='" + image_path + '\'' +
                ", content='" + content + '\'' +
                ", cate_idx=" + cate_idx +
                ", upload_path='" + upload_path + '\'' +
                ", dc_rate=" + dc_rate +
                ", dc_state=" + dc_state +
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
                '}';
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

    public Integer getCate_idx() {
        return cate_idx;
    }

    public void setCate_idx(Integer cate_idx) {
        this.cate_idx = cate_idx;
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
}
