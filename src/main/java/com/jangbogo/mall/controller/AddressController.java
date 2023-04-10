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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
public class AddressController {

    @Autowired
    AddressService service;

    @GetMapping("/mypage/address") //배송지 관리 뷰
    public String myPageAddrView(HttpServletRequest req, Model m, HttpSession session) {
        m.addAttribute("mypageUrl", req.getRequestURI());

        int idx = (int) session.getAttribute("idx"); //세션 얻기

        try {
            List<Address> list = service.selAddrList(idx);
            m.addAttribute("addrList", list);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "user/addrList";
    }
}
