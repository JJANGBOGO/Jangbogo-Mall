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
        ul {
            padding: 0;
        }
        li {
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
            margin-left: 10px;
        }
        .cart_item__contents {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-left: 20px;
        }
        .cart_item__cnt {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border: 1px solid rgb(221, 223, 225);
            border-radius: 4px;
            margin-right: 40px;
            width: 90px;
        }

        .cart_item__cnt > div {
            padding: 5px 10px;
        }
        #subtract-btn, #add-btn {
            cursor: pointer;
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

        .cart_item__close > a, #subtract-btn > a, #add-btn > a {
            text-decoration: none;
            color: black;
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
                <div class="cart_items">
                    <ul>
                        <c:forEach var="cartDto" items="${list}">  <!-- 반복문 입력 -->
                            <li class="cart_item">
                                <input type="checkbox" name="chk"  />
                                <img src="${cartDto.prod_rpath}" alt="" />
                                <div class="cart_item__title">${cartDto.prod_name}</div>
                                <div class="cart_item__contents">
                                    <div class="cart_item__cnt">
                                        <div id="subtract-btn">
                                            <a href="<c:url value="/cart/subtractCnt?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx}&prod_cnt=${cartDto.prod_cnt}"/>">-</a>
                                        </div>
                                        <div>${cartDto.prod_cnt}</div>
                                        <div id="add-btn">
                                            <a href="<c:url value="/cart/addCnt?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx}"/>">+</a>
                                        </div>
                                    </div>
                                    <div class="cart_item__price">${cartDto.prod_price * cartDto.prod_cnt}</div>
                                    <div class="cart_item__close" id="removeBtn">
                                        <a href="<c:url value="/cart/remove?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx}"/>">&times;</a>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
<%--                <div class="selection">--%>
<%--                    <input type="checkbox" name="chk-all" class="input-all" /> 전체선택(1/${list.size()}) |  선택삭제--%>
<%--                </div>--%>
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
        $(document).ready(function() {

            let cnt = 0;    // li 태그 개수를 저장할 변수 cnt 선언 및 0으로 초기화
            let price = 0;  // 상품금액을 저장할 변수 price 선언 및 0으로 초기화

            // li태그의 개수가 몇 개인지 each메서드를 사용하여 계산
            $('.cart_item__price').each(() => {
                cnt++;
            })

            // 상품금액이 총 얼마인지 계산
            for(let i = 1; i <= cnt; i++) {
                price += parseInt($('li:nth-child(' + i + ') > .cart_item__contents > .cart_item__price').text());
            }

            // alert(parseInt($('.cart_item__price').text())) -> 2900990031500 실패


            $('#prodPrice').text(price + "원");  // 상품금액 태그에 내용으로 price 추가
            price += 2500;                      // 상품금액에 배송비를 추가한다.
            $('#totalPrice').text(price + "원")  // 결제예정금액에 price값을 추가한다.

            // 이벤트 대상 : .input-all
            // 이벤트 : click
            // 이벤트 핸들러 기능 : 전체 선택 시, 모든 상품의 체크박스 체크드 처리
            // 1. 체크
                // 1.1 '전체'
                // 1.2 '특정 종목'
            // 2. 언체크
                // 2.1 '전체'
                // 2.2 '특정 종목'
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

            // 이벤트 대상 : #add-btn
            // 이벤트 : click
            // 이벤트 핸들러 기능 : 클릭 시, 장바구니 상품 개수 1 증가
            <%--$("#add-btn").click(() => {--%>
            <%--    // CartController의 addProductCnt메서드 실행--%>
            <%--    alert("add-btn 동작")--%>
            <%--    location.href="<c:url value="/cart/addCnt?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx}"/>";--%>
            <%--})--%>

            // 이벤트 대상 : #subtract-btn
            // 이벤트 : click
            // 이벤트 핸들러 기능 : 클릭 시, 장바구니 상품 개수 1 감소
            $("#subtract-btn > a").click(() => {
                // 장바구니 물품 개수가 1일 때, 버튼을 클릭하면, 함수 호출을 못 하게 해야 한다.
            })
            // cartDto.prod_idx를 js에서 사용할수 없어서 무용지물

        })
    </script>
</body>
</html>