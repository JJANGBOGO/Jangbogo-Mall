package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.ProductDtl;
import com.jangbogo.mall.domain.ProductDto;
import com.jangbogo.mall.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
@Slf4j
@Controller
public class RegisterController {
    @Autowired
    ProductService productService;
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

    //상품 등록 페이지에서 상품등록하기
    @PostMapping("/seller/register/product")
    public String regProduct(ProductDto productDto, ProductDtl productDtl, HttpSession session, RedirectAttributes rattr) {
        try {

            log.info("productDto…." + productDto);
            log.info("productDtl…." + productDtl);

            //판매자 idx 적용
            Integer idx = (Integer) session.getAttribute("idx");
            productDto.setSeler_idx(idx);

            if (productService.registerProduct(productDto, productDtl) != 1)
                throw new Exception("register product failed");

            rattr.addFlashAttribute("msg", "REG_PROD_OK");
            return "redirect:/seller/list/product";
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/seller/register/product";
        }
    }
}
