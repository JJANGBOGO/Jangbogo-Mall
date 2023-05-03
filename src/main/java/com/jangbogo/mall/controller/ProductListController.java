package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.JoinProdInqryDto;
import com.jangbogo.mall.domain.ProductDetailDto;
import com.jangbogo.mall.domain.ProductDto;
import com.jangbogo.mall.domain.ProductListDto;
import com.jangbogo.mall.service.ProductListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ProductListController {
    @Autowired
    ProductListService productListService;

    @GetMapping("/productList")
    public String showProductList( Model m) {



        return "product/productList";
    }

    @GetMapping("/productList/list")
    public ResponseEntity<List<ProductListDto>> showProducts(Integer prod_idx, ProductListDto productListDto, Model m) {
        try {
            List<ProductListDto> list = productListService.allProductInfoSelect();
            Integer totalReview = productListService.reviewNumSelect(prod_idx);
            m.addAttribute("totalReview", totalReview);
            return new ResponseEntity<List<ProductListDto>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<ProductListDto>>(HttpStatus.BAD_REQUEST);

        }
    }

//    대분류에 맞게 카테고리 출력
//    @GetMapping("/productList/category")
//    public ResponseEntity<List<ProductListDto>> categoryList(ProductListDto productListDto) {
//        try {
////            System.out.println("f_cate_idx???"+ f_cate_idx); //04
////            List<ProductListDto> list = productListService.allffloorSelect();
//            //dto에는 setter 통해서 f_cate_idx를 넣어줄 수 있는데 list에는 넣어주지 못한다. 단지 mapper를 통해 검색 된 내용만 들어갈 뿐이다.
////            productListDto.setF_cate_idx(f_cate_idx);
////            System.out.println("productListDto = ????" + productListDto);
////                    setF_cate_idx(f_cate_idx);
////            System.out.println("list==="+list);
////            return new ResponseEntity<List<ProductListDto>>(list, HttpStatus.OK);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<List<ProductListDto>>(HttpStatus.BAD_REQUEST);
//        }
//    }

//    대분류에 맞게 상품출력
//    @GetMapping("/productList/ffloor/{f_cate_idx}")
//    public ResponseEntity<List<ProductListDto>> listFilter(@PathVariable String f_cate_idx, ProductListDto productListDto, String filterType) {
//
//        productListDto.setF_cate_idx(f_cate_idx);
//
//        try {
////            List<ProductListDto> list = productListService.allProductInfoSelect(productListDto);
////            System.out.println("list = " + list);
////            return new ResponseEntity<List<ProductListDto>>(list, HttpStatus.OK);
//        } catch (Exception e) {
//            e.printStackTrace();
//            return new ResponseEntity<List<ProductListDto>>(HttpStatus.OK);
//        }
//    }
}
