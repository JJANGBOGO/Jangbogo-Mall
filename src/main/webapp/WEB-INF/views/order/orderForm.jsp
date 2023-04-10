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
            * {
                box-sizing: border-box;
                font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
            }
            h3 {
                font-size: 20px;
            }
            svg {
                display: inline-block;
                width: 25px;
                height: 25px;
                padding: 5px;
                cursor: pointer;
            }
            body {
            }
            .order-container {
                padding: 50px 0 60px 0;
                width: 1050px;
                margin: 0 auto;
            }
            .order-title {
                text-align: center;
                padding-bottom: 48px;
                font-weight: 500;
                font-size: 28px;
                line-height: 29px;
            }
            .order-section {

            }
            .order-section__title {
                display: flex;
                justify-content: space-between;
                align-items: center;
                line-height: 29px;
                border-bottom: 1px solid black;
            }
            .order-section__title > h3 {
                padding: 16px 0;
                font-weight: 500;
                font-size: 20px;
            }
            .order-section__content {
                padding: 28px 0;
                border-bottom: 1px solid rgb(244, 244, 244);
                line-height: 29px;
            }
            .order-container__parent {
                display: flex;
                justify-content: space-between;
            }
            .order-container__child {
                width: 724px;
            }
            .order-amount__container {
                position: relative;
                width: 284px;
            }
            .order-amount__title {
                display: flex;
                flex-direction: row;
                -webkit-box-pack: justify;
                justify-content: space-between;
                -webkit-box-align: center;
                align-items: center;
            }
            .order-amount__title > h3 {
                padding: 16px 0;
                font-weight: 500;
                font-size: 20px;
                color: rgb(51, 51, 51);
                line-height: 29px;
            }
            .order-amount {
                width: 100%;
                padding: 17px 16px 18px 18px;
                background: rgb(250, 250, 250);
                border: 1px solid rgb(242, 242, 242);
            }
            .order-amount__section {
                display: flex;
                -webkit-box-pack: justify;
                justify-content: space-between;
                margin-top: 16px;
                font-size: 16px;
                color: rgb(51, 51, 51);
                padding-bottom: 8px;
            }
            .order-amount__section-final {
                display: flex;
                -webkit-box-pack: justify;
                justify-content: space-between;
                margin-top: 16px;
                padding: 16px 0px 1px;
                border-top: 1px solid rgb(244, 244, 244);
                font-size: 16px;
                color: rgb(76, 76, 76);
            }
        </style>
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
        <%@ include file="/WEB-INF/views/include/navbar.jsp" %>
        <div class="order-container">
            <h1 class="order-title">주문서</h1>
            <section class="order-section">
                <div class="order-section__title">
                    <h3>주문 상품</h3>
                    <svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='#212529'><path fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/></svg>
                </div>
                <div class="order-section__content">
                    <ul id="orderItems">

                    </ul>
                </div>
            </section>
            <section class="order-section">
                <div class="order-section__title"><h3>주문자 정보</h3></div>
                <div class="order-section__content">
                    <ul id="ordererInform">

                    </ul>
                </div>
            </section>
            <section class="order-section">
                <div class="order-section__title"><h3>배송 정보</h3></div>
                <div class="order-section__content">
                    <ul id="deliveryInform">

                    </ul>
                </div>
            </section>
            <div class="order-container__parent">
                <div class="order-container__child">
                    <section class="order-section">
                        <div class="order-section__title"><h3>쿠폰</h3></div>
                        <div class="order-section__content">
                            <ul id="orderCoupons">

                            </ul>
                        </div>
                    </section>
                    <section class="order-section">
                        <div class="order-section__title"><h3>결제 수단</h3></div>
                        <div class="order-section__content">
                            <ul id="paymentMethod">

                            </ul>
                        </div>
                    </section>
                    <section class="order-section">
                        <div class="order-section__title"><h3>개인정보 수집/제공</h3></div>
                        <div class="order-section__content">
                            <ul id="agreeOfPersonalInform">
                            </ul>
                        </div>
                    </section>
                </div>
                <div class="order-amount__container">
                    <div class="order-amount__title"><h3>결제 금액</h3></div>
                    <div class="order-amount">
                        <div class="order-amount__section">
                            <div class="order-amount__section-name">주문금액</div>
                            <div class="order-amount__section-content">
                                <span>2,610</span>
                                <span>원</span>
                            </div>
                        </div>
                        <div class="order-amount__section">
                            <div class="order-amount__section-name">배송비</div>
                            <div class="order-amount__section-content">
                                <span>3,000</span>
                                <span>원</span>
                            </div>
                        </div>
                        <div class="order-amount__section">
                            <div class="order-amount__section-name">쿠폰할인</div>
                            <div class="order-amount__section-content">
                                <span>0</span>
                                <span>원</span>
                            </div>
                        </div>
                        <div class="order-amount__section-final">
                            <div class="order-amount__section-name">최종결제금액</div>
                            <div class="order-amount__section-content">
                                <span>5,610</span>
                                <span>원</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(() => {

            })
        </script>
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </body>
</html>
