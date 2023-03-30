package com.jangbogo.mall.service;


import com.jangbogo.mall.domain.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;

@Service
public class EmailSender {

    @Autowired
    private JavaMailSender mailSender;
    //can not autowired라고 뜬다면 root-context.xml에 등록을 안 한 것이다.

    public String sendMail(Email email) {
        System.out.println("email = " + email);
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            messageHelper.setTo(email.getToEmail());
            messageHelper.setText(email.getContent());
            messageHelper.setFrom(email.getFromEmail());
            messageHelper.setSubject(email.getTitle());	// 메일제목은 생략이 가능하다

            mailSender.send(message);

        } catch(Exception e){
            System.out.println(e);
        }
        return "Sucess";
    }
}
