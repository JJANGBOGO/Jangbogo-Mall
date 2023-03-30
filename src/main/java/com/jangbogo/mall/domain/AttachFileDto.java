package com.jangbogo.mall.domain;


import lombok.Data;

@Data
public class AttachFileDto {

    private String fileName;
    private String uploadPath;
    private String uuid;
    private boolean image; //img?

    // 대표이미지 여부
    private boolean thumbnail;

    //디비 컬럼으로는 int로 해서 0 || 1. =>, 디비 컬럼 걍 추가해~

}
