package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.*;
import com.jangbogo.mall.service.ProductService;
import com.jangbogo.mall.service.RegistProductService;
import com.jangbogo.mall.utils.Utils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
@Slf4j
@Controller
public class RegisterController {
//    @Autowired
//    ProductService productService;

    @Autowired
    Utils utils;
    @Autowired
    RegistProductService registProductService;

    //등록된 상품리스트 보여주기
//    @GetMapping("/seller/list/product")
//    public String listProductView(HttpSession session, HttpServletRequest req, Model m, RedirectAttributes rattr) {
//        m.addAttribute("mySellerUrl", req.getRequestURI());
//        try {
//            Integer idx = (Integer) session.getAttribute("idx");
//            List<RegistProductDto> list = productService.getListBySeller(idx);
//            m.addAttribute("productList", list);
//            return "/seller/productList";
//        } catch (Exception e) {
//            e.printStackTrace();
//            return "redirect:/";
//        }
//    }
    //등록된 상품 리스트 보여주기
    @GetMapping("/seller/list/product")
    public String listProductView(HttpSession session, HttpServletRequest req, Model m, RedirectAttributes rattr) {
        m.addAttribute("mySellerUrl", req.getRequestURI());
        Integer idx = (Integer) session.getAttribute("idx");
        try {
            List<RegistProductDto> list = registProductService.getProductList(idx);
            m.addAttribute("productList", list);
            return "/seller/registerProductList";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }
    }

    //판매자 상품 등록 화면
    @GetMapping("/seller/register/product")
    public String regProductView() {
        return "/seller/registerProduct";
    }


    //상품 등록 페이지에서 상품등록하기
    @PostMapping("/seller/register/productInfo")
    public String regProduct(RegistProductDto registProductDto, HttpSession session, RedirectAttributes rattr) {
        try {
            Integer idx = (Integer)session.getAttribute("idx");
            registProductDto.setSeler_idx(idx);

            if(registProductDto.getDc_state_cd() == 2) {
                registProductDto.setDc_rate(0);
            }
            if(registProductDto.getSle_date_type() == 1) {
                registProductDto.setSle_start_tm(null);
                registProductDto.setSle_end_tm(null);
            }

            if(registProductService.insertProduct(registProductDto) != 1 || registProductService.checkSellerProdCd(registProductDto) == 1) {  //기존의 판매자상품코드와 겹치는 번호가 있는지 혹인후, 상품테이블에 insert
                rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            }

            int prod_idx = registProductService.getProdIdx(registProductDto);       //AI형식으로 늘어나는 상품번호를 받고
            registProductDto.setProd_idx(prod_idx);                                 //상품번호를 dto에 저장해준다.


            if(registProductService.insertProductDetail(registProductDto) != 1){
                rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            }

            registProductDto.setProducts("https://cdn.iworldtoday.com/news/photo/202104/401210_201173_4855.jpg");
            registProductDto.setUUID(utils.createRandomStr());  //테스트시 uuid 재할당 필수 (pk로 지정되어 있음)
            registProductDto.setNAME("본문사진");
            registProductDto.setTYPE(1); //파일유형 1(이미지)
            registProductDto.setState(1); //파일상태코드 1(사용)
            registProductDto.setSORT_ODR(1); //파일정렬순서

            if (registProductService.insertProductFile(registProductDto) != 1) {
                rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            }

            System.out.println(registProductDto.toString());
            rattr.addFlashAttribute("msg", "REG_PROD_OK");
            return "redirect:/seller/list/product";
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/seller/register/product";
        }
    }
}
