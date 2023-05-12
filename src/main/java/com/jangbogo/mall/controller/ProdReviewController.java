//package com.jangbogo.mall.controller;
//
//import com.jangbogo.mall.domain.*;
//import com.jangbogo.mall.service.ProdReviewService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import java.util.*;
//
//@Controller
////@RequestMapping("/mypage")
//public class ProdReviewController {
//    @Autowired
//    ProdReviewService prodReviewService;
//
//    // 상품후기 처음에 필요한 것  1.상품번호(하드코딩) 2.회원번호(수정)
//    @GetMapping("/product/review")
//    public String productReviewPage(HttpSession session, Model m,Integer prod_idx){ // 상품 후기는 세션에서 그 회원의 회원번호를 가진 사람만 후기를 수정할 수 있어야 한다
////        Integer user_idx = (int)session.getAttribute("idx"); // 세션에서 회원번호를 가져온다
//        List<ProdReviewDto> list = null;
//
////        m.addAttribute(prod_idx); // 현재 하드코딩 나중에 넣어주기
//
//        return "productReview";
//    }
//
//    // 상품후기 목록을 가져오는 메서드 + 페이징
//    @GetMapping("/product/review/list") // /product/review/list?prod_idx=1  GET
//    public ResponseEntity<Map> list(Integer page,Integer pageSize, Integer prod_idx, HttpSession session, SearchCondition sc){ // 상품번호, 회원번호 보유중
//        List<ProdReviewDto> list = null;
//        System.out.println("222222 = " + 222222);
//
//        Integer user_idx = (Integer)session.getAttribute("idx");        // 세션에서 회원번호를 가져온다
//        try {
//            int totalCnt = prodReviewService.getCount(prod_idx);              // 해당 상품의 상품후기 개수
//            PageHandler pageHandler = new PageHandler(totalCnt,sc);
//
//            if(page==null || page.equals("")) page=1;
//            if(pageSize==null || page.equals("")) pageSize=10;
//
//            Map map = new HashMap();
//            map.put("offset", (page-1) * pageSize);
//            map.put("pageSize",pageSize);
//            map.put("prod_idx",prod_idx);
//            list = prodReviewService.selectPage(map);                         // 상품후기 목록을 가져온다 10개씩
//            System.out.println("list = " + list);
//
//            Map<String, Object> listsMap = new HashMap<>();                   // Map(listsMap) 생성 // 여러개의 값을 보내기 위해서
//            listsMap.put("totalCnt",totalCnt);                                // Map 에 상품후기 개수(totalCnt) 추가
//            listsMap.put("pageHandler",pageHandler);                          // Map 에 페이징(pageHandler) 추가
//            listsMap.put("list",list);                                        // Map 에 상품후기 목록 10개(list) 추가
//
////            list = prodReviewService.getList(prod_idx);                       // 상품번호를 가지고 상품후기 목록을 가져온다
//
//            return new ResponseEntity<Map>(listsMap, HttpStatus.OK);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<Map>(HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//
//    }
//
//
//    // 상품후기 내용을 수정하는 메서드
//    @PatchMapping("/product/review/{idx}") // /product/review/1  PATCH
//    public ResponseEntity<String> update(@PathVariable Integer idx, @RequestBody ProdReviewDto prodReviewDto,HttpSession session){
////        System.out.println("prodReviewDto = " + prodReviewDto);
//
//        Integer user_idx = (int)session.getAttribute("idx"); // 세션에서 회원번호를 가져온다
//        String opub_yn = prodReviewDto.getOpub_yn();  // 공개여부 변수 선언
//
//        prodReviewDto.setUser_idx(user_idx);          // prodReviewDto 에 회원번호를 담는다
//        prodReviewDto.setIdx(idx);                    // prodReviewDto 에 상품 후기 일련번호를 담는다
//        try {
//            if(opub_yn.equals("true")){               // 공개여부 확인(후기 비공개하기 == Yes or No)
//                prodReviewDto.setOpub_yn("N");        // 공개여부 N(no)
//            }else {
//                prodReviewDto.setOpub_yn("Y");        // 공개여부 Y(yes)
//            }
//            prodReviewService.update(prodReviewDto); // 수정할 상품 후기 정보를 담아준다( 수정내용, 공개여부..)
//            return new ResponseEntity<String>("Update_OK",HttpStatus.OK);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<String>("Update_ERR",HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }
//
//
//    private boolean loginCheck(HttpServletRequest request) {
//        // 1. 세션을 얻어서
//        HttpSession session = request.getSession();
//        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
//        return session.getAttribute("idx")!=null;
////        return true;  // 일단 (하드코딩) true 박기
//    }
//
//
//}