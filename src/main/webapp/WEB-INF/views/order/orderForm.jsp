<%--
  Created by IntelliJ IDEA.
  User: jiwoo
  Date: 2023/04/09
  Time: 7:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>주문서 작성</title>
    <style>

    </style>
</head>
<body>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <div class="order-container">
        <h1 class="order-title">주문서</h1>
        <section class="order-section">
            <h1 class="order-section__title">주문 상품</h1>
            <ul id="orderItems">

            </ul>
        </section>
        <section class="order-section">
            <h1 class="order-section__title">주문자 정보</h1>
            <ul id="ordererInform">

            </ul>
        </section>
        <section class="order-section">
            <h1 class="order-section__title">배송 정보</h1>
            <ul id="deliveryInform">

            </ul>
        </section>
        <section class="order-section">
            <h1 class="order-section__title">쿠폰</h1>
            <ul id="orderCoupons">

            </ul>
        </section>
        <section class="order-section">
            <h1 class="order-section__title">결제 수단</h1>
            <ul id="paymentMethod">

            </ul>
        </section>
        <section class="order-section">
            <h1 class="order-section__title">개인정보 수집/제공</h1>
            <ul id="agreeOfPersonalInform">

            </ul>
        </section>
    </div>
    <script>
        $(document).ready(() => {

        })
    </script>
</body>
</html>
