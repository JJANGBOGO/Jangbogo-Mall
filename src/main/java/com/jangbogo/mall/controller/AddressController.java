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

    @GetMapping("/addresslist") //배송지 관리 뷰
    public String myPageAddrList(HttpServletRequest req, Model m, HttpSession session) {
        m.addAttribute("mypageUrl", req.getRequestURI());

//        int idx = (int) session.getAttribute("idx"); //세션 얻기

        try {
            List<Address> list = service.selAddrList(1);
            m.addAttribute("addrList", list);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "dlvpn/dlvpnlist";
    }

    @GetMapping("/addressupdate") //배송지 수정 팝업 창 뷰
    public String myPageAddrUpdate(Integer idx,HttpServletRequest req, Model m, HttpSession session) {
//        m.addAttribute("mypageUrl", req.getRequestURI());

//        int idx = (int) session.getAttribute("idx"); //세션 얻기
        System.out.println("idx2 = " + idx); // 배송지일련번호를 가져온다 // mapper에서 배송지 테이블에 배송지 일련번호를 조회한다

        try {
            Address address = service.selAddr(idx); // 가져온 일련번호로 배송지 정보를 가져온다

            m.addAttribute("address", address);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "dlvpn/dlvpnupdate";
    }

    @GetMapping ("/addressremove") //배송지 수정 삭제후 새로고침 // 사실상 post방식으로 해줘야한다(어떻게 팝업창 닫고 부모창을 이 경로로 가게해주나 (post)방식으로
    public String myPageAddrRemove(Address address,Integer idx,HttpServletRequest req, Model m, HttpSession session) {
//        m.addAttribute("mypageUrl", req.getRequestURI());
//        int idx = (int) session.getAttribute("idx"); //세션 얻기

        // 1. 일단 로그인 체크부터 하자
        // 2. 그리고 세션에서 정보를 가저온 뒤에 회원번호 회득


        // 3. 회원번호를 가져오고 Dto에 (setter) 넣어준다
        // 회원번호랑, 배송지일련번호를 가져와서 삭제한다
        System.out.println("idx33 = " + idx); // 배송지일련번호를 가져온다 // mapper에서 배송지 테이블에 배송지 일련번호를 조회한다

        try {
            if(service.deleteAddr(idx,1)!=1) throw new Exception("Delete failed.");
        } catch(Exception e) {
            e.printStackTrace();
        }
        System.out.println("ㅎ2ㅎ2ㅎ = ");
//        return "redirect:/";
        return "redirect:/mypage/addresslist";

    }
}


//1. 컨트롤러
// - 1. 세션에서 이메일 가저온뒤에 넣어주면 그 이메일을 가진 회원번호 알아낸다(회원번호 얻어오기) 하드코딩
// - 2. 그 회원의 배송지 목록 가져오기 - List<Address> list = service.selAddrList(회원번호)
// - 3. 그 회원의 배송지목록을 모델에 넣기 - m.addAttribute("addList", list);
// - 4. retrun "dlvpn";

