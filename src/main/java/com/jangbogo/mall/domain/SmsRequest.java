package com.jangbogo.mall.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class SmsRequest {
    private String type;
    private String contentType;
    private String countryCode;
    private String from;
    private String content;
    private List<Message> messages;
}