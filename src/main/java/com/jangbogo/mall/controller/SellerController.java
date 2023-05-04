package com.jangbogo.mall.controller;


import com.jangbogo.mall.domain.*;
import com.jangbogo.mall.service.ProductService;
import com.jangbogo.mall.service.SellerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Objects;

@Slf4j
@Controller
public class SellerController {

    @Autowired
    SellerService service;

//    @Autowired
//    ProductService productService;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    //로그인화면
    @RequestMapping("/seller/login") //꼭 requestMapping
    public String loginSellerView(HttpServletRequest req, Authentication authentication) {

        String uri = req.getHeader("Referer");
        if (authentication != null) return "redirect:/";

        if (uri != null && !(uri.contains("/seller/login") || uri.contains("/seller/login_check")))
            req.getSession().setAttribute("prevPage", uri);

        return "/seller/login";
    }

    //가입화면
    @GetMapping("/seller/register")
    public String regSellerView(Authentication auth) {
        if (auth != null) return "redirect:/";
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
    public String readBrandView(HttpSession session, HttpServletRequest req, Model m, RedirectAttributes rattr) {
        m.addAttribute("mySellerUrl", req.getRequestURI()); //sidebar css

        try {
            Integer idx = (Integer) session.getAttribute("idx");
            Seller seller = service.getSellerByIdx(idx);
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
    public String modifyBrandView(HttpSession session, HttpServletRequest req, Model m, RedirectAttributes rattr) {
        m.addAttribute("mySellerUrl", req.getRequestURI());

        try {
            Integer idx = (int) session.getAttribute("idx");
            Seller seller = service.getSellerByIdx(idx);
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
    public String modifyBrand(HttpSession session, Seller seller, RedirectAttributes rattr) {
        log.info("brnd...." + seller);

        Integer idx = (Integer) session.getAttribute("idx");
        String email = (String) session.getAttribute("email");
        seller.setIdx(idx);
        seller.setEmail(email);

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

    //판매자 수정 전 인증
    @PostMapping("/seller/info")
    public String verifySeller(String email, String pwd, RedirectAttributes rattr) {
        try {
            if (service.verifySeller(email, pwd)) return "redirect:/seller/modify";
            else { //회원 존재X
                rattr.addFlashAttribute("msg", "NOT_FOUND_ERR");
                return "redirect:/seller/info";
            }

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/seller/info";
        }
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

            if (service.updateSeller(seller, sellerDtl) != 1)
                throw new Exception("modify failed");

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return redirectUrl;
        }
        return redirectUrl;
    }

    //판매자탈퇴 뷰
    @GetMapping("/seller/withdraw")
    public String withdrawSellerView(Model m, HttpSession session, RedirectAttributes rattr) {
        try {
            Integer idx = (Integer) session.getAttribute("idx");
            Seller seller = service.getSellerByIdx(idx);
            m.addAttribute("seller", seller);
            return "/seller/withdraw";

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addAttribute("msg", "EXCEPTION_ERR");
            return "/";
        }
    }

    @PostMapping("/seller/withdraw")
    public String withdrawSeller(String pwd, HttpServletRequest req, HttpServletResponse resp, RedirectAttributes rattr, HttpSession session) {
        try {
            int idx = (int) session.getAttribute("idx");
            String email = (String) session.getAttribute("email"); //이메일 얻기

            Seller seller = service.getSellerByIdx(idx);
            if (!passwordEncoder.matches(pwd, seller.getPwd())) { //비밀번호 일치여부 확인
                rattr.addFlashAttribute("msg", "SELLER_NOT_FOUND"); //불일치
                return "redirect:/seller/withdraw";
            }

            if (service.withdrawSeller(idx, email) != 1)
                throw new Exception("withdraw failed");

            session.invalidate();
            deleteAuth(req, resp);
            rattr.addFlashAttribute("msg", "WITHDRAW_OK");
            return "redirect:/";

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "EXCEPTION_ERR");
            return "redirect:/seller/withdraw";
        }
    }

    //이메일 찾기
    @PostMapping("/seller/find/email")
    public String findSellerEmail(String cpnm, String pwd, RedirectAttributes rattr) {
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

    public void deleteAuth(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
    }

}
