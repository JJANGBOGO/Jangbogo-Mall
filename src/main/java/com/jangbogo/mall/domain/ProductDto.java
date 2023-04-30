package com.jangbogo.mall.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.util.Date;
import java.util.Objects;

@Data
@AllArgsConstructor
@Builder
public class ProductDto {

    public ProductDto () {}
    private Integer idx; //상품 idx
    private Integer seler_idx; //판매자 idx
    private Integer cate_idx; //카테고리 idx
    private Integer seler_prod_cd; //판매코드
    private String upload_path; //대표이미지
    private String name; //이름
    private String ctent; // 내용
    private Integer prc; //가격
    private Integer dc_state_cd; //할인상태코드
    private Integer dc_rate; //할인율
    private Integer dsply_state_cd; //전시상태코드
    private Integer ascr; //별점

    private int reg_state_cd; //상품 등록 상태 코드
    private int review_cnt;

}