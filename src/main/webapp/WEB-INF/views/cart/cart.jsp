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
        <%@ include file="/WEB-INF/views/include/header.jsp" %>
        <link rel="stylesheet" href="/css/index.css"/>
        <link rel="stylesheet" href="/css/order/cart.css"/>
        <script src = "/js/order/format.js"></script>
        <title>장보고 | 장바구니</title>
    </head>
    <body>
        <div class="cart-container">
            <%@ include file="/WEB-INF/views/include/navbar.jsp" %>
            <div class="cart-title">
                <h1>장바구니</h1>
            </div>
            <div class="cart">
                <div class="cart-content">
                    <div id="totalChkBox"></div>
                    <div id="cartItems">
                    </div>
                </div>
                <div id="cartEstimate"></div>
            </div>
            <%@ include file="/WEB-INF/views/include/footer.jsp" %>
        </div>
        <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
        <script>
            // 메서드명 : dilvpToHtml
            // 기   능 : 선택된 배송지 및 배송지 변경 버튼을 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
            // 매개변수 : address - Object(Address)
            // 반환타입 : String - 동적으로 생성한 html 태그 모음(tmp)
            const dilvpToHtml = (address) => {
                let tmp = "";                                                                                           // 변수명 : tmp - 저장값 : 동적으로 생성할 html 태그(문자열)
                tmp += '<h3 class="dilvp-title">배송지</h3>'                                                              // 제목
                if(address !== "") {                                                                                    // Case 1. 사용중인 배송지가 있는 경우
                    tmp += '<span class="dilvp-content">'+ address.addr_base + ' ' + address.addr_dtl + '</span>';      // 객체에 담긴 기본 주소 & 상세 주소 값 랜더링
                    tmp += '<button type="button" id="cartAddressModBtn">배송지 변경</button>';                            // '배송지 변경' 버튼 랜더링
                } else {                                                                                                // Case 2. 사용중인 배송지가 없는 경우
                    tmp += '<span class="dilvp-content">'+ '배송지를 등록하세요!' + '</span>';                               // 배송지 등록을 유도하는 메세지 출력
                    tmp += '<button type="button" id="cartAddressModBtn">배송지 등록</button>';                            // '배송지 등록' 버튼 랜더링
                }
                return tmp;                                                                                             // 동적으로 생성한 요소 반환
            }

            // 메서드명 : listToHtml
            // 기   능 : 장바구니 목록 및 정보를 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
            // 매개변수 : items - cartDto
            // 반환타입 : String - 동적으로 생성한 html 태그 모음(tmp)
            const listToHtml = (items) => {
                let tmp = "<ul>";                                                                                       // 변수명 : tmp - 저장값 : 동적으로 생성할 html 태그(문자열)

                // 메서드명 : forEach
                // 기   능 : 복수의 CartDto값들을 저장한 list에서 각각의 CartDto에 저장된 iv들을 적절한 태그의 속성값 또는 내용에 위치시키는 메서드
                // 사용대상 : items - Array : List<CartDto>, 장바구니 목록
                // 매개변수 : item - Object : CartDto, 장바구니 개별 품목
                items.forEach((item) => {
                    tmp += '<li class="cart_item" data-pid=' + item.prod_idx + ' data-uid=' + item.user_idx +' >';          // Cart 데이터에 data속성 삽입 (1) 상품번호(prod_idx), (2) 회원번호(user_idx)
                    tmp += '<input type="checkbox" name="chk"  />';                                                         // 삭제에 사용되는 체크박스
                    tmp += '<img src=' + item.upload_path + " alt='' />";                                                   // 장바구니상품 이미지
                    tmp += "<div class='cart_item__title'>" + item.prod_name + "</div>";                                    // 장바구니상품 이름
                    tmp += '<div class="cart_item__contents">';                                                             // 장바구니상품 내용
                    tmp += '<div class="cart_item__cnt">';                                                                  // 장바구니상품 수량
                    tmp += '<div id="subtractBtn">-</div>';                                                                 // a. 상품조절개수 마이너스 버튼
                    tmp += '<div class=item__count>' + item.prod_cnt + "</div>";                                            // b. 장바구니상품수량
                    tmp += '<div id="addBtn">+</div>';                                                                      // c. 상품조절개수 플러스 버튼
                    tmp += '</div>';
                    tmp += "<div class='cart_item__price'>";                                                                // 장바구니상품 가격정보
                    tmp +=  formatPriceWithComma((item.prod_price - Math.floor(item.prod_price / 100 * item.dc_rate)) * item.prod_cnt);
                    tmp += "<span>원</span>";
                    if(item.dc_rate) {                                                                                      // 할인적용된 상품의 경우, 기존 가격 명시
                        tmp += '<span id="prevPrice">' + formatPriceWithComma(Math.floor(item.prod_price * item.prod_cnt)) + '원' + '</span>';
                    }
                    tmp += '</div>';
                    tmp += '<div class="cart_item__close">&times;</div>';                                                   // 클릭한 장바구니상품 삭제 버튼
                    tmp += '</div>';
                    tmp += '</li>';
                })
                tmp += '</ul>';
                tmp += '<div id="emptyItems">';                                                                             // 장바구니상품개수가 0인 경우 출력되는 메세지
                tmp += '<h3>장바구니에 담긴 상품이 없습니다</h3>';
                return tmp += '</div>';                                                                                     // 동적으로 생성한 요소 반환
            }

            // 메서드명 : estimateToHtml
            // 기   능 : 배송지와 주문금액 관련 정보를 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
            // 매개변수 : items - cartDto
            // 반환타입 : String - 동적으로 생성한 html 태그 모음(tmp)
            const estimateToHtml = (items) => {
                const DELIVERY_FEE = 2500;                                                                              // 상수명 : DELIVERY_FEE - 저장값 : 고정 배송비 2,500원
                let total_price = 0;                                                                                    // 변수명 : total_price -    저장값 :     상품금액
                let total_discount = 0;                                                                                 // 변수명 : total_discount - 저장값 :  상품할인금액
                let total_invoice = 0;                                                                                  // 변수명 : total_invoice -  저장값 :  결제예정금액
                let tmp = "";                                                                                           // 변수명 : tmp - 저장값 : 동적으로 생성할 html 태그(문자열)

                // 메서드명 : forEach
                // 기   능 : 복수의 CartDto값들을 저장한 list에서 각각의 CartDto에 저장된 iv들을 적절한 태그의 속성값 또는 내용에 위치시키는 메서드
                // 사용대상 : items - Array : List<CartDto>, 장바구니 목록
                // 매개변수 : item - Object : CartDto, 장바구니 개별 품목
                items.forEach((item) => {
                    total_price += item.prod_price * item.prod_cnt;
                    total_discount += Math.floor(item.prod_price / 100 * item.dc_rate) * item.prod_cnt;
                });
                total_invoice = total_price - total_discount + DELIVERY_FEE;                                            // 결제예정금액 = 상품금액 - 상품할인금액 + 배송비

                tmp += '<section class="dilvp">';                                                                       // 배송지 섹션
                tmp += '</section>';
                tmp += '<section class="cart-estimate">';                                                               // 결제예정금액 섹션
                tmp += '<section class="prod-price">';
                tmp += '<span class="prod-title">상품금액</span>';
                tmp += '<span class="prod-content" id="prodPrice">' + formatPriceWithComma(total_price) + ' 원</span>';
                tmp += '</section>';
                tmp += '<section class="prod-discount">';
                tmp += '<span class="prod-title">상품할인금액</span>';
                if(!total_discount)
                    tmp += '<span class="prod-content" id="discountPrice">' + '0 원</span>';
                else
                    tmp += '<span class="prod-content" id="discountPrice">-' + formatPriceWithComma(total_discount) + ' 원</span>';
                tmp += '</section>';
                tmp += '<section class="dilv-cost">';
                tmp += '<span class="prod-title">배송비</span>';
                tmp += '<span class="prod-content">2,500 원</span>';
                tmp += '</section>';
                tmp += '<section class="dilv-total">';
                tmp += '<span class="prod-title">결제예정금액</span>';
                tmp += '<span class="prod-content" id="totalPrice">' + formatPriceWithComma(total_invoice) +' 원</span>';
                tmp += '</section>';
                tmp += '</section>';
                tmp += '<input type="button" name="order" value= "주문하기" />';
                tmp += '<input type="button" name="sold-out" value= "상품을 담아주세요" />';
                tmp += '<input type="button" name="no-dlvpn" value= "배송지를 입력해주세요" />';
                return tmp;                                                                                             // 동적으로 생성한 요소 반환
            }

            // 메서드명 : checkBoxToHtml
            // 기   능 : 전체선택 체크박스와 전체상품개수, 체크된 상품개수 정보를 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
            // 매개변수 : items - cartDto
            // 반환타입 : tmp - 동적으로 생성한 html 태그
            const checkBoxToHtml = (items) => {
                let tmp = "";                                                                                           // 변수명 : tmp - 저장값 : 동적으로 생성할 html 태그(문자열)
                tmp = '<input type="checkbox" name="chk-all" class="input-all" /> 전체선택(<span id="checked">0</span>/' + items.length+') &nbsp; | &nbsp;  <span id="checkedDelBtn">선택삭제</span>';
                return tmp;                                                                                             // 동적으로 생성한 요소 반환
            }

            // 메서드명 : showList
            // 기   능 : 장바구니 목록 관련 랜더링하는 메서드들을 전부 호출하는 메서드
            // 매개변수 : user_idx - 회원번호
            const showList = (user_idx) => {
                $.ajax({                                                                                                // $.ajax() start
                    type:'GET',                                                                                         // 요청 메서드
                    url:'/cart/list?user_idx=' + user_idx,                                                              // 요청URI
                    success: (result) => {                                                                              // 성공 응답이 오면, 장바구니 목록, 주문정보, 체크박스 정보를 페이지에 랜더링하기
                        $('#cartItems').html(listToHtml(result));                                                       // listToHtml메서드 호출
                        $('#cartEstimate').html(estimateToHtml(result));                                                // estimateToHtml메서드 호출
                        $('#totalChkBox').html(checkBoxToHtml(result));                                                 // checkBoxToHtml메서드 호출
                        renderRightBtn(result, user_idx);                                                               // showAddress메서드 호출 - 선택된 배송지 랜더링
                    },
                    error : function() { alert("showList get error");}                                                  // 실패 응답이 오면, 경고창 띄우기
                });                                                                                                     // $.ajax() end
            }

            // 메서드명 : handleEmptyItems
            // 기   능 : 장바구니 목록 개수가 0인 경우, '장바구니에 담긴 상품이 없습니다' 메시지를 렌더링하는 함수
            // 매개변수 : result - List<CartDto>
            const handleEmptyItems = (result) => {
                if(!result.length)                                                                                      // Case 1. 장바구니 목록이 빈 경우(empty)
                    $('#emptyItems').css('display', 'block');                                                           // 메시지를 렌더링한다.
                else                                                                                                    // Case 2. 장바구니 목록이 비어있지 않은 경우
                    $('#emptyItems').css('display', 'none');                                                            // 메시지를 숨긴다.
            }

            // 메서드명 : renderRightBtn
            // 기   능 : 상황에 맞는 버튼을 렌더링하는 메서드
            // 매개변수 : list - 장바구니상품 목록, user_idx - 회원번호
            const renderRightBtn = (list, user_idx) => {
                $.ajax({                                                                                                // $.ajax() start
                    type:'GET',                                                                                         // 요청 메서드
                    url:'/cart/address?user_idx=' + user_idx,                                                           // 요청URI
                    success: (result) => {                                                                              // 성공 응답이 오면, 장바구니 목록, 주문정보, 체크박스 정보를 페이지에 랜더링하기
                        $('.dilvp').html(dilvpToHtml(result));                                                          // 화면에 동적 생성한 요소인 '배송지 정보' 렌더링
                        handleDlvpnBtns(result);                                                                        // handleOrderbtn메서드 호출
                        handleOrderBtns(list);                                                                          // handleOrderBtns메서드 호출
                        handleEmptyItems(list);                                                                         // handleEmptyItems 호출
                    },
                    error : function() { alert("renderRightBtn get error");}                                            // 실패 응답이 오면, 경고창 띄우기
                });                                                                                                     // $.ajax() end
            }

            // 메서드명 : handleOrderBtns
            // 기   능 : 장바구니 목록 개수가 0개인 경우, '상품을 담아주세요' 버튼을 화면에 보이게 하고 반대의 경우, '주문하기' 버튼을 보이게 만드는 토글 함수
            // 매개변수 : items - 장바구니 목록
            const handleOrderBtns = (items) => {
                if(!items.length) {                                                                                     // case 1. 장바구니 목록 개수가 0개인 경우
                    $("input[name='order']").css('display', 'none');                                                    // '주문하기' 버튼 문서에서 없애기
                    $("input[name='no-dlvpn']").css('display', 'none');                                                 // '배송지를 입력해주세요' 버튼 문서에서 없애기
                    $("input[name='sold-out']").css('display', 'block');                                                // '상품을 담아주세요' 버튼 문서에 보이기
                } else                                                                                                  // case 2. 상품이 하나 이상 담긴 경우
                    $("input[name='sold-out']").css('display', 'none');                                                 // '상품을 담아주세요' 버튼 문서에서 없애기
            }

            // 메서드명 : handleDlvpnBtns
            // 기   능 : 배송지 등록이 되어있지 않은 경우, '배송지를 입력해주세요' 버튼을 화면에 보이게 하고 반대의 경우, '주문하기' 버튼을 보이게 만드는 토글 함수
            // 매개변수 : address - 주소
            const handleDlvpnBtns = (address) => {
                if(address === "" || address === null) {                                                                // case 1. 장바구니 목록 개수가 0개인 경우
                    $("input[name='order']").css('display', 'none');                                                    // '주문하기' 버튼 문서에서 없애기
                    $("input[name='no-dlvpn']").css('display', 'block');                                                // '상품을 담아주세요' 버튼 문서에 보이기
                } else {                                                                                                // case 2. '1'개 이상인 경우
                    $("input[name='no-dlvpn']").css('display', 'none');                                                 // '상품을 담아주세요' 버튼 문서에서 없애기
                    $("input[name='order']").css('display', 'block');                                                   // '주문하기' 버튼 문서에 렌더링
                }
            }

            // 메서드명 : handleProductCnt
            // 기   능 : 클릭한 버튼 종류에 따라, 다른 ajax요청을 통해 상품개수를 조절하는 메서드
            // 매개변수 : prod_idx, user_idx, prod_cnt, upt_cnt - 상품번호, 회원번호, 변경 전 상품개수, 변경 후 상품개수
            const handleProductCnt = (prod_idx, user_idx, prod_cnt, upt_cnt) => {
                $.ajax({                                                                                                // $.ajax() start
                    type:'GET',                                                                                         // 1. 요청 메서드
                    url: '/cart/updateCnt?prod_idx=' + prod_idx + '&user_idx=' + user_idx + "&prod_cnt=" + prod_cnt     // 2. 요청 URI, 상품번호(prod_idx), 회원번호(user_idx), 연산자(operator) 변수 처리
                        + "&upt_cnt=" + upt_cnt,
                    success : (result) => {                                                                             // 3. 서버로부터 성공 응답이 도착하면 호출될 함수.
                        showList(user_idx);
                    },
                    error   : () => {                                                                                   // 4. 서버로부터 실패 응답이 도착하면 호출될 함수.
                        alert("error");
                    }
                });                                                                                                     // $.ajax() end
            }

            $(document).ready(function() {                                                                              // 문서가 준비된 상황 이후에 자바스크립트 코드 실행 === (JS) window.onload = () => { ... }
                let idx = "${idx}";                                                                                     // 변수명 : idx - 저장값 : 세션에 저장된 회원번호(user_idx)
                showList(idx);                                                                                          // showList메서드 호출 - 장바구니 전체 목록 랜더링

                // 이벤트 대상 : .input-all 전체선택 체크박스
                // 이벤트 : click
                // 이벤트 핸들러 기능 : 전체 선택 시, 모든 상품의 체크박스 체크드 처리
                $(document).on("click", ".input-all", (e) => {
                    let checked = $(".input-all").is(":checked");                                                       // 변수명 : checked - 저장값 : 전체선택 체크박스의 체크상태 여부
                    $("input[name=chk]").prop("checked", checked);                                                      // 동적 요소 속성 변경 1. checked변수의 값이 true이면 전체선택 체크박스를 '체크'처리하고, false이면 '체크해제'처리한다.

                    let checkedCount = $("input[name=chk]:checked").length;                                             // 변수명 : checkedCount - 저장값 : 개별 체크박스들 중 체크드 처리된 것들의 개수를 저장
                    $("#checked").prop("innerHTML", checkedCount);                                                      // 동적 요소 속성 변경 2. 이벤트 발생 결과, '체크'처리된 체크박스 개수를 화면에서 보여준다.
                });

                // 이벤트 대상 : input[name=chk] 개별선택 체크박스
                // 이벤트 : click
                // 이벤트 핸들러 기능 : 개별 상품 선택 시, 해당 상품의 체크박스 체크드 처리, 모든 상품 선택 시, 전체선택 체크박스도 체크드 처리
                $(document).on("click", "input[name=chk]", (e) => {
                    let total = $("input[name=chk]").length;                                                            // 변수명 : total - 저장값 : 개별 체크박스 개수
                    let checkedCnt = $("input[name=chk]:checked").length;                                               // 변수명 : checked - 저장값 : 개별 체크박스 중 체크드 처리된 체크박스
                    $("#checked").prop("innerHTML", checkedCnt);                                                        // 1. 이벤트 발생 결과, 체크드 처리된 체크박스 개수를 화면에서 보여준다.
                    if(total !== checkedCnt) $(".input-all").prop("checked", false);                                    // 2.1 모든 개별 체크박스가 체크드 상태가 아니라면, 전체선택 체크박스를 체크해제 처리한다.
                    else $(".input-all").prop("checked", true);                                                         // 2.2 모든 개별 체크박스가 체크드 상태라면, 전체선택 체크박스를 체크드 처리한다.
                });

                // 이벤트 대상 : .cart_item__close 장바구니 개별 상품의 삭제 버튼
                // 이벤트 : click
                // 이벤트 핸들러 기능 : 삭제 버튼 클릭 시, 해당 장바구니 상품 삭제 처리
                $(document).on("click", ".cart_item__close", (e) => {                                                   // 회원번호와 상품번호를 html태그의 data속성에서 가져와야 한다.
                    let prod_idx = $(e.target).closest("li").data("pid");                                               // 변수명 : prod_idx - 저장값 : 삭제버튼이 클릭된 상품의 정보 중 상품번호의 참조값(data-pid="...")
                    let user_idx = $(e.target).closest("li").data("uid");                                               // 변수명 : user_idx - 저장값 : 삭제버튼이 클릭된 상품의 정보 중 회원번호의 참조값(data-uid="...")

                    if(!confirm("정말로 삭제하시겠습니까?")) return;                                                           // 1. 버튼 클릭 시, 확인 창 팝업
                    $.ajax({                                                                                            // $.ajax() start
                        type:'DELETE',                                                                                  // 2. 요청 메서드
                        url: '/cart/remove?prod_idx=' + prod_idx + '&user_idx=' + user_idx,                             // 3. 요청 URI, 상품번호(prod_idx), 회원번호(user_idx) 변수 처리
                        success : (result) => {
                            showList(user_idx);                                                                         // 4. 서버로부터 성공 응답이 도착하면 호출될 함수.
                        },
                        error : () => {                                                                                 // 5. 서버로부터 실패 응답이 도착하면 호출될 함수
                            alert("error");
                        }
                    });                                                                                                 // $.ajax() end
                });

                // 이벤트 대상 : #checkedDelBtn                                                                            // To Do List
                // 이벤트 : click                                                                                         // 1. '선택 체크' 버튼를 눌렀을 때
                // 이벤트 핸들러 기능 : '선택삭제' 버튼 클릭 시, 체크박스가 체크드 처리된 상품들을 삭제 처리                                 // 2. ul 태그의 자식 요소인 li들을 순회하며, '체크'상태인지 확인
                $(document).on("click", "#checkedDelBtn", (e) => {                                                      // 3. '체크'상태인 모든 li 태그에 대해 삭제 요청을 보낸다.
                    // 1. 변수 선언
                    let cartItems = Array.from($('#cartItems > ul').children());                                        // 변수명 : cartItems - 저장값 : HTMLCollection(유사배열객체, 이터러블)에 저장되어 있는 모든 li태그들에 대해 Array.from으로 배열로 변환한 값
                    let isAnyBoxChecked = false;                                                                        // 변수명 : isAnyBoxChecked - 저장값 : 전체 체크박스 중 하나라도 체크드 상태인지 여부

                    // 2. 메서드 정의
                    // 메서드명 : checkAnyBoxChecked
                    // 기   능 : (1) 각 자식 요소들의 체크드 여부를 확인 (2) 하나라도 체크드 상태면 isAnyBoxChecked에 true 저장
                    const checkAnyBoxChecked = () => {
                        for(let cartItem of cartItems) {                                                                // 변수명 : cartItem - 저장값 : 배열 cartItems의 자식 요소
                            let input = cartItem.children[0];                                                           // 변수명 : input - 저장값 : cartItem의 첫 번째 자식 요소인 input[type="checkbox"]
                            if(input.checked) {                                                                         // cartItem에 있는 input의 checked 속성이 true('체크'상태)인 경우
                                isAnyBoxChecked = true;                                                                 // isAnyBoxChecked에 true 저장
                            }
                        }
                    }

                    const handleSelectedDelBtn = () => {
                        for(let cartItem of cartItems) {                                                                // 변수명 : child - 저장값 : ul 태그의 i번쨰 자식 요소인 Li 태그의 참조
                            let input = cartItem.children[0];                                                           // 변수명 : input - 저장값 : child의 0번째 자식 요소인 input 태그의 참조
                            let checked = input.checked;                                                                // 변수명 : checked - 저장값 : 체크박스(input)의 "checked"속성값(true || false)
                            if(checked) {                                                                               // 체크박스(input)가 '체크'상태인 경우
                                $.ajax({                                                                                // $.ajax() start
                                    type:'DELETE',                                                                      // 요청 메서드
                                    url: '/cart/remove?prod_idx=' +cartItem.dataset["pid"] + '&user_idx=' + cartItem.dataset["uid"],  // 요청 URI, 상품번호(prod_idx), 회원번호(user_idx) 파라미터에 담아 요청
                                    success : (result) => {                                                             // 서버로부터 성공 응답이 도착하면 호출될 함수.
                                        showList(cartItem.dataset["uid"]);
                                    },
                                    error : () => {                                                                     // 서버로부터 실패 응답이 도착하면 호출될 함수
                                        alert("error");
                                    }
                                });                                                                                     // $.ajax() end
                            }
                        }
                    }

                    // 3. 메서드 호출
                    checkAnyBoxChecked();                                                                               // 1. 체크된 체크박스가 있는지 확인, 없으면 핸들러 함수 호출 안 함
                    if(isAnyBoxChecked) {                                                                               // 2. 체크된 체크박스가 하나 이상인 경우
                        if(!confirm("선택한 상품을 삭제하시겠습니까?")) return;                                                  // 2.1. 삭제 여부를 다시 확인
                        handleSelectedDelBtn();                                                                         // 2.2. 핸들러 함수 호출 - 체크된 품목들을 장바구니 목록에서 삭제
                    }
                });

                // 이벤트 대상 : #subtractBtn 상품개수조절 '-' 버튼
                // 이벤트 : click
                // 이벤트 핸들러 기능 : '-' 버튼 클릭 시, 해당 상품의 개수를 -1 처리
                $(document).on("click", "#subtractBtn", (e) => {                                                        // 회원번호와 상품번호, 그리고 상품개수를 html태그의 data속성에서 가져와야 한// 1. 변수 선언
                    let prod_idx = $(e.target).closest("li").data("pid");                                               // 변수명 : prod_idx - 저장값 : '-'버튼이 클릭된 상품의 정보 중 상품번호의 참조값(data-pid="...")
                    let user_idx = $(e.target).closest("li").data("uid");                                               // 변수명 : user_idx - 저장값 : '-'버튼이 클릭된 상품의 정보 중 상품번호의 참조값(data-uid="...")
                    let prod_cnt = parseInt($(e.target).next("div").text());                                            // 변수명 : prod_cnt - 저장값 : '-'버튼이 클릭된 상품의 정보 중 상품개수의 참조값(next - 버튼 다음 요소)
                    let upt_cnt = prod_cnt - 1;                                                                         // 변수명 : upt_cnt - 저장값  : '-'버튼이 클릭된 경우, 상품개수(prod_cnt) - 1에 해당하는// 2. 유효성 검사
                    if(prod_cnt < 2) return;                                                                            // 상품 개수가 2보다 작은 경우 요청을 보내지 않는다.
                                                                                                                        // 3. 메서드 호출
                    handleProductCnt(prod_idx, user_idx, prod_cnt, upt_cnt);                                            // handleProductCnt메서드
                });

                // 이벤트 대상 : #addBtn 상품개수조절 '+' 버튼
                // 이벤트 : click
                // 이벤트 핸들러 기능 : '+' 버튼 클릭 시, 해당 상품의 개수를 +1 처리
                $(document).on("click", "#addBtn", (e) => {                                                             // 회원번호와 상품번호, 그리고 상품개수를 html태그의 data속성에서 가져와야 한다.
                    // 1. 변수 선언
                    let prod_idx = $(e.target).closest("li").data("pid");                                               // 변수명 : prod_idx - 저장값 : '+'버튼이 클릭된 상품의 정보 중 상품번호의 참조값(data-pid="...")
                    let user_idx = $(e.target).closest("li").data("uid");                                               // 변수명 : user_idx - 저장값 : '+'버튼이 클릭된 상품의 정보 중 상품번호의 참조값(data-uid="...")
                    let prod_cnt = parseInt($(e.target).prev("div").text());                                            // 변수명 : prod_cnt - 저장값 : '+'버튼이 클릭된 상품의 정보 중 상품개수의 참조값(prev - 버튼 이전 요소)
                    let upt_cnt = prod_cnt + 1;                                                                         // 변수명 : upt_cnt - 저장값  : '+'버튼이 클릭된 경우, 상품개수(prod_cnt) + 1에 해당하는 값
                                                                                                                        // 2. 메서드 호출
                    handleProductCnt(prod_idx, user_idx, prod_cnt, upt_cnt);                                            // handleProductCnt메서드 호출
                });

                // 이벤트 대상 : input[name=order] 주문 버튼
                // 이벤트 : click
                // 이벤트 핸들러 기능 : '주문' 버튼 클릭 시, 주문서 작성 페이지로 이동
                $(document).on("click", "input[name=order]", () => {
                    location.href= "/order/checkout";                                                                   // 주문서 작성 페이지로 이동
                });

                // 이벤트 대상 : #cartAddressModBtn 배송지 변경 버튼
                // 이벤트 : click
                // 이벤트 핸들러 기능 : '배송지 변경' 버튼 클릭 시, 배송지 관리 페이지로 이동
                $(document).on("click", "#cartAddressModBtn", () => {
                    location.href= "/mypage/address/list";                                                              // 마이페이지 배송지 관리 페이지로 이동
                });
            })
        </script>
    </body>
</html>