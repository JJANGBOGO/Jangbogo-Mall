package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.JoinProdInqryDto;
import com.jangbogo.mall.domain.ProdInqryDto;
import com.jangbogo.mall.service.ProdInqryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
//@ResponseBody
//@RestController
public class ProdController {
    @Autowired
    ProdInqryService service;

    @GetMapping("/product")
    public String product() {
        return "product";
    }

    //게시물을 수정
    @PatchMapping("/products/{idx}")
    public ResponseEntity<String> modify(@PathVariable Integer idx, @RequestBody ProdInqryDto dto, Integer prod_idx, HttpSession session) {
        Integer user_idx = 1010;
        dto.setIdx(idx);
        System.out.println("dto = " + dto);
        try {

            System.out.println("modiNNamedto = " + dto);
            if(service.modify(dto) != 1) {
                throw new Exception("Write failed");
            }
            return new ResponseEntity<>("MOD_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    //상품문의 게시물을 등록
    @PostMapping("/products")  // /product?prod_idx=1 POST
    public ResponseEntity<String> write(@RequestBody ProdInqryDto dto, Integer prod_idx, HttpSession session) {
        Integer user_idx = 1010;
        dto.setUser_idx(user_idx);
        dto.setProd_idx(prod_idx);
        System.out.println("dto = " + dto);
        try {
            if(service.write(dto) != 1) {
                throw new Exception("Write failed");
            }
            return new ResponseEntity<>("WRT_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    //상품문의 게시물을 삭제
    @DeleteMapping("/products/{idx}")  // /product/1
    public ResponseEntity<String> remove(@PathVariable Integer idx, Integer prod_idx, HttpSession session) {
        Integer user_idx = 1010;
        try {
            int rowCnt = service.remove(idx, prod_idx, user_idx);

            if(rowCnt != 1) {
                throw new Exception("Delete Failed");
            }
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    //상품문의 게시물 가져오기
    @GetMapping("/products")
    public ResponseEntity<List<JoinProdInqryDto>> list(Integer prod_idx) {
        List<JoinProdInqryDto> list = null;
        try {
            list = service.getList(prod_idx);
            System.out.println("list = " + list);
            return new ResponseEntity<List<JoinProdInqryDto>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<JoinProdInqryDto>>(HttpStatus.BAD_REQUEST);
        }


    }
}
