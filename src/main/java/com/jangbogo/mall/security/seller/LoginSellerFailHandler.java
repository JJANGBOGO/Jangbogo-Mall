package com.jangbogo.mall.security.seller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.*;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Slf4j
@Service("loginSellerFailHandler")
public class LoginSellerFailHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {
        // TODO Auto-generated method stub
        if(exception instanceof AuthenticationServiceException) {
            request.setAttribute("LoginFailMessage", "죄송합니다. 시스템에 오류가 발생했습니다.");
        }
        else if(exception instanceof BadCredentialsException) {
            request.setAttribute("LoginFailMessage", "아이디 또는 비밀번호가 일치하지 않습니다.");
        }
        else if(exception instanceof DisabledException) {
            request.setAttribute("LoginFailMessage", "현재 사용할 수 없는 계정입니다.");
        }
        else if(exception instanceof LockedException) {
            request.setAttribute("LoginFailMessage", "현재 잠긴 계정입니다.");
        }
        else if(exception instanceof AccountExpiredException) {
            request.setAttribute("LoginFailMessage", "이미 만료된 계정입니다.");
        }
        else if(exception instanceof CredentialsExpiredException) {
            request.setAttribute("LoginFailMessage", "비밀번호가 만료된 계정입니다.");
        }
        else request.setAttribute("LoginFailMessage", "계정을 찾을 수 없습니다.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/seller/login");
        dispatcher.forward(request, response); //forward 요청으로 경로는 그대로
    }
}
