package com.jangbogo.mall.controller;


import com.jangbogo.mall.domain.Seller;
import com.jangbogo.mall.domain.SellerDtl;
import com.jangbogo.mall.domain.User;
import com.jangbogo.mall.service.SellerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class SellerController {

    @Autowired
    SellerService service;

    //로그인화면
    @GetMapping("/seller/login")
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
    public String regSeller(Seller seller, Model m) {
        log.info("판매자 가입........" + seller);
        return "seller/register";
    }

    //이메일 중복 체크
    @PostMapping("/seller/duplicate/email")
    @ResponseBody
    public String chkDuplicateEmail(String email, String type) {
        log.info("email...." + email);
        String msg = "DUPLICATE";
        try {
//            User user = userService.getUserByEmail(email);
//            if (user == null) {
//                msg = "OK";
//            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
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
    public String verifySeller(HttpServletRequest req, Model m) {
        m.addAttribute("mySellerUrl", req.getRequestURI());
        return "/seller/verify";
    }

    //판매자수정 뷰
    @GetMapping("/seller/modify")
    public String chgSellerView(HttpServletRequest req, Model m, RedirectAttributes rattr) {
        m.addAttribute("mySellerUrl", req.getRequestURI());
        try {
            // TODO:: 세션에서 idx 받아오기
            Seller seller = service.getSellerByIdx(14);
            SellerDtl sellerDtl = service.getSellerDtl(14);

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
    public String modifySeller (Seller seller, SellerDtl sellerDtl, HttpServletRequest req, Model m){
        return "redirect:/seller/info";
    }

    //판매자탈퇴 뷰
    @GetMapping("/seller/withdraw")
    public String withdrawSellerView() {
        return "/seller/withdraw";
    }

    @PostMapping("/seller/withdraw")
    public String withdrawSeller(String pwd, RedirectAttributes rattr, HttpSession session) {
        int idx = (int) session.getAttribute("idx");
        String email = (String) session.getAttribute("email"); //이메일 얻기
        try {
//          TODO:: 구현해야 함
            rattr.addFlashAttribute("msg", "SELLER_NOT_FOUND"); //판매자 존재 X
            return "redirect:/";

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "SELER_WITHDRAW_OK"); //탈퇴완료
            return "redirect:/";
        }
    }
}
