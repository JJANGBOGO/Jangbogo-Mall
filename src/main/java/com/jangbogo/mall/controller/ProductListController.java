package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.JoinProdInqryDto;
import com.jangbogo.mall.domain.ProductDetailDto;
import com.jangbogo.mall.domain.ProductDto;
import com.jangbogo.mall.domain.ProductListDto;
import com.jangbogo.mall.service.ProductListService;
import com.jangbogo.mall.service.WishlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ProductListController {
    @Autowired
    ProductListService productListService;

    @Autowired
    WishlistService wishlistService;

    @GetMapping("/productList")
    public String showProductList( Model m, HttpSession session) {
        Integer user_idx = (Integer)session.getAttribute("idx");

        m.addAttribute("user_idx", user_idx);
        return "product/productList";
    }

    @GetMapping("/productList/list")
    public ResponseEntity<List<ProductListDto>> showProducts( ProductListDto productListDto, Model m) {
        try {
            List<ProductListDto> list = productListService.allProductInfoSelect();
            return new ResponseEntity<List<ProductListDto>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<ProductListDto>>(HttpStatus.BAD_REQUEST);

        }
    }

    @PostMapping("/productList/cart")
    public ResponseEntity<String> insertCart(Integer prod_idx, Integer prod_cnt, HttpSession session) {
        int user_idx = (int)session.getAttribute("idx");
        String msg = "";
        try {
            if(wishlistService.checkCart(prod_idx, user_idx)==0) {
                wishlistService.insertCart(prod_idx, user_idx, prod_cnt);
                msg = "INSERT_OK";
            } else {
                wishlistService.updateCartCnt(prod_idx, user_idx, prod_cnt);
                msg = "UPDATE_OK";
            }
            return ResponseEntity.ok().body(msg);
        } catch (Exception e) {
            e.printStackTrace();
            msg = "INSERT_ERR";
            return new ResponseEntity<String>("INSERT_ERR", HttpStatus.BAD_REQUEST);
        }
    }

}
