package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.Address;
import com.jangbogo.mall.domain.CartDto;
import com.jangbogo.mall.domain.OrderDto;
import com.jangbogo.mall.domain.User;
import com.jangbogo.mall.service.AddressService;
import com.jangbogo.mall.service.CartService;
import com.jangbogo.mall.service.OrderService;
import com.jangbogo.mall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {
    // CartService 자동 주입
    @Autowired
    OrderService orderService;

    @Autowired
    CartService cartService;

    @Autowired
    UserService userService;

    @Autowired
    AddressService addressService;


    // 메서드명 : getItemList
    // 기   능 : 주문상품 목록을 불러오는 ajax요청을 처리한다.
    // 반환타입 : ResponseEntity<List<CartDto>> - list값과 상태코드를 함께 반환하기 위한 클래스
    // 매개변수 : Integer user_idx
    // 요청URL : /order/checkout/list?user_idx=1234 GET
    @GetMapping("/order/checkout/item-list")
    @ResponseBody
    public ResponseEntity<List<CartDto>> getItemList(Integer user_idx) {
        List<CartDto> list = null;                                                                                      // 변수명 : list - 저장값 : CartDto 저장소 List
        try {
            list = cartService.getList(user_idx);                                                                       // cartService의 getList메서드에 인자로 회원번호를 지정하여 호출, 반환값을 list에 저장
            return new ResponseEntity<List<CartDto>>(list, HttpStatus.OK);                                              // 성공 시, list와 OK상태코드를 반환 - 상태코드 : 200
        } catch (Exception e) {                                                                                         // 에러 발생 시
            e.printStackTrace();                                                                                        // 1) 에러 내용을 로그에 출력
            return new ResponseEntity<List<CartDto>>(list, HttpStatus.BAD_REQUEST);                                     // 2) list값과 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
        }
    }

    // 메서드명 : getOrdererInfo
    // 기   능 : 주문자 정보 불러오기
    // 반환타입 : ResponseEntity<Map> - list값과 상태코드를 함께 반환하기 위한 클래스
    // 요청URL : order/checkout/orderer?user_idx=1234 GET
    @GetMapping("/order/checkout/orderer")
    @ResponseBody
    public ResponseEntity<Map> getOrderInfo(HttpSession session) {
        Integer idx = (Integer)(session.getAttribute("idx"));                                                     // 변수명 : ordererInfo - 저장값 : 세션에 저장된 회원번호(idx)
        User user = null;                                                                                               // 변수명 : user - 저장값 : userDto
        String mpno = "";                                                                                               // 변수명 : mpno - 저장값 : 휴대폰번호
        String nick_nm = "";                                                                                            // 변수명 : nick_nm - 저장값 : 닉네임
        String email = "";                                                                                              // 변수명 : email - 저장값 : 이메일
        Map map = new HashMap();                                                                                        // 변수명 : map - 저장값 : 주문자 정보를 K/V로 저장할 저장소
        try {
            user = userService.selectUser(idx);                                                                         // 회원의 UserDto 저장
            mpno = user.getMpno();                                                                                      // 회원의 '휴대폰번호' 저장
            nick_nm = user.getNick_nm();                                                                                // 회원의 '닉네임' 저장
            email = user.getEmail();                                                                                    // 회원의 '이메일' 저장
            map.put("nick_nm", nick_nm);                                                                                // 회원의 '휴대폰번호' map에 K/V로 저장
            map.put("email", email);                                                                                    // 회원의 '닉네임' map에 K/V로 저장
            map.put("mpno", mpno);                                                                                      // 회원의 '이메일' map에 K/V로 저장
            return new ResponseEntity<Map>(map, HttpStatus.OK);                                                         // 성공 시, list와 OK상태코드를 반환 - 상태코드 : 200
        } catch (Exception e) {                                                                                         // 에러 발생 시,
            e.printStackTrace();                                                                                        // 1) 에러 내용을 로그에 출력
            return new ResponseEntity<Map>(map, HttpStatus.BAD_REQUEST);                                                // 2) list값과 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
        }
    }

    // 메서드명 : getDeliveryInfo
    // 기   능 : 배송 정보 불러오기
    // 반환타입 : ResponseEntity<User> - user값과 상태코드를 함께 반환하기 위한 클래스
    // 매개변수 : HttpSession session
    // 요청URL : order/checkout/delivery?user_idx=1234 GET
    @GetMapping("/order/checkout/delivery")
    @ResponseBody
    public ResponseEntity<Address> getDeliveryInfo(HttpSession session) {
        Integer user_idx = (Integer)(session.getAttribute("idx"));                                                // 변수명 : user_idx - 저장값 : 세션에 저장된 회원번호(idx)         // 변수명 : list - 저장값 : List<CartDto>
        Address address = null;
        try {
            address =  addressService.selAddrSelected(user_idx);
            return new ResponseEntity<Address>(address, HttpStatus.OK);                                                 // 성공 시, list와 OK상태코드를 반환 - 상태코드 : 200
        } catch (Exception e) {                                                                                         // 에러 발생 시,
            e.printStackTrace();                                                                                        // 1) 에러 내용을 로그에 출력
            return new ResponseEntity<Address>(address, HttpStatus.OK);                                                 // 2) user값과 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
        }
    }

    // 메서드명 : goToRecipientDetails
    // 기   능 : 배송 정보 수정 페이지로 이동
    // 매개변수 : HttpSession session
    // 반환타입 : String
    // 요청URL : /order/checkout/recipient-details GET
    @GetMapping("/order/checkout/recipient-details")
    public String goToRecipientDetails() {
        return "/order/recipientDetails";
    }

    // 메서드명 : handleOrderSucceㅁss
    // 기   능 : 주문완료 처리 메서드
    // 반환타입 : String
    // 요청URL : /order/checkout/success?orderNo=2303023110171
    @GetMapping("/order/checkout/success")
    public String handleOrderSuccess() {
        return "/order/orderSuccess";
    }


    // 메서드명 : getPaymentMethodList
    // 기   능 : 결제수단 목록 불러오기
    // 반환타입 : ResponseEntity<List<String>> - list값과 상태코드를 함께 반환하기 위한 클래스
    // 요청URL : order/checkout/payment?user_idx=1234 GET
    @GetMapping("/order/checkout/payment")
    @ResponseBody
    public ResponseEntity<List<String>> getPaymentMethodList() {
        List<String> list = new ArrayList();
        try {
            list.add("카카오페이");
            return new ResponseEntity<List<String>>(list, HttpStatus.OK);                                               // 성공 시, list와 OK상태코드를 반환 - 상태코드 : 200
        } catch(Exception e) {                                                                                          // 에러 발생 시,
            e.printStackTrace();                                                                                        // 1) 에러 내용을 로그에 출력
            return new ResponseEntity<List<String>>(list, HttpStatus.BAD_REQUEST);                                      // 2) list값과 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
        }
    }

    // 메서드명 : loginCheck
    // 기   능 : 로그인 상태 여부 확인
    // 매개변수 : HttpSession session
    // 반환타입 : boolean
    private static boolean loginCheck(HttpSession session) {
        return session.getAttribute("idx") != null;                                                               // session에 저장된 idx값이 null이 아니면 true 반환
    }
}
