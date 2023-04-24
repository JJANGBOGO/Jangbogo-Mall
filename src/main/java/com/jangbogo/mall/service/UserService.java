package com.jangbogo.mall.service;

import com.jangbogo.mall.domain.Address;
import com.jangbogo.mall.domain.User;

public interface UserService {

    int withdrawUser (int idx, String email) throws Exception;

    //회원이메일 반환
    String findUserEmail (String nick_nm, String pwd) throws Exception;

    boolean isUserPresent (String nick_nm, String email) throws Exception; //비번찾기에 쓰는 회원 확인

    User selectUser (int idx) throws Exception; //회원상세조회

    int sendPwdEmail (String nick_nm, String toEmail) throws Exception; //임시비번을 이메일로 전송

    //이메일 중복체크
    User getUserByEmail (String email) throws Exception;

    //소셜가입
    int regSocialUser (User user) throws Exception;

    //일반가입
    int registerUser (User user, Address addr) throws Exception;

    //로그인시각 업데이트
    int updateLoginTm (int idx, String email) throws Exception;

    //닉네임 중복체크
    boolean isNickDuplicated (String nick_nm) throws Exception;

    //회원수정 전 인증
    boolean verifyUser (String email, String pwd) throws Exception;

    //회원수정
    int updateUser (User user) throws Exception;

    //비번변경날짜
    int updatePwdUptTm (int idx, String email) throws Exception;
}
