package com.jangbogo.mall.controller;


import com.jangbogo.mall.domain.ProductDto;
import com.jangbogo.mall.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    ProductService service;

    //메인 페이지 상품 탭별 조회
    @GetMapping("/list/pd")
    public ResponseEntity<List<ProductDto>> renderList(String category) {
        List<ProductDto> list = new ArrayList<>();
        try {
            list = service.getListByCategory(category);
            return ResponseEntity.ok().body(list);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(list);
        }
    }

    //키워드 검색 페이지
    @GetMapping("/search/product")
    public String searchView(String keyword, Model m, RedirectAttributes rattr) {
        try {
            List<ProductDto> list = service.searchProductList(keyword);
            m.addAttribute("searchPdList", list);
            m.addAttribute("searchKeyword", keyword);
            return "search";
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg" ,"EXCEPTION_ERR");
            return "redirect:/";
        }
    }
}
