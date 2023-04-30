package com.jangbogo.mall.controller;


import com.jangbogo.mall.domain.ProductDto;
import com.jangbogo.mall.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    ProductService service;

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
}
