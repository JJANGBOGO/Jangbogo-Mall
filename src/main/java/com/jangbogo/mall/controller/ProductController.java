package com.jangbogo.mall.controller;


import com.jangbogo.mall.domain.ProductDto;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {

    @GetMapping("/pd/list")
    public ResponseEntity<List<ProductDto>> renderList(String category) {
        List<ProductDto> list = new ArrayList<>();
        try {

            return ResponseEntity.ok().body(list);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(list);
        }
    }
}
