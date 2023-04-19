package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.ProductDto;
import com.jangbogo.mall.domain.ProdReviewDto;
import com.jangbogo.mall.service.ProdReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
//@RequestMapping("/mypag")
public class ProdReviewController {
    @Autowired
    ProdReviewService prodReviewService;

    // 상품후기 처음에 필요한 것  1.상품번호(조회) 2.회원번호(수정,삭제,추가)
    @GetMapping("/product/review")
    public String productReviewPage(HttpSession session, Model m,Integer prod_idx){ // 상품 후기는 세션에서 그 회원의 회원번호를 가진 사람만 후기를 수정할 수 있어야 한다
        Integer user_idx = (int)session.getAttribute("idx"); // 세션에서 회원번호를 가져온다
//        m.addAttribute(user_idx); // 회원번호를 jsp 로 넘겨준다
//        m.addAttribute(prod_idx); // 상품번호를 jsp 로 넘겨준다
        return "productReview";
    }

    // 상품후기 처음에 필요한 것  1.상품번호(조회) 2.회원번호(수정,삭제,추가)
    // 상품후기 목록을 가져오는 메서드
    @GetMapping("/product/review/list") // /product/review/list?prod_idx=1  GET
    public ResponseEntity<List<ProdReviewDto>> list(Integer prod_idx, HttpSession session){
        List<ProdReviewDto> list = null;
        Integer user_idx = (Integer)session.getAttribute("idx");        // 세션에서 회원번호를 가져온다
        try {
            list = prodReviewService.getList(prod_idx);                       // 상품번호를 가지고 상품후기 목록을 가져온다
            System.out.println("list = " + list);
            return new ResponseEntity<List<ProdReviewDto>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<ProdReviewDto>>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }




    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("idx")!=null;
//        return true;  // 일단 (하드코딩) true 박기
    }


}