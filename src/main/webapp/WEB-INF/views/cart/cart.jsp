<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jiwoo
  Date: 2023/03/26
  Time: 5:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/main.css"/>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
            Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
        }
        #itemList {
            padding: 0;
        }
        .cart_item {
            display: flex;
            align-items: center;
            list-style: none;
            margin-top: 15px;
            border-top: black 1px solid;
            padding-top: 20px;
        }
        .header {
            background: #B4C79E;
            height: 20%;
        }
        .title {
            padding: 50px 0;
        }
        .title > h1 {
            font-weight: 600;
            text-align: center;
        }
        .cart {
            display: flex;
            justify-content: center;
            margin: 0 125px;
            margin-bottom: 30px;
        }
        .container {
            width: 100%;
            height: 100%;
        }
        .content {
            /*background: #3498db;*/
            height: 60%;
            width: 730px;
            margin-right: 20px;
        }
        .footer {
            background: #B3945A;
            height: 20%;
        }
        .selection {
            padding: 10px 0;
        }

        .selection > input {
            font-size: 14px;
        }

        .selection:last-child {
            border: none;
        }
        .cart_item {
            display: flex;
        }
        .cart_item__title {
            width: 50%;
            text-align: left;
            font-weight: 600;
            margin-left: 20px;
        }
        .cart_item__contents {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-left: 20px;
            cursor:
        }
        .cart_item__cnt {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border: 1px solid rgb(221, 223, 225);
            border-radius: 4px;
            margin-right: 15px;
            width: 90px;
        }
        .item__count {
            text-align: center;
        }
        .cart_item__cnt > div {
            /*padding: 5px 10px;*/
        }
        #subtractBtn, #addBtn {
            cursor: pointer;
        }
        #subtractBtn {
            display:  block;
            padding: 5px 10px;
        }
        #addBtn  {
            display:  block;
            padding: 5px 10px;
        }
        .cart_item__price {
            font-weight: 700;
            text-align: right;
            width: 80px;
        }

        .cart_item__close {
            display: flex;
            align-items: center;
            margin: 0 20px;
            cursor: pointer;
        }


        .cart_item__close, #subtractBtn, #addBtn {
            text-decoration: none;
            color: black;
        }
        .cart_item__close {
            color: lightgray;
        }
        .cart_item > input {
            margin-right: 15px;
        }

        img {
            display: inline-block;
            width: 60px;
            height: 78px;
        }
        .summary {
            position: relative;
            width: 360px;
            height: 430px;
        }
        .dilvp > h3 {
            font-weight: 500;
        }
        .dilvp, .order-summary {
            padding: 25px;
            border: 1px solid #f2f2f2;
        }

        .dilvp {
            height: 190px;
        }

        .order-summary {
            height: 160px;
            background: #fafafa;
        }
        input[name='order'] {
            position: absolute;
            bottom: 0;
            left: 0;
            border-style: none;
            background: #5f0080;
            color: white;
            width: 100%;
            height: 56px;
            border-radius: 4px;
            font-weight: 500;
            font-size: 18px;
            cursor: pointer;
        }

        .prod-title {
            font-size: 18px;
        }

        .prod-content {
            font-size: 18px;
        }

        .dilv-cost, .dilv-total {
            padding-top: 12px;
        }

        .prod-price, .dilv-cost, .dilv-total {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    </style>
    <title>장보고 | 장바구니</title>
</head>
<body>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <div class="container">
    <%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<%--        <div class="header"></div>--%>
        <div class="title">
            <h1>장바구니</h1>
        </div>
        <div class="cart">
            <div class="content">
                <div class="selection">
                    <input type="checkbox" name="chk-all" class="input-all" /> 전체선택(<span id="checked">0</span>/${list.size()}) |  선택삭제
                </div>
                <div id="cartItems">

                </div>
            </div>
            <div class="summary">
                <section class="dilvp">
                    <h3 class="dilvp-title">배송지</h3>
                    <span class="dilvp-content">경기 의왕시 원골로 43(모락산현대아파트)118동 202호</span>
                </section>
                <section class="order-summary">
                    <section class="prod-price">
                        <span class="prod-title">상품금액</span>
                        <span class="prod-content" id="prodPrice"></span>
                    </section>
                    <section class="dilv-cost">
                        <span class="prod-title">배송비</span>
                        <span class="prod-content">2500원</span>
                    </section>
                    <section class="dilv-total">
                        <span class="prod-title">결제예정금액</span>
                        <span class="prod-content" id="totalPrice">0원</span>
                    </section>

                </section>
                <input type="button" name="order" value="주문하기" />
            </div>
        </div>
        <div class="footer"></div>
    </div>
    <script>
        // 1. 장바구니 전체 목록 조회
        let toHtml = (items) => {
            let tmp = "<ul>";

            items.forEach((item) => {
                tmp += '<li class="cart_item" data-pid=' + item.prod_idx + ' data-uid=' + item.user_idx +' >';
                tmp += '<input type="checkbox" name="chk"  />';
                tmp += '<img src=' + item.prod_rpath + " alt='' />";
                tmp += "<div class='cart_item__title'>" + item.prod_name + "</div>";
                tmp += '<div class="cart_item__contents">';
                tmp += '<div class="cart_item__cnt">';
                tmp += '<div id="subtractBtn">-</div>';
                tmp += '<div class=item__count>' + item.prod_cnt + "</div>";
                tmp += '<div id="addBtn">+</div>';
                tmp += '</div>';
                tmp += '</div>';
                tmp += "<div class='cart_item__price'>" + item.prod_price * item.prod_cnt + "</div><span>원</span>";
                tmp += '<div class="cart_item__close">&times;</div>';
                tmp += '</div>';
                tmp += '</li>';
            })
            return tmp += '</ul>';
        }
        let showList = (user_idx) => {
            $.ajax({
                type:'GET',
                url:'/cart/list?user_idx=' + user_idx,
                success: (result) => {
                    $('#cartItems').html(toHtml(result));
                },
                error : function() { alert("comment get error");}
            })
        }

        $(document).ready(function() {
            showList(1234);  // 회원번호(user_idx) 하드코딩


            // 이벤트 핸들러에서 user_idx와 prod_idx를 사용하려면?
            // 동적으로 생성된 태그에 이벤트를 걸려면 document 객체에서 잡아와서 이벤트를 걸어야한다.

            let cnt = 0;    // li 태그 개수를 저장할 변수 cnt 선언 및 0으로 초기화
            let price = 0;  // 상품금액을 저장할 변수 price 선언 및 0으로 초기화

            // li태그의 개수가 몇 개인지 each메서드를 사용하여 계산
            $('.cart_item__price').each(() => {
                cnt++;
            })

            // 상품금액이 총 얼마인지 계산
            // 상품개수가 1 이하인 경우, - 버튼 비활성화, 그렇지 않은 경우 활성화
            for(let i = 1; i <= cnt; i++) {
                price += parseInt($('li:nth-child(' + i + ') > .cart_item__contents > .cart_item__price').text());
                let a = parseInt($('li:nth-child(' + i + ') > .cart_item__contents > .cart_item__cnt > .item__count').text());
                let b = $('li:nth-child(' + i + ') > .cart_item__contents > .cart_item__cnt > .subtract-btn');
                if(a <= 1) {
                    b.css("color", "rgb(244, 244, 244)");
                    b.css("cursor", "default");
                    b.attr("disabled", true);
                } else {
                    b.css("color", "black");
                    b.css("cursor", "pointer");
                    b.attr("disabled", false);
                }
            }

            $('#prodPrice').text(price + "원");  // 상품금액 태그에 내용으로 price 추가
            price += 2500;                      // 상품금액에 배송비를 추가한다.
            $('#totalPrice').text(price + "원")  // 결제예정금액에 price값을 추가한다.

            // 이벤트 대상 : .input-all
            // 이벤트 : click
            // 이벤트 핸들러 기능 : 전체 선택 시, 모든 상품의 체크박스 체크드 처리
            $(".input-all").click(function() {
                if($(".input-all").is(":checked")) $("input[name=chk]").prop("checked", true);
                else $("input[name=chk]").prop("checked", false);

                let checked = $("input[name=chk]:checked").length;
                $(".selection > span ").prop("innerHTML", checked);
            });

            $("input[name=chk]").click(function() {
                let total = $("input[name=chk]").length;
                let checked = $("input[name=chk]:checked").length;

                $(".selection > span ").prop("innerHTML", checked);

                if(total != checked) $(".input-all").prop("checked", false);
                else $(".input-all").prop("checked", true);
            });

            $(document).on("click", ".cart_item__close", (e) => {// 회원번호와 상품번호를 JQUERY단에 가져와야 한다.
                let element = $(e.target).closest("li").data("pid"); // console.log(element) - 100, 101, 102 출력
                let element2 = $(e.target).closest("li").data("uid"); // console.log(element2) - 1234 출력

                if(!confirm("정말로 삭제하시겠습니까?")) return;                               // 1. 버튼 클릭 시, 확인 창 팝업
                $.ajax({
                    type:'DELETE',                                                      // 2. 요청 메서드
                    url: '/cart/remove?prod_idx=' + element + '&user_idx=' + element2,  // 3. 요청 URI, 상품번호(prod_idx), 회원번호(user_idx) 변수 처리
                    success : (result) => {
                        showList(element2);                                             // 4. 서버로부터 성공 응답이 도착하면 호출될 함수.
                    },
                    error   : () => {
                        alert("error");                                                 // 5. 서버로부터 실패 응답이 도착하면 호출될 함수
                    }
                });  // $.ajax()
            })

            $(document).on("click", "#subtractBtn", (e) => {// 회원번호와 상품번호, 그리고 상품개수를 JQUERY단에 가져와야 한다.
                let element = $(e.target).closest("li").data("pid"); // console.log(element) - 100, 101, 102 출력
                let element2 = $(e.target).closest("li").data("uid"); // console.log(element2) - 1234 출력
                let element3 = parseInt($(e.target).next("div").text()); // console.log(element2) - 1234 출력

                $.ajax({
                    type:'GET',                                                                                        // 1. 요청 메서드
                    url: '/cart/subtractCnt?prod_idx=' + element + '&user_idx=' + element2 + "&prod_cnt=" + element3,  // 2. 요청 URI, 상품번호(prod_idx), 회원번호(user_idx), 상품개수(prod_cnt) 변수 처리
                    success : (result) => {
                        showList(element2);                                                                            // 3. 서버로부터 성공 응답이 도착하면 호출될 함수.
                    },
                    error   : () => {
                        alert("error");                                                                                // 4. 서버로부터 실패 응답이 도착하면 호출될 함수.
                    }
                });  // $.ajax()
            })

            $(document).on("click", "#addBtn", (e) => {// 회원번호와 상품번호, 그리고 상품개수를 JQUERY단에 가져와야 한다.
                let element = $(e.target).closest("li").data("pid"); // console.log(element) - 100, 101, 102 출력
                let element2 = $(e.target).closest("li").data("uid"); // console.log(element2) - 1234 출력

                $.ajax({
                    type:'GET',                                                         // 1. 요청 메서드
                    url: '/cart/addCnt?prod_idx=' + element + '&user_idx=' + element2,  // 2. 요청 URI, 상품번호(prod_idx), 회원번호(user_idx) 변수 처리
                    success : (result) => {
                        showList(element2);                                             // 3. 서버로부터 성공 응답이 도착하면 호출될 함수.
                    },
                    error   : () => {
                        alert("error");                                                 // 4. 서버로부터 실패 응답이 도착하면 호출될 함수.
                    }
                });  // $.ajax()
            })

        })

    </script>

</body>
</html>