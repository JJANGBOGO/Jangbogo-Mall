package com.jangbogo.mall.security.seller;


import com.jangbogo.mall.dao.UserDao;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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

@Service("loginSellerSuccessHandler")
@Slf4j
public class LoginSellerSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    UserDao userDao;

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

        //세션에 idx, email, nickname, loginService 넣어야 함.... TODO:: 회원과 판매자 분기처리
//        String email =  authentication.getPrincipal().toString();
//        try {
//            log.info("test..." + email);
//            User user = userDao.getUser(email);
//            log.info("....test...." + user);
//            request.getSession().setAttribute("userInfo", user);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        response.sendRedirect(redirectUrl);
    }
}

