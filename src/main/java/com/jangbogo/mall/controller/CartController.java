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
    // 기   능 : 장바구니 목록을 불러오는 ajax요청을 처리한다.
    // 반환타입 : ResponseEntity<List<CartDto>>
    // 매개변수 : Integer user_idx
    // 요청URL : /cart/list?user_idx=1234 GET
    @GetMapping("/cart/list")
    public ResponseEntity<List<CartDto>> list(Integer user_idx) {
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
    // 메서드명 : deleteCartProduct
    // 기   능 : 장바구니에서 선택된 상품을 삭제한다.
    // 반환타입 : String
    // 매개변수 : Integer prod_idx, Integer user_idx
    // 요청URL : /cart/remove?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx} GET
    @DeleteMapping("/cart/remove")
    public ResponseEntity<String> remove(Integer prod_idx, Integer user_idx) {
        // 변수명 : rowCnt
        // 저장값 : 쿼리문 실행 결과, 영향 받은 테이블 행의 개수, 0으로 초기화
        int rowCnt = 0;  //
        try {
            // cartService의 remove메서드에 인자로 회원번호와 상품번호를 지정하여 호출, 반환값을 rowCnt에 저장
            rowCnt = cartService.remove(prod_idx, user_idx);

            // 행의 개수가 1이 아닐 경우, 예외를 던진다.
            if(rowCnt != 1) {
                throw new Exception("delete failed");
            }
            // 성공 시, 엔티티로 "DEL_OK"라는 상태 메시지와 OK 상태코드를 반환 - 상태코드 : 200
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            // 에러 발생 시, 에러 내용을 로그에 출력
            e.printStackTrace();
            // 에러 발생 시, "DEL_ERR"라는 상태 메시지와 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
            return new ResponseEntity<>("DEL_ERR", HttpStatus.OK);
        }
    }

    // 메서드명 : subtractProductCnt
    // 기   능 : 장바구니 상품 개수를 1 감소시킨다.
    // 반환타입 : String
    // 요청URL : /cart/subtractCnt?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx}&prod_cnt=${prod_cnt} GET
    @GetMapping("/cart/subtractCnt")
    public String subtractProductCnt(Integer prod_idx, Integer user_idx, Integer prod_cnt) {
        // 변수명 : rowCnt
        // 저장값 : 쿼리문 실행 결과, 영향 받은 테이블 행의 개수, 0으로 초기화
        int rowCnt = 0;
        try {
            // 삼품 개수가 1보다 큰 경우
            if(prod_cnt > 1) {
                // cartService의 subtractCount메서드에 인자로 회원번호와 상품번호, 그리고 상품개수 지정하여 호출, 반환값을 rowCnt에 저장
                rowCnt = cartService.subtractCount(prod_idx, user_idx, prod_cnt);

                // 행의 개수가 1이 아닐 경우, 예외를 던진다.
                if (rowCnt != 1) {
                    throw new Exception("subtract failed - prod_cnt = 1");
                }
            }
        } catch (Exception e) {
            // 에러 발생 시, 에러 내용을 로그에 출력
            e.printStackTrace();
        }
        // 응답결과에 상관없이 장바구니 페이지로 리다이렉트 이동한다.
        return "redirect:/cart";
    }

    // 메서드명 : addProductCnt
    // 기   능 : 장바구니 상품 개수를 1 증가시킨다.
    // 반환타입 : String
    // 요청URL : /cart/addCnt?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx} GET
    @GetMapping("/cart/addCnt")
    public ResponseEntity<String> addProductCnt(Integer prod_idx, Integer user_idx) throws Exception {
        // 변수명 : rowCnt
        // 저장값 : 쿼리문 실행 결과, 영향 받은 테이블 행의 개수, 0으로 초기화
        int rowCnt = 0;
        try {
            // cartService의 remove메서드에 인자로 회원번호와 상품번호를 지정하여 호출, 반환값을 rowCnt에 저장
            rowCnt = cartService.addCount(prod_idx, user_idx);

            // 행의 개수가 1이 아닐 경우, 예외를 던진다.
            if(rowCnt != 1) {
                throw new Exception("add failed");
            }
            // 성공 시, 엔티티로 "DEL_OK"라는 상태 메시지와 OK 상태코드를 반환 - 상태코드 : 200
            return new ResponseEntity<>("ADD_OK", HttpStatus.OK);
        }
        catch (Exception e) {
            // 에러 발생 시, 에러 내용을 로그에 출력
            e.printStackTrace();
            // 에러 발생 시, "ADD_ERR"라는 상태 메시지와 BAD_REQUEST 상태코드 반환  - 상태코드 : 400
            return new ResponseEntity<>("ADD_ERR", HttpStatus.OK);
        }

    }

    // 메서드명 : goToOrderForm
    // 기   능 : 주문서 작성 페이지로 이동한다.
    // 반환타입 : String
    // 매개변수 : HttpSession session
    // 요청URL : /order/checkout GET
    @GetMapping("/order/checkout")
    public String goToOrderForm(HttpSession session) {
        // 1. 로그인 확인 - loginCheck메서드가 false를 반환하는 경우, 로그인 페이지로 리다이렉트
        if(!loginCheck(session)) return "redirect:/user/login";

        // 2. 주문서 작성 페이지로 이동
        return "order/orderForm";
    }

    // 메서드명 : loginCheck
    // 기   능 : 로그인 상태 여부 확인
    // 매개변수 : HttpServletRequest request
    // 반환타입 : boolean
    private static boolean loginCheck(HttpSession session) {
        // session에 저장된 idx값이 null이 아니면 true 반환
        return session.getAttribute("idx") != null;
    }
}