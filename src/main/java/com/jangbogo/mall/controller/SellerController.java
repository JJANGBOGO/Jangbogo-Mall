package com.jangbogo.mall.controller;


import com.jangbogo.mall.domain.*;
import com.jangbogo.mall.service.ProductService;
import com.jangbogo.mall.service.SellerService;
import com.jangbogo.mall.utils.RegEx;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Objects;

@Slf4j
@Controller
public class SellerController {

    @Autowired
    SellerService service;

    @Autowired
    ProductService productService;

    //로그인화면
    @RequestMapping("/seller/login")
    public String loginSellerView() {
        return "/seller/login";
    }

    //가입화면
    @GetMapping("/seller/register")
    public String regSellerView() {
        return "/seller/register";
    }

    //가입 처리
    @PostMapping("/seller/register")
    public String regSeller(Seller seller, RedirectAttributes rattr) {
        log.info("판매자 가입........" + seller);

        try {
            if (service.registerSeller(seller) != 1)
                throw new Exception("register failed");

            rattr.addFlashAttribute("msg", "REG_OK");
            return "redirect:/seller/login"; // 가입 성공 시 로그인 페이지로 이동
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/seller/register";
        }
    }

    //이메일 중복 체크
    @PostMapping("/seller/duplicate/email")
    @ResponseBody
    public ResponseEntity<String> chkDuplicateEmail(String email, String type) {
        try {
            String msg = (!service.isEmailDuplicated(email)) ? "OK" : "DUPLICATED";
            return ResponseEntity.ok().body(msg);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("EXCEPTION_ERR"); //test ok
        }
    }

    //브랜드명 중복 체크
    @PostMapping("/seller/duplicate/cpnm") //ok
    @ResponseBody
    public ResponseEntity<String> chkDuplicateNick(String cpnm) {
        try {
            String msg = (!service.isCpnmDuplicated(cpnm)) ? "OK" : "DUPLICATED";
            return ResponseEntity.ok().body(msg);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("EXCEPTION_ERR"); //test ok
        }
    }

    //마이셀러 브랜드조회 뷰
    @GetMapping("/seller/read/brnd")
    public String readBrandView(HttpServletRequest req, Model m, RedirectAttributes rattr) {
        m.addAttribute("mySellerUrl", req.getRequestURI()); //sidebar css

        try {
            Seller seller = service.getSellerByIdx(14); // TODO:: 추후 세션에서 받아오는 걸로 수정
            m.addAttribute("seller", seller);
            return "/seller/readBrnd";
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/";
        }
    }

    //브랜드수정화면
    @GetMapping("/seller/modify/brnd")
    public String modifyBrandView(HttpServletRequest req, Model m, RedirectAttributes rattr) {
        m.addAttribute("mySellerUrl", req.getRequestURI());

        try {
            // TODO:: 세션에서 idx 얻어서 판매자 정보 뿌리는걸로 추후 수정
            Seller seller = service.getSellerByIdx(14);
            m.addAttribute("seller", seller);
            return "/seller/modifyBrnd";
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/";
        }
    }

    //브랜드 수정
    @PostMapping("/seller/modify/brnd")
    public String modifyBrand(Seller seller, RedirectAttributes rattr) {
        log.info("brnd...." + seller);

        //TODO:: set idx, email from session => security이후 세션에서 받아오기로 수정
        seller.setIdx(14);
        seller.setEmail("seller100@naver.com");

        try {
            if (service.updateSellerBrnd(seller) != 1)
                throw new Exception("Modify failed");

            rattr.addFlashAttribute("msg", "MODIFY_BRND_OK");
            return "redirect:/seller/read/brnd";

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/seller/read/brnd";
        }
    }

    //판매자수정 인증 뷰
    @GetMapping("/seller/info")
    public String verifySeller(HttpServletRequest req, Model m, RedirectAttributes rattr) {
        m.addAttribute("mySellerUrl", req.getRequestURI());
        return "/seller/verify";
    }

    //판매자수정 뷰
    @GetMapping("/seller/modify")
    public String chgSellerView(HttpServletRequest req, HttpSession session, Model m, RedirectAttributes rattr) {
        m.addAttribute("mySellerUrl", req.getRequestURI());
        try {
            Integer idx = (Integer) session.getAttribute("idx");
            Seller seller = service.getSellerByIdx(idx);
            SellerDtl sellerDtl = service.getSellerDtl(idx);

            m.addAttribute("seller", seller);
            m.addAttribute("sellerDtl", sellerDtl);
            return "/seller/modifySeller";
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/seller/info";
        }
    }

    @PostMapping("/seller/modify")
    public String modifySeller(Seller seller, SellerDtl sellerDtl, HttpSession session, RedirectAttributes rattr) {
        String redirectUrl = "redirect:/seller/info";

        try {
            Integer idx = (Integer) session.getAttribute("idx");
            seller.setIdx(idx);
            seller.setEmail((String) session.getAttribute("email"));
            sellerDtl.setSeler_idx(idx);

            int result = service.updateSeller(seller, sellerDtl);
//            int result2 = service.updateSellerDtl(sellerDtl);

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return redirectUrl;
        }
        return redirectUrl;
    }

    //판매자탈퇴 뷰
    @GetMapping("/seller/withdraw")
    public String withdrawSellerView() {
        return "/seller/withdraw";
    }

    @PostMapping("/seller/withdraw")
    public String withdrawSeller(String pwd, RedirectAttributes rattr, HttpSession session) {
//        TODO:: 세션에서 얻어오기로 변경
        try {
//          TODO:: 구현해야 함
            int idx = (int) session.getAttribute("idx");
            String email = (String) session.getAttribute("email"); //이메일 얻기
            if (service.withdrawSeller(idx, email) != 1)
                throw new Exception("withdraw failed");

            rattr.addFlashAttribute("msg", "SELLER_NOT_FOUND"); //판매자 존재 X
            return "redirect:/seller/withdraw";

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "SELER_WITHDRAW_OK"); //탈퇴완료
            return "redirect:/seller/withdraw";
        }
    }

    //이메일 찾기
    @PostMapping("/seller/find/email")
    public String findSellerEmail(String cpnm, String pwd, Model m, RedirectAttributes rattr) {
        try {
            String email = service.findSellerEmail(cpnm, pwd);
            if (email == null) {
                rattr.addFlashAttribute("msg", "NOT_FOUND_ERR");
                return "redirect:/find/email";
            }
            rattr.addFlashAttribute("sellerEmail", email);
            return "redirect:/find/email/success?member=seller"; //성공

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/find/email";
        }
    }

    //비번 찾기
    @PostMapping("/seller/find/pwd")
    public String findSellerPwd(String cpnm, String email, RedirectAttributes rattr) {

        try {
            if (!service.isSellerPresent(cpnm, email)) {
                rattr.addFlashAttribute("msg", "NOT_FOUND_ERR");
                return "redirect:/find/pwd";
            }

            if (service.sendPwdEmail(cpnm, email) != 1)
                throw new Exception("send mail failed");

            rattr.addFlashAttribute("toEmail", email);
            return "redirect:/find/pwd/success?member=seller";

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/find/pwd";
        }
    }

    @GetMapping("/seller/list/product")
    public String listProductView(HttpServletRequest req, Model m, RedirectAttributes rattr) {
        m.addAttribute("mySellerUrl", req.getRequestURI());
        try {
            List<ProductDto> list = productService.getListBySeller(1);
            m.addAttribute("productList", list);
            return "/seller/productList";
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    //판매자 상품 등록 화면
    @GetMapping("/seller/register/product")
    public String regProductView() {
        return "/seller/registerProduct";
    }

    @PostMapping("/seller/register/product")
    public String regProduct(ProductDto product, ProductDetailDto dtl, RedirectAttributes rattr) {
        try {
            log.info("product...." + product);
            log.info("dtl...." + dtl);

            return "redirect:/seller/list/product";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/seller/register/product";
        }
    }

}
