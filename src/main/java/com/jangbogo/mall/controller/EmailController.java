package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.Email;
import com.jangbogo.mall.service.EmailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EmailController {

    @Autowired
    EmailSender emailSender;

    @GetMapping("/send/email")
    public ResponseEntity<HttpStatus> getEmail(String toEmail) {

        try {
            Email email = Email.builder()
                    .fromEmail("jinvicky17@gmail.com")
                    .toEmail(toEmail)
                    .title("정석마켓 제목")
                    .content("키키키")
                    .build();

            emailSender.sendMail(email);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
        return ResponseEntity.ok(HttpStatus.OK);
    }
}
