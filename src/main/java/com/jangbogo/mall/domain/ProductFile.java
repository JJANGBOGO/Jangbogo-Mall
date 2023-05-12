package com.jangbogo.mall.domain;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class ProductFile {

    public ProductFile () {}

    private String uuid; //pk

    private Integer prod_idx; //

    private String name; //파일 이름

    private String upload_path; //파일 업로드 경로

    private int type; //파일 타입 코드

    private int state_cd; //파일 상태코드 (삭제, 비삭제)

    private int sort_odr; //파일 정렬 순서

}
