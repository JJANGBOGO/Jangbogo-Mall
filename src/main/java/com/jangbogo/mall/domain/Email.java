package com.jangbogo.mall.domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Email {

    private String toEmail;

    private String fromEmail;

    private String title;

    private String content;

}
