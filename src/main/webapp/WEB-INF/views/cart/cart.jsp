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
    <style>
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
            background: #2ecc71;
            height: 20%;
        }
        .title {

        }
        .title > h1 {
            font-weight: 600;
            text-align: center;
        }
        .cart {
            display: flex;
            margin: 0 125px;
        }
        .content {
            /*background: #3498db;*/
            height: 60%;
            width: 1000px;
            margin-right: 20px;
        }
        .footer {
            background: #f39c12;
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
        }

        .cart_item__cnt > div {
            padding: 5px 10px;
        }
        #subtract-btn, #add-btn {
            cursor: pointer;
        }
        .cart_item__price {
            font-weight: 700;
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
        .summary {
            width: 400px;
            height: 500px;
            background: lavender;
        }

        img {
            display: inline-block;
            width: 60px;
            height: 78px;
        }
    </style>
</head>
<body>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <div class="container">
        <div class="header"></div>
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
                                            <a href="<c:url value="/cart/subtractCnt?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx}"/>">-</a>
                                        </div>
                                        <div>${cartDto.prod_cnt}</div>
                                        <div id="add-btn">
                                            <a href="<c:url value="/cart/addCnt?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx}"/>">+</a>
                                        </div>
                                    </div>
                                    <div class="cart_item__price">${cartDto.prod_price * cartDto.prod_cnt}원</div>
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

            </div>
        </div>
        <div class="footer"></div>
    </div>
    <script>
        $(document).ready(function() {
            // 선택된 상품 개수를 의미하는 변수 count
            let checked = $("input[name=chk]:checked").length;
            $(".selection > span ").prop("innerHTML", checked);

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
            // cartDto.prod_idx를 js에서 사용할수 없어서 무용지물
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
            <%--$("#subtract-btn").click(() => {--%>
            <%--    // CartController의 subtractProductCnt메서드 실행--%>
            <%--    alert("subtract-btn 동작")--%>
            <%--    location.href="<c:url value="/cart/subtractCnt?prod_idx=${cartDto.prod_idx}&user_idx=${cartDto.user_idx}"/>";--%>
            <%--})--%>
        })
    </script>
</body>
</html>
