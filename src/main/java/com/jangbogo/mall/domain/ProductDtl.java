package com.jangbogo.mall.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.util.Date;
import java.util.List;


@Data
@AllArgsConstructor
@Builder
public class ProductDtl {

    private Integer prod_idx; //상품 idx

    private String orplc; //원산지

    private String sle_unit; // 판매 단위

    private String weight; // 중량

    private Date mft_tm; //제조일자

    private Date distb_tlmt;  //유통기한일자

    private String warn; //주의사항

    private int max_sle_quty; //1회 최대 구매 수량

    private int sfkp_tp_state_cd; //보관유형 상태코드

    private Date sle_start_tm; //상품 판매 시작일. 기간 판매 한정값

    private Date sle_end_tm; //상품 판매 종료일. 기간 판매 한정값

    private Date create_tm; //상품 등록일자

    private int inv_quty; //상품 재고수

    private String guid; //상품 안내사항

    private List<ProductFile> file_list; //상품 상세첨부파일 리스트
}
