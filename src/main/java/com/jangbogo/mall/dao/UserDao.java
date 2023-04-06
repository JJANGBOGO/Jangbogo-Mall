package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.Address;
import com.jangbogo.mall.domain.User;

public interface UserDao {

    int deleteUser (int idx, String email) throws Exception; //회원탈퇴

    String selUserEmail (String nick_nm, String pwd) throws Exception; //닉넴, 비번으로 이메일찾기

    User selUserByEmail (String nick_nm, String email) throws Exception; //닉넴, 이메일로 회원찾기

    User selectUser (int idx) throws Exception; //회원상세조회

    int updatePwd (String pwd, String nick_nm, String email) throws Exception; //비밀번호 수정

    //이메일 중복 검사. 소셜, 일반 가입용
    User chkDuplicateEmail (String email) throws Exception;

    //소셜회원 가입. insert후 idx 리턴
    int insertSocialUser (User user) throws Exception;

    // insert한 후 idx 리턴. 배송지 추가에 필요
    int insertUser (User user) throws Exception;

    //로그인일시 업데이트
    int updateLoginTm (int idx, String email) throws Exception;

    //닉네임중복체크
    User chkDuplicateNick (String nick_nm) throws Exception;


}