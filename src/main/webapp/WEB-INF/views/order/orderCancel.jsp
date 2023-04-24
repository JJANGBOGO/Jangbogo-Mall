<%--
  Created by IntelliJ IDEA.
  User: jiwoo
  Date: 2023/04/21
  Time: 10:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <link rel="stylesheet" href="/css/modal.css">
        <link rel="stylesheet" href="/css/order/orderCancel.css">
        <title>결제를 취소했습니다.</title>
    </head>
    <body>
        <div class="background show">
        <div class="popup order-cancel__popup">
            <div class="order-cancel__popup-title">결제를 취소했습니다.</div>
            <button type="button" id="orderCancelConfirmBtn">확인</button>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script>
        $(document).ready(() => {
            $(document).on("click", "#orderCancelConfirmBtn", () => {
                location.href="http://localhost:8080/order/checkout";
            })
        })
    </script>
    </body>
</html>
