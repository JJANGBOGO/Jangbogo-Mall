package com.jangbogo.mall.security;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Service("accessFailHandler")
public class AccessFailHandler implements AccessDeniedHandler {

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response,
                       AccessDeniedException accessDeniedException) throws IOException, ServletException {
        // TODO Auto-generated method stub
//        if(accessDeniedException instanceof AccessDeniedException) {
        if(accessDeniedException != null) {
            System.out.println("accessDeniedException = " + accessDeniedException);
            request.setAttribute("LoginFailMessage", "접근 권한이 없는 계정입니다.");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/user/login");
        dispatcher.forward(request, response);
    }
}
