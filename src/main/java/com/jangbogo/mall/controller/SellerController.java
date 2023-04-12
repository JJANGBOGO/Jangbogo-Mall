package com.jangbogo.mall.controller;


import com.jangbogo.mall.domain.Seller;
import com.jangbogo.mall.domain.User;
import com.jangbogo.mall.service.SellerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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

    @GetMapping("/seller/login")
    public String loginSellerView() {
        return "/seller/login";
    }

    //판매자가입 뷰
    @GetMapping("/seller/register")
    public String regSellerView() {
        return "/seller/register";
    }

    //판매자가입 처리
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

    //닉네임 중복 체크
    @PostMapping("/seller/duplicate/nickname")
    @ResponseBody
    public String chkDuplicateNick(String nick_nm, String type) {
        log.info("nick...." + nick_nm);
        String msg = "DUPLICATE";
        try {
//            User user = userService.chkDuplicateNick(nick_nm);
//            if (user == null) {
//                msg = "OK";
//            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }

    //마이셀러 브랜드조회 뷰
    @GetMapping("/seller/read/brnd")
    public String readBrndView(HttpServletRequest req, Model m) {
        m.addAttribute("mySellerUrl", req.getRequestURI());

        try {
            Seller seller = service.getSellerByIdx(14); //추후 세션에서 받아오는 걸로 수정
            m.addAttribute("seller", seller);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/seller/readBrnd";
    }

    //마이셀러 브랜드수정 뷰
    @GetMapping("/seller/modify/brnd")
    public String chgBrndView(HttpServletRequest req, Model m) {
        m.addAttribute("mySellerUrl", req.getRequestURI());
        return "/seller/modifyBrnd";
    }

    //판매자수정 인증 뷰
    @GetMapping("/seller/info")
    public String verifySeller(HttpServletRequest req, Model m) {
        m.addAttribute("mySellerUrl", req.getRequestURI());
        return "/seller/verify";
    }

    //판매자수정 뷰
    @GetMapping("/seller/modify")
    public String chgSellerView(HttpServletRequest req, Model m) {
        m.addAttribute("mySellerUrl", req.getRequestURI());
        try {
            Seller seller = service.getSellerByIdx(8);
            m.addAttribute("seller", seller);
            return "/seller/modifySeller";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/seller/info";
        }
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
