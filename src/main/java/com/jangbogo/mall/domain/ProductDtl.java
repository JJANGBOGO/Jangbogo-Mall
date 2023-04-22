package com.jangbogo.mall.domain;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.util.Date;

@Data
@AllArgsConstructor
@Builder
public class ProductDtl {

    public ProductDtl () {}

    private Integer prod_idx; //상품번호

    private String orplc; //원산지

    private String sle_unit; //판매단위

    private String weight; //중량

    private Date mft_tm; //제조일자

    private Date distb_tlmt; //유통기한

    private String warn; //주의사항

    private String algy_cn; //알러지 정보;

    private String adlt_yn;  //성인한정 여부


}
