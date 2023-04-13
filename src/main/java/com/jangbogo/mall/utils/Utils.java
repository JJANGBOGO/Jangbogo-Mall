package com.jangbogo.mall.utils;


import org.springframework.stereotype.Component;

@Component
public class Utils {

    //공통 함수
    public String createTmpPwd() {
        String pwd = "";
        for (int i = 0; i < 12; i++) {
            pwd += (char) ((Math.random() * 26) + 97);
        }
        return pwd;
    }
}
