package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.ProductDto;
import com.jangbogo.mall.service.WishlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/mypage")
public class WishlistController {
    @Autowired
    WishlistService wishlistService;

    // 위시리스트 페이지 이동
    @GetMapping("/wishlist")
    public String wishlistPage() {
        return "wishlist";
    }

    // 지정된 위시리스트 목록을 가져오는 메서드
    @GetMapping("/wishlists") // /wishlists GET
    public ResponseEntity<List<ProductDto>> list(HttpSession session){
        List<ProductDto> list = null;
        Integer user_idx = (Integer)session.getAttribute("idx");
        try {
            list = wishlistService.getlist(user_idx);
            return new ResponseEntity<List<ProductDto>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<ProductDto>>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    @DeleteMapping("/wishlists/{prod_idx}") // DELETE /wishlists/1  <-- 삭제할 상품 번호
    public ResponseEntity<String> remove(@PathVariable Integer prod_idx, HttpSession session){
        Integer user_idx = (Integer) session.getAttribute("idx");
        int rowCnt = 0;
        System.out.println("user_idx = " + user_idx);
        System.out.println("prod_idx = " + prod_idx);
        try {
            rowCnt = wishlistService.delete(prod_idx,user_idx);
            if(rowCnt != 1) {
                throw new Exception("Delete Failed");
            }
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    // 장바구니에 상품 존재 확인 메서드
    @PostMapping("/wishlists") //wishlists?prod_idx=1&prod_cnt=1 POST
    public ResponseEntity<String> insert(Integer prod_idx, Integer prod_cnt,HttpSession session,RedirectAttributes ratt){
        int user_idx = (int) session.getAttribute("idx");

        try {
            int CartCnt = wishlistService.checkCart(prod_idx, user_idx); // 장바구니에 이 상품이 있는지 확인
            if (CartCnt == 0) { // 0 or 1
                int cnt = wishlistService.insertCart(prod_idx, user_idx, prod_cnt);    // 2-1 상품번호,회원번호,개수를 넣어주면 장바구니에 담긴다
                return new ResponseEntity<>("DEL_OK1", HttpStatus.OK);
            } else {
                int cnt = wishlistService.updateCartCnt(prod_idx, user_idx, prod_cnt); // 2-1 상품번호,회원번호,개수를 넣어주면 장바구니에 담긴다
                return new ResponseEntity<>("DEL_OK2", HttpStatus.OK);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR", HttpStatus.INTERNAL_SERVER_ERROR);

        }


    }




//    @GetMapping("/wishlist") // 위시리스트 조회
//    public String list(Model m, HttpServletRequest request, HttpSession session) {  // 하트모양(위시리스트) 누르거나, 마이페이지에서 위시리스트 클릭 시
//        if (!loginCheck(request))
//            return "redirect:/user/login?toURL=" + request.getRequestURL();         // 로그인을 안했으면 로그인 화면으로 이동
//
//        try {
//            int idx = (int) session.getAttribute("idx");                      // 1. 세션에서 회원번호를 가저온다
//            List<ProductDto> list = wishlistService.getlist(idx);                   // 2. 회원번호를 알려주면 그 회원의 위시리스트를 가저온다
//            int totalCnt = list.size();                                             // 3. 이 회원의 위시리스트 총 상품 개수
//            m.addAttribute("totalCnt", totalCnt);                       // 4. 위시리스트 총 개수를 모델에 담는다
//            m.addAttribute("list", list);                               // 5. 위시리스트 목록을 모델에 담는다
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//        return "wishlist";                                                           // 6. 위시리스트 조회 화면으로 이동
//    }



//    @PostMapping("/removeWishlist")
//    public String delete(Integer prod_idx, HttpServletRequest request, HttpSession session) {  // 위시리스트 삭제
//
//        int idx = (int) session.getAttribute("idx");                      // 1. 세션에서 회원번호를 가저온다
//        try {
//            int cnt = wishlistService.delete(prod_idx, idx);                    // 2. 상품번호와 회원번호를 넣어 위시리스트에서 삭제한다
//            if (cnt != 1) {
//                throw new Exception("Delete_failed");
//            }
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//        return "redirect:/mypage/wishlist";                                     // 3. 삭제 한 뒤에 목록 페이지로 새로고침(redirect)
//    }

//    @PostMapping("/insertCart")                                               // 장바구니담기  //담기 클릭 시 장바구니에 담는다
//    public String insertCart(Integer prod_idx, Integer prod_cnt, RedirectAttributes ratt, HttpSession session) {
//
//        int idx = (int) session.getAttribute("idx");                        // 1. 세션에서 회원번호를 가저온다
//        try {
//            int CartCnt = wishlistService.checkCart(prod_idx, idx);               // 2. 장바구니에 이 상품이 있는지 조회한다
//            if (CartCnt != 1) {
//                int cnt = wishlistService.insertCart(prod_idx, idx, prod_cnt);    // 2-1 상품번호,회원번호(하드코딩),개수(하드코딩)를 넣어주면 장바구니에 담긴다
//                ratt.addFlashAttribute("msg", "add");
//            } else {
//                int cnt = wishlistService.updateCartCnt(prod_idx, idx, prod_cnt); // 2-1 상품번호,회원번호(하드코딩),개수(하드코딩)를 넣어주면 장바구니에 담긴다
//                ratt.addFlashAttribute("msg", "addmore");
//            }
//
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//        return "redirect:/mypage/wishlist";                                       // 3. 장바구니에 담은 뒤에 목록 페이지 새로고침(redirect)
//    }



    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("idx")!=null;
//        return true;  // 일단 (하드코딩) true 박기
    }


}