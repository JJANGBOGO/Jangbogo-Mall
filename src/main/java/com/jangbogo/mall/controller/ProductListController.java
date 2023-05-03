package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.JoinProdInqryDto;
import com.jangbogo.mall.domain.ProductDetailDto;
import com.jangbogo.mall.domain.ProductListDto;
import com.jangbogo.mall.service.ProductListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ProductListController {
    @Autowired
    ProductListService productListService;

    @GetMapping("/productList/{f_cate_idx}")
    public String showProductList(@PathVariable String f_cate_idx, Model m) {

        m.addAttribute("f_cate_idx", f_cate_idx);
        return "product/productList";
    }

    @GetMapping("/productList/ffloor/{f_cate_idx}")
    public ResponseEntity<List<ProductListDto>> listFilter(@PathVariable String f_cate_idx, ProductListDto productListDto, String filterType) {

        productListDto.setF_cate_idx(f_cate_idx);

        try {
            List<ProductListDto> list = productListService.allProductInfoSelect(productListDto);
            return new ResponseEntity<List<ProductListDto>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<ProductListDto>>(HttpStatus.OK);
        }
    }
}
