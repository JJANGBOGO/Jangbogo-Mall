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
    <link rel="stylesheet" href="/css/main.css"/>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
            Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
        }
        #cartItems {
            padding: 0;
        }
        .cart_item {
            display: flex;
            align-items: center;
            list-style: none;
            margin-top: 15px;
            border-top: lightgray 1px solid;
            padding-top: 20px;
        }
        .cart-title {
            padding: 50px 0;
        }
        .cart-title > h1 {
            font-weight: 600;
            text-align: center;
        }
        .cart {
            display: flex;
            justify-content: center;
            margin: 0 125px;
            margin-bottom: 30px;
        }
        .cart-container {
            width: 100%;
            height: 100%;
        }
        .cart-content {
            height: 60%;
            width: 730px;
            margin-right: 20px;
        }
        .footer {
            background: #B3945A;
            height: 20%;
        }
        #totalChkBox {
            padding: 10px 0;
        }

        #totalChkBox > input {
            font-size: 14px;
        }

        #totalChkBox:last-child {
            border: none;
        }
        .cart_item {
            display: flex;
        }
        .cart_item__title {
            width: 50%;
            text-align: left;
            font-weight: 600;
            margin-left: 20px;
        }
        .cart_item__contents {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-left: 20px;
            cursor:
        }
        .cart_item__cnt {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border: 1px solid rgb(221, 223, 225);
            border-radius: 4px;
            margin-right: 15px;
            width: 90px;
        }
        .item__count {
            text-align: center;
        }
        .cart_item__cnt > div {
            /*padding: 5px 10px;*/
        }
        #subtractBtn, #addBtn {
            cursor: pointer;
        }
        #subtractBtn {
            display:  block;
            padding: 5px 10px;
        }
        #addBtn  {
            display:  block;
            padding: 5px 10px;
        }
        .cart_item__price {
            font-weight: 700;
            text-align: right;
            width: 80px;
        }

        .cart_item__close {
            display: flex;
            align-items: center;
            margin: 0 20px;
            cursor: pointer;
        }

        .cart_item__close, #subtractBtn, #addBtn {
            text-decoration: none;
            color: black;
        }
        .cart_item__close {
            color: lightgray;
        }
        .cart_item > input {
            margin-right: 15px;
        }

        img {
            display: inline-block;
            width: 60px;
            height: 78px;
        }
        #cartEstimate {
            position: relative;
            width: 360px;
            height: 430px;
        }
        .dilvp > h3 {
            font-weight: 500;
        }
        .dilvp, .cart-estimate {
            padding: 25px;
            border: 1px solid #f2f2f2;
        }

        .dilvp {
            height: 190px;
        }

        .cart-estimate {
            height: 160px;
            background: #fafafa;
        }
        input[name='order'] {
            position: absolute;
            bottom: 0;
            left: 0;
            border-style: none;
            background: #5f0080;
            color: white;
            width: 100%;
            height: 56px;
            border-radius: 4px;
            font-weight: 500;
            font-size: 18px;
            cursor: pointer;
        }

        .prod-title {
            font-size: 18px;
        }

        .prod-content {
            font-size: 18px;
        }

        .dilv-cost, .dilv-total {
            padding-top: 12px;
        }

        .prod-price, .dilv-cost, .dilv-total {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        #checkedDelBtn {
            cursor: pointer;
        }
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    </style>
    <title>장보고 | 장바구니</title>
</head>
<body>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <div class="cart-container">
    <%@ include file="/WEB-INF/views/include/navbar.jsp" %>
        <div class="cart-title">
            <h1>장바구니</h1>
        </div>
        <div class="cart">
            <div class="cart-content">
                <div id="totalChkBox"></div>
                <div id="cartItems"></div>
            </div>
            <div id="cartEstimate"></div>
        </div>
        <div class="footer"></div>
    </div>
    <script>
        // 메서드명 : listToHtml
        // 기   능 : 장바구니 목록 및 정보를 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
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
                tmp += '<li class="cart_item" data-pid=' + item.prod_idx + ' data-uid=' + item.user_idx +' >';
                tmp += '<input type="checkbox" name="chk"  />';
                tmp += '<img src=' + item.prod_rpath + " alt='' />";
                tmp += "<div class='cart_item__title'>" + item.prod_name + "</div>";
                tmp += '<div class="cart_item__contents">';
                tmp += '<div class="cart_item__cnt">';
                tmp += '<div id="subtractBtn">-</div>';
                tmp += '<div class=item__count>' + item.prod_cnt + "</div>";
                tmp += '<div id="addBtn">+</div>';
                tmp += '</div>';
                tmp += "<div class='cart_item__price'>" + item.prod_price * item.prod_cnt + "</div><span>원</span>";
                tmp += '<div class="cart_item__close">&times;</div>';
                tmp += '</div>';
                tmp += '</li>';
            })
            // 변수명 : cnt
            // 저장값 : 장바구니에 담긴 모든 품목 개수
            let cnt = items.length;
            return tmp += '</ul>';
        }

        // 메서드명 : estimateToHtml
        // 기   능 : 배송지와 주문금액 관련 정보를 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
        // 매개변수 : items - cartDto
        // 반환타입 : String - 동적으로 생성한 html 태그 모음(tmp)
        let estimateToHtml = (items) => {
            // 변수명 : price
            // 저장값 : 모든 상품 가격 x 담은 개수
            let price = 0;
            // 변수명 : tmp
            // 저장값 : 동적으로 생성할 html 태그(문자열)
            let tmp = "";

            // 메서드명 : forEach
            // 기   능 : 복수의 CartDto값들을 저장한 list에서 각각의 CartDto에 저장된 iv들을 적절한 태그의 속성값 또는 내용에 위치시키는 메서드
            // 사용대상 : items - Array : List<CartDto>, 장바구니 목록
            // 매개변수 : item - Object : CartDto, 장바구니 개별 품목
            items.forEach((item) => {
                price += item.prod_price * item.prod_cnt;
            })
            tmp += '<section class="dilvp">'
            tmp += '<h3 class="dilvp-title">배송지</h3>'
            tmp += '<span class="dilvp-content">경기 의왕시 원골로 43(모락산현대아파트)118동 202호</span>'
            tmp += '</section>'
            tmp += '<section class="cart-estimate">'
            tmp += '<section class="prod-price">'
            tmp += '<span class="prod-title">상품금액</span>'
            tmp += '<span class="prod-content" id="prodPrice">' + price + '원</span>'
            tmp += '</section>'
            tmp += '<section class="dilv-cost">'
            tmp += '<span class="prod-title">배송비</span>'
            tmp += '<span class="prod-content">2500원</span>'
            tmp += '</section>'
            tmp += '<section class="dilv-total">'
            tmp += '<span class="prod-title">결제예정금액</span>'
            tmp += '<span class="prod-content" id="totalPrice">' + (parseInt(price) + 2500) +'원</span>'
            tmp += '</section>'
            tmp += '</section>'
            tmp += '<input type="button" name="order" value= "주문하기" />'
            return tmp;
        }

        // 메서드명 : checkBoxToHtml
        // 기   능 : 전체선택 체크박스와 전체상품개수, 체크된 상품개수 정보를 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
        // 매개변수 : items - cartDto
        // 반환타입 : tmp - 동적으로 생성한 html 태그
        let checkBoxToHtml = (items) => {
            // 변수명 : tmp
            // 저장값 : 동적으로 생성할 html 태그(문자열)
            let tmp = "";
            tmp = '<input type="checkbox" name="chk-all" class="input-all" /> 전체선택(<span id="checked">0</span>/' + items.length+') &nbsp; | &nbsp;  <span id="checkedDelBtn">선택삭제</span>';
            return tmp;
        }

        let showList = (user_idx) => {
            // ajax 요청(비동기)
            $.ajax({
                type:'GET',
                url:'/cart/list?user_idx=' + user_idx,
                success: (result) => {  // 성공 응답이 오면, 장바구니 목록, 주문정보, 체크박스 정보를 페이지에 랜더링하기
                    $('#cartItems').html(listToHtml(result));       // listToHtml메서드 호출
                    $('#cartEstimate').html(estimateToHtml(result));    // estimateToHtml메서드 호출
                    $('#totalChkBox').html(checkBoxToHtml(result)); // checkBoxToHtml메서드 호출
                },
                error : function() { alert("comment get error");}   // 실패 응답이 오면, 경고창 띄우기
            });  // $.ajax() end
        }

        // 문서가 준비된 상황 이후에 자바스크립트 코드 실행 === (JS) window.onload = () => { ... }
        $(document).ready(function() {
            // 회원번호(user_idx) 하드코딩
            // 세션에서 회원번호를 가져와야 한다. 세션 연동 시, 추후 테스트 필요.
            // data-uid는 장바구니가 비었을 경우도 있기 때문에 사용할 수 없다.
            showList(1234);

            // 이벤트 대상 : .input-all 전체선택 체크박스
            // 이벤트 : click
            // 이벤트 핸들러 기능 : 전체 선택 시, 모든 상품의 체크박스 체크드 처리
            $(document).on("click", ".input-all", (e) => {
                // 전체선택 체크박스가 체크되는 경우, 개별 선택 체크박스 전부 체크드 처리
                if($(".input-all").is(":checked")) $("input[name=chk]").prop("checked", true);
                // 전체선택 체크박스가 체크해제되는 경우, 개별 선택 체크박스 전부 체크해제 처리
                else $("input[name=chk]").prop("checked", false);

                // 변수명 : checked
                // 저장값 : 개별 체크박스들 중 체크드 처리된 것들의 개수를 저장
                let checked = $("input[name=chk]:checked").length;
                // 이벤트 발생 결과, 체크드 처리된 체크박스 개수를 화면에서 보여준다.
                $("#checked").prop("innerHTML", checked);
            });

            // 이벤트 대상 : input[name=chk] 개별선택 체크박스
            // 이벤트 : click
            // 이벤트 핸들러 기능 : 개별 상품 선택 시, 해당 상품의 체크박스 체크드 처리, 모든 상품 선택 시, 전체선택 체크박스도 체크드 처리
            $(document).on("click", "input[name=chk]", (e) => {
                // 변수명 : total
                // 저장값 : 개별 체크박스 개수
                let total = $("input[name=chk]").length;
                // 변수명 : checked
                // 저장값 : 개별 체크박스 중 체크드 처리된 체크박스 개수
                let checked = $("input[name=chk]:checked").length;

                // 이벤트 발생 결과, 체크드 처리된 체크박스 개수를 화면에서 보여준다.
                $("#checked").prop("innerHTML", checked);

                // 모든 개별 체크박스가 체크드 상태가 아니라면, 전체선택 체크박스를 체크해제 처리한다.
                if(total !== checked) $(".input-all").prop("checked", false);
                // 모든 개별 체크박스가 체크드 상태라면, 전체선택 체크박스를 체크드 처리한다.
                else $(".input-all").prop("checked", true);
            });

            // 이벤트 대상 : .cart_item__close 장바구니 개별 상품의 삭제 버튼
            // 이벤트 : click
            // 이벤트 핸들러 기능 : 삭제 버튼 클릭 시, 해당 장바구니 상품 삭제 처리
            $(document).on("click", ".cart_item__close", (e) => {// 회원번호와 상품번호를 html태그의 data속성에서 가져와야 한다.
                // 변수명 : element, element2
                // 저장값 : 삭제버튼이 클릭된 상품의 정보 중 상품번호와 회원번호의 참조값
                let element = $(e.target).closest("li").data("pid"); // console.log(element) - 100, 101, 102 출력
                let element2 = $(e.target).closest("li").data("uid"); // console.log(element2) - 1234 출력

                if(!confirm("정말로 삭제하시겠습니까?")) return;                               // 1. 버튼 클릭 시, 확인 창 팝업
                $.ajax({
                    type:'DELETE',                                                      // 2. 요청 메서드
                    url: '/cart/remove?prod_idx=' + element + '&user_idx=' + element2,  // 3. 요청 URI, 상품번호(prod_idx), 회원번호(user_idx) 변수 처리
                    success : (result) => {
                        showList(element2);                                             // 4. 서버로부터 성공 응답이 도착하면 호출될 함수.
                    },
                    error   : () => {
                        alert("error");                                                 // 5. 서버로부터 실패 응답이 도착하면 호출될 함수
                    }
                });  // $.ajax() end
            });

            // 이벤트 대상 : #checkedDelBtn
            // 이벤트 : click
            // 이벤트 핸들러 기능 : '선택삭제' 버튼 클릭 시, 체크박스가 체크드 처리된 상품들을 삭제 처리
            $(document).on("click", "#checkedDelBtn", (e) => {
                // To Do List
                // 1. '선택 체크' 버튼를 눌렀을 때
                // 2. ul 태그의 자식 요소들을 순휘하며, 체크드 상태인지 확인
                // 3. 체크드 상태인 모든 li 태그에 대해 삭제 요청을 보낸다.

                // 변수 선언
                // 변수명 : children
                // 저장값 : ul 태그의 자식 요소인 모든 li태그를 참조하는 값
                let children = $('#cartItems > ul').children();
                // 변수명 : isAnyBoxChecked
                // 저장값 : 전체 체크박스 중 하나라도 체크드 상태인지 여부를 boolean값으로 저장
                let isAnyBoxChecked = false;

                // 메서드 정의
                let checkAnyBoxChecked = () => {
                    // 1. 각 자식 요소들의 체크드 여부를 확인
                    // 2. 하나라도 체크드 상태면 break;
                    // 3. 모두 체크 해제 상태이면 return;
                    for(let i = 0; i < children.length; i++) {
                        if(children[i].children[0].checked) {
                            return isAnyBoxChecked = true;
                        }
                        if( i === children[children.length - 1] && isAnyBoxChecked === false ) return;
                    }
                }

                let handleSelectedDelBtn = () => {
                    for(let i = 0; i < children.length; i++) {
                        // 변수명 : child
                        // 저장값 : ul 태그의 i번쨰 자식 요소인 Li 태그의 참조
                        let child = children[i];
                        // 변수명 : checked
                        // 저장값 : ul 태그의 i번째 자식 요소인 li 태그의 체크박스의 상태가 체크드인지 여부를 나타내는 boolean값
                        let checked = child.children[0].checked;
                        if(checked) {
                            $.ajax({
                                type:'DELETE',                                                                               // 1. 요청 메서드
                                url: '/cart/remove?prod_idx=' + child.dataset["pid"] + '&user_idx=' + child.dataset["uid"],  // 2. 요청 URI, 상품번호(prod_idx), 회원번호(user_idx) 변수 처리
                                success : (result) => {
                                    showList(child.dataset["uid"]);                                                          // 3. 서버로부터 성공 응답이 도착하면 호출될 함수.
                                },
                                error   : () => {
                                    alert("error");                                                                          // 4. 서버로부터 실패 응답이 도착하면 호출될 함수
                                }
                            });  // $.ajax() end
                        }
                    }
                }

                // 메서드 호출
                checkAnyBoxChecked();                               // 1. 체크된 체크박스가 있는지 확인, 없으면 핸들러 함수 호출 안 함
                if(isAnyBoxChecked) {                               // 2. 체크된 체크박스가 하나 이상인 경우
                    if(!confirm("선택한 상품을 삭제하시겠습니까?")) return;  // 2.1. 삭제 여부를 다시 확인
                    handleSelectedDelBtn();                         // 2.2. 핸들러 함수 호출 - 체크된 품목들을 장바구니 목록에서 삭제
                }
            });

            // 이벤트 대상 : #subtractBtn 상품개수조절 '-' 버튼
            // 이벤트 : click
            // 이벤트 핸들러 기능 : '-' 버튼 클릭 시, 해당 상품의 개수를 -1 처리
            $(document).on("click", "#subtractBtn", (e) => {// 회원번호와 상품번호, 그리고 상품개수를 html태그의 data속성에서 가져와야 한다.
                let element = $(e.target).closest("li").data("pid"); // console.log(element) - 100, 101, 102 출력
                let element2 = $(e.target).closest("li").data("uid"); // console.log(element2) - 1234 출력
                let element3 = parseInt($(e.target).next("div").text()); // console.log(element2) - 1 출력
                if(element3 < 2) return;    // 상품 개수가 2보다 작은 경우 요청을 보내지 않는다.
                $.ajax({
                    type:'GET',                                                                                        // 1. 요청 메서드
                    url: '/cart/subtractCnt?prod_idx=' + element + '&user_idx=' + element2 + "&prod_cnt=" + element3,  // 2. 요청 URI, 상품번호(prod_idx), 회원번호(user_idx), 상품개수(prod_cnt) 변수 처리
                    success : (result) => {
                        showList(element2);                                                                            // 3. 서버로부터 성공 응답이 도착하면 호출될 함수.
                    },
                    error   : () => {
                        alert("error");                                                                                // 4. 서버로부터 실패 응답이 도착하면 호출될 함수.
                    }
                });  // $.ajax() end
            });

            // 이벤트 대상 : #addBtn 상품개수조절 '+' 버튼
            // 이벤트 : click
            // 이벤트 핸들러 기능 : '+' 버튼 클릭 시, 해당 상품의 개수를 +1 처리
            $(document).on("click", "#addBtn", (e) => { // 회원번호와 상품번호, 그리고 상품개수를 html태그의 data속성에서 가져와야 한다.
                let element = $(e.target).closest("li").data("pid"); // console.log(element) - 100, 101, 102 출력
                let element2 = $(e.target).closest("li").data("uid"); // console.log(element2) - 1 출력

                $.ajax({
                    type:'GET',                                                         // 1. 요청 메서드
                    url: '/cart/addCnt?prod_idx=' + element + '&user_idx=' + element2,  // 2. 요청 URI, 상품번호(prod_idx), 회원번호(user_idx) 변수 처리
                    success : (result) => {
                        showList(element2);                                             // 3. 서버로부터 성공 응답이 도착하면 호출될 함수.
                    },
                    error   : () => {
                        alert("error");                                                 // 4. 서버로부터 실패 응답이 도착하면 호출될 함수.
                    }
                });  // $.ajax() end
            });

            // 이벤트 대상 : input[name=order] 주문 버튼
            // 이벤트 : click
            // 이벤트 핸들러 기능 : '주문' 버튼 클릭 시, 주문서 작성 페이지로 이동
            $(document).on("click", "input[name=order]", (e) => { // 회원번호와 상품번호, 그리고 상품개수를 html태그의 data속성에서 가져와야 한다.
                let link = "/order/checkout";
                location.href= link;
            });
        })
    </script>
</body>
</html>