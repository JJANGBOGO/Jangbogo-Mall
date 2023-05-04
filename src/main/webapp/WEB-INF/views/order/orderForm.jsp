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
        <link rel="stylesheet" href="/css/modal.css"/>
        <link rel="stylesheet" href="/css/order/orderCancel.css">
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
        <script src = "/js/order/format.js"></script>
    </head>
    <body>
        <%@ include file="/WEB-INF/views/include/navbar.jsp" %>
        <div class="order-container">
            <h1 class="order-title">주문서</h1>
            <section class="order-section">
                <div class="order-section__title">
                    <h3>주문 상품</h3>
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
                <div class="order-section__content" id="deliveryInform"></div>
            </section>
            <div class="order-container__parent">
                <div class="order-container__child">
                    <section class="order-section" id="orderSectionCoupon">
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
        <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
        <script>
            // 메서드명 : orderBtnToHtml
            // 기   능 : '결제하기' 버튼을 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
            // 매개변수 : items
            // 반환타입 : String
            const orderBtnToHtml = (items) => {
                let price = 0;                                                                                          // 변수명 : price - 저장값 : 결제 총 금액
                items.forEach((item) => {
                    price += item.prod_price * item.prod_cnt;
                })
                let tmp = "";                                                                                           // 변수명 : tmp - 저장값 : 동적으로 생성할 html 태그(문자열)
                tmp += "<span>";
                tmp += formatPriceWithComma(price + 2500) + "원";
                tmp += " 결제하기</span>";
                return tmp;
            }

            // 메서드명 : invoiceToHtml
            // 기   능 : 결제 금액 정보를 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
            // 매개변수 : items
            // 반환타입 : String
            const invoiceToHtml = (items) => {
                let price = 0;                                                                                          // 변수명 : price - 저장값 : 결제 총 금액
                items.forEach((item) => {
                    price += item.prod_price * item.prod_cnt;
                })
                let tmp = "";                                                                                           // 변수명 : tmp - 저장값 : 동적으로 생성할 html 태그(문자열)
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
            const listToHtml = (items) => {
                let itemCnt = items.length;                                                                             // 변수명 : itemCnt - 저장값 : 장바구니에 담긴 모든 품목 개수
                let itemsQuantity = 0;                                                                                  // 변수명 : itemsQuantity - 저장값 : 장바구니에 담긴 모든 품목 개수의 합
                let tmp = "<ul>";                                                                                       // 변수명 : tmp - 저장값 : 동적으로 생성할 html 태그(문자열)

                // 메서드명 : forEach
                // 기   능 : 복수의 CartDto값들을 저장한 list에서 각각의 CartDto에 저장된 iv들을 적절한 태그의 속성값 또는 내용에 위치시키는 메서드
                // 사용대상 : items - Array : List<CartDto>, 장바구니 목록
                // 매개변수 : item - Object : CartDto, 장바구니 개별 품목
                items.forEach((item) => {
                    tmp += '<li class="order-item" data-pid=' + item.prod_idx + ' data-uid=' + item.user_idx +' >';
                    tmp += '<img src=' + item.upload_path + " alt='' />";
                    tmp += "<div class='order-item__title'>" + item.prod_name + "</div>";
                    tmp += '<div class="order-item__contents">';
                    tmp += '<div class="order-item__count">' + item.prod_cnt + "<span>개</span></div>";
                    tmp += "<div class='order-item__price'>" + formatPriceWithComma(item.prod_price * item.prod_cnt) + "<span>원</span></div>";
                    tmp += '</div>';
                    tmp += '</li>';
                    itemsQuantity += item.prod_cnt;                                                                     // 변수 itemsQuantity에 각 품목의 개수만큼 추가한다.
                })
                tmp += '<input type="hidden" value="' + itemCnt + '" id="itemsCnt"/>';
                tmp += '<input type="hidden" value="' + itemsQuantity + '" id="itemsQuantity"/>';
                return tmp += '</ul>';
            }

            // 메서드명 : ordererToHtml
            // 기   능 : 주문자 정보를 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
            // 매개변수 : ordererInfo - 주문자정보(user)
            // 반환타입 : String - 동적으로 생성한 html 태그 모음(tmp)
            const ordererToHtml = (ordererInfo) => {
                let tmp = "";                                                                                           // 변수명 : tmp - 저장값 : 동적으로 생성할 html 태그(문자열)
                tmp += "<div class='orderer-section'>";
                tmp += "<div class='orderer-inform'>";
                tmp += "<span>보내는 분</span>";
                tmp += "</div>";
                tmp += "<div class='orderer-value'>";
                tmp += "<span id='ordererName' >" + ordererInfo.nick_nm + "</span>";
                tmp += "</div>";
                tmp += "</div>";
                tmp += "<div class='orderer-section'>";
                tmp += "<div class='orderer-inform'>";
                tmp += "<span>휴대폰</span>";
                tmp += "</div>";
                tmp += "<div class='orderer-value'>";
                tmp += "<span id='ordererMpno' >" + formatMpnoWithHyphen(ordererInfo.mpno) + "</span>";
                tmp += "</div>";
                tmp += "</div>";
                tmp += "<div class='orderer-section'>";
                tmp += "<div class='orderer-inform'>";
                tmp += "<span>이메일</span>";
                tmp += "</div>";
                tmp += "<div class='orderer-value'>";
                tmp += "<span>" + ordererInfo.email + "</span>";
                tmp += "<div class='orderer-value__paragraph'>";
                tmp += "<p>이메일을 통해 주문처리과정을 보내드립니다.</p>";
                tmp += "<p>정보 변경은 마이페이지 > 개인정보 수정 메뉴에서 가능합니다.</p>";
                tmp += "</div>";
                tmp += "</div>";
                tmp += "</div>";
                return tmp;
            }

            // 메서드명 : deliveryToHtml
            // 기   능 : 배송 정보를 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
            // 매개변수 : items - deliveryDto
            // 반환타입 : String - 동적으로 생성한 html 태그 모음(tmp)
            const deliveryToHtml = (deliveryInfo) => {
                let tmp = "";                                                                                           // 변수명 : tmp - 저장값 : 동적으로 생성할 html 태그(문자열)
                tmp += "<div class='delivery-section'>"
                tmp += "<div class='delivery-inform'>"
                tmp += "<span>배송지</span>"
                tmp += "</div>"
                tmp += "<div id='deliveryAddress' class='delivery-value' >"
                tmp += "<span>" + deliveryInfo[0].addr_base + " </span>"
                tmp += "<span>" + deliveryInfo[0].addr_dtl + "</span>"
                tmp += "</div>"
                tmp += "</div>"
                tmp += "<div class='delivery-section'>"
                tmp += "<div class='delivery-inform'>"
                tmp += "<span>상세정보</span>"
                tmp += "</div>"
                tmp += "<div class='delivery-value'>"
                tmp += "<div class='delivery-value__column' id='deliveryRecipient'>"
                tmp += "<span>" + "받으실 분 정보를 입력해주세요." + "</span>"
                tmp += "</div>"
                tmp += "<div class='delivery-value__column' id='deliveryLocation'>"
                tmp += "</div>"
                tmp += "<div class='delivery-value__column'>"
                tmp += "<button type='button' id='deliveryModBtn'>입력</button>"
                tmp += "</div>"
                tmp += "</div>"
                tmp += "</div>"
                return tmp;
            }

            // 메서드명 : couponListToHtml                                                                                // TODO:3차 개발
            // 기   능 : 주문자가 소유한 쿠폰 목록을 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
            // 매개변수 : items - CouponDto
            // 반환타입 : String - 동적으로 생성한 html 태그 모음(tmp)
            // function couponListToHtml(couponList) {
            //     let tmp = "";                                                                                        // 변수명 : tmp - 저장값 : 동적으로 생성할 html 태그(문자열)
            //     tmp += "<div class='order__coupon-section'>";
            //     tmp += "<div class='order__coupon-inform'>"
            //     tmp += "<span>쿠폰</span>"
            //     tmp += "</div>"
            //     tmp += "<div class='order__coupon-value'>"
            //     tmp += "<select name='coupons' id='coupons'>"
            //     tmp += "<option value='default'>" + "사용가능 쿠폰 2장 / 전체 2장" + "</option>"
            //     // 메서드명 : forEach
            //     // 기   능 : 복수의 CouponDto값들을 저장한 list에서 각각의 CouponDto에 저장된 iv들을 적절한 태그의 속성값 또는 내용에 위치시키는 메서드
            //     // 사용대상 : items - Array : List<CouponDto>, 주문자가 소유한 쿠폰 목록
            //     // 매개변수 : item - Object : CouponDto, 주문자가 소유한 개별 쿠폰
            //     couponList.forEach((coupon) => {
            //         tmp += "<option value=" + coupon +  ">" + coupon + "</option>"
            //     })
            //     tmp += "</select>"
            //     tmp += "</div>";
            //     tmp += "</div>";
            //     return tmp;
            // }

            // 메서드명 : paymentMethodsToHtml
            // 기   능 : 결제수단 목록을 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
            // 매개변수 : paymentMethods - 결제수단
            // 반환타입 : String - 동적으로 생성한 html 태그 모음(tmp)
            const paymentMethodsToHtml = (paymentMethods) => {
                let tmp = "";                                                                                           // 변수명 : tmp - 저장값 : 동적으로 생성할 html 태그(문자열)
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
            const showItemList = (user_idx) => {
                $.ajax({                                                                                                // $.ajax() start
                    type:'GET',                                                                                         // 요청 메서드
                    url:'/order/checkout/item-list?user_idx=' + user_idx,                                               // 요청URI
                    success: (result) => {                                                                              // 성공 응답이 오면, 주문 상품 정보를 페이지에 랜더링하기
                        $('#orderItems').html(listToHtml(result));                                                      // listToHtml메서드 호출
                        $('.order-amount__container').html(invoiceToHtml(result));                                      // invoiceToHtml 메서드 호출
                        $('.order-button > button').html(orderBtnToHtml(result));                                       // orderBtnToHtml 메서드 호출
                        checkItemQuantity(result);                                                                      // checkItemQuantity 호출
                    },
                    error : function() { alert("showItemList 실패 응답 : 회원번호 누락");}                                    // 실패 응답이 오면, 경고창 띄우기
                });                                                                                                     // $.ajax() end
            }

            // 메서드명 : checkItemQuantity
            // 기   능 : 장바구니 목록 개수가 0개인 경우, 장바구니 페이지로 이동
            // 매개변수 : items - Object
            const checkItemQuantity = (items) => {
                if (!items.length) {
                    alert("장바구니에 상품을 담아주세요.")
                    location.href = "/cart";
                }
            }

            // 메서드명 : showOrdererInfo
            // 기   능 : orderController에 ajax요청하여 주문자 정보를 가져온다.
            // 매개변수 : user_idx - 회원번호
            const showOrdererInfo = (user_idx) => {
                $.ajax({                                                                                                // $.ajax() start
                    type:'GET',                                                                                         // 요청 메서드
                    url:'/order/checkout/orderer?user_idx=' + user_idx,                                                 // 요청URI
                    success: (result) => {                                                                              // 성공 응답이 오면, 주문자 정보를 페이지에 랜더링하기
                        $('#ordererInform').html(ordererToHtml(result));                                                // ordererToHtml메서드 호출
                    },
                    error : function() { alert("showOrderInfo 실패 응답 : 회원번호 누락");}                                   // 실패 응답이 오면, 경고창 띄우기
                });                                                                                                     // $.ajax() end
            }

            // 메서드명 : showDeliveryInfo
            // 기   능 : orderController에 ajax요청하여 배송 정보를 가져온다.
            // 매개변수 : user_idx - 회원번호
            const showDeliveryInfo = (user_idx) => {
                $.ajax({                                                                                                // $.ajax() start
                    type:'GET',                                                                                         // 요청 메서드
                    url:'/order/checkout/delivery?user_idx=' + user_idx,                                                // 요청URI
                    success: (result) => {                                                                              // 성공 응답이 오면, 배송 정보를 페이지에 랜더링하기
                        $('#deliveryInform').html(deliveryToHtml(result));                                              // deliveryToHtml메서드 호출
                        $('#deliveryRecipient > span').css('color', 'rgb(240, 63, 64)');
                    },
                    error : function() { alert("showDeliveryInfo 실패 응답 : 회원번호 누락");}                                // 실패 응답이 오면, 경고창 띄우기
                });                                                                                                     // $.ajax() end                 //
            }

            // 메서드명 : showCouponList                                                                                   // TODO:3차 개발
            // 기   능 : orderController에 ajax요청하여 주문자가 소유한 쿠폰 목록을 가져온다.
            // 매개변수 : user_idx - 회원번호
            const showCouponList = (user_idx) => {
                $.ajax({                                                                                                // $.ajax() start
                    type:'GET',                                                                                         // 요청 메서드
                    url:'/order/checkout/coupons?user_idx=' + user_idx,                                                 // 요청URI
                    success: (result) => {                                                                              // 성공 응답이 오면, 쿠폰 정보를 페이지에 랜더링하기
                        $('#couponList').html(couponListToHtml(result));                                                // couponListToHtml메서드 호출
                    },
                    error : function() { alert("showCouponList 실패 응답 : 회원번호 누락");}                                  // 실패 응답이 오면, 경고창 띄우기
                });                                                                                                     // $.ajax() end
            }

            // 메서드명 : showPaymentMethod
            // 기   능 : 결제수단 목록을 가져온다.
            // 매개변수 : user_idx - 회원번호
            const showPaymentMethods = (user_idx) => {
                $.ajax({                                                                                                // $.ajax() start
                    type:'GET',
                    url:'/order/checkout/payment?user_idx=' + user_idx,
                    success: (result) => {                                                                              // 성공 응답이 오면, 쿠폰 정보를 페이지에 랜더링하기
                        $('#paymentMethod').html(paymentMethodsToHtml(result));                                         // couponListToHtml메서드 호출
                    },
                    error : function() { alert("showPaymentMethods 실패 응답 : 회원번호 누락");}                              // 실패 응답이 오면, 경고창 띄우기
                });                                                                                                     // $.ajax() end
            }

            // 메서드명 : showPersonalInfoAgreement                                                                       // TODO:3차 개발
            // 기   능 : 개인정보 수집/제공을 가져온다.
            // function showPersonalInfoAgreement(idx) {
            //
            // }

            $(document).ready(() => {                                                                                   // 즉시 실행 함수 start - js의 window.onload(() => {...})
                let idx = `${idx}`;                                                                                     // 변수명 : idx - 저장값 : 세션에 저장된 회원번호(user_idx)

                showItemList(idx);                                                                                      // 메서드 호출 start - TODO: showCouponList(idx); 3차 개발
                showOrdererInfo(idx);
                showDeliveryInfo(idx);
                showPaymentMethods(idx);                                                                                // 메서드 호출 end

                // 메서드명 : popupCenter
                // 기   능 : 자식창을 열고, 스크린 가운데로 위치시키기
                // 매개변수 : String url, Integer width, Integer height
                const popupCenter = (url, width, height) => {
                    let xPos = (document.body.offsetWidth/2) - (width/2);                                               // 수평 정렬
                    let yPos = (document.body.offsetHeight/2) - (height/2);                                             // 수직 정렬
                    xPos += window.screenLeft;                                                                          // 듀얼 모니터일 때
                    window.open(url, "장보고", "width="+ width +", height="+ height +", left="+xPos+", top="+yPos+", " +  // 팝업창 띄우기
                        "menubar=yes, status=yes, titlebar=yes, resizable=yes");
                }

                // 이벤트 대상 : #deliveryModBtn 배송 정보 수정 버튼
                // 이벤트 : click
                // 이벤트 핸들러 기능 : '수정' 버튼 클릭 시, 배송 상제 정보 수정 창 새로 띄우기
                $(document).on("click", "#deliveryModBtn", (e) => {                                                     // 배송정보 수정 페이지를 새창에 띄워야 한다.
                    let url = "/order/checkout/recipient-details";                                                      // 변수명 : url - 새창에 해당하는 url
                    popupCenter(url, 500, 800);                                                                         // 메서드 호출 - 팝업을 가운데 위치시키기 위해 값 구하기
                });

                // 이벤트 대상 : #paymentBtn 결제하기 버튼
                // 이벤트 : click
                // 이벤트 핸들러 기능 : '결제하기' 버튼 클릭 시,                                                                  (3) 결제 페이지로 이동
                $(document).on("click", "#paymentBtn", (e) => {
                    // TODO: 버튼 클릭 시, 주문자 정보가 입력되지 않으면 모달창을 불러온다.
                    if($('#deliveryModBtn').text() !== '수정') {
                        // display:none -> display: block으로 바꿔야 한다.
                        $('div#orderFormSubmitFailModal').css('display', 'block');
                        $(document).on("click", "#orderFormSubmitFailureBtn", () => {
                            $('div#orderFormSubmitFailModal').css('display', 'none');
                        })
                        return;
                    }
                    let ordr_name = $("#ordererName").text();                                                           // 변수명 : orderer_name - 저장값 : 주문자이름를 저장한 요소 참조
                    let ordr_mpno = $("#ordererMpno").text();                                                           // 변수명 : orderer_mpno - 저장값 : 주문자휴대폰번호를 저장한 요소 참조
                    ordr_mpno =formatMpnoWitoutHyphen(ordr_mpno);                                                       // 주문자휴대전화번호에서 하이픈 삭제(010-8888-9999 -> 01088889999)

                    let total_amount = $(".order-amount__section-final .order-amount__section-content span").text();     // 변수명 : total_amojunt - 저장값 : 주문총금액
                    total_amount = total_amount.slice(0, total_amount.length - 1);                                      // 주문총금액에서 "원" 삭제(예. 43,500원 -> 43,500)
                    total_amount = formatPriceWithoutComma(total_amount);                                               // 주문총금액에서 "콤마" 삭제(예. 43500)

                    let itemsCnt = $("#itemsCnt").val();                                                                // 변수명 : itemCnt - 저장값 : 장바구니에 담긴 모든 품목 개수를 저장한 요소의 value 참조
                    let itemsQuantity = $("#itemsQuantity").val();                                                      // 변수명 : itemsQuantity - 저장값 : 장바구니에 담긴 모든 품목 개수의 합을 저장한 요소의 value 참조
                    let item_name = $(".order-item:first-child .order-item__title").text();                              // 변수명 : item_name - 저장값 : 주문상품명을 저장한 요소 참조
                    item_name = (itemsCnt < 2) ? item_name : (item_name+ " 외 " + (itemsCnt - 1) + "건");                // 주문상품의 품목 개수가 2개 이상일 경우, item_name의 저장값은 '상품명 외 (n-1)건'로 수정

                    let addr_base = $("#deliveryAddress > span:first-of-type").text();
                    let addr_dtl = $("#deliveryAddress > span:last-of-type").text();
                    let plrcv = $("#deliveryLocation > span:last-of-type").text();
                    let rcpr_nm = $("#deliveryRecipient > span:first-of-type").text();
                    let rcpr_mpno = $("#deliveryRecipient > span:last-of-type").text();

                    let delivery = {
                        "rcpr_nm" : rcpr_nm,
                        "rcpr_mpno" : rcpr_mpno,
                        "rcpr_addr_base" : addr_base,
                        "rcpr_addr_dtl" : addr_dtl,
                        "plrcv" : plrcv,
                    }

                    let orderDto = {                                                                                    // 변수명 : orderDto - 저장값 : KakaoReadyRequestDto 객체에 K/V로 담아 전송할 OrderDto 객체
                        "user_idx" : idx,
                        "ordr_nm" : ordr_name,
                        "mpno" : ordr_mpno,
                        "tot_amt" : total_amount,
                        "gtot" : itemsQuantity,
                        "plist_tot" : itemsCnt,
                    }

                    let kakaoReadyRequest = {                                                                           // 변수명 : kakaoReadyRequest - 저장값 : 서버로 전송할 데이터
                        "item_name" : item_name,                                                                        // 값목록 : (1) 주문상품명(item_name), (2) 주문상품개수(quantity), (3) 주문총금액(total_amount)
                        "quantity" : itemsQuantity,
                        "total_amount" : total_amount,
                        "orderDto" : orderDto,
                        "deliveryDto" : delivery
                    }

                    let kakaoReadyResponse = {};                                                                        // 서버로부터 도착한 응답에 담긴 데이터를 저장할 변수 kakaoReadyResponse
                    $.ajax({                                                                                            // $.ajax() start
                        type: 'POST',                                                                                   // 요청 메서드
                        url:'/payment/kakao/ready',                                                                     // 요청URI
                        headers: {"content-type" : "application/json; charset=UTF-8"},                                  // 요청 헤더 - 적시하지 않으면, 데이터가 서버에서 깨진 채로 전송된다.
                        dataType:'text',                                                                                // 전송할 데이터 타입
                        data: JSON.stringify(kakaoReadyRequest),                                                        // 서버로 전송할 데이터. 직렬화 필요.
                        success:function(data) {                                                                        // 서버로부터 응답이 도착하면 호출될 함수
                            kakaoReadyResponse = JSON.parse(data);                                                      // 직렬화된 JSON객체를 파싱한 객체
                            location.href= kakaoReadyResponse.next_redirect_pc_url +                                    // 결제 준비 페이지로 리다이렉트
                                "?tid=" + kakaoReadyResponse.tid;
                        },
                        error:function(error) {                                                                         // 에러가 발생했을 때 호출될 함수
                            alert(error);
                        }
                    })                                                                                                  // $.ajax() end
                })
            })                                                                                                          // $(document).ready(() => {}) end
        </script>
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>                                                          <!-- include 액션 태그 - footer -->
        <div class="background show" id="orderFormSubmitFailModal">
            <div class="popup order-cancel__popup">
                <div class="order-cancel__popup-title">받으실 분 정보를 입력해주세요.</div>
                <button type="button" id="orderFormSubmitFailureBtn">확인</button>
            </div>
        </div>
    </body>
</html>