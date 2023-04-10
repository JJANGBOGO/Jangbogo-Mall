package com.jangbogo.mall.domain;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@Builder
public class Address {

    public Address() {
    }

    private int idx; //배송지번호
    private int user_idx; //회원번호

    private String zpcd; //우편번호
    private String addr_base; //기본주소
    private String addr_dtl; //상세주소

    private String rcpr_nm; //수령자이름
    private String rcpr_mobl_no;  //수령인전화번호

    private String is_default_yn; //기본배송지여부
    private int state_cd; //배송지상태코드

    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date reg_tm; //배송지등록일자
    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date chg_tm; //배송지수정일
}
