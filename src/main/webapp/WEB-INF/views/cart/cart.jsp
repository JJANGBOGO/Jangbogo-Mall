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

        .cart_item__price {
            font-weight: 700;
        }

        .cart_item__close {
            display: flex;
            align-items: center;
            margin: 0 20px;
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
    <div class="container">
        <div class="header"></div>
        <div class="title">
            <h1>장바구니</h1>
        </div>
        <div class="cart">
            <div class="content">
                <div class="selection">
                    <input type="checkbox" /> 전체선택(${list.size()}/1) |  선택삭제
                </div>
                <div class="cart_items">
                    <ul>
                        <c:forEach var="cartDto" items="${list}">  <!-- 반복문 입력 -->
                            <li class="cart_item">
                                <img src="${cartDto.prod_rpath}" alt="" />
                                <div class="cart_item__title">${cartDto.prod_name}</div>
                                <div class="cart_item__contents">
                                    <div class="cart_item__cnt">
                                        <div>-</div>
                                        <div>${cartDto.prod_cnt}</div>
                                        <div>+</div>
                                    </div>
                                    <div class="cart_item__price">${cartDto.prod_price}원</div>
                                    <div class="cart_item__close">&times;</div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="selection">
                    <input type="checkbox" /> 전체선택(1/1)   |   선택삭제
                </div>
            </div>
            <div class="summary">

            </div>
        </div>
        <div class="footer"></div>
    </div>
</body>
</html>
