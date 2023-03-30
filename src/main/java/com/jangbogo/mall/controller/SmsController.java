package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.SmsResponse;
import com.jangbogo.mall.service.EmailSender;
import com.jangbogo.mall.service.SmsService;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

@RestController
@RequiredArgsConstructor
@PropertySource("classpath:api_info.properties")
public class SmsController {

    //@RequiredArgsConstructor를 통해서 매개변수가 있는 생성자를 만들어서 자동으로 주입되도록 한다.
    private final SmsService smsService;

    @Autowired
    EmailSender emailSender;

    @PostMapping(value = "/user/sms")
    public ResponseEntity<SmsResponse> test(@RequestBody String recipientPhoneNumber) throws NoSuchAlgorithmException, URISyntaxException, UnsupportedEncodingException, InvalidKeyException, JsonProcessingException {
        SmsResponse data = smsService.sendSms(recipientPhoneNumber, "randomNumber00000");
        return ResponseEntity.ok().body(data);
    }
}
