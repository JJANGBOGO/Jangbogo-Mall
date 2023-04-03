package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.WishlistDto;
import com.jangbogo.mall.service.WishlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/mypage")
public class WishlistController {
    @Autowired
    WishlistService wishlistService;

    @GetMapping("/wishlist") // 하트모양(위시리스트) 누르거나, 마이페이지에서 위시리스트 클릭 시
    public String list(Model m, HttpServletRequest request) {
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동

        // 세션에서 회원의 아이디?,비밀번호를 가저온뒤에 넣어주면

        try {
            List<WishlistDto> list = wishlistService.getlist(3); // 회원번호를 알려주면 그 회원의 위시리스트를 보여준다
            m.addAttribute("list",list);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "wishlist"; // 로그인을 한 상태이면, 위시리스트 화면으로 이동
    }

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
//        return session.getAttribute("id")!=null;
        return true;
    }

    @GetMapping ("/wishlistremove")
    public String delete(Integer prod_idx, HttpServletRequest request) {
        System.out.println("prod_idx = " + prod_idx);

        // 세션에서 회원번호, 매개변수에서 상품번호 받아 온 뒤에
        try {
            int cnt = wishlistService.delete(prod_idx,3);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }



        return "redirect:/mypage/wishlist"; // 삭제 한 뒤에 새로고침
    }

}