package com.jangbogo.mall.security.seller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Slf4j
@Service("accessSellerFailHandler")
public class AccessSellerFailHandler implements AccessDeniedHandler {

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response,
                       AccessDeniedException accessDeniedException) throws IOException, ServletException {

        if(accessDeniedException instanceof AccessDeniedException)
            request.setAttribute("LoginFailMessage", "접근 권한이 없는 계정입니다.");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/seller/login");
        dispatcher.forward(request, response);
    }
}
