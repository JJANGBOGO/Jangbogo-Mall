package com.jangbogo.mall.domain;

import java.util.Date;

public class ProductListDto {
    //<상품테이블>
    private Integer prod_idx;//상품번호
    private String cate_idx;//카테고리아이디
    private Integer price;//상품가격
    private String upload_path;//이미지파일경로
    private String name;//상품이름
    private String ctent;//상품설명
    private Integer dc_state_cd;//상품할인상태코드
    private Integer dc_rate;//할인율
    private Integer dsply_state_cd;//상품전시상태코드

    //<상품상세테이블>
    private Integer sle_quty;//상품판매량
    private Integer reg_state_cd;//상품등록상태코드
    private Integer state_cd;//상품상태코드
    private Date sle_start_tm;//판매 시작일
    private Date sle_end_tm;// 종료일 받기
    private Date create_tm;//상품등록일  // '신상품순' 정렬을 위한 정보
    private Integer inv_quty;//상품재고수량받기

    //<카테고리테이블>
    private String id;//카테고리아이디
    private Integer cate_no;//카테고리번호
    private String cate_name;//카테고리이름
    private String icon_upload_path; //카테고리아이콘파일경로
    private Integer sort_odr;//카테고리이름별정렬순서
    private Integer cate_state_cd;//카테고리상태코드
    private Integer upp_floor;//상위카테고리층

    //    판매자 테이블
    private String brandName;

    private Integer filterType; //정렬 필터타입번호  //아직사용안함

    private String f_cate_idx;//대분류 카테고리 저장 //상품자체에는 포함되어있지 않지만 자체적으로 저장

    private Integer review_cnt;
    //<카테고리이벤트배너테이블>
    //

    // <상품후기테이블>
    // 컬럼내용을 받기보단 상품에 걸린 후기 갯수 찾기

    //<장바구니테이블>
    //장바구니상품수량


    public ProductListDto() {}

    public ProductListDto(Integer prod_idx, String cate_idx, Integer price, String upload_path, String name, String ctent, Integer dc_state_cd, Integer dc_rate, Integer dsply_state_cd, Integer sle_quty, Integer reg_state_cd, Integer state_cd, Date sle_start_tm, Date sle_end_tm, Date create_tm, Integer inv_quty, String id, Integer cate_no, String cate_name, String icon_upload_path, Integer sort_odr, Integer cate_state_cd, Integer upp_floor, String brandName, Integer filterType, String f_cate_idx, Integer review_cnt) {
        this.prod_idx = prod_idx;
        this.cate_idx = cate_idx;
        this.price = price;
        this.upload_path = upload_path;
        this.name = name;
        this.ctent = ctent;
        this.dc_state_cd = dc_state_cd;
        this.dc_rate = dc_rate;
        this.dsply_state_cd = dsply_state_cd;
        this.sle_quty = sle_quty;
        this.reg_state_cd = reg_state_cd;
        this.state_cd = state_cd;
        this.sle_start_tm = sle_start_tm;
        this.sle_end_tm = sle_end_tm;
        this.create_tm = create_tm;
        this.inv_quty = inv_quty;
        this.id = id;
        this.cate_no = cate_no;
        this.cate_name = cate_name;
        this.icon_upload_path = icon_upload_path;
        this.sort_odr = sort_odr;
        this.cate_state_cd = cate_state_cd;
        this.upp_floor = upp_floor;
        this.brandName = brandName;
        this.filterType = filterType;
        this.f_cate_idx = f_cate_idx;
        this.review_cnt = review_cnt;
    }

    @Override
    public String toString() {
        return "ProductListDto{" +
                "prod_idx=" + prod_idx +
                ", cate_idx='" + cate_idx + '\'' +
                ", price=" + price +
                ", upload_path='" + upload_path + '\'' +
                ", name='" + name + '\'' +
                ", ctent='" + ctent + '\'' +
                ", dc_state_cd=" + dc_state_cd +
                ", dc_rate=" + dc_rate +
                ", dsply_state_cd=" + dsply_state_cd +
                ", sle_quty=" + sle_quty +
                ", reg_state_cd=" + reg_state_cd +
                ", state_cd=" + state_cd +
                ", sle_start_tm=" + sle_start_tm +
                ", sle_end_tm=" + sle_end_tm +
                ", create_tm=" + create_tm +
                ", inv_quty=" + inv_quty +
                ", id='" + id + '\'' +
                ", cate_no=" + cate_no +
                ", cate_name='" + cate_name + '\'' +
                ", icon_upload_path='" + icon_upload_path + '\'' +
                ", sort_odr=" + sort_odr +
                ", cate_state_cd=" + cate_state_cd +
                ", upp_floor=" + upp_floor +
                ", brandName='" + brandName + '\'' +
                ", filterType=" + filterType +
                ", f_cate_idx='" + f_cate_idx + '\'' +
                ", review_cnt=" + review_cnt +
                '}';
    }

    public Integer getProd_idx() {
        return prod_idx;
    }

    public void setProd_idx(Integer prod_idx) {
        this.prod_idx = prod_idx;
    }

    public String getCate_idx() {
        return cate_idx;
    }

    public void setCate_idx(String cate_idx) {
        this.cate_idx = cate_idx;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
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

    public Integer getSle_quty() {
        return sle_quty;
    }

    public void setSle_quty(Integer sle_quty) {
        this.sle_quty = sle_quty;
    }

    public Integer getReg_state_cd() {
        return reg_state_cd;
    }

    public void setReg_state_cd(Integer reg_state_cd) {
        this.reg_state_cd = reg_state_cd;
    }

    public Integer getState_cd() {
        return state_cd;
    }

    public void setState_cd(Integer state_cd) {
        this.state_cd = state_cd;
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

    public Date getCreate_tm() {
        return create_tm;
    }

    public void setCreate_tm(Date create_tm) {
        this.create_tm = create_tm;
    }

    public Integer getInv_quty() {
        return inv_quty;
    }

    public void setInv_quty(Integer inv_quty) {
        this.inv_quty = inv_quty;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getCate_no() {
        return cate_no;
    }

    public void setCate_no(Integer cate_no) {
        this.cate_no = cate_no;
    }

    public String getCate_name() {
        return cate_name;
    }

    public void setCate_name(String cate_name) {
        this.cate_name = cate_name;
    }

    public String getIcon_upload_path() {
        return icon_upload_path;
    }

    public void setIcon_upload_path(String icon_upload_path) {
        this.icon_upload_path = icon_upload_path;
    }

    public Integer getSort_odr() {
        return sort_odr;
    }

    public void setSort_odr(Integer sort_odr) {
        this.sort_odr = sort_odr;
    }

    public Integer getCate_state_cd() {
        return cate_state_cd;
    }

    public void setCate_state_cd(Integer cate_state_cd) {
        this.cate_state_cd = cate_state_cd;
    }

    public Integer getUpp_floor() {
        return upp_floor;
    }

    public void setUpp_floor(Integer upp_floor) {
        this.upp_floor = upp_floor;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public Integer getFilterType() {
        return filterType;
    }

    public void setFilterType(Integer filterType) {
        this.filterType = filterType;
    }

    public String getF_cate_idx() {
        return f_cate_idx;
    }

    public void setF_cate_idx(String f_cate_idx) {
        this.f_cate_idx = f_cate_idx;
    }

    public Integer getReview_cnt() {
        return review_cnt;
    }

    public void setReview_cnt(Integer review_cnt) {
        this.review_cnt = review_cnt;
    }
}
