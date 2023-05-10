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
import java.util.Date;
import java.util.List;


@Slf4j
@Controller
public class RegisterController {

    @Autowired
    Utils utils;
    @Autowired
    RegistProductService registProductService;

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
            System.out.println("list = " + list);
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

    @PostMapping("/seller/register/checkData/selerProdCd")
    public ResponseEntity<String> checkSelerProdCd(HttpSession session, @RequestBody RegistProductDto registProductDto ) {
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

    @PostMapping("/seller/register/checkData/sleTm")
    public ResponseEntity<String> checkSleTm(@RequestBody RegistProductDto registProductDto ) {
        try {
            Date sle_start_tm = registProductDto.getSle_start_tm();
            Date sle_end_tm = registProductDto.getSle_end_tm();

            String msg = "";
            if (isNull(sle_start_tm) || isNull(sle_end_tm)) {  //둘 중 하나라도 안 들어갔을 때
                msg = "DEFICIENT_VALUES";
            } else if (!isNull(sle_start_tm) && !isNull(sle_end_tm)) {  // 둘 다 들어갔을 시
                int result = sle_start_tm.compareTo(sle_end_tm);
                if (result == 0) {
                    msg = "SAME_DATE";
                } else if (result < 0) {
                    msg = "CONFIRM";
                } else {
                    msg = "RETURN";
                }
            } else {                                            //둘 다 안 들어갔을 시
                msg = "RETURN";
            }
            return ResponseEntity.ok().body(msg);
        } catch(Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("EXCPETION_ERR");
        }
    }

    static boolean isNull(Date tm) {
        return tm == null;
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
