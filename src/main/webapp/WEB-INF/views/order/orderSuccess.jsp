<%--
  Created by IntelliJ IDEA.
  User: jiwoo
  Date: 2023/04/17
  Time: 1:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>카카오페이 승인</title>
        <link rel="stylesheet" href="/css/order/orderSuccess.css"/>
        <script src = "/js/order/format.js"></script>
    </head>
    <body>
        <div class="order-success__container">
            <h1 class="order-success__title">주문이 완료되었습니다.</h1>
            <div class="order-success__contents">
                <div class="order-success__section">
                    <div class="order-success__column-title">결제일시</div>
                    <div class="order-success__column-value">${model.approved_at}</div>
                </div>
                <div class="order-success__section">
                    <div class="order-success__column-title">상품명</div>
                    <div class="order-success__column-value">${model.item_name}</div>
                </div>
                <div class="order-success__section">
                    <div class="order-success__column-title">상품수량</div>
                    <div class="order-success__column-value" id="orderSuccessQuantity">${model.quantity}</div>
                </div>
                <div class="order-success__section">
                    <div class="order-success__column-title">결제금액</div>
                    <div class="order-success__column-value" id="orderSuccessTotal">${model.amount.total}</div>
                </div>
                <div class="order-success__section">
                    <div class="order-success__column-title">결제수단</div>
                    <div class="order-success__column-value" id="orderSuccessMethod">${model.payment_method_type}</div>
                </div>
            </div>
            <div class="order-success__section-paragraph">
                <p>[주문완료] 상태일 경우에만 주문내역 상세페이지에서 주문 취소가 가능합니다.</p>
                <p>엘리베이터 이용이 어려운 경우 6층 이상부터는 공동 현관 앞 또는 경비실로 대응 배송될 수 있습니다.</p>
            </div>
            <div class="order-success__section-buttons">
                <button type="button" class="order-success__btn-order-details">주문 상세보기</button>
                <button type="button" class="order-success__btn-home">홈으로 이동</button>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
        <script>
            $(document).ready(() => {
                let total_amount = Number($("#orderSuccessTotal").text());                                              // 변수명 : total_amount - 카카오페이 서버로부터 응답 받은 결제금액에 해당하는 값
                $("#orderSuccessTotal").text(formatPriceWithComma(total_amount) + "원");                                 // formatPriceWithComma 함수 - 금액에 해당하는 값에 comma를 삽입

                let quantity = $("#orderSuccessQuantity").text();                                                       // 변수명 : quantity - 카카오페이 서버로부터 응답 받은 주문수량에 해당하는 값
                $("#orderSuccessQuantity").text(quantity + "개");                                                        // quantity에 해당하는 수량에 "개"라는 문자열을 붙여서 화면에 랜더링한다.
                let payment_method = $("#orderSuccessMethod").text();                                                   // 변수명 : payment_method - 카카오페이 서버로부터 응답 받은 결제수단에 해당하는 값
                payment_method = (payment_method === "MONEY") ? "카카오페이머니결제" : "카드결제";                             // MONEY이면 "카카오페이머니" || CARD면 "카드결제"를 화면에 랜더링한다.
                $("#orderSuccessMethod").text(payment_method);
                // 이벤트 대상 : .order-success__btn-home '홈으로 이동' 버튼
                // 이벤트 : click
                // 이벤트 핸들러 기능 : 사이트 '홈'으로 이동
                $(document).on("click", ".order-success__btn-home", () => {
                    location.href="http://localhost:8080/"
                })

                // 이벤트 대상 : .order-success__btn-order-details '주문 상세보기' 버튼
                // 이벤트 : click
                // 이벤트 핸들러 기능 : '주문 상세보기'으로 이동
                $(document).on("click", ".order-success__btn-order-details", () => {

                })
            })
        </script>
    </body>
</html>
