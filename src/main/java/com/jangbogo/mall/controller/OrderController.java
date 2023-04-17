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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
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

    // 메서드명 : getDeliveryInfo
    // 기   능 : 배송 정보 불러오기
    // 반환타입 : ResponseEntity<Map>
    // 요청URL : order/checkout/delivery?user_idx=1234 GET
    @GetMapping("/order/checkout/delivery")
    public ResponseEntity<Map> getDeliveryInfo() {
        Map map = new HashMap();
        // 1. 하드코딩
        // 1.1 배송지
        // 1.2 받는 사람
        // 1.3 전화번호
        // 1.4 받으실 장소
        // 1.5 공동현관 비밀번호
        // 1.6 배송완료 메시지
        try {
            String address = "경기 의왕시 원골로 43(모락산현대아파트)118동 202호";
            String recipient = "정지우";
            String mpno = "01084354496";
            String pickUpLocation = "문 앞";
            boolean hasGatePwd = true;
            String gatePwd = "#1234#0000";
            boolean completeMsg = true;
            map.put("address", address);
            map.put("recipient", recipient);
            map.put("mpno", mpno);
            map.put("pickUpLocation", pickUpLocation);
            map.put("hasGatePwd", hasGatePwd);
            map.put("completeMsg", completeMsg);
            // ResponseEntity<List<CartDto> list값과 상태코드를 함께 반환하기 위한 클래스
            // 성공 시, list와 OK상태코드를 반환 - 상태코드 : 200
            return new ResponseEntity<Map>(map, HttpStatus.OK);
        } catch(Exception e) {
            // 에러 발생 시, 에러 내용을 로그에 출력
            e.printStackTrace();
            // 에러 발생 시, list값과 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
            return new ResponseEntity<Map>(map, HttpStatus.BAD_REQUEST);
        }
        // 2. 소프트 코딩
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

    // 메서드명 : getCouponList
    // 기   능 : 쿠폰 목록 불러오기
    // 반환타입 :
    // 요청URL : order/checkout/coupons?user_idx=1234 GET
    @GetMapping("/order/checkout/coupons")
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

    // 메서드명 : kakaoPaymentReady
    // 기   능 : 결제 준비 및 요청 처리 후, 결제 승인 메서드 호출
    // 매개변수 : HttpSession session
    // 반환타입 : String
    // POST /v1/payment/ready HTTP/1.1
    // Host: kapi.kakao.com
    // Authorization: KakaoAK ${APP_ADMIN_KEY}
    // Content-type: application/x-www-form-urlencoded;charset=utf-8
    // TODO: 결제 요청 결과로 받은 tid를 결제 테이블에 저장한다.
    @GetMapping("/payment/kakao/ready")
    @ResponseBody
    public String kakaoPaymentReady(HttpSession session) {
        try {
            URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "KakaoAK 4319c284b87b726f5f038d839ad6bbd2");
            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
            conn.setDoOutput(true);  // doOutput : 연결을 통해 서버에 전달할 데이터가 있는지 여부 conn: 디폴트 doInput : true
            String params = "";
            params = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount=2200&tax_free_amount=0&approval_url=http://localhost:8080/payment/kakao/approve&cancel_url=http://localhost:8080/payment/kakao/cancel&fail_url=http://localhost:8080/payment/kakao/faillure";
            OutputStream outputStream = conn.getOutputStream();
            DataOutputStream dataOutputStream = new DataOutputStream(outputStream);
            dataOutputStream.writeBytes(params);
            dataOutputStream.flush();
            dataOutputStream.close();

            int result = conn.getResponseCode();
            InputStream inputStream;
            if(result == 200) {
                inputStream = conn.getInputStream();
            } else {
                inputStream = conn.getErrorStream();
            }
            System.out.println("inputStream = " + inputStream);
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
            System.out.println("inputStreamReader = " + inputStreamReader);
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);  // bufferedReader : 형변환하는애

            return bufferedReader.readLine();

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "{\"result\":\"NO\"}";
    }

    // POST /v1/payment/approve HTTP/1.1
    // Host: kapi.kakao.com
    // Authorization: KakaoAK ${APP_ADMIN_KEY}
    // Content-type: application/x-www-form-urlencoded;charset=utf-8
    // 메서드명 : kakaoPaymentApprove
    // 기   능 : 결제 승인 처리
    // 반환타입 : String
    @GetMapping("/payment/kakao/approve")
    public String kakaoPaymentApprove(String pg_token) {
        try {
            System.out.println("pg_token = " + pg_token);
            URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "KakaoAK 4319c284b87b726f5f038d839ad6bbd2");
            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
            conn.setDoOutput(true);  // doOutput : 연결을 통해 서버에 전달할 데이터가 있는지 여부 conn: 디폴트 doInput : true

            String params = "cid=TC0ONETIME&tid=T1234567890123456789&partner_order_id=partner_order_id&partner_user_id=partner_user_id&pg_token=" + pg_token;

            OutputStream outputStream = conn.getOutputStream();
            DataOutputStream dataOutputStream = new DataOutputStream(outputStream);
            dataOutputStream.writeBytes(params);
            dataOutputStream.flush();
            dataOutputStream.close();

            int result = conn.getResponseCode();
            InputStream inputStream;
            if(result == 200) {
                inputStream = conn.getInputStream();
            } else {
                inputStream = conn.getErrorStream();
            }
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);  // bufferedReader : 형변환하는애
            return bufferedReader.readLine();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "order/kakaoPayApprove";
    }

    // POST /payment/kakao/approve HTTP/1.1
    // Host: kapi.kakao.com
    // Authorization: KakaoAK ${APP_ADMIN_KEY}
    // Content-type: application/x-www-form-urlencoded;charset=utf-8
    // 메서드명 : kakaoPaymentCancel
    // 기   능 : 결제 취소 처리
    // 반환타입 : String

    // POST /payment/kakao/failure HTTP/1.1
    // Host: kapi.kakao.com
    // Authorization: KakaoAK ${APP_ADMIN_KEY}
    // Content-type: application/x-www-form-urlencoded;charset=utf-8
    // 메서드명 : kakaoPaymentFailure
    // 기   능 : 결제 실패 처리
    // 반환타입 : String

    // 메서드명 : saveOrderForm
    // 기   능 : 주문서 작성 내용을 '주문' 데이터에 저장한다.
    // 반환타입 : ResponseEntity<String>
    @PostMapping("/order/checkout/submit")
    public ResponseEntity<String> saveOrderForm() {
        String msg = "";
        int rowCnt = 0;
        try {

            // rowCnt가 1일 경우, 성공 응답을 보낸다.
            // 1이 아닐 경우, 에러 발생 및 리턴
            
            // ResponseEntity<String> 성공 메시지 "SAVE_OK"와 상태코드를 함께 반환하기 위한 클래스
            // 성공 시, 'SAVE_OK'와 OK상태코드를 반환 - 상태코드 : 200

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

    // 메서드명 : saveTid
    // 기   능 : 결제 준비 메서드로부터 받은 응답 중 tid를 db에 저장한다.
    // 매개변수 : String tid
    // 반환타입 : ResponseEntity<String>
    @GetMapping("/payment/kakao/save-tid")
    public ResponseEntity<String> saveTid(String tid) {
        String msg = "";
        Integer rowCnt = 0;
        try {
            // ResponseEntity<String> 성공 메시지 "SAVE_OK"와 상태코드를 함께 반환하기 위한 클래스
            // 성공 시, 'SAVE_OK'와 OK상태코드를 반환 - 상태코드 : 200
            rowCnt = orderService.addCountsaveKakaoPayment(tid);
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
