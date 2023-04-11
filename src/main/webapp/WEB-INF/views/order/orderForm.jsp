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
            /* 공통 태그 */
            * {
                box-sizing: border-box;
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

            /* 주문서 페이지 container */
            .order-container {
                padding: 50px 0 60px 0;
                width: 1050px;
                margin: 0 auto;
            }

            /* 주문서 페이지 제목 */
            .order-title {
                text-align: center;
                padding-bottom: 48px;
                font-weight: 500;
                font-size: 28px;
                line-height: 29px;
            }

            /* 모든 주문 관련 정보 섹션 태그 */
            .order-section:not(:first-of-type) {
                margin-top: 75px;
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

            /* 쿠폰, 결제 수단, 개인정보 수집/제공 정보 섹션 컨테이너 */
            .order-container__parent {
                display: flex;
                justify-content: space-between;
            }
            .order-container__child {
                width: 724px;
            }

            /* 결제 금액 섹션 컨테이너 */
            .order-amount__container {
                position: relative;
                width: 284px;
            }

            /* 결제 금액 섹션 박스 */
            .order-amount__box {
                position: absolute;
                top: 0px;
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

            /* 주문 상품 섹션 */
            #orderItems {
                padding: 0;
            }
            .order-item {
                display: flex;
                align-items: center;
                list-style: none;
                padding: 25px 0;
            }
            .order-item:not(:last-child) {
                border-bottom: 1px solid rgb(244, 244, 244);
            }
            .order-item__title {
                width: 50%;
                text-align: left;
                font-weight: 600;
                margin-left: 40px;
            }
            .order-item__contents {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 180px;
                margin-left: 240px;
            }
            .order-item__count {
                text-align: center;
            }
            .order-item__price {
                font-weight: 700;
                text-align: right;
                width: 80px;
            }
            .order-item > img {
                display: inline-block;
                width: 60px;
                height: 78px;
            }

            /* 주문자 정보 섹션 */
            #ordererInform {
                padding: 10px 0;
            }
            .orderer-section {
                display: flex;
                justify-content: left;
                align-items: flex-start;
                padding: 8px 0;
            }
            .orderer-inform {
                width: 160px;
                font-size: 14px;
                font-weight: 600;
                margin-right: 30px;
            }
            .orderer-value {
                width: 70%;
                font-size: 14px;
            }
            .orderer-value__paragraph > p {
                font-size: 12px;
                line-height: 21px;
                color: rgb(102, 102, 102);
            }
            /* 주문서 관련 주석 */
            .paragraph {
                padding-left: 16px;
                font-size: 12px;
                line-height: 16px;
                color: rgb(102, 102, 102);
            }
            .paragraph::before {
                display: inline-block;
                width: 16px;
                margin-left: -16px;
                content: "※";
            }

            /* 주문완료 버튼 */
            .order-button {
                text-align: center;
            }
            .order-button > button {
                display: block;
                padding: 0 10px;
                text-align: center;
                overflow: hidden;
                width: 240px;
                height: 56px;
                border-radius: 3px;
                background-color: var(--primary-color);
                border: 0px none;
                margin: 40px auto 30px;
                font-weight: 500;
            }
            .order-button > button > span {
                display: inline-block;
                font-size: 16px;
                font-weight: 500;
                color: rgb(255, 255, 255);
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
                <div class="order-section__content" id="orderItems">
                </div>
            </section>
            <section class="order-section">
                <div class="order-section__title"><h3>주문자 정보</h3></div>
                <div class="order-section__content" id="ordererInform">

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
                    <p class="paragraph">
                        주문완료 상태일 경우에만 주문 취소가 가능하며, 상품 미배송 시 결제하신 수단으로 환불됩니다.
                    </p>
                    <p class="paragraph">
                        컬리 내 개별 판매자가 등록한 오픈마켓 상품의 경우 컬리는 통신판매중개자로서 주문, 품질, 교환/환불 등 의무와 책임을 부담하지 않습니다.
                    </p>
                    <div class="order-button">
                        <button class="css-1lha8en e4nu7ef3" type="button"><span>5,610원 결제하기</span></button>
                    </div>
                </div>
                <div class="order-amount__container">
                    <div class="order-amount__box">
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
        </div>
        <script>
            // 메서드명 : listToHtml
            // 기   능 : 주문 상품 정보를 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
            // 매개변수 : items - cartDto
            // 반환타입 : String - 동적으로 생성한 html 태그 모음(tmp)
            let listToHtml = (items) => {
                // 변수명 : tmp
                // 저장값 : 동적으로 생성할 html 태그(문자열)
                let tmp = "<ul>";

                // 메서드명 : forEach
                // 기   능 : 복수의 CartDto값들을 저장한 list에서 각각의 CartDto에 저장된 iv들을 적절한 태그의 속성값 또는 내용에 위치시키는 메서드
                // 사용대상 : items - Array : List<CartDto>, 장바구니 목록
                // 매개변수 : item - Object : CartDto, 장바구니 개별 품목
                items.forEach((item) => {
                    tmp += '<li class="order-item" data-pid=' + item.prod_idx + ' data-uid=' + item.user_idx +' >';
                    tmp += '<img src=' + item.prod_rpath + " alt='' />";
                    tmp += "<div class='order-item__title'>" + item.prod_name + "</div>";
                    tmp += '<div class="order-item__contents">';
                    tmp += '<div class="order-item__count">' + item.prod_cnt + "<span>개</span></div>";
                    tmp += "<div class='order-item__price'>" + item.prod_price * item.prod_cnt + "<span>원</span></div>";
                    tmp += '</div>';
                    tmp += '</li>';
                })
                // 변수명 : cnt
                // 저장값 : 장바구니에 담긴 모든 품목 개수
                let cnt = items.length;
                return tmp += '</ul>';
            }

            // 메서드명 : ordererToHtml
            // 기   능 : 주문자 정보를 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
            // 매개변수 : ordererInfo - Object(User)
            // 반환타입 : String - 동적으로 생성한 html 태그 모음(tmp)
            let ordererToHtml = (ordererInfo) => {
                // 변수명 : tmp
                // 저장값 : 동적으로 생성할 html 태그(문자열)
                let tmp = "";

                tmp += "<div class='orderer-section'>"
                tmp += "<div class='orderer-inform'>"
                tmp += "<span>보내는 분</span>"
                tmp += "</div>"
                tmp += "<div class='orderer-value'>"
                tmp += "<span>" + ordererInfo.nick_nm + "</span>"
                tmp += "</div>"
                tmp += "</div>"
                tmp += "<div class='orderer-section'>"
                tmp += "<div class='orderer-inform'>"
                tmp += "<span>휴대폰</span>"
                tmp += "</div>"
                tmp += "<div class='orderer-value'>"
                tmp += "<span>" + ordererInfo.mpno + "</span>"
                tmp += "</div>"
                tmp += "</div>"
                tmp += "<div class='orderer-section'>"
                tmp += "<div class='orderer-inform'>"
                tmp += "<span>이메일</span>"
                tmp += "</div>"
                tmp += "<div class='orderer-value'>"
                tmp += "<span>" + ordererInfo.email + "</span>"
                tmp += "<div class='orderer-value__paragraph'>"
                tmp += "<p>이메일을 통해 주문처리과정을 보내드립니다.</p>"
                tmp += "<p>정보 변경은 마이페이지 > 개인정보 수정 메뉴에서 가능합니다.</p>"
                tmp += "</div>"
                tmp += "</div>"
                tmp += "</div>"
                 ;
            return tmp;
            }

            let showItemList = (user_idx) => {
                // ajax 요청(비동기)
                $.ajax({
                    type:'GET',
                    url:'/cart/list?user_idx=' + user_idx,
                    success: (result) => {                                              // 성공 응답이 오면, 주문 상품 정보를 페이지에 랜더링하기
                        $('#orderItems').html(listToHtml(result));                      // listToHtml메서드 호출
                    },
                    error : function() { alert("showItemList 실패 응답 : 회원번호 누락");}   // 실패 응답이 오면, 경고창 띄우기
                });  // $.ajax() end
            }

            let showOrdererInfo = (user_idx) => {
                // ajax 요청(비동기)
                $.ajax({
                    type:'GET',
                    url:'/order/orderer?user_idx=' + user_idx,
                    success: (result) => {                                              // 성공 응답이 오면, 주문자 정보를 페이지에 랜더링하기
                        $('#ordererInform').html(ordererToHtml(result));                // ordererToHtml메서드 호출
                    },
                    error : function() { alert("showOrderInfo 실패 응답 : 회원번호 누락");}   // 실패 응답이 오면, 경고창 띄우기
                });  // $.ajax() end
            }

            $(document).ready(() => {
                // TODO : 세션에서 회원번호를 가져와야 한다. 세션 연동 시, 추후 테스트 필요.
                // 변수명 : idx
                // 저장값 : 세션에 저장된 회원번호(user_idx)
                let idx = `${idx}`;

                // 메서드 호출
                showItemList(idx);
                showOrdererInfo(idx);
            })
        </script>
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </body>
</html>
