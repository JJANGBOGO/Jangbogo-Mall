package com.jangbogo.mall.security.seller;


import com.jangbogo.mall.dao.SellerDao;
import com.jangbogo.mall.dao.UserDao;
import com.jangbogo.mall.domain.Seller;
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
    SellerDao sellerDao;

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

        String email =  authentication.getPrincipal().toString();
        try {
            Seller seller = sellerDao.getSellerByEmail(email);
            Integer idx = seller.getIdx();
            String sellerEmail = seller.getEmail();

            request.getSession().setAttribute("idx", seller.getIdx());
            request.getSession().setAttribute("email", seller.getEmail());
            request.getSession().setAttribute("nickName", seller.getCpnm());

            sellerDao.updateLoginTm(idx, email); //로그인일자 최신화
        } catch (Exception e){
            e.printStackTrace();
            redirectUrl = "/seller/login";  //에러 발생시 다시 로그인 페이지로 이동
        }
        response.sendRedirect(redirectUrl);
    }
}

