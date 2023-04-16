package com.jangbogo.mall.controller;


import com.jangbogo.mall.domain.Address;
import com.jangbogo.mall.domain.User;
import com.jangbogo.mall.service.AddressService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class AddressController {

    @Autowired
    AddressService service;

    @GetMapping("/addresslist") //배송지 조회
    public String myPageAddrList(HttpServletRequest req, Model m, HttpSession session,HttpServletRequest request) {
        m.addAttribute("mypageUrl", req.getRequestURI());

        if(!loginCheck(request))
            return "redirect:/user/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동

        int user_idx = (int) session.getAttribute("idx"); //세션에서 회원번호 얻기

        try {
            List<Address> list = service.selAddrList(user_idx);
            m.addAttribute("addrList", list);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "dlvpn/dlvpnlist";
    }

    @GetMapping("/addressopen") // 배송지 수정 창(오픈)
    public String myPageAddrOpen(Integer idx,HttpServletRequest req, Model m, HttpSession session) {
//        m.addAttribute("mypageUrl", req.getRequestURI());

        try {
            Address address = service.selAddr(idx); // 가져온 일련번호로 배송지 정보를 가져온다
            m.addAttribute("address", address);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "dlvpn/dlvpnopen";
    }
///유효성 검사 해야함 ! 번호 체크 !
    @PostMapping ("/addressremove") //배송지 수정창-> 삭제
    public String myPageAddrRemove(Address address,Integer idx,HttpServletRequest req, Model m, HttpSession session) {
//        m.addAttribute("mypageUrl", req.getRequestURI());
        int user_idx = (int) session.getAttribute("idx"); //세션 얻기

        // 회원번호랑, 배송지일련번호를 가져와서 삭제한다
        try {
            if(service.deleteAddr(idx,user_idx)!=1) throw new Exception("Delete failed.");
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:/mypage/addresslist";

    }

    @PostMapping ("/addressupdate") //배송지 수정창-> 수정
    public String myPageAddrUpdate(Address address,HttpServletRequest req, Model m, HttpSession session) {



        int user_idx = (int) session.getAttribute("idx");   // 세션에서 회원번호 회득
        address.setUser_idx(user_idx);
        try {
            if (address.getIs_default_yn().equals("true")) {
                service.resetDefault_N(user_idx);
                service.updateAddr(address);
            }else {
                service.updateAddr(address);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/mypage/addresslist";

    }

    @PostMapping ("/changestate") // 배송지 선택 상태 변경
    public String chageState(Address address,HttpServletRequest req, Model m, HttpSession session) {

        int user_idx = (int) session.getAttribute("idx");
        int idx = address.getIdx();

        try {
            service.resetStateCD(user_idx);
            service.AddrStateCD(idx);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:/mypage/addresslist";

    }

    @GetMapping ("/dlvpninsert") // 배송지 선택 상태 변경
    public String dlvpninsert(Address address,HttpServletRequest req, Model m, HttpSession session) {

//        int user_idx = (int) session.getAttribute("idx");
//        int idx = address.getIdx();
//
//        try {
//            service.resetStateCD(user_idx);
//            service.AddrStateCD(idx);
//        } catch(Exception e) {
//            e.printStackTrace();
//        }
        return "/dlvpn/dlvpninsert";

    }

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("idx")!=null;
//        return true;  // 일단 (하드코딩) true 박기
    }

}

