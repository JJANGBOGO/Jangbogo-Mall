package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.*;
import com.jangbogo.mall.service.ProdReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
//@RequestMapping("/mypage")
public class ProdReviewController {
    @Autowired
    ProdReviewService prodReviewService;

    // 상품후기 처음에 필요한 것  1.상품번호(조회) 2.회원번호(수정,삭제,추가)
    @GetMapping("/product/review")
    public String productReviewPage(Integer page,Integer pageSize,HttpSession session, Model m,Integer prod_idx,SearchCondition sc){ // 상품 후기는 세션에서 그 회원의 회원번호를 가진 사람만 후기를 수정할 수 있어야 한다
        Integer user_idx = (int)session.getAttribute("idx"); // 세션에서 회원번호를 가져온다
        Integer pd = 3;

        List<ProdReviewDto> list = null;

        try {
            int totalCnt = prodReviewService.getCount(1);
            System.out.println("totalCnt = " + totalCnt);
            PageHandler pageHandler = new PageHandler(totalCnt,sc);
//            System.out.println("pageHandler = " + pageHandler);
//            if(page==null) page=1;
//            if(pageSize==null) pageSize=10;

//            Map map = new HashMap();
//            map.put("offset", (page-1) * pageSize);
//            map.put("pageSize",pageSize);
//            map.put("prod_idx",prod_idx);
//            list = prodReviewService.selectPage(map);
//            m.addAttribute("ph",pageHandler);
//            System.out.println("pageHandler = " + pageHandler);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

//        m.addAttribute(user_idx); // 회원번호를 jsp 로 넘겨준다
//        m.addAttribute(prod_idx); // 상품번호를 jsp 로 넘겨준다
        m.addAttribute(pd);
        return "productReview";
    }

    // 상품후기 처음에 필요한 것  1.상품번호(조회) 2.회원번호(수정,삭제,추가)
    // 상품후기 목록을 가져오는 메서드
    @GetMapping("/product/review/list") // /product/review/list?prod_idx=1  GET
    public ResponseEntity<Map> list(Integer page,Integer pageSize, Integer prod_idx, HttpSession session, SearchCondition sc){ // 상품번호, 회원번호 보유중
        List<ProdReviewDto> list = null;

        Integer user_idx = (Integer)session.getAttribute("idx");        // 세션에서 회원번호를 가져온다
        try {
            int totalCnt = prodReviewService.getCount(prod_idx);
            PageHandler pageHandler = new PageHandler(totalCnt,sc);
            if(page==null) page=1;
            if(pageSize==null) pageSize=10;

            Map map = new HashMap();
            map.put("offset", (page-1) * pageSize);
            map.put("pageSize",pageSize);
            map.put("prod_idx",prod_idx);
            list = prodReviewService.selectPage(map);
//            System.out.println("map = " + map);
            Map<String, Object> mapp = new HashMap<>();
            mapp.put("totalCnt",totalCnt);
            mapp.put("pageHandler",pageHandler);
            mapp.put("list",list);
//            list = prodReviewService.getList(prod_idx);                       // 상품번호를 가지고 상품후기 목록을 가져온다
//            System.out.println("list = " + list);
            return new ResponseEntity<Map>(mapp, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<Map>(HttpStatus.INTERNAL_SERVER_ERROR);
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


    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("idx")!=null;
//        return true;  // 일단 (하드코딩) true 박기
    }


}