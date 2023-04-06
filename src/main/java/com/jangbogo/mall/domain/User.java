package com.jangbogo.mall.domain;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;

@Data
@AllArgsConstructor
@Builder
//@Component  => validator용
public class User {

    public User() {

    }

    private int idx; // 번호
    private int auth_idx; //권한번호
    private int rnk_idx; //등급번호

    private String email; //이메일
    private String nick_nm; //닉네임
    private String pwd; //비밀번호
    private String mpno; //휴대전화번호

    private Date brdy; //생일

    private String user_agre_yn; //개인정보수집동의여부
    private String markt_agre_yn; //마케팅수신동의여부

    private int login_tp_cd; //로그인 타입 1: 일반 2: 카카오 3: 네이버

    private String social_yn; // 소셜연동여부

    private int state_cd; //상태코드 1: 정상 2: 신고정지 3: 탈퇴 4: 휴면

    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date pwd_upt_tm; //비번변경날짜

    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date last_login_tm; //마지막로그인날짜

    private int decl_cnt;  //신고당한횟수

    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date reg_tm; //회원가입날짜

    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date chg_tm; //회원수정날짜
}
