package com.jangbogo.mall.domain;

import lombok.*;
import org.springframework.stereotype.Component;

@NoArgsConstructor
@Data
@Component //validator를 적용할 대상에 필수이다.
public class User {

    private String id;

    private String email;

    private String pwd;
}
