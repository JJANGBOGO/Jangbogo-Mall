package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.CartDto;
import com.jangbogo.mall.domain.OrderDto;
import com.jangbogo.mall.domain.User;
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

    // 메서드명 : getItemList
    // 기   능 : 주문상품 목록을 불러오는 ajax요청을 처리한다.
    // 반환타입 : ResponseEntity<List<CartDto>>
    // 매개변수 : Integer user_idx
    // 요청URL : /order/checkout/list?user_idx=1234 GET
    @GetMapping("/order/checkout/item-list")
    @ResponseBody
    public ResponseEntity<List<CartDto>> getItemList(Integer user_idx) {
        // 변수명 : list
        // 저장값 : CartDto 저장소 List
        List<CartDto> list = null;
        try {
            // cartService의 getList메서드에 인자로 회원번호를 지정하여 호출, 반환값을 list에 저장
            list = cartService.getList(user_idx);
            // ResponseEntity<List<CartDto> list값과 상태코드를 함께 반환하기 위한 클래스
            // 성공 시, list와 OK상태코드를 반환 - 상태코드 : 200
            return new ResponseEntity<List<CartDto>>(list, HttpStatus.OK);
        } catch (Exception e) {
            // 에러 발생 시, 에러 내용을 로그에 출력
            e.printStackTrace();
            // 에러 발생 시, list값과 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
            return new ResponseEntity<List<CartDto>>(list, HttpStatus.BAD_REQUEST);
        }
    }

    // 메서드명 : getOrdererInfo
    // 기   능 : 주문자 정보 불러오기
    // 반환타입 : ResponseEntity<Map>
    // 요청URL : order/checkout/orderer?user_idx=1234 GET
    @GetMapping("/order/checkout/orderer")
    @ResponseBody
    public ResponseEntity<Map> getOrderInfo(HttpSession session) {
        // 변수명 : ordererInfo
        // 저장값 : 세션에 저장된 회원번호(idx)
        Integer idx = (Integer)(session.getAttribute("idx"));

        User user = null;
        String mpno = "";
        String nick_nm = "";
        String email = "";

        Map map = new HashMap();
        try {
            // cartService의 getList메서드에 인자로 회원번호를 지정하여 호출, 반환값을 list에 저장
//            list = cartService.getList(user_idx);
//            ordererInfo = "{ username : 정지우, ph : 01084354496, email : djdu4496@gmail.com}";
            user = userService.selectUser(idx);
            mpno = user.getMpno();
            nick_nm = user.getNick_nm();
            email = user.getEmail();
            map.put("nick_nm", nick_nm);
            map.put("email", email);
            map.put("mpno", mpno);
            // ResponseEntity<List<CartDto> list값과 상태코드를 함께 반환하기 위한 클래스
            // 성공 시, list와 OK상태코드를 반환 - 상태코드 : 200
            return new ResponseEntity<Map>(map, HttpStatus.OK);
        } catch (Exception e) {
            // 에러 발생 시, 에러 내용을 로그에 출력
            e.printStackTrace();
            // 에러 발생 시, list값과 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
            return new ResponseEntity<Map>(map, HttpStatus.BAD_REQUEST);
        }
    }

    // 메서드명 : getDeliveryInfo
    // 기   능 : 배송 정보 불러오기
    // 반환타입 : ResponseEntity<User>
    // 매개변수 : HttpSession session
    // 요청URL : order/checkout/delivery?user_idx=1234 GET
    @GetMapping("/order/checkout/delivery")
    @ResponseBody
    public ResponseEntity<User> getDeliveryInfo(HttpSession session) {
        Integer idx = (Integer)(session.getAttribute("idx"));

        User user = null;
        try {
            user = userService.selectUser(idx);
            // ResponseEntity<User> list값과 상태코드를 함께 반환하기 위한 클래스
            // 성공 시, list와 OK상태코드를 반환 - 상태코드 : 200
            return new ResponseEntity<User>(user, HttpStatus.OK);
        } catch (Exception e) {
            // 에러 발생 시, 에러 내용을 로그에 출력
            e.printStackTrace();
            // 에러 발생 시, list값과 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
            return new ResponseEntity<User>(user, HttpStatus.BAD_REQUEST);
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

    // 메서드명 : handleOrderSuccess
    // 기   능 : 주문완료 처리 메서드
    // 반환타입 : String
    // 요청URL : /order/checkout/success?orderNo=2303023110171
    @GetMapping("/order/checkout/success")
    public String handleOrderSuccess() {
        return "/order/orderSuccess";
    }

    // 메서드명 : getCouponList
    // 기   능 : 쿠폰 목록 불러오기
    // 반환타입 :
    // 요청URL : order/checkout/coupons?user_idx=1234 GET
    @GetMapping("/order/checkout/coupons")
    @ResponseBody
    public ResponseEntity<List<String>> getCouponList() {
        List<String> list = new ArrayList();
        try {
            list.add("첫주문 감사 5천원 할인쿠폰(3만원 이상 주문시)");
            list.add("배송비 무료 쿠폰");
            // ResponseEntity<List<CouponDto> list값과 상태코드를 함께 반환하기 위한 클래스
            // 성공 시, list와 OK상태코드를 반환 - 상태코드 : 200
            return new ResponseEntity<List<String>>(list, HttpStatus.OK);
        } catch(Exception e) {
            // 에러 발생 시, 에러 내용을 로그에 출력
            e.printStackTrace();
            // 에러 발생 시, list값과 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
            return new ResponseEntity<List<String>>(list, HttpStatus.BAD_REQUEST);
        }
    }

    // 메서드명 : getPaymentMethodList
    // 기   능 : 결제수단 목록 불러오기
    // 반환타입 : ResponseEntity<List<String>>
    // 요청URL : order/checkout/payment?user_idx=1234 GET
    @GetMapping("/order/checkout/payment")
    @ResponseBody
    public ResponseEntity<List<String>> getPaymentMethodList() {
        List<String> list = new ArrayList();
        try {
            list.add("카카오페이");
            // ResponseEntity<List<CouponDto> list값과 상태코드를 함께 반환하기 위한 클래스
            // 성공 시, list와 OK상태코드를 반환 - 상태코드 : 200
            return new ResponseEntity<List<String>>(list, HttpStatus.OK);
        } catch(Exception e) {
            // 에러 발생 시, 에러 내용을 로그에 출력
            e.printStackTrace();
            // 에러 발생 시, list값과 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
            return new ResponseEntity<List<String>>(list, HttpStatus.BAD_REQUEST);
        }
    }

    // 메서드명 : loginCheck
    // 기   능 : 로그인 상태 여부 확인
    // 매개변수 : HttpSession session
    // 반환타입 : boolean
    private static boolean loginCheck(HttpSession session) {
        // session에 저장된 idx값이 null이 아니면 true 반환
        return session.getAttribute("idx") != null;
    }

    // 메서드명 : saveOrderForm
    // 기   능 : 주문서 작성 내용을 '주문' 데이터에 저장한다.
    // 반환타입 : ResponseEntity<String>
    @PostMapping("/order/checkout/submit")
    public ResponseEntity<OrderDto> saveOrderForm(@RequestBody OrderDto orderDto) {
        System.out.println(orderDto);  // {ordr_nm='정지우', mpno='010-8435-4496', user_idx=1235}
        String msg = "";
        int rowCnt = 0;
        OrderDto orderDto2 = null;
        try {
            // rowCnt가 1일 경우, 성공 응답을 보낸다.
            // 1이 아닐 경우, 에러 발생 및 리턴
            // ResponseEntity<String> 성공 메시지 "SAVE_OK"와 상태코드를 함께 반환하기 위한 클래스
            // 성공 시, 'SAVE_OK'와 OK상태코드를 반환 - 상태코드 : 200
            rowCnt = orderService.addOrder(orderDto);
            if(rowCnt == 0) new Exception("insert failure.");
            orderDto2 = orderService.getOrderDto(orderDto.getIdx());
            System.out.println(orderDto);  // {ordr_nm='정지우', mpno='010-8435-4496', user_idx=1235}
            msg = "SAVE_OK";
            return new ResponseEntity<OrderDto>(orderDto, HttpStatus.OK);
        } catch(Exception e) {
            // 에러 발생 시, 에러 내용을 로그에 출력
            e.printStackTrace();
            // ResponseEntity<String> 실패 메시지 "SAVE_ERR"와 상태코드를 함께 반환하기 위한 클래스
            // 에러 발생 시, "SAVE_ERR"와 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
            msg = "SAVE_ERR";
            return new ResponseEntity<OrderDto>(orderDto, HttpStatus.BAD_REQUEST);
        }
    }

    // 메서드명 : saveTid
    // 기   능 : 결제 준비 메서드로부터 받은 응답 중 tid를 db에 저장한다.
    // 매개변수 : String tid
    // 반환타입 : ResponseEntity<String>
    @GetMapping("/payment/kakao/save-tid")
    public ResponseEntity<String> saveTid(String tid, Integer ord_idx) {
        String msg = "";
        Integer rowCnt = 0;
        try {
            // ResponseEntity<String> 성공 메시지 "SAVE_OK"와 상태코드를 함께 반환하기 위한 클래스
            // 성공 시, 'SAVE_OK'와 OK상태코드를 반환 - 상태코드 : 200
            rowCnt = orderService.addCountsaveKakaoPayment(tid, ord_idx);
            msg = "SAVE_OK";
            return new ResponseEntity<String>(msg, HttpStatus.OK);
        } catch(Exception e) {
            // 에러 발생 시, 에러 내용을 로그에 출력
            e.printStackTrace();
            // ResponseEntity<String> 실패 메시지 "SAVE_ERR"와 상태코드를 함께 반환하기 위한 클래스
            // 에러 발생 시, "SAVE_ERR"와 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
            msg = "SAVE_ERR";
            return new ResponseEntity<String>(msg, HttpStatus.BAD_REQUEST);
        }
    }
}
