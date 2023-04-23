package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.OrderDto;
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
import java.util.Arrays;
import java.util.Enumeration;
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
        Integer pd = 3;
//        m.addAttribute(user_idx); // 회원번호를 jsp 로 넘겨준다
//        m.addAttribute(prod_idx); // 상품번호를 jsp 로 넘겨준다
        m.addAttribute(pd);
        return "productReview";
    }

    // 상품후기 처음에 필요한 것  1.상품번호(조회) 2.회원번호(수정,삭제,추가)
    // 상품후기 목록을 가져오는 메서드
    @GetMapping("/product/review/list") // /product/review/list?prod_idx=1  GET
    public ResponseEntity<List<ProdReviewDto>> list(Integer prod_idx, HttpSession session){ // 상품번호, 회원번호 보유중
        List<ProdReviewDto> list = null;
        Integer user_idx = (Integer)session.getAttribute("idx");        // 세션에서 회원번호를 가져온다
        try {
            list = prodReviewService.getList(prod_idx);                       // 상품번호를 가지고 상품후기 목록을 가져온다
//            System.out.println("list = " + list);
            return new ResponseEntity<List<ProdReviewDto>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<ProdReviewDto>>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }


    // 상품후기 내용을 수정하는 메서드
    @PatchMapping("/product/review/{idx}") // /product/review/1  PATCH
    public ResponseEntity<String> update(@PathVariable Integer idx, @RequestBody ProdReviewDto prodReviewDto,HttpSession session){
        System.out.println("prodReviewDto = " + prodReviewDto);

        Integer user_idx = (int)session.getAttribute("idx"); // 세션에서 회원번호를 가져온다
        String opub_yn = prodReviewDto.getOpub_yn();  // 공개여부 변수 선언

        prodReviewDto.setUser_idx(user_idx);          // prodReviewDto 에 회원번호를 담는다
        prodReviewDto.setIdx(idx);                    // prodReviewDto 에 상품 후기 일련번호를 담는다
        System.out.println("prodReviewDto1 = " + prodReviewDto);
        try {
            if(opub_yn.equals("true")){               // 공개여부 확인(후기 비공개하기 Yes or No)
                prodReviewDto.setOpub_yn("N");        // 공개여부 N(no)
            }else {
                prodReviewDto.setOpub_yn("Y");        // 공개여부 Y(yes)
            }
            prodReviewService.update(prodReviewDto); // 수정할 상품 후기 정보를 담아준다( 수정내용, 공개여부..)
            return new ResponseEntity<String>("Update_OK",HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("Update_ERR",HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }




    // 상품 후기를 등록하는 메서드
    @PostMapping("/product/review")   // /product/review  POST
    public ResponseEntity<String> write(@RequestBody ProdReviewDto prodReviewDto, HttpSession session) {
        Integer user_idx = (int)session.getAttribute("idx"); // 세션에서 회원번호를 가져온다
        String nickName = (String) session.getAttribute("nickName"); // 세션에서 닉네임(작성자)를 가져온다
        String n3 = (String) session.getAttribute("email"); // 이메일

        prodReviewDto.setUser_idx(user_idx);
        prodReviewDto.setWriter(nickName);
        System.out.println("prodReviewDto = " + prodReviewDto); // 주문번호,상품번호,회원번호,후기내용,작성자

        try {
            if(prodReviewService.insert(prodReviewDto)!=1) throw new Exception("Write failed");
            return new ResponseEntity<>("WRT_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
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