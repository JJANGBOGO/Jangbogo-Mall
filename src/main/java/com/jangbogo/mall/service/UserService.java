package com.jangbogo.mall.service;

public interface UserService {

    int withdrawUser (int idx, String email) throws Exception;

    String findUserEmail (String nick_nm, String pwd) throws Exception;

    boolean isUserPresent (String nick_nm, String email) throws Exception;
}
