package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.*;
import com.jangbogo.mall.service.ProdInqryService;
import com.jangbogo.mall.service.ProductDetailService;
import com.mysql.cj.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
//@ResponseBody
//@RestController
public class ProdController {
    @Autowired
    ProdInqryService prodInqryService;
    @Autowired
    ProductDetailService productDetailService;
    //페이지 이동
    @GetMapping("/product/{prod_idx}")
    public String product(@PathVariable Integer prod_idx, HttpSession session, Model m, HttpServletRequest request) {
        if(!loginCheck(request))
            return "redirect:/user/login?toURL=" + request.getRequestURL();
        Integer session_idx = (Integer)session.getAttribute("idx");
        try {
            ProductDetailDto list = productDetailService.read(prod_idx);
            Integer cate_idx = productDetailService.findDlvry(list.getCate_idx());
            ProductDetailDto dlvryMethod = productDetailService.dlvryInfo(cate_idx);
            ProductDetailDto findBrand = productDetailService.findBrand(prod_idx);
            m.addAttribute("prod_idx", prod_idx);
            m.addAttribute("session_idx", session_idx);
            m.addAttribute("list", list);
            m.addAttribute("dlvryMethod", dlvryMethod);
            m.addAttribute("findBrand", findBrand);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "product";
    }

    @GetMapping("/product/inqry/list")
    @ResponseBody
    public ResponseEntity<List<JoinProdInqryDto>> inqryList(Integer prod_idx, HttpSession session, JoinProdInqryDto joinProdInqryDto, ProductDetailDto productDetailDto) {
        List<JoinProdInqryDto> list = null;
        Integer idx = (Integer)session.getAttribute("idx");
        String email = (String)session.getAttribute("email");
        System.out.println("[GET]user idx = "+idx);
        System.out.println("user email = "+email);

//        if(page == null) page = 1;
//        if(pageSize == null) pageSize = 10;
        try {
//            ProdInqryPageHandler prodInqryPageHandler = new ProdInqryPageHandler(totalCnt, page, pageSize);


            list = prodInqryService.getList(prod_idx);
            return new ResponseEntity<List<JoinProdInqryDto>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<JoinProdInqryDto>>(HttpStatus.BAD_REQUEST);
        }
    }

    //게시물을 수정
    @PatchMapping("/product/inqry/{idx}")
    public ResponseEntity<String> modify(@PathVariable Integer idx, Integer prod_idx, @RequestBody ProdInqryDto prodInqryDto, HttpSession session) {
        Integer user_idx = (Integer)session.getAttribute("idx");
        String nick_name = (String)session.getAttribute("nickName");
        prodInqryDto.setUser_idx(user_idx);
        prodInqryDto.setIdx(idx);
        prodInqryDto.setProd_idx(prod_idx);
        try {
            prodInqryDto.setWriter(nick_name);
            if(prodInqryService.modify(prodInqryDto) != 1) {
                throw new Exception("Write failed");
            }
            return new ResponseEntity<>("MOD_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    //상품문의 게시물을 등록
    @PostMapping("/product/inqry/write")  // /product?prod_idx=1 POST
    public ResponseEntity<String> write(@RequestBody ProdInqryDto prodInqryDto, Integer prod_idx, HttpSession session) {
        Integer user_idx = (Integer)session.getAttribute("idx");
        String nick_name = (String)session.getAttribute("nickName");
        prodInqryDto.setUser_idx(user_idx);
        prodInqryDto.setProd_idx(prod_idx);
        try {
            prodInqryDto.setWriter(nick_name);
            System.out.println("Post dto ===== " + prodInqryDto);

            if(prodInqryService.write(prodInqryDto) != 1) {
                throw new Exception("Write failed");
            }
            return new ResponseEntity<>("WRT_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    //상품문의 게시물을 삭제
    @DeleteMapping("/product/inqry/list/{idx}")  // /product/1
    public ResponseEntity<String> remove(@PathVariable Integer idx, Integer prod_idx, HttpSession session) {
        Integer user_idx = (Integer)session.getAttribute("idx");
        int rowCnt = 0;
        try {
            rowCnt = prodInqryService.remove(idx, prod_idx, user_idx);

            if(rowCnt != 1) {
                throw new Exception("Delete Failed");
            }
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    //상세 이미지들 가져오기
//    @GetMapping("/product/productDetail/description")
//    @ResponseBody
//    public ResponseEntity<ProductDetailDto> showDescriptionList(Integer prod_idx) {
//
//    }

    @GetMapping("/product/productDetail/detail")
    @ResponseBody
    public ResponseEntity<ProductDetailDto> showDetailList(Integer prod_idx) {
        try {
            ProductDetailDto infoList = productDetailService.read(prod_idx);
            return new ResponseEntity<>(infoList, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }


    //상품상세 정보 가져오기
    @GetMapping("/product/productDetail/list")
    @ResponseBody
    public ResponseEntity<ProductDetailDto> prodDetailList(Integer prod_idx) {
        try {
            ProductDetailDto info = productDetailService.read(prod_idx);

            return new ResponseEntity<ProductDetailDto>(info, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<ProductDetailDto>(HttpStatus.BAD_REQUEST);
        }
    }

    private boolean loginCheck(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("idx") != null;
    }

}
