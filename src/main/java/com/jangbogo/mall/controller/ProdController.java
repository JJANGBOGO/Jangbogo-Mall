package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.*;
import com.jangbogo.mall.service.ProdInqryService;
import com.jangbogo.mall.service.ProdReviewService;
import com.jangbogo.mall.service.ProductDetailService;
import com.jangbogo.mall.service.WishlistService;
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
    @Autowired
    WishlistService wishlistService;

    // 상품후기
    @Autowired
    ProdReviewService prodReviewService;


    //페이지 이동
    @GetMapping("/product/{prod_idx}")
    public String product(@PathVariable Integer prod_idx, ProductDetailDto productDetailDto, HttpSession session, Model m, HttpServletRequest request) {

        Integer session_idx = (Integer)session.getAttribute("idx");
        try {
            String urlPath = request.getContextPath();
            ProductDetailDto list = productDetailService.read(prod_idx);
            String cate_idx = list.getCate_idx();
            String f_cate_idx = cate_idx.substring(0,2);  //'04'
            list.setF_cate_idx(f_cate_idx);
//배송방식 번호를 찾아서
            Integer dlvry_method = productDetailService.findDlvry(list.getF_cate_idx());
//배송방식 검색
            ProductDetailDto dlvryMethod = productDetailService.dlvryInfo(dlvry_method);

            ProductDetailDto findBrand = productDetailService.findBrand(prod_idx);
            m.addAttribute("urlPath", urlPath);
            m.addAttribute("prod_idx", prod_idx);
            m.addAttribute("session_idx", session_idx);
            m.addAttribute("list", list);
            m.addAttribute("dlvryMethod", dlvryMethod);
            m.addAttribute("findBrand", findBrand);

            List<ProductFileDto> fileList = productDetailService.findProdFile(prod_idx);
            m.addAttribute("fileList", fileList);


            if(productDetailService.checkWishlist(prod_idx, session_idx) == 0) {
                m.addAttribute("msg","no");
            } else {
                m.addAttribute("msg","ok");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "product/product";
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
//        session객체가 안 찾아지고 있습니다.
        Integer user_idx = (Integer)session.getAttribute("idx");
        System.out.println("user_idx=???"+user_idx); //null


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
    @PostMapping("/wishlist")
    @ResponseBody
    public ResponseEntity<String> insertWishList(Integer prod_idx, HttpSession session) {
        Integer user_idx = (Integer)session.getAttribute("idx");
        System.out.println("prod_idx="+prod_idx);
        String msg = "";
        try {
            if(productDetailService.checkWishlist(prod_idx, user_idx) == 0) {
                productDetailService.insertWishlist(prod_idx, user_idx);
//                return new ResponseEntity<String>("INSERT_OK", HttpStatus.OK);
                msg = "INSERT_OK";
                return ResponseEntity.ok().body(msg);
            } else {
                productDetailService.deleteWishList(prod_idx, user_idx);
//                return new ResponseEntity<String>("DELETE_OK", HttpStatus.OK);
                msg = "DELETE_OK";
                return ResponseEntity.ok().body(msg);
            }
        } catch (Exception e) {
            e.printStackTrace();
//            return new ResponseEntity<String>("INSERT_ERR", HttpStatus.BAD_REQUEST);
            return ResponseEntity.status(400).body("INSERT_ERR");
        }
    }

    @PostMapping("/cart")
    @ResponseBody
    public ResponseEntity<String> insertCart(Integer prod_idx, Integer prod_cnt, HttpSession session) {
        Integer user_idx = (Integer)session.getAttribute("idx");
//        System.out.println("prod_idx="+prod_idx);
        try {
            String msg = "";

            if(wishlistService.checkCart(prod_idx, user_idx)==0) {
                wishlistService.insertCart(prod_idx, user_idx, prod_cnt);
//                return new ResponseEntity<String>("INSERT_OK", HttpStatus.OK);
                msg = "INSERT_OK";
                return ResponseEntity.ok().body(msg);
            } else {
                wishlistService.updateCartCnt(prod_idx, user_idx, prod_cnt);
//                return new ResponseEntity<String>("UPDATE_OK", HttpStatus.OK);
                msg = "UPDATE_OK";
                return ResponseEntity.ok().body(msg);
            }
        } catch (Exception e) {
            e.printStackTrace();
//            return new ResponseEntity<String>("INSERT_ERR", HttpStatus.BAD_REQUEST);
            return ResponseEntity.status(400).body("INSERT_ERR");
        }
    }


    //상세 이미지들 가져오기
    @GetMapping("/product/productDetail/description")
    @ResponseBody
    public ResponseEntity<List<ProductFileDto>> showDescriptionList(Integer prod_idx) {
        List<ProductFileDto> fileList = null;
        try {
            fileList = productDetailService.findProdFile(prod_idx);

            return new ResponseEntity<List<ProductFileDto>>(fileList, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

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


//  ------------------  상품후기  ---------------------

//    // 상품후기 처음에 필요한 것  1.상품번호(하드코딩) 2.회원번호(수정)
//    @GetMapping("/product/review")
//    public String productReviewPage(HttpSession session, Model m,Integer prod_idx){ // 상품 후기는 세션에서 그 회원의 회원번호를 가진 사람만 후기를 수정할 수 있어야 한다
//        Integer user_idx = (int)session.getAttribute("idx"); // 세션에서 회원번호를 가져온다
//        List<ProdReviewDto> list = null;
//
////        m.addAttribute(prod_idx); // 현재 하드코딩 나중에 넣어주기
//
//        return "productReview";
//    }

    // 상품후기 목록을 가져오는 메서드 + 페이징
    @GetMapping("/product/review/list") // /product/review/list?prod_idx=1  GET
    public ResponseEntity<Map> list(Integer page,Integer pageSize, Integer prod_idx, HttpSession session, SearchCondition sc){ // 상품번호, 회원번호 보유중
        List<ProdReviewDto> list = null;

        Integer user_idx = (Integer)session.getAttribute("idx");        // 세션에서 회원번호를 가져온다
        try {
            int totalCnt = prodReviewService.getCount(prod_idx);              // 해당 상품의 상품후기 개수
            PageHandler pageHandler = new PageHandler(totalCnt,sc);

            if(page==null || page.equals("")) page=1;
            if(pageSize==null || page.equals("")) pageSize=10;

            Map map = new HashMap();
            map.put("offset", (page-1) * pageSize);
            map.put("pageSize",pageSize);
            map.put("prod_idx",prod_idx);
            list = prodReviewService.selectPage(map);                         // 상품후기 목록을 가져온다 10개씩

            Map<String, Object> listsMap = new HashMap<>();                   // Map(listsMap) 생성 // 여러개의 값을 보내기 위해서
            listsMap.put("totalCnt",totalCnt);                                // Map 에 상품후기 개수(totalCnt) 추가
            listsMap.put("pageHandler",pageHandler);                          // Map 에 페이징(pageHandler) 추가
            listsMap.put("list",list);                                        // Map 에 상품후기 목록 10개(list) 추가

//            list = prodReviewService.getList(prod_idx);                       // 상품번호를 가지고 상품후기 목록을 가져온다

            return new ResponseEntity<Map>(listsMap, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<Map>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }


    // 상품후기 내용을 수정하는 메서드
    @PatchMapping("/product/review/{idx}") // /product/review/1  PATCH
    public ResponseEntity<String> update(@PathVariable Integer idx, @RequestBody ProdReviewDto prodReviewDto,HttpSession session){
//        System.out.println("prodReviewDto = " + prodReviewDto);

        Integer user_idx = (int)session.getAttribute("idx"); // 세션에서 회원번호를 가져온다
        String opub_yn = prodReviewDto.getOpub_yn();  // 공개여부 변수 선언

        prodReviewDto.setUser_idx(user_idx);          // prodReviewDto 에 회원번호를 담는다
        prodReviewDto.setIdx(idx);                    // prodReviewDto 에 상품 후기 일련번호를 담는다
        try {
            if(opub_yn.equals("true")){               // 공개여부 확인(후기 비공개하기 == Yes or No)
                prodReviewDto.setOpub_yn("N");        // 공개여부 N(no)
            }else {
                prodReviewDto.setOpub_yn("Y");        // 공개여부 Y(yes)
            }
            prodReviewService.update(prodReviewDto); // 수정할 상품 후기 정보를 담아준다( 수정내용, 공개여부..)
            return new ResponseEntity<String>("Update_OK",HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("Update_ERR",HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    private boolean loginCheck(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("idx") != null;
    }

}
