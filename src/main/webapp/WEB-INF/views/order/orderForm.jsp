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
        <link rel="stylesheet" href="/css/order/orderForm.css"/>
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
        <script src = "/js/order/format.js"></script>
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
                <div class="order-section__content" id="deliveryInform">

                </div>
            </section>
            <div class="order-container__parent">
                <div class="order-container__child">
                    <section class="order-section">
                        <div class="order-section__title"><h3>쿠폰</h3></div>
                        <div class="order-section__content" id="couponList" ></div>
                    </section>
                    <section class="order-section">
                        <div class="order-section__title"><h3>결제 수단</h3></div>
                        <div class="order-section__content" id="paymentMethod"></div>
                    </section>
                    <section class="order-section">
                        <div class="order-section__title"><h3>개인정보 수집/제공</h3></div>
                        <div class="order-section__content" id="agreeOfPersonalInform">
                            <div class="order__personalInfo-section">
                                <span>개인정보 수집∙이용 및 처리 동의</span>
                                <button type="button" id="personalPolicyBtn">보기</button>
                            </div>
                            <div class="order__personalInfo-section">
                                <span>전자지급 결제대행 서비스 이용약관 동의</span>
                                <button type="button" id="paymentPolicyBtn">보기</button>
                            </div>
                            <div class="order__personalInfo-section">
                                <span>위 내용을 확인 하였으며 결제에 동의합니다.</span>
                            </div>
                        </div>
                    </section>
                    <p class="paragraph">
                        주문완료 상태일 경우에만 주문 취소가 가능하며, 상품 미배송 시 결제하신 수단으로 환불됩니다.
                    </p>
                    <p class="paragraph">
                        컬리 내 개별 판매자가 등록한 오픈마켓 상품의 경우 컬리는 통신판매중개자로서 주문, 품질, 교환/환불 등 의무와 책임을 부담하지 않습니다.
                    </p>
                    <div class="order-button">
                        <button type="button" id="paymentBtn"></button>
                    </div>
                </div>
                <div class="order-amount__container"></div>
            </div>
        </div>
        <script>
            // 메서드명 : orderBtnToHtml
            // 기   능 : '결제하기' 버튼을 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
            let orderBtnToHtml = (items) => {
                let price = 0;
                items.forEach((item) => {
                    price += item.prod_price * item.prod_cnt;
                })
                let tmp = "";
                tmp += "<span>";
                tmp += formatPriceWithComma(price + 2500) + "원";
                tmp += " 결제하기</span>";
                return tmp;
            }

            // 메서드명 : invoiceToHtml
            // 기   능 : 결제 금액 정보를 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
            let invoiceToHtml = (items) => {
                let price = 0;
                items.forEach((item) => {
                    price += item.prod_price * item.prod_cnt;
                })
                let tmp = "";
                tmp += '<div class="order-amount__box">'
                tmp += '<div class="order-amount__title"><h3>결제 금액</h3></div>'
                tmp += '<div class="order-amount">'
                tmp += '<div class="order-amount__section">'
                tmp += '<div class="order-amount__section-name">주문금액</div>'
                tmp += '<div class="order-amount__section-content">'
                tmp += '<span>' + formatPriceWithComma(price) + '</span>'
                tmp += '<span>원</span>'
                tmp += '</div>'
                tmp += '</div>'
                tmp += '<div class="order-amount__section">'
                tmp += '<div class="order-amount__section-name">배송비</div>'
                tmp += '<div class="order-amount__section-content">'
                tmp += '<span>2,500</span>'
                tmp += '<span>원</span>'
                tmp += '</div>'
                tmp += '</div>'
                tmp += '<div class="order-amount__section">'
                tmp += '<div class="order-amount__section-name">쿠폰할인</div>'
                tmp += '<div class="order-amount__section-content">'
                tmp += '<span>0</span>'
                tmp += '<span>원</span>'
                tmp += '</div>'
                tmp += '</div>'
                tmp += '<div class="order-amount__section-final">'
                tmp += '<div class="order-amount__section-name">최종결제금액</div>'
                tmp += '<div class="order-amount__section-content">'
                tmp += '<span>' + formatPriceWithComma(price + 2500) + '</span>'
                tmp += '<span>원</span>'
                tmp += '</div>'
                tmp += '</div>'
                tmp += '</div>'
                tmp += '</div>';
                return tmp;
            }

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
                    tmp += "<div class='order-item__price'>" + formatPriceWithComma(item.prod_price * item.prod_cnt) + "<span>원</span></div>";
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
                tmp += "<span id='ordererName' >" + ordererInfo.nick_nm + "</span>"
                tmp += "</div>"
                tmp += "</div>"
                tmp += "<div class='orderer-section'>"
                tmp += "<div class='orderer-inform'>"
                tmp += "<span>휴대폰</span>"
                tmp += "</div>"
                tmp += "<div class='orderer-value'>"
                tmp += "<span id='ordererMpno' >" + formatMpnoWithHyphen(ordererInfo.mpno) + "</span>"
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
                tmp += "</div>";
                return tmp;
            }

            // 메서드명 : deliveryToHtml
            // 기   능 : 배송 정보를 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
            // 매개변수 : items - deliveryDto
            // 반환타입 : String - 동적으로 생성한 html 태그 모음(tmp)
            let deliveryToHtml = (deliveryInfo) => {
                // 변수명 : tmp
                // 저장값 : 동적으로 생성할 html 태그(문자열)
                let tmp = "";
                tmp += "<div class='delivery-section'>"
                tmp += "<div class='delivery-inform'>"
                tmp += "<span>배송지</span>"
                tmp += "</div>"
                tmp += "<div id='deliveryAddress' class='delivery-value' >"
                tmp += "<span>" + deliveryInfo.address + "</span>"
                tmp += "</div>"
                tmp += "</div>"
                tmp += "<div class='delivery-section'>"
                tmp += "<div class='delivery-inform'>"
                tmp += "<span>상세정보</span>"
                tmp += "</div>"
                tmp += "<div class='delivery-value'>"
                tmp += "<div class='delivery-value__column' id='deliveryRecipient'>"
                tmp += "<span>" + deliveryInfo.recipient + "</span> , <span>" + formatMpnoWithHyphen(deliveryInfo.mpno) + "</span>"
                tmp += "</div>"
                tmp += "<div class='delivery-value__column' id='deliveryLocation'>"
                tmp += "<span>받으실 장소 | " + deliveryInfo.pickUpLocation + "</span>"
                tmp += "</div>"
                tmp += "<div class='delivery-value__column'>"
                tmp += "<button type='button' id='deliveryModBtn'>수정</button>"
                tmp += "</div>"
                tmp += "</div>"
                tmp += "</div>"
                return tmp;
            }

            // 메서드명 : couponListToHtml
            // 기   능 : 주문자가 소유한 쿠폰 목록을 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
            // 매개변수 : items - CouponDto
            // 반환타입 : String - 동적으로 생성한 html 태그 모음(tmp)
            function couponListToHtml(couponList) {
                // 변수명 : tmp
                // 저장값 : 동적으로 생성할 html 태그(문자열)
                let tmp = "";
                tmp += "<div class='order__coupon-section'>";
                tmp += "<div class='order__coupon-inform'>"
                tmp += "<span>쿠폰</span>"
                tmp += "</div>"
                tmp += "<div class='order__coupon-value'>"
                tmp += "<select name='coupons' id='coupons'>"
                tmp += "<option value='default'>" + "사용가능 쿠폰 2장 / 전체 2장" + "</option>"
                // 메서드명 : forEach
                // 기   능 : 복수의 CouponDto값들을 저장한 list에서 각각의 CouponDto에 저장된 iv들을 적절한 태그의 속성값 또는 내용에 위치시키는 메서드
                // 사용대상 : items - Array : List<CouponDto>, 주문자가 소유한 쿠폰 목록
                // 매개변수 : item - Object : CouponDto, 주문자가 소유한 개별 쿠폰
                couponList.forEach((coupon) => {
                    tmp += "<option value=" + coupon +  ">" + coupon + "</option>"
                })
                tmp += "</select>"
                tmp += "</div>";
                tmp += "</div>";
                return tmp;
            }

            // 메서드명 : paymentMethodsToHtml
            // 기   능 : 결제수단 목록을 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
            // 매개변수 : items - CouponDto
            // 반환타입 : String - 동적으로 생성한 html 태그 모음(tmp)
            let paymentMethodsToHtml = (paymentMethods) => {
                // 변수명 : tmp
                // 저장값 : 동적으로 생성할 html 태그(문자열)
                let tmp = "";
                tmp += "<div class='order__payment-section'>";
                tmp +=      "<div class='order__payment-inform'>"
                tmp +=          "<span>결제수단 선택</span>"
                tmp +=      "</div>"
                tmp +=      "<div class='order__payment-value'>"
                tmp +=          "<div class='order__payment-value-section'>"
                tmp +=              "<button type='button' >"
                tmp +=              "<span>" + "Kakao Pay" + "</span>"
                tmp +=              "</button>"
                tmp +=          "</div>"
                tmp +=      "</div>"
                tmp += "</div>"
                return tmp;
            }

            // 메서드명 : showItemList
            // 기   능 : orderController에 ajax요청하여 주문 상품 목록을 가져온다.
            // 매개변수 : user_idx - 회원번호
            let showItemList = (user_idx) => {
                // ajax 요청(비동기)
                $.ajax({
                    type:'GET',
                    url:'/order/checkout/item-list?user_idx=' + user_idx,
                    success: (result) => {                                              // 성공 응답이 오면, 주문 상품 정보를 페이지에 랜더링하기
                        $('#orderItems').html(listToHtml(result));                      // listToHtml메서드 호출
                        $('.order-amount__container').html(invoiceToHtml(result));      // invoiceToHtml 호출
                        $('.order-button > button').html(orderBtnToHtml(result));
                    },
                    error : function() { alert("showItemList 실패 응답 : 회원번호 누락");}   // 실패 응답이 오면, 경고창 띄우기
                });  // $.ajax() end
            }

            // 메서드명 : showOrdererInfo
            // 기   능 : orderController에 ajax요청하여 주문자 정보를 가져온다.
            // 매개변수 : user_idx - 회원번호
            let showOrdererInfo = (user_idx) => {
                // ajax 요청(비동기)
                $.ajax({
                    type:'GET',
                    url:'/order/checkout/orderer?user_idx=' + user_idx,
                    success: (result) => {                                              // 성공 응답이 오면, 주문자 정보를 페이지에 랜더링하기
                        $('#ordererInform').html(ordererToHtml(result));                // ordererToHtml메서드 호출
                    },
                    error : function() { alert("showOrderInfo 실패 응답 : 회원번호 누락");}   // 실패 응답이 오면, 경고창 띄우기
                });  // $.ajax() end
            }

            // 메서드명 : showDeliveryInfo
            // 기   능 : orderController에 ajax요청하여 배송 정보를 가져온다.
            // 매개변수 : user_idx - 회원번호
            let showDeliveryInfo = (user_idx) => {
                // ajax 요청(비동기)
                $.ajax({
                    type:'GET',
                    url:'/order/checkout/delivery?user_idx=' + user_idx,
                    success: (result) => {                                                 // 성공 응답이 오면, 주문자 정보를 페이지에 랜더링하기
                        $('#deliveryInform').html(deliveryToHtml(result));                 // deliveryToHtml메서드 호출
                    },
                    error : function() { alert("showDeliveryInfo 실패 응답 : 회원번호 누락");}  // 실패 응답이 오면, 경고창 띄우기
                });  // $.ajax() end
            }

            // 메서드명 : showCouponList
            // 기   능 : orderController에 ajax요청하여 주문자가 소유한 쿠폰 목록을 가져온다.
            // 매개변수 : user_idx - 회원번호
            let showCouponList = (user_idx) => {
                // ajax 요청(비동기)
                $.ajax({
                    type:'GET',
                    url:'/order/checkout/coupons?user_idx=' + user_idx,
                    success: (result) => {                                                 // 성공 응답이 오면, 쿠폰 정보를 페이지에 랜더링하기
                        $('#couponList').html(couponListToHtml(result));                   // couponListToHtml메서드 호출
                    },
                    error : function() { alert("showCouponList 실패 응답 : 회원번호 누락");}  // 실패 응답이 오면, 경고창 띄우기
                });  // $.ajax() end
            }

            // 메서드명 : showPaymentMethod
            // 기   능 : 결제수단 목록을 가져온다.
            let showPaymentMethods = (user_idx) => {
                // ajax 요청(비동기)
                $.ajax({
                    type:'GET',
                    url:'/order/checkout/payment?user_idx=' + user_idx,
                    success: (result) => {                                                 // 성공 응답이 오면, 쿠폰 정보를 페이지에 랜더링하기
                        $('#paymentMethod').html(paymentMethodsToHtml(result));                   // couponListToHtml메서드 호출
                    },
                    error : function() { alert("showPaymentMethods 실패 응답 : 회원번호 누락");}  // 실패 응답이 오면, 경고창 띄우기
                });  // $.ajax() end
            }

            // 메서드명 : showPersonalInfoAgreement
            // 기   능 : 개인정보 수집/제공을 가져온다.
            function showPersonalInfoAgreement(idx) {

            }

            $(document).ready(() => {
                // TODO : 세션에서 회원번호를 가져와야 한다. 세션 연동 시, 추후 테스트 필요.
                // 변수명 : idx
                // 저장값 : 세션에 저장된 회원번호(user_idx)
                let idx = `${idx}`;

                // 메서드 호출
                showItemList(idx);
                showOrdererInfo(idx);
                showDeliveryInfo(idx);
                showCouponList(idx);
                showPaymentMethods(idx);
                showPersonalInfoAgreement(idx);

                // 메서드명 : popupCenter
                // 기   능 : 자식창을 열고, 스크린 가운데로 위치시키기
                // 매개변수 : String url, Integer width, Integer height
                function popupCenter(url, width, height) {
                    let xPos = (document.body.offsetWidth/2) - (width/2); // 가운데 정렬
                    let yPos = (document.body.offsetHeight/2) - (height/2);
                    xPos += window.screenLeft; // 듀얼 모니터일 때
                    window.open(url, "장보고", "width="+ width +", height="+ height +", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
                }

                // 이벤트 대상 : #deliveryModBtn 배송 정보 수정 버튼
                // 이벤트 : click
                // 이벤트 핸들러 기능 : '수정' 버튼 클릭 시, 배송 상제 정보 수정 창 새로 띄우기
                $(document).on("click", "#deliveryModBtn", (e) => { // 회원번호를 html태그의 data속성에서 가져와야 한다. '/order/recipient-details?user_idx=' + element2,
                    // 변수명 : url
                    // 저장값 : 새창에 해당하는 url
                    let url = "/order/checkout/recipient-details";
                    // 비동기 요청 수정
                    // 1. 수정 페이지 이동 2. 값 입력 후 저장 버튼 클릭 3. result로 값이 오고 deliveryToHtml 호출
                    // location.href(url);
                    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
                    popupCenter(url, 500, 800);
                });

                // 이벤트 대상 : #paymentBtn 결제하기 버튼
                // 이벤트 : click
                // 이벤트 핸들러 기능 : '결제하기' 버튼 클릭 시, 결제 페이지로 이동
                $(document).on("click", "#paymentBtn", (e) => {
                    $.ajax({
                        url:'/payment/kakao/ready',
                        dataType:'json',
                        success:function(data) {
                            location.href=data.next_redirect_pc_url + "?tid=" + data.tid;
                        },
                        error:function(error) {
                            alert(error);
                        }
                    })
                })
            })
        </script>
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </body>
</html>
