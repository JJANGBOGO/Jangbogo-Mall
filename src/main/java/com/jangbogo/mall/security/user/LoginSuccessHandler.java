package com.jangbogo.mall.security.user;


import com.jangbogo.mall.dao.UserDao;
import com.jangbogo.mall.domain.User;
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

@Service("loginSuccessHandler")
@Slf4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    UserDao userDao;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {

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

        String email = authentication.getPrincipal().toString();
        try {
            //회원 조회
            User user = userDao.getUserByEmail(email);
            Integer idx = user.getIdx();
            String userEmail = user.getEmail();

            //세션 생성
            request.getSession().setAttribute("idx", idx);
            request.getSession().setAttribute("email", userEmail);
            request.getSession().setAttribute("nickName", user.getNick_nm());

            //최종로그인일자 업데이트
            userDao.updateLoginTm(idx, userEmail);

        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(redirectUrl);
    }
}

