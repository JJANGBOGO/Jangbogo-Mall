package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.JoinProdInqryDto;
import com.jangbogo.mall.domain.ProdInqryDto;
import com.jangbogo.mall.domain.ProdInqryPageHandler;
import com.jangbogo.mall.service.ProdInqryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
//@ResponseBody
//@RestController
public class ProdController {
    @Autowired
    ProdInqryService service;
    //페이지 이동
    @GetMapping("/product")
    public String product() {
        return "product";
    }

    //게시물을 수정
    @PatchMapping("/products/{idx}")
    public ResponseEntity<String> modify(@PathVariable Integer idx, @RequestBody ProdInqryDto dto, HttpSession session) {
        Integer user_idx = (Integer)session.getAttribute("idx");
        dto.setUser_idx(user_idx);
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
        Integer user_idx = (Integer)session.getAttribute("idx");

        dto.setUser_idx(user_idx);
        dto.setProd_idx(prod_idx);
        System.out.println("user_idx = "+user_idx);
        System.out.println("dto = " + dto);
        try {
            String nickName = service.getNickName(user_idx);
            dto.setWriter(nickName);
            System.out.println("dto ===== " + dto);

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
        Integer user_idx = (Integer)session.getAttribute("idx");
        int rowCnt = 0;
        try {
            rowCnt = service.remove(idx, prod_idx, user_idx);

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
    public ResponseEntity<List<JoinProdInqryDto>> list(Integer prod_idx, HttpSession session) {
        List<JoinProdInqryDto> list = null;
        Integer idx = (Integer)session.getAttribute("idx");
        String email = (String)session.getAttribute("email");
        System.out.println("user idx = "+idx);
        System.out.println("user email = "+email);
//        if(page == null) page = 1;
//        if(pageSize == null) pageSize = 10;

        try {
//            int totalCnt = service.getCount();
//            ProdInqryPageHandler prodInqryPageHandler = new ProdInqryPageHandler(totalCnt, page, pageSize);

            list = service.getList(prod_idx);
            return new ResponseEntity<List<JoinProdInqryDto>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<JoinProdInqryDto>>(HttpStatus.BAD_REQUEST);
        }


    }
}
