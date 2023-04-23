package com.jangbogo.mall.controller;

import com.jangbogo.mall.domain.CartDto;
import com.jangbogo.mall.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CartController {
    // CartService 자동 주입
    @Autowired
    CartService cartService;

    // 메서드명 : goToCard
    // 기   능 : 장바구니 페이지로 이동한다.
    // 반환타입 : String
    // 매개변수 : Model model
    // 요청URL : /cart/cart GET
    @GetMapping("/cart")
    public String goToCart(HttpSession session, Model model) {
        if(!loginCheck(session)) return "redirect:/user/login";                                                         // 1. 로그인 확인 - loginCheck메서드가 false를 반환하는 경우, 로그인 페이지로 리다이렉트
        return "cart/cart";
    }

    // 메서드명 : getList
    // 기   능 : 장바구니 목록을 불러온다.
    // 반환타입 : ResponseEntity<List<CartDto>>
    // 매개변수 : Integer user_idx
    // 요청URL : /cart/list?user_idx=1234 GET
    @GetMapping("/cart/list")
    public ResponseEntity<List<CartDto>> list(Integer user_idx) {                                                       // ResponseEntity<List<CartDto>> -  list값과 상태코드를 함께 반환하기 위한 클래스
        List<CartDto> list = null;                                                                                      // 변수명 : list - 저장값 : CartDto 저장소 List
        try {
            list = cartService.getList(user_idx);                                                                       // cartService의 getList메서드에 인자로 회원번호를 지정하여 호출, 반환값을 list에 저장
            return new ResponseEntity<List<CartDto>>(list, HttpStatus.OK);                                              // 성공 시, list와 OK상태코드를 반환 - 상태코드 : 200
        } catch (Exception e) {                                                                                         // 에러 발생 시,
            e.printStackTrace();                                                                                        // 1) 에러 내용을 로그에 출력
            return new ResponseEntity<List<CartDto>>(list, HttpStatus.BAD_REQUEST);                                     // 2)list값과 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
        }
    }
    // 메서드명 : deleteCartProduct
    // 기   능 : 장바구니에서 선택된 상품을 삭제한다.
    // 반환타입 : String
    // 매개변수 : Integer prod_idx, Integer user_idx
    // 요청URL : /cart/remove?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx} GET
    @DeleteMapping("/cart/remove")
    public ResponseEntity<String> remove(Integer prod_idx, Integer user_idx) {                                          // ResponseEntity<List<CartDto>> -  list값과 상태코드를 함께 반환하기 위한 클래스
        int rowCnt = 0;                                                                                                 // 변수명 : rowCnt - 저장값 : 쿼리문 실행 결과, 영향 받은 테이블 행의 개수, 0으로 초기화
        try {
            rowCnt = cartService.remove(prod_idx, user_idx);                                                            // cartService의 remove메서드에 인자로 회원번호와 상품번호를 지정하여 호출, 반환값을 rowCnt에 저장
            if(rowCnt != 1) {                                                                                           // 행의 개수가 1이 아닐 경우, 예외를 던진다.
                throw new Exception("delete failed");
            }
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);                                                 // 성공 시, 엔티티로 "DEL_OK"라는 상태 메시지와 OK 상태코드를 반환 - 상태코드 : 200
        } catch (Exception e) {                                                                                         // 에러 발생 시,
            e.printStackTrace();                                                                                        // 1) 에러 내용을 로그에 출력
            return new ResponseEntity<>("DEL_ERR", HttpStatus.OK);                                                // 2) "DEL_ERR"라는 상태 메시지와 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
        }
    }

    // 메서드명 : updateProductCnt
    // 기   능 : 장바구니 상품 개수를 1만큼 증가 또는 감소시키는 방식으로 수정한다.
    // 반환타입 : String
    // 요청URL : /cart/updateCnt?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx}&prod_cnt=${prod_cnt} GET
    @GetMapping("/cart/updateCnt")
    public String updateProductCnt(Integer prod_idx, Integer user_idx, Integer prod_cnt, Integer upt_cnt) {
        int rowCnt = 0;                                                                                                 // 변수명 : rowCnt - 저장값 : 쿼리문 실행 결과, 영향 받은 테이블 행의 개수, 0으로 초기화
        try {
            if(!((prod_cnt - 1 == upt_cnt) && prod_cnt < 2)) {                                                          // 상품 개수가 2보다 작고, '-'버튼을 눌렀을 경우
                rowCnt = cartService.updateCount(prod_idx, user_idx, prod_cnt, upt_cnt);                                // cartService의 updateCount메서드에 인자로 회원번호와 상품번호, 그리고 상품개수, 변경개수를 지정하여 호출, 반환값을 rowCnt에 저장
                if (rowCnt != 1) {                                                                                      // 영향 받은 행의 개수가 1이 아닐 경우, 예외를 던진다.
                    throw new Exception("operation failed");
                }
            }
        } catch (Exception e) {                                                                                         // 에러 발생 시
            e.printStackTrace();                                                                                        // 에러 내용을 로그에 출력
        }
        return "redirect:/cart";                                                                                        // 응답결과에 상관없이 장바구니 페이지로 리다이렉트 이동한다.
    }

    // 메서드명 : goToOrderForm
    // 기   능 : 주문서 작성 페이지로 이동한다.
    // 반환타입 : String
    // 매개변수 : HttpSession session
    // 요청URL : /order/checkout GET
    @GetMapping("/order/checkout")
    public String goToOrderForm(HttpSession session) {
        if(!loginCheck(session)) return "redirect:/user/login";                                                         // 1. 로그인 확인 - loginCheck메서드가 false를 반환하는 경우, 로그인 페이지로 리다이렉트
        return "order/orderForm";                                                                                       // 2. 주문서 작성 페이지로 이동
    }

    // 메서드명 : loginCheck
    // 기   능 : 로그인 상태 여부 확인
    // 매개변수 : HttpServletRequest request
    // 반환타입 : boolean
    private static boolean loginCheck(HttpSession session) {
        return session.getAttribute("idx") != null;                                                               // session에 저장된 idx값이 null이 아니면 true 반환
    }
}