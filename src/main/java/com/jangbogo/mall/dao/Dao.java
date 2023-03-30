package com.jangbogo.mall.dao;

import com.jangbogo.mall.domain.UserDetailsDto;

import java.util.ArrayList;

public interface Dao {

    public UserDetailsDto selectUser(String username);

    public ArrayList<String> getAuthList(String username);

    public void userSignUp(String username, String password, char enable);

    public void giveAuth(String username, String authority);
}
