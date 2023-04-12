package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.CartDto;
import com.jangbogo.mall.domain.User;
import com.jangbogo.mall.service.CartService;
import com.jangbogo.mall.service.OrderService;
import com.jangbogo.mall.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
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

    // 메서드명 : goToOrderForm
    // 기   능 : 주문서 작성 페이지로 이동
    // 반환타입 : String
    // 요청URL : /order/checkout
    @GetMapping("/order/checkout")
    public String goToOrderForm() { return "/order/orderForm"; }

    // 메서드명 : getItemList
    // 기   능 : 주문상품 목록을 불러오는 ajax요청을 처리한다.
    // 반환타입 : ResponseEntity<List<CartDto>>
    // 매개변수 : Integer user_idx
    // 요청URL : /order/list?user_idx=1234 GET
    @GetMapping("/order/list")
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
    // 요청URL : order/orderer?user_idx=1234 GET
    @GetMapping("/order/orderer")
    public ResponseEntity<Map> getOrderInfo(HttpSession session) {
        // 변수명 : ordererInfo
        // 저장값 :
        // TODO : 회원가입, 로그인 기능 테스트 완료 후, 데이터 값이 들어오는지 테스트 요망 (완료) 1. 세션 테스트 2. 서비스 테스트
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
}
