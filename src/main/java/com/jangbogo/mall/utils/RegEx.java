package com.jangbogo.mall.utils;


import org.springframework.stereotype.Component;

import java.util.Objects;
import java.util.regex.Pattern;

@Component
public class RegEx {

    public boolean isEmpty (String val) {
        return Objects.equals(val, "");
    }

    //이메일 정규식 검사
    public boolean chkEmail (String email) {
        String emailRegex = "/^[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$/i";
        return Pattern.matches(emailRegex, email);
    }

    //닉네임, 브랜드명 정규식 검사
    public boolean chkName (String name) {
        String nameRegex = "";
        return Pattern.matches(nameRegex, name);
    }
}
