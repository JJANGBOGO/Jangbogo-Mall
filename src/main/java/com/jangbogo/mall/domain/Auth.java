package com.jangbogo.mall.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class Auth {

    public Auth() {}

    private int idx; //권한번호
    private String name; //일반/판매자/관리자
    private int state_cd; //상태코드
}
