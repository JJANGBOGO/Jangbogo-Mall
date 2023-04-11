package com.jangbogo.mall.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@Builder
public class SellerDtl { //판매자 상세 (선택 정보). userDetailsDto와 다름

    public SellerDtl() {}

    private Integer seler_idx; //판매자 idx

    private String guid_nm; //안내담당자이름
    private String guid_email; //안내담당자 이메일

    private String cllr_nm; //고객센터담당자이름
    private String cllr_tellno; //고객센터담당자 연락처

    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date reg_tm; //등록날짜

    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date chg_tm; //수정날짜

}
