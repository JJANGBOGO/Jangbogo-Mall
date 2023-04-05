package com.jangbogo.mall.controller;

import com.jangbogo.mall.dao.ProdInqryDao;
import com.jangbogo.mall.domain.PageHandler;
import com.jangbogo.mall.domain.ProdInqryDto;
import com.jangbogo.mall.domain.ProdInqryPageHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    ProdInqryDao prodInqryDao;

    @PostMapping("/list")
    public String inqryWrite() {

        return "productDetail";
    }

    @GetMapping("/list")
    public String list(Integer page, Integer pageSize, Model m) {

        if(page==null) page = 1;
        if(pageSize == null) pageSize = 10;

        try {
            int totalCnt = prodInqryDao.count();
            ProdInqryPageHandler prodInqryPageHandler = new ProdInqryPageHandler(totalCnt, page, pageSize);
            Map map = new HashMap();
            map.put("offset", (page-1)*pageSize);
            map.put("pageSize", pageSize);

            List<ProdInqryDto> prodInqryDto = prodInqryDao.selectPage(map);
            m.addAttribute("prodInqryDto", prodInqryDto);
            m.addAttribute("ph", prodInqryPageHandler);
        } catch (Exception e) {
            e.printStackTrace();
        }


//        if(page == null) page = 1;
//        if(pageSize == null) pageSize = 10;
//
//        try {
//            Map map = new HashMap();
//            map.put("offset", (page-1)*pageSize);
//            map.put("pageSize", pageSize);
//
//            List<ProdInqryDto> list = prodInqryService.getPage(map);
//            m.addAttribute("list", list);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        return "productDetail";
    }

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("id")!=null;
    }
}
