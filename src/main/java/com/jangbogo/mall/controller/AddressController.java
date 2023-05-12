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
    @GetMapping("/address/list")

    public String product(HttpServletRequest req,Model m) {
        m.addAttribute("mypageUrl", req.getRequestURI());

        return "/dlvpn/dlvpnlist";
    }

    // 회원의 배송지 목록을 가져오는 메서드
    @GetMapping("/address/lists") //  /address/lists GET
    public ResponseEntity<List<Address>> list(HttpSession session){
        List<Address> list = null;
        Integer user_idx = (Integer)session.getAttribute("idx"); // 세션에서 회원번호 가져오기
        try {
            list = service.selAddrList(user_idx);
            return new ResponseEntity<List<Address>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<Address>>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 배송지 상태를 변경하는 메서드      ex).. [(사용), 미사용, 삭제]
    @PatchMapping("/address/state/{idx}")   // /addresslists/1  PATCH
    public ResponseEntity<String> modify(@PathVariable Integer idx,HttpSession session) {
        int user_idx = (int) session.getAttribute("idx"); // 세션에서 회원번호 가져오기

        try {
            service.resetStateCD(user_idx);                     // 이 회원의 모든 배송지 상태롤 (미사용)로 초기화
            service.AddrStateCD(idx);                           // 이 회원의 배송지 상태를 (사용)로 변경
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 배송지 수정 팝업창으로 이동하는 메서드
    @GetMapping("/address/updatePage")
    public String myPageAddrOpen(Integer idx,HttpServletRequest req, Model m, HttpSession session) {

        try {
            Address address = service.selAddr(idx);             // 해당 일련번호의 배송지 정보를 가져온다
            m.addAttribute("address", address);     // Model 에 배송지 정보를 넣어준다
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "/dlvpn/updatePage";
    }

    // 배송지 상태를 변경하는 메서드      ex).. [사용, 미사용, (삭제)]
    @PatchMapping("/address/delete")   // /address/delete  PATCH
    public ResponseEntity<String> myPageAddrDel(@RequestBody Address address,HttpSession session) {
        int user_idx = (int) session.getAttribute("idx");   // 세션에서 회원번호를 가져온다
        int state_cd = address.getState_cd();                     // address 에서 배송지 상태를 가져온다
        int idx = address.getIdx();                               // address 에서 배송지 번호를 가져온다
//        log.info("....");
        try {

            if(service.checkIS_DEFAULT_YN(idx).equals("Y")){     // 기본 배송지는 삭제 불가능 처리
                return new ResponseEntity("DEL_ERR", HttpStatus.BAD_REQUEST);
            }
            service.deleteAddr(idx, user_idx);                    // 배송지의 상태를(삭제)로 변경한다
            if (state_cd == 1) {                                  // 삭제할 배송지의 상태가(사용)일 경우
                service.changeState(user_idx);                    // 기본 배송여부가('Y')인 배송지의 상태를(사용)으로 변경한다
            }
//            if(service.deleteAddr(idx,user_idx)!=1) throw new Exception("Delete failed.");
            return new ResponseEntity<String>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    // 배송지 정보를 변경하는 메서드 (수정)
    @PatchMapping("/address/update")   // /addresslistsupd/1  PATCH
    public ResponseEntity<String> myPageAddrUpd(@RequestBody Address address,HttpSession session) {
            int user_idx = (int) session.getAttribute("idx");   // 세션에서 회원번호 회득
            address.setUser_idx(user_idx);                            // 회원번호를 address(Dto)에 넣어준다
        try {
            if (address.getIs_default_yn().equals("true")) {          // 만약 기본 배송지 상태가('true')이면
                service.resetDefault_N(user_idx);                     // 모든 기본 배송지 상태를('false')로 변경한다
            }
                service.updateAddr(address);                          // 현재 배송지의 정보를 변경한다
            return new ResponseEntity<String>("UPDATE_OK", HttpStatus.OK);
//            return ResponseEntity.ok("DEL_OK");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }


    // 배송지 추가 팝업창으로 이동하는 메서드
    @GetMapping ("/address/insertPage") // 배송지 추가 팝업창 이동
    public String dlvpninsertpage(String addr,String zonecode,HttpServletRequest req, Model m, HttpSession session) {

        try {
            m.addAttribute("zonecode",zonecode);    // model 에 우편번호를 넣어준다
            m.addAttribute("addr",addr);            // model 에 기본주소를 넣어준다
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "/dlvpn/insertPage";                              // 추가 팝업창으로 이동
    }

    // 배송지 추가하는 메서드
    @PostMapping ("/address/insert") // 배송지 추가
    public ResponseEntity<String> dlvpninsert(@RequestBody Address address,HttpServletRequest req, Model m, HttpSession session) {
        int user_idx = (int) session.getAttribute("idx");
        address.setRcpr_nm("");
        address.setRcpr_mobl_no("");
//        System.out.println("address = " + address);

        try {
            // 처음 배송지 추가하면 무조건 기본 배송지로 설정한다
            if(service.checkIS_FIRST_YN(user_idx)==0){
                service.insertAddrDefault(user_idx,address);
                return new ResponseEntity<String>("INSERT_OK", HttpStatus.OK);
            }

            if (address.getIs_default_yn().equals("true")) {  // 기본 배송치 설정으로 배송지를 추가했을 때
                service.resetDefault_N(user_idx);             // 현재(DB) 기본 배송지 상태가 Y인 배송지의 기본 배송지 상태를 N(해제) 초기화
                address.setIs_default_yn("Y");                // 기본 배송지 설정("Y")

            } else {                                          // 기본 배송치 설정으로 하지 않고 배송지를 추가했을 때
                address.setIs_default_yn("N");                // 기본 배송지 설정("N")
            }
            service.resetStateCD(user_idx);                   // 배송지 선택 상태가(사용)인 배송지의 배송지상태를 (미사용)으로 초기회
            service.insertAddr(user_idx, address);            // 선택 상태로 배송지를 추가한다
            return new ResponseEntity<String>("INSERT_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }


    }


    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("idx")!=null;
//        return true;  // 일단 (하드코딩) true 박기
    }

}

