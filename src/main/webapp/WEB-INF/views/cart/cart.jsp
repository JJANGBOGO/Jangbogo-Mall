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
    <link rel="stylesheet" href="/css/order/cart.css"/>
    <script src = "/js/order/format.js"></script>
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
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div>
    <script>
        // 메서드명 : listToHtml
        // 기   능 : 장바구니 목록 및 정보를 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
        // 매개변수 : items - cartDto
        // 반환타입 : String - 동적으로 생성한 html 태그 모음(tmp)
        const listToHtml = (items) => {
            let tmp = "<ul>";                                                                                           // 변수명 : tmp - 저장값 : 동적으로 생성할 html 태그(문자열)

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
                tmp += "<div class='cart_item__price'>" + formatPriceWithComma(item.prod_price * item.prod_cnt) + "</div><span>원</span>";
                tmp += '<div class="cart_item__close">&times;</div>';
                tmp += '</div>';
                tmp += '</li>';
            })
            let cnt = items.length;                                                                                     // 변수명 : cnt - 저장값 : 장바구니에 담긴 모든 품목 개수
            return tmp += '</ul>';                                                                                      // 동적으로 생성한 요소 반환
        }

        // 메서드명 : estimateToHtml
        // 기   능 : 배송지와 주문금액 관련 정보를 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
        // 매개변수 : items - cartDto
        // 반환타입 : String - 동적으로 생성한 html 태그 모음(tmp)
        const estimateToHtml = (items) => {
            let price = 0;                                                                                              // 변수명 : price - 저장값 : 주문총금액
            let tmp = "";                                                                                               // 변수명 : tmp - 저장값 : 동적으로 생성할 html 태그(문자열)

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
            tmp += '<span class="prod-content" id="prodPrice">' + formatPriceWithComma(price) + '원</span>'
            tmp += '</section>'
            tmp += '<section class="dilv-cost">'
            tmp += '<span class="prod-title">배송비</span>'
            tmp += '<span class="prod-content">2,500원</span>'
            tmp += '</section>'
            tmp += '<section class="dilv-total">'
            tmp += '<span class="prod-title">결제예정금액</span>'
            tmp += '<span class="prod-content" id="totalPrice">' + formatPriceWithComma(parseInt(price) + 2500) +'원</span>'
            tmp += '</section>'
            tmp += '</section>'
            tmp += '<input type="button" name="order" value= "주문하기" />'
            tmp += '<input type="button" name="sold-out" value= "상품을 담아주세요" />'
            return tmp;                                                                                                 // 동적으로 생성한 요소 반환
        }

        // 메서드명 : checkBoxToHtml
        // 기   능 : 전체선택 체크박스와 전체상품개수, 체크된 상품개수 정보를 담은 태그 요소를 동적으로 생성하고 화면에 랜더링하는 메서드
        // 매개변수 : items - cartDto
        // 반환타입 : tmp - 동적으로 생성한 html 태그
        const checkBoxToHtml = (items) => {
            let tmp = "";                                                                                               // 변수명 : tmp - 저장값 : 동적으로 생성할 html 태그(문자열)
            tmp = '<input type="checkbox" name="chk-all" class="input-all" /> 전체선택(<span id="checked">0</span>/' + items.length+') &nbsp; | &nbsp;  <span id="checkedDelBtn">선택삭제</span>';
            return tmp;                                                                                                 // 동적으로 생성한 요소 반환
        }

        // 메서드명 : showList
        // 기   능 : 장바구니 목록 관련 랜더링하는 메서드들을 전부 호출하는 메서드
        // 매개변수 : user_idx - 회원번호
        const showList = (user_idx) => {
            $.ajax({                                                                                                    // $.ajax() start
                type:'GET',                                                                                             // 요청 메서드
                url:'/cart/list?user_idx=' + user_idx,                                                                  // 요청URI
                success: (result) => {                                                                                  // 성공 응답이 오면, 장바구니 목록, 주문정보, 체크박스 정보를 페이지에 랜더링하기
                    $('#cartItems').html(listToHtml(result));                                                           // listToHtml메서드 호출
                    $('#cartEstimate').html(estimateToHtml(result));                                                    // estimateToHtml메서드 호출
                    $('#totalChkBox').html(checkBoxToHtml(result));                                                     // checkBoxToHtml메서드 호출
                    handleOrderBtns(result);                                                                             // handleOrderbtn메서드 호출
                },
                error : function() { alert("comment get error");}                                                       // 실패 응답이 오면, 경고창 띄우기
            });                                                                                                         // $.ajax() end
        }
        // 메서드명 : handleOrderbtns
        // 기   능 : 장바구니 목록 개수가 0개인 경우, '상품을 담아주세요' 버튼을 화면에 보이게 하고 반대의 경우, '주문하기' 버튼을 보이게 만드는 토글 함수
        // 매개변수 : items - 장바구니 목록
        const handleOrderBtns = (items) => {
            if(!items.length) {                                                                                         // case 1. 장바구니 목록 개수가 0개인 경우
                $("input[name='order']").css('display', 'none');                                                        // '주문하기' 버튼 문서에서 없애기
                $("input[name='sold-out']").css('display', 'block');                                                    // '상품을 담아주세요' 버튼 문서에 보이기
            } else {                                                                                                    // case 2. '1'개 이상인 경우
                $("input[name='order']").css('display', 'block');                                                       // '주문하기' 버튼 문서에 보이기
                $("input[name='sold-out']").css('display', 'none');                                                     // '상품을 담아주세요' 버튼 문서에서 없애기
            }
        }

        // 메서드명 : handleProductCnt
        // 기   능 : 클릭한 버튼 종류에 따라, 다른 ajax요청을 통해 상품개수를 조절하는 메서드
        // 매개변수 : prod_idx, user_idx, prod_cnt, upt_cnt - 상품번호, 회원번호, 변경 전 상품개수, 변경 후 상품개수
        const handleProductCnt = (prod_idx, user_idx, prod_cnt, upt_cnt) => {
            $.ajax({                                                                                                    // $.ajax() start
                type:'GET',                                                                                             // 1. 요청 메서드
                url: '/cart/updateCnt?prod_idx=' + prod_idx + '&user_idx=' + user_idx + "&prod_cnt=" + prod_cnt         // 2. 요청 URI, 상품번호(prod_idx), 회원번호(user_idx), 연산자(operator) 변수 처리
                    + "&upt_cnt=" + upt_cnt,
                success : (result) => {                                                                                 // 3. 서버로부터 성공 응답이 도착하면 호출될 함수.
                    showList(user_idx);
                },
                error   : () => {                                                                                       // 4. 서버로부터 실패 응답이 도착하면 호출될 함수.
                    alert("error");
                }
            });                                                                                                         // $.ajax() end
        }

        $(document).ready(function() {                                                                                  // 문서가 준비된 상황 이후에 자바스크립트 코드 실행 === (JS) window.onload = () => { ... }
            let idx = "${idx}";                                                                                         // 변수명 : idx - 저장값 : 세션에 저장된 회원번호(user_idx)
            showList(idx);                                                                                              // showList메서드 호출 - 장바구니 전체 목록 랜더링

            // 이벤트 대상 : .input-all 전체선택 체크박스
            // 이벤트 : click
            // 이벤트 핸들러 기능 : 전체 선택 시, 모든 상품의 체크박스 체크드 처리
            $(document).on("click", ".input-all", (e) => {
                let checked = $(".input-all").is(":checked");                                                           // 변수명 : checked - 저장값 : 전체선택 체크박스의 체크상태 여부
                $("input[name=chk]").prop("checked", checked);                                                          // 동적 요소 속성 변경 1. checked변수의 값이 true이면 전체선택 체크박스를 '체크'처리하고, false이면 '체크해제'처리한다.

                let checkedCount = $("input[name=chk]:checked").length;                                                 // 변수명 : checkedCount - 저장값 : 개별 체크박스들 중 체크드 처리된 것들의 개수를 저장
                $("#checked").prop("innerHTML", checkedCount);                                                          // 동적 요소 속성 변경 2. 이벤트 발생 결과, '체크'처리된 체크박스 개수를 화면에서 보여준다.
            });

            // 이벤트 대상 : input[name=chk] 개별선택 체크박스
            // 이벤트 : click
            // 이벤트 핸들러 기능 : 개별 상품 선택 시, 해당 상품의 체크박스 체크드 처리, 모든 상품 선택 시, 전체선택 체크박스도 체크드 처리
            $(document).on("click", "input[name=chk]", (e) => {
                let total = $("input[name=chk]").length;                                                                // 변수명 : total - 저장값 : 개별 체크박스 개수
                let checkedCnt = $("input[name=chk]:checked").length;                                                   // 변수명 : checked - 저장값 : 개별 체크박스 중 체크드 처리된 체크박스 개수

                $("#checked").prop("innerHTML", checkedCnt);                                                            // 1. 이벤트 발생 결과, 체크드 처리된 체크박스 개수를 화면에서 보여준다.
                if(total !== checkedCnt) $(".input-all").prop("checked", false);                                        // 2.1 모든 개별 체크박스가 체크드 상태가 아니라면, 전체선택 체크박스를 체크해제 처리한다.
                else $(".input-all").prop("checked", true);                                                             // 2.2 모든 개별 체크박스가 체크드 상태라면, 전체선택 체크박스를 체크드 처리한다.
            });

            // 이벤트 대상 : .cart_item__close 장바구니 개별 상품의 삭제 버튼
            // 이벤트 : click
            // 이벤트 핸들러 기능 : 삭제 버튼 클릭 시, 해당 장바구니 상품 삭제 처리
            $(document).on("click", ".cart_item__close", (e) => {                                                       // 회원번호와 상품번호를 html태그의 data속성에서 가져와야 한다.
                let prod_idx = $(e.target).closest("li").data("pid");                                                   // 변수명 : prod_idx - 저장값 : 삭제버튼이 클릭된 상품의 정보 중 상품번호의 참조값(data-pid="...")
                let user_idx = $(e.target).closest("li").data("uid");                                                   // 변수명 : user_idx - 저장값 : 삭제버튼이 클릭된 상품의 정보 중 회원번호의 참조값(data-uid="...")

                if(!confirm("정말로 삭제하시겠습니까?")) return;                                                               // 1. 버튼 클릭 시, 확인 창 팝업
                $.ajax({                                                                                                // $.ajax() start
                    type:'DELETE',                                                                                      // 2. 요청 메서드
                    url: '/cart/remove?prod_idx=' + prod_idx + '&user_idx=' + user_idx,                                 // 3. 요청 URI, 상품번호(prod_idx), 회원번호(user_idx) 변수 처리
                    success : (result) => {
                        showList(user_idx);                                                                             // 4. 서버로부터 성공 응답이 도착하면 호출될 함수.
                    },
                    error : () => {                                                                                     // 5. 서버로부터 실패 응답이 도착하면 호출될 함수
                        alert("error");
                    }
                });                                                                                                     // $.ajax() end
            });

            // 이벤트 대상 : #checkedDelBtn                                                                                // To Do List
            // 이벤트 : click                                                                                             // 1. '선택 체크' 버튼를 눌렀을 때
            // 이벤트 핸들러 기능 : '선택삭제' 버튼 클릭 시, 체크박스가 체크드 처리된 상품들을 삭제 처리                                     // 2. ul 태그의 자식 요소인 li들을 순회하며, '체크'상태인지 확인
            $(document).on("click", "#checkedDelBtn", (e) => {                                                          // 3. '체크'상태인 모든 li 태그에 대해 삭제 요청을 보낸다.
                // 1. 변수 선언
                let cartItems = Array.from($('#cartItems > ul').children());                                            // 변수명 : cartItems - 저장값 : HTMLCollection(유사배열객체, 이터러블)에 저장되어 있는 모든 li태그들에 대해 Array.from으로 배열로 변환한 값
                let isAnyBoxChecked = false;                                                                            // 변수명 : isAnyBoxChecked - 저장값 : 전체 체크박스 중 하나라도 체크드 상태인지 여부

                // 2. 메서드 정의
                // 메서드명 : checkAnyBoxChecked
                // 기   능 : (1) 각 자식 요소들의 체크드 여부를 확인 (2) 하나라도 체크드 상태면 isAnyBoxChecked에 true 저장
                const checkAnyBoxChecked = () => {
                    for(let cartItem of cartItems) {                                                                    // 변수명 : cartItem - 저장값 : 배열 cartItems의 자식 요소
                        let input = cartItem.children[0];                                                               // 변수명 : input - 저장값 : cartItem의 첫 번째 자식 요소인 input[type="checkbox"]
                        if(input.checked) {                                                                             // cartItem에 있는 input의 checked 속성이 true('체크'상태)인 경우
                            isAnyBoxChecked = true;                                                                     // isAnyBoxChecked에 true 저장
                        }
                    }
                }

                const handleSelectedDelBtn = () => {
                    for(let cartItem of cartItems) {                                                                    // 변수명 : child - 저장값 : ul 태그의 i번쨰 자식 요소인 Li 태그의 참조
                        let input = cartItem.children[0];                                                               // 변수명 : input - 저장값 : child의 0번째 자식 요소인 input 태그의 참조
                        let checked = input.checked;                                                                    // 변수명 : checked - 저장값 : 체크박스(input)의 "checked"속성값(true || false)
                        if(checked) {                                                                                   // 체크박스(input)가 '체크'상태인 경우
                            $.ajax({                                                                                    // $.ajax() start
                                type:'DELETE',                                                                          // 요청 메서드
                                url: '/cart/remove?prod_idx=' +cartItem.dataset["pid"] + '&user_idx=' + cartItem.dataset["uid"],  // 요청 URI, 상품번호(prod_idx), 회원번호(user_idx) 파라미터에 담아 요청
                                success : (result) => {                                                                 // 서버로부터 성공 응답이 도착하면 호출될 함수.
                                    showList(cartItem.dataset["uid"]);
                                },
                                error : () => {                                                                         // 서버로부터 실패 응답이 도착하면 호출될 함수
                                    alert("error");
                                }
                            });                                                                                         // $.ajax() end
                        }
                    }
                }

                // 3. 메서드 호출
                checkAnyBoxChecked();                                                                                   // 1. 체크된 체크박스가 있는지 확인, 없으면 핸들러 함수 호출 안 함
                if(isAnyBoxChecked) {                                                                                   // 2. 체크된 체크박스가 하나 이상인 경우
                    if(!confirm("선택한 상품을 삭제하시겠습니까?")) return;                                                      // 2.1. 삭제 여부를 다시 확인
                    handleSelectedDelBtn();                                                                             // 2.2. 핸들러 함수 호출 - 체크된 품목들을 장바구니 목록에서 삭제
                }
            });

            // 이벤트 대상 : #subtractBtn 상품개수조절 '-' 버튼
            // 이벤트 : click
            // 이벤트 핸들러 기능 : '-' 버튼 클릭 시, 해당 상품의 개수를 -1 처리
            $(document).on("click", "#subtractBtn", (e) => {                                                            // 회원번호와 상품번호, 그리고 상품개수를 html태그의 data속성에서 가져와야 한다.
                                                                                                                        // 1. 변수 선언
                let prod_idx = $(e.target).closest("li").data("pid");                                                   // 변수명 : prod_idx - 저장값 : '-'버튼이 클릭된 상품의 정보 중 상품번호의 참조값(data-pid="...")
                let user_idx = $(e.target).closest("li").data("uid");                                                   // 변수명 : user_idx - 저장값 : '-'버튼이 클릭된 상품의 정보 중 상품번호의 참조값(data-uid="...")
                let prod_cnt = parseInt($(e.target).next("div").text());                                                // 변수명 : prod_cnt - 저장값 : '-'버튼이 클릭된 상품의 정보 중 상품개수의 참조값(next - 버튼 다음 요소)
                let upt_cnt = prod_cnt - 1;                                                                             // 변수명 : upt_cnt - 저장값  : '-'버튼이 클릭된 경우, 상품개수(prod_cnt) - 1에 해당하는 값
                                                                                                                        // 2. 유효성 검사
                if(prod_cnt < 2) return;                                                                                // 상품 개수가 2보다 작은 경우 요청을 보내지 않는다.
                                                                                                                        // 3. 메서드 호출
                handleProductCnt(prod_idx, user_idx, prod_cnt, upt_cnt);                                                // handleProductCnt메서드
            });

            // 이벤트 대상 : #addBtn 상품개수조절 '+' 버튼
            // 이벤트 : click
            // 이벤트 핸들러 기능 : '+' 버튼 클릭 시, 해당 상품의 개수를 +1 처리
            $(document).on("click", "#addBtn", (e) => {                                                                 // 회원번호와 상품번호, 그리고 상품개수를 html태그의 data속성에서 가져와야 한다.
                                                                                                                        // 1. 변수 선언
                let prod_idx = $(e.target).closest("li").data("pid");                                                   // 변수명 : prod_idx - 저장값 : '+'버튼이 클릭된 상품의 정보 중 상품번호의 참조값(data-pid="...")
                let user_idx = $(e.target).closest("li").data("uid");                                                   // 변수명 : user_idx - 저장값 : '+'버튼이 클릭된 상품의 정보 중 상품번호의 참조값(data-uid="...")
                let prod_cnt = parseInt($(e.target).prev("div").text());                                                // 변수명 : prod_cnt - 저장값 : '+'버튼이 클릭된 상품의 정보 중 상품개수의 참조값(prev - 버튼 이전 요소)
                let upt_cnt = prod_cnt + 1;                                                                             // 변수명 : upt_cnt - 저장값  : '+'버튼이 클릭된 경우, 상품개수(prod_cnt) + 1에 해당하는 값
                                                                                                                        // 2. 메서드 호출
                handleProductCnt(prod_idx, user_idx, prod_cnt, upt_cnt);                                                // handleProductCnt메서드 호출
            });

            // 이벤트 대상 : input[name=order] 주문 버튼
            // 이벤트 : click
            // 이벤트 핸들러 기능 : '주문' 버튼 클릭 시, 주문서 작성 페이지로 이동
            $(document).on("click", "input[name=order]", () => {
                location.href= "/order/checkout";                                                                       // 주문서 작성 페이지로 이동
            });
        })
    </script>
</body>
</html>