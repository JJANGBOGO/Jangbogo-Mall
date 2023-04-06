package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.User;

public interface UserService {

    int withdrawUser (int idx, String email) throws Exception;

    String findUserEmail (String nick_nm, String pwd) throws Exception;

    boolean isUserPresent (String nick_nm, String email) throws Exception; //비번찾기에 쓰는 회원 확인

    User selectUser (int idx) throws Exception; //회원상세조회

    int updatePwd (String pwd, String nick_nm, String email) throws Exception; //비번을 임시 비번으로 변경.

    int sendPwdEmail (String nick_nm, String toEmail) throws Exception; //임시비번을 이메일로 전송

    //이메일로 중복 확인
    User chkDuplicateEmail (String email) throws Exception;
}
