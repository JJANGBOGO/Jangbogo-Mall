package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.User;

public interface UserService {

    int withdrawUser (int idx, String email) throws Exception;

    String findUserEmail (String nick_nm, String pwd) throws Exception;

    boolean isUserPresent (String nick_nm, String email) throws Exception; //비번찾기에 쓰는 회원 확인

    User selectUser (int idx) throws Exception; //회원상세조회

    int updatePwd (String pwd, String nick_nm, String email) throws Exception; //비번을 임시 비번으로 변경.

    int sendPwdEmail (String nick_nm, String toEmail) throws Exception; //임시비번을 이메일로 전송

    //이메일 중복체크
    User getUserByEmail (String email) throws Exception;

    //소셜가입
    int regSocialUser (User user) throws Exception;

    //일반가입
    int insertUser (User user) throws Exception;

    //로그인시각 업데이트
    int updateLoginTm (int idx, String email) throws Exception;

    //닉네임 중복체크
    User chkDuplicateNick (String nick_nm) throws Exception;
}
