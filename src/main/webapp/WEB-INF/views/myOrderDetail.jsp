<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/validateUser.css"/>
    <%--    경로에 warning이 뜨면 카멜케이스로 명명 수정한다. mypage(x) myPage(o). 어길시 css 404--%>

    <link rel="stylesheet" href="/css/myOrderDetail.css"/>
    <link rel="stylesheet" href="/css/wishlistmodal.css">
    <link rel="stylesheet" href="/css/productReviewModal.css"/>

</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="mypage-banner"><a href="/product/91"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/5743dc11-54b5-4140-a574-d0424e6414eb.jpg"></a></div>
<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
    <div class="orderDetail-container">
<%--        <div class="orderDetail-header">--%>
<%--            <h2>주문 내역 상세</h2>--%>
<%--        </div>--%>
<%--        <div class="orderDetail-ord_idx">--%>
<%--            <h3>--%>
<%--                주문번호 <span class="order_idx">${idx}</span>--%>
<%--            </h3>--%>
<%--        </div>--%>
<%--        <div class="orderDetail-list">--%>
<%--            <img src="https://img-cf.kurly.com/shop/data/goods/1654669098671l0.jpg" alt="" >--%>
<%--            <div class="orderDetail-content">--%>
<%--                <a href="">[하림] 닭가슴살 핫도그 5개입</a>--%>
<%--                <div><span class="orderDetail-price">7,300원</span><span class="orderDetail-count">1개</span></div>--%>
<%--            </div>--%>
<%--            <span class="orderDetail-state_cd">배송완료</span>--%>
<%--            <div class="orderDetail-listBtn">--%>
<%--                <button class="orderDetail-review"><span>후기완료</span></button>--%>
<%--                <button class="orderDetail-cart"><span>장바구니 담기</span></button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="orderDetail-Btn">--%>
<%--            <button class="orderDetail-cartAll">전체 상품 다시 담기</button>--%>
<%--            <button class="orderDetail-cancle">전체 상품 주문 취소</button>--%>
<%--        </div>--%>
<%--        <span class="orderDetail-notice">주문취소는 [주문완료] 상태일 경우에만 가능합니다.</span>--%>


<%--        <div class="orderDetail-setl">--%>
<%--            <h3>결제정보</h3>--%>
<%--        </div>--%>
<%--        <ul class="orderDetail-setl_list">--%>
<%--            <li><span>상품금액</span><span>7,300원</span></li>--%>
<%--            <li><span>배송비</span><span></span>2,500원</li>--%>
<%--            <li><span>결제금액</span><span>7,300원</span></li>--%>
<%--            <li class="last"><span>결제방법</span><span>신용카드</span></li>--%>
<%--        </ul>--%>

<%--        <div class="orderDetail-ord">--%>
<%--            <h3>주문정보</h3>--%>
<%--        </div>--%>
<%--        <ul class="orderDetail-ord_list">--%>
<%--            <li><span class="key">주문번호</span><span class="value">23000021502</span></li>--%>
<%--            <li><span class="key">보내는 분</span><span class="value">문하늘</span></li>--%>
<%--            <li class="last"><span class="key">결제일시</span><span class="value">2023-03-20 15:50:31</span></li>--%>
<%--        </ul>--%>

<%--        <div class="orderDetail-address">--%>
<%--            <h3>배송정보</h3>--%>
<%--        </div>--%>
<%--        <ul class="orderDetail-address_list">--%>
<%--            <li><span class="key">받는 분</span><span class="value">문하늘</span></li>--%>
<%--            <li><span class="key">핸드폰</span><span class="value">010-9273-****</span></li>--%>
<%--            <li><span class="key">주소</span><span class="value">(03164) 서울특별시 종로구 종로 69 (서울 YMCA) 518호 정석코딩</span></li>--%>
<%--            <li><span class="key">받으실 장소</span><span class="value"></span></li>--%>
<%--            <li><span class="key">공동현관 출입방법</span><span class="value"></span></li>--%>
<%--            <li><span class="key">포장 방법</span><span class="value"></span></li>--%>
<%--            <li><span class="key">유형</span><span class="value">냉동</span></li>--%>
<%--        </ul>--%>

    </div>

<%--    장바구니 담기 모달--%>
    <div class="background">
        <div class="popup">
            <div>
                <div>
                    <span class="prd-name">1</span>
                </div>
                <div class="prd-priceAndcount">
                    <div class="prd-price">
                        <span class="prd-priceOrigin">2</span><span class="prd-priceDC"></span>
                    </div>
                    <div class="count-box">
                        <button class="button1" type="button"></button>
                        <%--                        <button class="button3" type="button"></button>--%>

                        <div class="count">

                        </div>
                        <button class="button2" type="button"></button>
                    </div>
                </div>
            </div>
            <div class="totalprice">
                <div class="total1">
                    <p class="total2">
                        합계
                    </p>
                    <div>
                        <span class="price"></span>
                        <span class="price-won">원</span>
                    </div>
                </div>
            </div>
            <div id="close" class="btn-container">
                <button class="cancle-btn">
                    <span class="cancle-cartBtn">취소</span>
                </button>
                <button class="insert-btn">
                    <span class="insert-cartBtn">장바구니 담기</span>
                </button>
                <input class="hidden_input" name="hidden_input" type="hidden" value="">
            </div>
        </div>
    </div>
<%--    장바구니 담기 모달 끝--%>

<%--    상품 후기 작성 모달--%>
    <div class="reviewUpdate-container">
        <div></div>
        <div class="reviewUpdate-background">
            <div class="reviewUpdate-modal">
                <header class="review-title">
                    <h2>후기 작성</h2>
                    <button class="closeXBtn">
                        <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"><g clip-path="url(#clip0_2073_60924)"><path d="M26 26L6 6" stroke="#999" stroke-linecap="square" stroke-width="0"></path><path d="M6 26L26 6" stroke="#999" stroke-linecap="square" stroke-width="0"></path></g><path fill-rule="evenodd" clip-rule="evenodd" d="M6.28431 5.58859L6.35355 5.64645L16 15.293L25.6464 5.64645C25.8417 5.45118 26.1583 5.45118 26.3536 5.64645C26.5271 5.82001 26.5464 6.08944 26.4114 6.28431L26.3536 6.35355L16.707 16L26.3536 25.6464C26.5488 25.8417 26.5488 26.1583 26.3536 26.3536C26.18 26.5271 25.9106 26.5464 25.7157 26.4114L25.6464 26.3536L16 16.707L6.35355 26.3536C6.15829 26.5488 5.84171 26.5488 5.64645 26.3536C5.47288 26.18 5.4536 25.9106 5.58859 25.7157L5.64645 25.6464L15.293 16L5.64645 6.35355C5.45118 6.15829 5.45118 5.84171 5.64645 5.64645C5.82001 5.47288 6.08944 5.4536 6.28431 5.58859Z" fill="#999"></path></svg>
                    </button>
                </header>
                <div class="review-body">
                    <div class="body-title">
                        <span class="title-img"><img src="https://img-cf.kurly.com/shop/data/goods/1654669098671l0.jpg"></span>
                        <div class="">
                            <span class="img-name">[하림] 닭가슴살 핫도그 5개입</span>
                        </div>
                    </div>
                    <form>
                        <div class="body-content">
                            <label class="content-side">
                                내용
                                <sup style="color: rgb(250, 98, 47);">*</sup>
                            </label>
                            <div class="content-box">
                            <textarea class="content" placeholder="최소 10자 이상 입력해 주세요."></textarea>
                                <div id="review_cnt">(0 / 3000)</div>
                                <span></span>
                            </div>
                            <div class="error-msg"></div>
                        </div>
                        <div class="body-warning">
                            <label class="warning-side"></label>
                            <ul class="warning-ul">
                                <li> *  상품과 무관하거나 반복되는 동일 단어/문장을 사용하여 후기로 볼 수 없는 글, 판매자와 고객의 후기 이용을 방해한다고 판단되는 경우, 배송 박스, 구매 상품을 구분할 수 없는 전체 사진, 화면캡쳐, 음란 및 부적절하거나 불법적인 내용은 통보없이 삭제 및 적립금 회수될 수 있습니다.</li>
                                <li> *  전화번호, 이메일, 주소, 계좌번호 등 개인정보가 노출되지 않도록 주의해주세요.</li>
                            </ul>
                        </div>
                        <div class="body-footer">
<%--                            <label class="footer-side"></label>--%>
<%--                            <label class="opub-label">--%>
<%--                                <input class="opubCheckbox" type="checkbox">--%>
<%--                                <span>후기 비공개하기</span>--%>
<%--                            </label>--%>
                        </div>
                        <div class="footerBtn">
                            <button class="cancleBtn" onclick="return false;">취소</button>
                            <button class="insertBtn" onclick="return false;">등록</button>
                            <button class="insertBtnNo" onclick="return false;">등록</button>
                            <input class="hidden-idx" type="hidden" value="">
                        </div>
                    </form>
                </div>

            </div>

        </div>
    </div>
<%--    상품 후기 작성 모달 끝--%>
</div>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>

    $(document).ready(function (){

        showList();
        // 전체 상품 주문 취소 버튼 클릭 시
        $('.orderDetail-container').on("click",'.orderDetail-cancle', function (){
            if(!confirm("주문 취소하시겠습니까?"))return;
            let idx = $(this).attr('data-idx')                       // 주문번호 회득
            // console.log(idx)
            $.ajax({
                type:'PATCH',              // 요청 메서드
                url: '/mypage/order/detail/stateUpdate/'+idx,  // 요청 URI
                // headers : { "content-type": "application/json"}, // 요청 헤더
                // data : JSON.stringify({ctent:ctent,prod_idx:prod_idx,ord_idx:ord_idx}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    alert("주문 취소가 완료되었습니다");
                    showList();
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

        });

        // 후기작성 버튼 클릭 시(작성 모달창 오픈)
        $(".orderDetail-container").on("click",'.orderDetail-review', function (){
            $('.content').keyup(function (){
                let newLength = $(this).val().length;
                // console.log(newLength)
                if(newLength<10) {
                    $(".insertBtn").css('display', 'none');
                    $(".insertBtnNo").css('display', 'block');
                } else {
                    $(".insertBtn").css('display', 'block');
                    $(".insertBtnNo").css('display', 'none');
                }

            })

            let upload_path = $(this).parent().siblings().attr('src');                          // 상품 이미지 url 변수 선언
            let name = $(this).parent().siblings('.orderDetail-content').children('a').text();  // 상품이름 변수 선언
            let prod_idx = $(this).attr('data-prod_idx')          // 상품번호 변수 선언
            let ord_idx = $(this).attr('data-ord_idx');           // 주문번호 변수 선언
            let ord_dtl_idx = $(this).attr('data-ord_dtl_idx')    // 주문상세번호 변수 선언

            $('.insertBtn').attr('data-prod_idx',prod_idx);       // 상품번호를 등록버튼에 사용자 정의 속성으로 추가
            $('.insertBtn').attr('data-ord_idx',ord_idx);         // 주문번호를 등록버튼에 사용자 정의 속성으로 추가
            $('.insertBtn').attr('data-ord_dtl_idx',ord_dtl_idx); // 주문상세번호를 등록버튼에 사용자 정의 속으로 추가
            // let user_idx = $(this).attr('data-user_idx');
            $('.title-img').children().attr("src",upload_path);   // 수정 모달창에 이미지 추가
            $('.img-name').text(name);                            // 수정 모달창에 상품이름 추가

            // $('.content').val("");                             // 작성 내용 빈칸으로 초기화
            openModal(); // 작성 모달창 오픈하기

        });


        $('.content').on('keyup', function() {
            $('#review_cnt').html("("+$(this).val().length+" / 3000)");
            if($(this).val().length > 3000) {
                $(this).val($(this).val().substring(0, 3000));
                $('#review_cnt').html("(3000 / 3000)");
                alert("작성 가능 문자수를 초과하셨습니다")
            }
        })

        // 후기작성 모달창 (등록) 버튼 클릭
        $(".insertBtn").click(function(){
            if(!confirm("작성하신 내용으로 후기 등록하시겠습니까?"))return;
            let ctent = $('.content').val(); // 후기내용
            let prod_idx = $(this).attr('data-prod_idx')               // 상품번호
            let ord_idx = $(this).attr('data-ord_idx')                 // 주문번호
            let ord_dtl_idx = $(this).attr('data-ord_dtl_idx')         // 주문상세번호


            if(ctent.length<10 || ctent.trim()==''){
                alert("10글자 이상 입력해주세요")
                // ctent.focus()
                $('.content').attr("tabindex",-1);
                $('.content').focus();
                // console.log(ctent.length);
                return;
            }

            $.ajax({
                type:'POST',              // 요청 메서드
                url: '/mypage/order/detail/insertReview?ord_dtl_idx='+ord_dtl_idx,  // 요청 URI
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({ctent:ctent,prod_idx:prod_idx,ord_idx:ord_idx}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    alert("후기 작성이 완료되었습니다")
                    // alert(result);
                    closeModal();
                    showList();
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

        });



        // 후기 작성 모달창 (X버튼) 클릭
        $('.closeXBtn').click(function (){
            closeModal();
            $(".insertBtn").css('display', 'none');
            $(".insertBtnNo").css('display', 'block');

            $('#review_cnt').html("(0 / 3000)");
        })
        // 후기 작성 모달창 (취소 버튼) 클릭
        $('.cancleBtn').click(function (){
            closeModal();
            $(".insertBtn").css('display', 'none');
            $(".insertBtnNo").css('display', 'block');

            $('#review_cnt').html("(0 / 3000)");
        })


        // 전체 상품 장바구니 담기(추가)
        $('.orderDetail-container').on("click",'.orderDetail-cartAll',function (e){
            // let idx = $('.order_idx').text();       // 주문번호
            let idx =  ${idx}; // 주문번호
            $.ajax({
                type:'POST',       // 요청 메서드 // 위시리스트에서 장바구니에 담기
                url: '/mypage/order/detail/insertCartAll/'+idx,  // 요청 URI
                success : function(result){
                    if(result=="CART_OK") alert("전체 상품을 장바구니에 담았습니다");

                    showList(); // 서버로부터 응답이 도착하면 호출될 함수
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        })

        // 주문내역 장바구니 담기(추가)
        $(".insert-btn").click(function(){
            let prod_idx = $('input[name=hidden_input]').text(); // 상품번호
            let prod_cnt = $('.count').text();       // 장바구니에 담을 상품개수

            let cnt = Number(prod_cnt);

            if (isNaN(cnt)) {
                alert ("숫자 형식이 아닙니다");
                return false;
            }

            if (cnt < 1 || cnt >= 100) {
                alert ("최소 1개에서 100개 미만 수량을 선택해 주세요");
                return false;
            }

            $.ajax({
                type:'POST',       // 요청 메서드 // 위시리스트에서 장바구니에 담기
                url: '/mypage/order/detail/insertCart?prod_idx='+prod_idx+'&prod_cnt=' + prod_cnt,  // 요청 URI
                success : function(result){
                    document.querySelector(".background").className = "background";
                    $('.count').text(counter=1); // 카운터 1로 리셋
                    $('.button3').attr('class',"button1"); // 버튼 클래스이름 변경
                    if(result=="INSERT_OK1") alert("장바구니에 상품이 담겼습니다");
                    if(result=="INSERT_OK2") alert("장바구니에 상품이 담겼습니다\n이미 담은 상품의 수량을 추가했습니다");
                    showList(); // 서버로부터 응답이 도착하면 호출될 함수
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });


        // 주문내역 장바구니 담기 버튼 클릭 (모달 창 오픈)
        $('.mypage-base').on("click",'.orderDetail-cart',function (e){
            let name = $(this).parent().siblings('.orderDetail-content').children('a').text(); // 요소 선택자 나중에 더 이해하기
            let dc_price = $(this).parent().siblings('.orderDetail-content').children().children('.orderDetail-price').text(); // 요소 선택자 나중에 더 이해하기
            let price = $(this).parent().siblings('.orderDetail-content').children().children('.orderDetail-price').text(); // 요소 선택자 나중에 더 이해하기
            let prod_idx = $(this).attr('data-prod_idx'); // 요소 선택자 나중에 더 이해하기

            // 상품이름, 상품 할인가격, 상품 가격, 상품번호 값을 모달에 넣어준다
            $('.prd-name').text(name); // 상품이름 ex) 홈런볼
            $('.prd-priceOrigin').text(dc_price); // 할인된 가격 ex) 1,500원
            // $('.prd-priceDC').text(price); // 원래 가격 ex) 1,700원
            $('.price').text(parseInt(dc_price.replace(',', "")).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")); // 기본 1개 가격 ex) 1,500원
            $('.hidden_input').text(prod_idx); // 상품 번호 ex) 1
            document.querySelector(".background").className = "background show"; // 모달창 오픈
            $('.count').text(counter=1); // 기본 장바구니 담는 개수 1개(default)
        });

        // 장바구니 모달 창 취소 버튼
        var close1 = $('.background').on("click",'.cancle-btn',function (){
            document.querySelector(".background").className = "background";
            $('.count').text(counter=1); // 카운터 1로 리셋
            $('.button3').attr('class',"button1"); // 버튼 클래스이름 변경
        });


        let counter = 1;  // 장바구니 담기 카운터  // 처음 기본(default) 개수
        // 카운터 상품개수조절(-)버튼
        $('.background').on("click",'.button3', function (){
            $('.count').text(--counter);
            let price = counter * parseInt($('.prd-priceOrigin').text().replace(',', ""));  // 콤마(,)제거 및 숫자 변환
            $('.price').text(formatPriceWithComma(price)); // 다시 콤마(,) 추가
            if(counter<2){                                  // 숫자 2보다 작으면(+) 버튼 비활성화
                $('.button3').attr('class',"button1");
            }
        });

        // 카운터 상품개수조절(+)버튼
        $('.button2').on('click',function (){
            $('.count').text(++counter);
            let price = counter * parseInt($('.prd-priceOrigin').text().replace(',', ""));  // 콤마(,)제거 및 숫자 변환
            $('.price').text(formatPriceWithComma(price)); // 다시 콤마(,) 추가
            if(counter>1){                                 // 숫자 1보다 크면 마이너스(-) 버튼 활성화
                $('.button1').attr('class',"button3");
            }
        });


    });

    // 주문 내역 (상세) 목록 함수
    let showList = function (){
        $.ajax({
            type:'GET',                                                 // 요청 메서드 // 상품후기 목록 가저오기
            url: '/mypage/order/detail/'+ ${idx},             // 요청 URI
            // headers : { "content-type": "application/json"},         // 요청 헤더
            // dataType : 'text',                                       // 전송받을 데이터의 타입 / 생략하면 기본이 JSON 이다
            // data : JSON.stringify(person),                           // 서버로 전송할 데이터. stringify()로 직렬화 필요.
            success : function(result){
                $(".orderDetail-container").html(OrderDetailToHtml(result));      // 서버로부터 응답이 도착하면 호출될 함수
            },
            error   : function(){ alert("error") }                      // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()

    }

    let OrderDetailToHtml = function (orders){
        let orderStatus = "";       // 주문상태
        let safekeeping_mthd = "";  // 배송유형
        let mean = "";              // 결제수단
        let packing_mthd = "";      // 포장유형
        let tmp = '<div class="orderDetail-header">'
        tmp += '<h2>주문 내역 상세</h2>'
        tmp += '</div>'
        tmp += '<div class="orderDetail-ord_idx">'
        tmp += '<h3>주문번호 <span class="order_idx">'+orders[0].idx+'</span></h3>'
        tmp += '</div>'
        tmp += ''
        orders.forEach(function (order){
            tmp += '<div class="orderDetail-list">'
            tmp += '<a href="/product/'+order.prod_idx+'">'
            tmp += '<img src="'+order.upload_path+'" alt="" >'
            tmp += '</a>'
            tmp += '<div class="orderDetail-content">'
            tmp += '<a href="/product/'+order.prod_idx+'">'+order.prod_nm+'</a>'
            tmp += '<div>'
            if(order.dc_rate != 0){
                tmp += '<span class="orderDetail-dc_rate" id="dc_rate">'+order.dc_rate+'%</span>'
            }
            tmp += '<span class="orderDetail-price">'+formatPriceWithComma((order.prod_prc - Math.floor(order.prod_prc / 100 * order.dc_rate)))+'원</span>'
            if(order.dc_rate != 0){
                tmp += '<span class="orderDetail-priceOrigin">'+formatPriceWithComma(order.prod_prc )+'원</span>'
            }
            tmp += '<span class="orderDetail-count">'+order.prod_qty+'개</span>'
            tmp += '</div>'
            tmp += '</div>'
            if (order.ord_state_cd == 1) {
                orderStatus = '결제완료';
            } else if (order.ord_state_cd == 2) {
                orderStatus = '배송준비중';
            } else if (order.ord_state_cd == 3) {
                orderStatus = '배송중';
            } else if (order.ord_state_cd == 4) {
                orderStatus = '배송완료';
            } else if (order.ord_state_cd == 5) {
                orderStatus = '취소완료';
            } else if (order.ord_state_cd == 6) {
                orderStatus ='환불완료';
            }
            tmp += '<span class="orderDetail-state_cd">'+orderStatus+'</span>'
            tmp += '<div class="orderDetail-listBtn">'
            if(order.prod_late_state_cd == 1){
                tmp += '<button class="orderDetail-review3" data-prod_idx = '+order.prod_idx+' data-ord_idx = '+order.idx+' data-ord_dtl_idx = '+order.ord_dtl_idx+'>후기불가능</button>'
            }else if(order.prod_late_state_cd==2){
                tmp += '<button class="orderDetail-review" data-prod_idx = '+order.prod_idx+' data-ord_idx = '+order.idx+' data-ord_dtl_idx = '+order.ord_dtl_idx+'>후기작성</button>'
            }else if(order.prod_late_state_cd==3){
                tmp += '<button class="orderDetail-review3" data-prod_idx = '+order.prod_idx+' data-ord_idx = '+order.idx+' data-ord_dtl_idx = '+order.ord_dtl_idx+'>후기완료</button>'
            }
            tmp += '<button class="orderDetail-cart" data-prod_idx = '+order.prod_idx+'>장바구니 담기</button>'
            tmp += '</div>'
            tmp += '</div>'
        })
        tmp += '<div class="orderDetail-Btn">'
        tmp += '<button class="orderDetail-cartAll">전체 상품 다시 담기</button>'
        if(orders[0].cncl_posbl_state_cd == 1){
            tmp += '<button class="orderDetail-cancle" data-idx= '+orders[0].idx+'>전체 상품 주문 취소</button>'
        }else {
            tmp += '<button class="orderDetail-cancleDefault">전체 상품 주문 취소</button>'
        }
        tmp += '</div>'
        tmp += '<span class="orderDetail-notice">주문취소는 [결제완료] 상태일 경우에만 가능합니다.</span>'

        tmp += '<div class="orderDetail-setl">'
        tmp += '<h3>결제정보</h3>'
        tmp += '</div>'
        tmp += '<ul class="orderDetail-setl_list">'
        if(orders[0].ord_state_cd == 5){
            tmp += '<li><span>상품금액</span><span>0원</span></li>'
            tmp += '<li><span>배송비</span><span></span>0원</li>'
            tmp += '<li><span>결제금액</span><span>0원</span></li>'
            tmp += '<li><span>환불완료금액</span><span>'+formatPriceWithComma(orders[0].amt)+'원</span></li>'
        }else{
            tmp += '<li><span>상품금액</span><span>'+formatPriceWithComma(orders[0].amt - 2500)+'원</span></li>'
            tmp += '<li><span>배송비</span><span></span>2,500원</li>'
            tmp += '<li><span>결제금액</span><span>'+formatPriceWithComma(orders[0].amt)+'원</span></li>'
        }

        tmp += '<li class="last"><span>결제방법</span>'
        if(orders[0].mn_cd==1){
            mean = "카카오페이";
        }else if(orders[0].mn_cd==2){
            mean = "네이버페이";
        }
        tmp += '<span>'+mean+'</span></li>'
        tmp += '</ul>'

        tmp += '<div class="orderDetail-ord">'
        tmp += '<h3>주문정보</h3>'
        tmp += '</div>'
        tmp += '<ul class="orderDetail-ord_list">'
        tmp += '<li><span class="key">주문번호</span><span class="value">'+orders[0].idx+'</span></li>'
        tmp += '<li><span class="key">보내는 분</span><span class="value">'+orders[0].ordr_nm+'</span></li>'
        tmp += '<li class="last"><span class="key">결제일시</span><span class="value">'+moment(orders[0].ord_tm).format("YYYY-MM-DD hh:mm:ss")+'</span></li>'
        tmp += '</ul>'

        tmp += '<div class="orderDetail-address">'
        tmp += '<h3>배송정보</h3>'
        tmp += '</div>'
        tmp += '<ul class="orderDetail-address_list">'
        tmp += '<li><span class="key">받는 분</span><span class="value">'+orders[0].rcpr_nm+'</span></li>'
        tmp += '<li><span class="key">핸드폰</span><span class="value">'+formatMpnoWithHyphen(orders[0].rcpr_mpno)+'</span></li>'
        tmp += '<li><span class="key">주소</span><span class="value">'+orders[0].rcpr_addr_base+' '+orders[0].rcpr_addr_dtl+'</span></li>'
        tmp += '<li><span class="key">받으실 장소</span><span class="value">'+orders[0].plrcv+'</span></li>'
        tmp += '<li><span class="key">공동현관 출입방법</span><span class="value"></span></li>'
        tmp += '<li><span class="key">포장 방법</span>'
        if(orders[0].pack_mtd_cd==1){
            packing_mthd = "종이박스"
        }else if(orders[0].pack_mtd_cd==2){
            packing_mthd = "아이스박스"
        }
        tmp += '<span class="value">'+packing_mthd+'</span></li>'
        tmp += '<li><span class="key">유형</span>'
        if(orders[0].sfkp_mtd_cd==1){
            safekeeping_mthd = "냉장";
        }else if(orders[0].sfkp_mtd_cd==2){
            safekeeping_mthd = "냉동";
        }else if(orders[0].sfkp_mtd_cd==3){
            safekeeping_mthd = "상온";
        }
        tmp += '<span class="value">'+safekeeping_mthd+'</span></li>'
        tmp += '</ul>'

        return tmp;
    }


    // 후기 작성 모달 닫기 함수
    let closeModal = function (){
        $('.content').val("");    // 작성 내용 빈칸으로 초기화
        $(".reviewUpdate-container").css("display", "none");
        $("body").css("overflow","visible");
    }
    // 후기 작성 모달 오픈 함수
    let openModal = function (){
        $(".reviewUpdate-container").css("display", "block");
        $("body").css("overflow","hidden");
    }


    // 정규식 함수화
    // 기   능 : 인자값을 문자열로 변환한 뒤, 정규식을 활용하여 3자리마다 삽입한 콤마를 제거한다.
    let formatPriceWithComma = (price) => {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }

    // 기   능 : 인자값을 문자열로 변환한 뒤, 정규식을 활용하여 각 자리에 하이픈을 삽입해준다.
    let formatMpnoWithHyphen = (mpno) => {
        return mpno.toString().replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
    }


</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>

