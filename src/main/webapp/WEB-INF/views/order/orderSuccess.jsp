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
                    <div class="order-success__column-value" id="orderSuccessApprovedAt"></div>
                </div>
                <div class="order-success__section">
                    <div class="order-success__column-title">상품명</div>
                    <div class="order-success__column-value" id="orderSuccessItemName"></div>
                </div>
                <div class="order-success__section">
                    <div class="order-success__column-title">상품수량</div>
                    <div class="order-success__column-value" id="orderSuccessQuantity"></div>
                </div>
                <div class="order-success__section">
                    <div class="order-success__column-title">결제금액</div>
                    <div class="order-success__column-value" id="orderSuccessTotal"></div>
                </div>
                <div class="order-success__section">
                    <div class="order-success__column-title">결제수단</div>
                    <div class="order-success__column-value" id="orderSuccessMethod"></div>
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
                let model = "${model}";                                                                                 // 변수명 : model - 저장값 : RedirectAttributes에 저장된 키(k)가 "model"인 값(v)
                if(model !== "") {                                                                                      // 변수 model에 RedirectAttributes의 저장된 키(k)가 "model"인 값(v)이 들어온 경우
                    sessionStorage.setItem("approved_at", "${model.approved_at}");                                      // '결제승인시각' 세션스토리지에 저장
                    sessionStorage.setItem("item_name", "${model.item_name}");                                          // '주문상품이름' 세션스토리지에 저장
                    sessionStorage.setItem("quantity", "${model.quantity}");                                            // '주문상품수량' 세션스토리지에 저장
                    sessionStorage.setItem("total", "${model.amount.total}");                                           // '주문총금액' 세션스토리지에 저장
                    sessionStorage.setItem("payment_method_type", "${model.payment_method_type}");                      // '주문결제수단' 세션스토리지에 저장
                }
                let approved_at = sessionStorage.getItem("approved_at");                                                // 변수명 : approved_at - 카카오페이 서버로부터 응답 받은 결제승인시각에 해당하는 값
                let item_name = sessionStorage.getItem("item_name");                                                    // 변수명 : item_name - 카카오페이 서버로부터 응답 받은 주문상품이름에 해당하는 값
                let quantity = sessionStorage.getItem("quantity");                                                      // 변수명 : quantity - 카카오페이 서버로부터 응답 받은 주문수량에 해당하는 값
                let total = sessionStorage.getItem("total");                                                            // 변수명 : total - 카카오페이 서버로부터 응답 받은 결제금액에 해당하는 값
                let payment_method_type = sessionStorage.getItem("payment_method_type");                                // 변수명 : payment_method - 카카오페이 서버로부터 응답 받은 결제수단에 해당하는 값
                payment_method_type = (payment_method_type === "MONEY") ? "카카오페이머니결제" : "카드결제";                   // MONEY이면 "카카오페이머니" || CARD면 "카드결제"를 화면에 랜더링한다.


                $("#orderSuccessApprovedAt").text(approved_at);                                                         // '결제승인시각' 특정 위치에 랜더링
                $("#orderSuccessItemName").text(item_name);                                                             // '주문상품이름' 특정 위치에 랜더링
                $("#orderSuccessQuantity").text(quantity);                                                              // '주문상품수량' 특정 위치에 랜더링
                $("#orderSuccessTotal").text(formatPriceWithComma(total) + "원");                                        // '주문총금액' 특정 위치에 랜더링 formatPriceWithComma 함수 - 금액에 해당하는 값에 comma를 삽입
                $("#orderSuccessMethod").text(payment_method_type);                                                     // '주문결제수단' 특정 위치에 랜더링
                $("#orderSuccessQuantity").text(quantity + "개");                                                        // quantity에 해당하는 수량에 "개"라는 문자열을 붙여서 화면에 랜더링한다.

                // 이벤트 대상 : .order-success__btn-home '홈으로 이동' 버튼
                // 이벤트 : click
                // 이벤트 핸들러 기능 : 사이트 '홈'으로 이동
                $(document).on("click", ".order-success__btn-home", () => {
                    sessionStorage.clear();                                                                             // '홈'으로 이동 이전 세션스토리지 데이터 전체 삭제
                    location.href="http://localhost:8080/";                                                             // '홈'으로 이동
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
