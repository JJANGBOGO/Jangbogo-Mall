package com.jangbogo.mall.security;


import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Service("loginSuccessHandler")
@Slf4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    //아예 여기를 타지를 않고 500에러가 난다.
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {

        //경우1 : 로그인 인증을 위해 Spring Security가 요청을 가로챈 경우
        RequestCache requestCache = new HttpSessionRequestCache();
        SavedRequest savedRequest = requestCache.getRequest(request, response);

        String redirectUrl = "";

        if (savedRequest == null) {
            HttpSession session = request.getSession();

            String prevPage = (String) session.getAttribute("prevPage");
            //주소창에 직접 입력하면 prevPage가 null이다.
            redirectUrl = prevPage == null ? "/" : prevPage;

            //이전 페이지가 존재하면 지운다.
            if (prevPage != null) session.removeAttribute("prevPage");

        } else redirectUrl = savedRequest.getRedirectUrl();

        response.sendRedirect(redirectUrl);
    }
}

