package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.*;
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
    //상품 수정페이지 보여주기
    @GetMapping("/seller/update/product/{prod_idx}")
    public String updateProductView(@PathVariable Integer prod_idx, Model m, RegistProductDto registProductDto) {
        //상품번호로 상품정보 가져와서 다시 리스트 안에 넣어준다.
        try {
            RegistProductDto info = registProductService.selectProdInfo(prod_idx);
            //update 명령
            System.out.println("registProductDto = ???" + registProductDto);
            m.addAttribute("product", info);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/seller/modifyProduct";
    }

    //상품 수정하기
    @PostMapping("/seller/update/productInfo")
    public String updateProduct(RegistProductDto registProductDto, RedirectAttributes rattr) {

        System.out.println("registProductDto |||= ???" + registProductDto); //넘어왔어
        try {
            if (registProductService.checkSellerProdCd(registProductDto) == 0) {
                registProductService.updateProduct(registProductDto);
                registProductService.updateProductDetail(registProductDto);
                registProductService.updateProductDetail(registProductDto);

            } else {
                rattr.addFlashAttribute("msg", "DUPLICATE_NUMBER");
            }
            rattr.addFlashAttribute("msg", "UPDATE_PROD_OK");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "UPDATE_PROD_ERR");
        }

        return "redirect:/seller/list/product";
    }

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
    public String regProductView(HttpServletRequest request) {
//        if (!loginCheck(request)) return "redirect:/user/login?toURL=" + request.getRequestURL();
        return "/seller/registerProduct";
    }

//    @PostMapping("/seller/register/checkData")
//    public String checkData(HttpSession session, @RequestBody RegistProductDto registProductDto, RedirectAttributes rattr) {
//        Integer idx = (Integer) session.getAttribute("idx");
//        registProductDto.setSeler_idx(idx);
//        try {
////            System.out.println("registProductDto = ????" + registProductDto); //넘어왔어
//            if (registProductService.checkSellerProdCd(registProductDto) != 0) {
////                String msg = "DUPLICATE_NUMBER";
//                rattr.addFlashAttribute("msg", "DUPLICATE_NUMBER");
//                throw new Exception("Duplicate Number");
//            } else {
//                rattr.addFlashAttribute("msg", "CONFIRM");
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        System.out.println("000" + registProductDto.getSeler_idx());
//        System.out.println("111" + registProductDto.getSeler_prod_cd());
//        System.out.println("222" + registProductDto.getMft_tm());
//        System.out.println("333" + registProductDto.getDistb_tlmt());
//        System.out.println("444" + registProductDto.getSle_start_tm());
//        System.out.println("555" + registProductDto.getSle_end_tm());
//
//
//        return "";
//    }

    @PostMapping("/seller/register/checkData")
    public ResponseEntity<String> checkData(HttpSession session, @RequestBody RegistProductDto registProductDto, RedirectAttributes rattr) {
        try {
            Integer idx = (Integer) session.getAttribute("idx");
            registProductDto.setSeler_idx(idx);
            String msg = (registProductService.checkSellerProdCd(registProductDto) != 0) ? "DUPLICATE_NUMBER" : "OK";


            return ResponseEntity.ok().body(msg);

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("EXCPETION_ERR");
        }
    }


    //상품 등록 페이지에서 상품등록하기
    @PostMapping("/seller/register/productInfo")
    public String regProduct(
            RegistProductDto registProductDto,
            HttpSession session,
            RedirectAttributes rattr
    ) {
        try {

            Integer idx = (Integer) session.getAttribute("idx");
            registProductDto.setSeler_idx(idx);

            if (registProductDto.getDc_state_cd() == 2) {
                registProductDto.setDc_rate(0);
            }
            if (registProductDto.getSle_date_type() == 1) {
                registProductDto.setSle_start_tm(null);
                registProductDto.setSle_end_tm(null);
            }

            if (registProductService.insertProduct(registProductDto) != 1 || registProductService.checkSellerProdCd(registProductDto) == 1) {  //기존의 판매자상품코드와 겹치는 번호가 있는지 혹인후, 상품테이블에 insert
                rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            }

            int prod_idx = registProductService.getProdIdx(registProductDto);       //AI형식으로 늘어나는 상품번호를 받고
            registProductDto.setProd_idx(prod_idx);                                 //상품번호를 dto에 저장해준다.

            if (registProductService.insertProductDetail(registProductDto) != 1) {
                rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            }

            Integer productIdx = registProductDto.getProd_idx();
            registProductService.insertProductFile(registProductDto.getFiles(), productIdx);

            System.out.println(registProductDto.toString());
            rattr.addFlashAttribute("msg", "REG_PROD_OK");
            return "redirect:/seller/list/product";
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/seller/register/product";
        }
    }

    private boolean loginCheck(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("idx") != null;
    }
}
