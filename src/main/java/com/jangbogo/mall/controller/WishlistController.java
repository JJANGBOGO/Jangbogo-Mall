package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.ProductDto;
import com.jangbogo.mall.domain.WishlistDto;
import com.jangbogo.mall.service.WishlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mypage")
public class WishlistController {
    @Autowired
    WishlistService wishlistService;

    @GetMapping("/wishlist") // 위시리스트 조회
    public String list(Model m, HttpServletRequest request) {  // 하트모양(위시리스트) 누₩르거나, 마이페이지에서 위시리스트 클릭 시
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동

        // 세션에서 이메일 가저온뒤에 넣어주면 그 이메일을 가진 회원번호 알아낸다
        try {
            List<WishlistDto> list = wishlistService.getlist(3); // 회원번호를 알려주면 그 회원의 위시리스트를 보여준다(하드코딩)
            System.out.println("상품번호 = " + list.get(0).getProd_idx());
            int totalCnt = list.size(); // 이 회원의 위시리스트 총 상품 개수
            System.out.println("totalCnt = " + totalCnt);
            Integer[] prods = new Integer[totalCnt]; // 위시리스트 상품 총 200개 제한
            for(int i=0;i<totalCnt;i++){ // 반복문으로 prods 배열에 상품번호들 저장
                    prods[i] = list.get(i).getProd_idx(); // 이 회원의 위시리스트 상품번호들
            }
            System.out.println("prods = " + Arrays.toString(prods));

            List<ProductDto> list2 = wishlistService.getProduct(prods); // 상품번호들 넣어주면 그 상품의 정보를 받아온다
            System.out.println("list2 = " + list2);
            m.addAttribute("totalCnt",totalCnt); // 이 회원의 위시리스트 총 개수
            m.addAttribute("list2",list2); //
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
        return true;  // 일단 (하드코딩) true 박기
    }

    @PostMapping ("/removeWishlist")
    public String delete(Integer prod_idx, HttpServletRequest request) { // 위시리스트 삭제
        System.out.println("prod_idx = " + prod_idx);

        // 세션에서 이메일 가저온뒤에 넣어주면 그 이메일을 가진 회원번호 알아낸다
        try {
            int cnt = wishlistService.delete(prod_idx,3);  // 상품번호와 회원번호를 넣어 위시리스트에서 삭제한다
        } catch (Exception e) {
            throw new RuntimeException(e);
        }



        return "redirect:/mypage/wishlist"; // 삭제 한 뒤에 새로고침
    }

    @PostMapping ("/insertCart")  // 장바구니담기    /담기 클릭 시 장바구니에 담는다
    public String insertCart(Integer prod_idx, Integer prod_cnt, Model m, RedirectAttributes ratt, HttpServletRequest request) {
        // 세션에서 이메일 가저온뒤에 넣어주면 그 이메일을 가진 회원번호 알아낸다
        System.out.println("prod_idxasdsadsadas = " + prod_idx);


        try {
            // 첫 번째로 장바구니에 이 상품이 있는지 조회한다
            int CartCnt = wishlistService.checkCart(prod_idx,3); // 상품번호, 회원번호(하드코딩)
            if(CartCnt!=1){ // 장바구니에 이 상품이 없으면
                int cnt = wishlistService.insertCart(prod_idx, 3, 2); // 상품번호,회원번호(하드코딩),개수(하드코딩)를 넣어주면 장바구니에 담긴다
                ratt.addFlashAttribute("msg","add");
            }else {
                int cnt = wishlistService.updateCartCnt(prod_idx,3,2);
                ratt.addFlashAttribute("msg","addmore");
            }
            
        } catch (Exception e) {
            throw new RuntimeException(e);
        }



        return "redirect:/mypage/wishlist"; // 삭제 한 뒤에 새로고침
    }


}