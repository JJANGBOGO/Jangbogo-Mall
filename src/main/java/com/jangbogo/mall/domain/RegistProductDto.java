package com.jangbogo.mall.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;
import java.util.Objects;


@Data
@AllArgsConstructor
@Builder
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
    private String upload_path; //UPLOAD_PATH
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

    private List<ProductFileDto> files; //상세 첨부파일들

    public RegistProductDto() {}

}
