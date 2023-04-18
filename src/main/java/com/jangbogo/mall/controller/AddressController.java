package com.jangbogo.mall.controller;


import com.jangbogo.mall.domain.Address;
import com.jangbogo.mall.service.AddressService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/mypage")
public class AddressController {

    @Autowired
    AddressService service;

    // 배송지 페이지로 이동
    @GetMapping("/addresslist")
    public String product() {
        return "/dlvpn/dlvpnlist";
    }

    // 지정된 배송지 목록을 가져오는 메서드
    @GetMapping("/addresslists") // /addresslists GET
    public ResponseEntity<List<Address>> list(HttpSession session){
        List<Address> list = null;
        Integer user_idx = (Integer)session.getAttribute("idx");
        try {
            list = service.selAddrList(user_idx);
            return new ResponseEntity<List<Address>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<Address>>(HttpStatus.BAD_REQUEST);
        }
    }

    // 배송지 선택 상태를 수정하는 메서드
    @PatchMapping("/address/state/{idx}")   // /addresslists/1  PATCH
    public ResponseEntity<String> modify(@PathVariable Integer idx,HttpSession session) {
        int user_idx = (int) session.getAttribute("idx");

        try {
            service.resetStateCD(user_idx);
            service.AddrStateCD(idx);
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }


    @GetMapping("/address/updatePage") // 배송지 수정 창(오픈)
    public String myPageAddrOpen(Integer idx,HttpServletRequest req, Model m, HttpSession session) {

        try {
            Address address = service.selAddr(idx); // 가져온 일련번호로 배송지 정보를 가져온다
            m.addAttribute("address", address);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "/dlvpn/updatePage";
    }

    // 배송지 삭제(수정)상태 변경 //배송지 수정창-> 삭제
    @PatchMapping("/address/delete")   // /addresslistsdel/1  PATCH
    public ResponseEntity<String> myPageAddrDel(@RequestBody Address address,HttpSession session) {
        int user_idx = (int) session.getAttribute("idx");
        int state_cd = address.getState_cd();
        int idx = address.getIdx();
//        log.info("....");

        try {
            if (state_cd == 1) { // 선택상태인 녀석을 삭제하는경우
                service.deleteAddr(idx, user_idx);
                service.changeState(user_idx);
            } else {
                service.deleteAddr(idx, user_idx);
            }
//            if(service.deleteAddr(idx,user_idx)!=1) throw new Exception("Delete failed.");
            return new ResponseEntity<String>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    // 배송지 수정 변경 //배송지 수정창-> 수정
    @PatchMapping("/address/update")   // /addresslistsupd/1  PATCH
    public ResponseEntity<String> myPageAddrUpd(@RequestBody Address address,HttpSession session) {
            int user_idx = (int) session.getAttribute("idx");   // 세션에서 회원번호 회득
            address.setUser_idx(user_idx);
        try {
            if (address.getIs_default_yn().equals("true")) {
                service.resetDefault_N(user_idx);
                service.updateAddr(address);
            } else {
                service.updateAddr(address);
            }
            return new ResponseEntity<String>("DEL_OK", HttpStatus.OK);
//            return ResponseEntity.ok("DEL_OK");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }


/////유효성 검사 해야함 ! 번호 체크 !
//    @PostMapping ("/addressremove") //배송지 수정창-> 삭제
//    public String myPageAddrRemove(Address address,Integer idx,HttpServletRequest req, Model m, HttpSession session) {
////        m.addAttribute("mypageUrl", req.getRequestURI());
//        int user_idx = (int) session.getAttribute("idx"); //세션 얻기
//
//        // 회원번호랑, 배송지일련번호를 가져와서 삭제한다
//        try {
//            if(service.deleteAddr(idx,user_idx)!=1) throw new Exception("Delete failed.");
//        } catch(Exception e) {
//            e.printStackTrace();
//        }
//        return "redirect:/mypage/addresslist";
////        return "/dlvpn/dlvpnlistfinal";
//
//    }
////
//    @PostMapping ("/addressupdate") //배송지 수정창-> 수정
//    public String myPageAddrUpdate(Address address,HttpServletRequest req, Model m, HttpSession session) {
//
//
//
//        int user_idx = (int) session.getAttribute("idx");   // 세션에서 회원번호 회득
//        address.setUser_idx(user_idx);
//        try {
//            if (address.getIs_default_yn().equals("true")) {
//                service.resetDefault_N(user_idx);
//                service.updateAddr(address);
//            }else {
//                service.updateAddr(address);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return "redirect:/mypage/addresslist";
////        return "/dlvpn/dlvpnlistfinal";
//
//    }

    @GetMapping ("/address/insertPage") // 배송지 추가 팝업창 이동
    public String dlvpninsertpage(String addr,String zonecode,HttpServletRequest req, Model m, HttpSession session) {

        try {
            System.out.println("zonecode = " + zonecode);
            System.out.println("addr = " + addr);
            m.addAttribute("zonecode",zonecode);
            m.addAttribute("addr",addr);

        } catch(Exception e) {
            e.printStackTrace();
        }
        return "/dlvpn/insertPage";

    }

    @PostMapping ("/address/insert") // 배송지 추가
    public ResponseEntity<String> dlvpninsert(@RequestBody Address address,HttpServletRequest req, Model m, HttpSession session) {
        int user_idx = (int) session.getAttribute("idx");
        System.out.println("address = " + address);
        try {
            if (address.getIs_default_yn().equals("true")) {
                service.resetDefault_N(user_idx);
                service.resetStateCD(user_idx);
                address.setIs_default_yn("Y");
                address.setRcpr_nm("");
                address.setRcpr_mobl_no("");
                service.insertAddr(user_idx, address);
            } else {
                service.resetStateCD(user_idx);
                address.setIs_default_yn("N");
                address.setRcpr_nm("");
                address.setRcpr_mobl_no("");
                service.insertAddr(user_idx, address);
            }
            return new ResponseEntity<String>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }


    }



    //
//    @GetMapping("/addresslist") //배송지 조회
//    public String myPageAddrList(HttpServletRequest req, Model m, HttpSession session,HttpServletRequest request) {
//        m.addAttribute("mypageUrl", req.getRequestURI());
//
//        if(!loginCheck(request))
//            return "redirect:/user/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동
//
//        int user_idx = (int) session.getAttribute("idx"); //세션에서 회원번호 얻기
//
//        try {
//            List<Address> list = service.selAddrList(user_idx);
//            m.addAttribute("addrList", list);
//        } catch(Exception e) {
//            e.printStackTrace();
//        }
//        return "dlvpn/dlvpnlist";
//    }
//

//
//    @PostMapping ("/changestate") // 배송지 선택 상태 변경
//    public String chageState(Address address,HttpServletRequest req, Model m, HttpSession session) {
//
//        int user_idx = (int) session.getAttribute("idx");
//        int idx = address.getIdx();
//
//        try {
//            service.resetStateCD(user_idx);
//            service.AddrStateCD(idx);
//        } catch(Exception e) {
//            e.printStackTrace();
//        }
//        return "redirect:/mypage/addresslist";
//
//    }
//

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("idx")!=null;
//        return true;  // 일단 (하드코딩) true 박기
    }

}

