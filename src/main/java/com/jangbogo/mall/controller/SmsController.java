package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.Message;
import com.jangbogo.mall.domain.SmsResponse;
import com.jangbogo.mall.service.EmailSender;
import com.jangbogo.mall.service.SmsService;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.ECField;
import java.util.Random;

@RestController
@RequiredArgsConstructor
@Slf4j
@PropertySource("classpath:api_info.properties")
public class SmsController {

    //@RequiredArgsConstructor를 통해서 매개변수가 있는 생성자를 만들어서 자동으로 주입되도록 한다.
    private final SmsService smsService;

    //휴대전화 인증
    @PostMapping(value = "/chk/mpno")
    @ResponseBody
    public ResponseEntity<SmsResponse> checkMpno(@RequestBody Message msg) throws Exception {
        msg.setContent(crtVerifyNum());
        log.info("mpno..." + msg.getTo());

        try {
//            SmsResponse resp = smsService.sendSms(msg.getTo(), "verify number: " + msg.getContent());
            SmsResponse resp = new SmsResponse();
            resp.setNumStr(msg.getContent());
            return ResponseEntity.ok().body(resp);

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(null);
        }
    }

    public String crtVerifyNum() { //휴대전화 인증번호 생성
        String numStr = "";
        for (int i = 0; i < 5; i++) {
            numStr += (new Random()).nextInt(9);
        }
        return numStr;
    }
}
