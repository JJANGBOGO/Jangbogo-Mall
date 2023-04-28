package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.*;
import com.jangbogo.mall.service.ProductService;
import com.jangbogo.mall.service.RegistProductService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
@Slf4j
@Controller
public class RegisterController {
    @Autowired
    ProductService productService;
    @Autowired
    RegistProductService registProductService;

    //등록된 상품리스트 보여주기
    @GetMapping("/seller/list/product")
    public String listProductView(HttpSession session, HttpServletRequest req, Model m, RedirectAttributes rattr) {
        m.addAttribute("mySellerUrl", req.getRequestURI());
        try {
            Integer idx = (Integer) session.getAttribute("idx");
            List<ProductDto> list = productService.getListBySeller(idx);
            m.addAttribute("productList", list);
            return "/seller/productList";
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

    @PostMapping("/seller/register/productInfo")  // /product?prod_idx=1 POST
    public ResponseEntity<String> registProduct(@RequestBody RegistProductDto registProductDto, HttpSession session) {
        Integer idx = (Integer)session.getAttribute("idx");

        registProductDto.setSeler_idx(idx);
        registProductDto.setR_img("https://cdn.iworldtoday.com/news/photo/202104/401210_201173_4855.jpg");

        try {
            if (registProductService.insertProduct(registProductDto) != 1){
                throw new Exception("register product failed");
            }
            //판매자상품코드를 가져온다.
            Integer prod_cd_val = registProductDto.getProd_cd_val();
            //상품번호를 받아온다.
            int productIdx = registProductService.getProdIdx(prod_cd_val);

            //받아온 상품번호를 dto에 넣어준다.
            registProductDto.setProd_idx(productIdx);

            System.out.println("getProdIDx===="+registProductDto.getProd_idx()); //상품을 인서트 하지 않았으니까 못찾지

            if(registProductService.insertProductDetail(registProductDto) != 1) {
                throw new Exception("register product failed");
            }
            //상품상세첨부파일테이블 하드코딩 - 등록시마다 uuid 새로 지정해서 테스트 해야함
            registProductDto.setUUID("008");
            registProductDto.setFile_NAME("본문사진");
            registProductDto.setUPLOAD_PATH("https://cdn.iworldtoday.com/news/photo/202104/401210_201173_4855.jpg");
            registProductDto.setTYPE(1);
            registProductDto.setSTATE_CD(1);
            registProductDto.setSORT_ODR(1);
            registProductService.insertProductFile(registProductDto);


            return new ResponseEntity<>("WRT_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    //상품 등록 페이지에서 상품등록하기
    @PostMapping("/seller/register/product")
    public String regProduct(ProductDto productDto, ProductDtl productDtl, HttpSession session, RedirectAttributes rattr) {
        try {
//            //판매자 idx 적용 //판매자 번호 session에서 가져옴!
//            Integer idx = (Integer) session.getAttribute("idx");
//
//
//            productDto.setSeler_idx(idx);
//
//            if (productService.registerProduct(productDto, productDtl) != 1)
//                throw new Exception("register product failed");

            rattr.addFlashAttribute("msg", "REG_PROD_OK");
            return "redirect:/seller/list/product";
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/seller/register/product";
        }
    }
}
