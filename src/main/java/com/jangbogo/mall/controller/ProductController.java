package com.jangbogo.mall.controller;

import com.jangbogo.mall.dao.ProdInqryDao;
import com.jangbogo.mall.domain.ProdInqryDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

    @GetMapping("/list")
    public String list(Model m) {

        try {
            List<ProdInqryDto> prodInqryDto = prodInqryDao.selectAll();
            m.addAttribute("prodInqryDto", prodInqryDto);
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

}
