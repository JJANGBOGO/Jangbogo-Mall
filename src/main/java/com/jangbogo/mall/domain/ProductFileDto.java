package com.jangbogo.mall.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.util.Date;
import java.util.Objects;


@Data
@AllArgsConstructor
@Builder
public class ProductFileDto {
    private String UUID;
    private Integer prod_idx;
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


}
