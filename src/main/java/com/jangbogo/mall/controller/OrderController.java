package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.CartDto;
import com.jangbogo.mall.domain.OrderDto;
import com.jangbogo.mall.domain.PaymentDto;
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
import org.springframework.web.bind.annotation.RequestBody;
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
    // 반환타입 : ResponseEntity<User>
    // 매개변수 : HttpSession session
    // 요청URL : order/checkout/delivery?user_idx=1234 GET
    @GetMapping("/order/checkout/delivery")
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

    // 메서드명 : saveOrderForm
    // 기   능 : 주문서 작성 내용을 '주문' 데이터에 저장한다.
    // 반환타입 : ResponseEntity<String>
    @PostMapping("/order/checkout/submit")
    public ResponseEntity<OrderDto> saveOrderForm(@RequestBody OrderDto orderDto) {
        System.out.println(orderDto);  // {idx=1, ordr_nm='정지우', mpno='010-8435-4496', user_idx=1235}
        String msg = "";
        int rowCnt = 0;
        try {
            // rowCnt가 1일 경우, 성공 응답을 보낸다.
            // 1이 아닐 경우, 에러 발생 및 리턴
            // ResponseEntity<String> 성공 메시지 "SAVE_OK"와 상태코드를 함께 반환하기 위한 클래스
            // 성공 시, 'SAVE_OK'와 OK상태코드를 반환 - 상태코드 : 200
            rowCnt = orderService.addOrder(orderDto);
            if(rowCnt == 0) new Exception("insert failure.");
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

    // 메서드명 : kakaoPaymentReady
    // 기   능 : 카카오페이 결제를 시작하기 위해 상세 정보를 카카오페이 서버에 전달하고 결제 고유 번호(TID)를 받는 단계
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
            URL url = new URL("https://kapi.kakao.com/v1/payment/ready");                             // 맵핑 - v1/payment/ready
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();                               // 요청하는 클라이언트(전봇대1) ~ 요청을 받는 카카오페이 서버(전봇대2)를 연결시켜주는 전깃줄
            conn.setRequestMethod("POST");                                                                  // 요청메서드 - POST 요청
            conn.setRequestProperty("Authorization", "KakaoAK 4319c284b87b726f5f038d839ad6bbd2");           // Property 설정 - Authorization: KakaoAK ${APP_ADMIN_KEY}
            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");     // Property 설정 - Content-type: application/x-www-form-urlencoded;charset=utf-8
            conn.setDoOutput(true);                                                                         // 커넥션의 doOutput - 연결을 통해 서버에 전달할 데이터 유무(디폴트 - doInput : true)
            String params = "";
            params = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount=2200&tax_free_amount=0&approval_url=http://localhost:8080/payment/kakao/approve&cancel_url=http://localhost:8080/payment/kakao/cancel&fail_url=http://localhost:8080/payment/kakao/faillure";
            OutputStream outputStream = conn.getOutputStream();                                             // 파라미터를 서버에 전달하기 위한 클래스 OutputStream을 받아냄 - 주는 쪽(getOutputStream(), 커넥션로부터 얻어냄), Byte 형식으로 주고받아야 함
            DataOutputStream dataOutputStream = new DataOutputStream(outputStream);                         // 데이터 주는 쪽 DataOutputStream - 인자로 주는 쪽인 OutputStream 지정, 파라미터를 Byte형식으로 써서 서버에 전달
            dataOutputStream.writeBytes(params);                                                            // 데이터 주는 쪽 DataOutputStream 클래스 메서드 중 writeBytes() - 인자로 문자열 지정, Byte로 형변환하여 써줌
                                                                                                            // 데이터를 주는 쪽에서 데이터를 갖고 있지만 아직 전깃줄(커넥션)에 타지는 않았다.
//          dataOutputStream.flush();                                                                        // 데이터 주는 쪽 DataOutputStream 클래스 메서드 중 flush() - 자기가 가지고 있는 것들을 '전깃줄'에 태워보내며 자기가 갖고 있던 것들을 비워준다
            dataOutputStream.close();                                                                       // 데이터 주는 쪽 DataOutputStream 클래스 메서드 중 close() - close()메서드를 사용하면 이 안에 flush()가 알아서 호출된다. 따라서, flush() 실행 안 해도 됨(포함)

            int result = conn.getResponseCode();                                                            // 통신 결과를 int result에 저장
            InputStream inputStream;                                                                        // 서버로부터 데이터를 전달받기 위한 클래스 InputStream을 받아냄. '받는 애'
            if(result == 200) {                                                                             // HTTP 상태 코드가 '200'인 경우
                inputStream = conn.getInputStream();                                                        // 받는 쪽 - 커넥션으로부터 getInputStream을 받음 - 받는 쪽(getInputStream(), 커넥션으로부터 얻어냄)
            } else {
                inputStream = conn.getErrorStream();                                                        // 받는 쪽 - 상태코드가 '200'이 아닌 경우 에러를 받는 스트림을 호출 - 에러 받는 쪽(getErrorStream(), 커넥션으로부터 얻어냄)
            }
            System.out.println("inputStream = " + inputStream);
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream);                       // InputStreamReader(받는 애) - 받아온 데이터 읽기 가능 클래스, 받는 쪽인 'inputStream'을 인자로 지정하면, 받는 쪽이 받은 데이터를 읽을 수 있다. '읽는 애'
            System.out.println("inputStreamReader = " + inputStreamReader);
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);                          // BufferedReader - InputStream, OutputStream은 Byte 형식으로 데이터를 주고 받는다. 문자열로 형변환해서 받아야 한다.             '형변환 하는 애'

            return bufferedReader.readLine();                                                               // readLine() - 문자열로 형변환을 해준 다음 찍어낸다. 그러면서 본인은 비워지게 된다.

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
            URL url = new URL("https://kapi.kakao.com/v1/payment/approve");                           // 맵핑 - v1/payment/approve
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();                               // 요청하는 클라이언트(전봇대1) ~ 요청을 받는 카카오페이 서버(전봇대2)를 연결시켜주는 전깃줄
            conn.setRequestMethod("POST");                                                                  // POST 요청
            conn.setRequestProperty("Authorization", "KakaoAK 4319c284b87b726f5f038d839ad6bbd2");           // Property 설정 - Authorization: KakaoAK ${APP_ADMIN_KEY}
            conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");     // Property 설정 - Content-type: application/x-www-form-urlencoded;charset=utf-8
            conn.setDoOutput(true);                                                                         // 커넥션의 doOutput - 연결을 통해 서버에 전달할 데이터 유무(디폴트 - doInput : true)

            // 주문번호(ord_idx) 가져오기
            OrderDto orderDto = orderService.getOrderDto(1235);             // TODO: 주문번호는 어디서 구하지?
            // 결제고유번호(tid)  가져오기
            PaymentDto paymentDto = orderService.getPaymentDto(1);          // TODO : 결제번호는 어디서 구하지?

            String tid = paymentDto.getSetl_idx();
            String params = "cid=TC0ONETIME&tid=" + tid +"&partner_order_id=partner_order_id&partner_user_id=partner_user_id&pg_token=" + pg_token;

            OutputStream outputStream = conn.getOutputStream();
            DataOutputStream dataOutputStream = new DataOutputStream(outputStream);
            dataOutputStream.writeBytes(params);
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
}
