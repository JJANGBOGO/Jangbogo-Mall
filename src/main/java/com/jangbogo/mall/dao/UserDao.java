package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.User;

public interface UserDao {

    int deleteUser (int idx, String email) throws Exception; //회원탈퇴

    String selUserEmail (String nick_nm, String pwd) throws Exception; //닉넴, 비번으로 이메일찾기

    User selUserByEmail (String nick_nm, String email) throws Exception; //닉넴, 이메일로 회원찾기

    User selectUser (int idx) throws Exception;
}