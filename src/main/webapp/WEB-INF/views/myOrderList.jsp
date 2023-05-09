<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/validateUser.css"/>
    <%--    경로에 warning이 뜨면 카멜케이스로 명명 수정한다. mypage(x) myPage(o). 어길시 css 404--%>
    <link rel="stylesheet" href="/css/myOrderList.css">

</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="mypage-banner"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/5743dc11-54b5-4140-a574-d0424e6414eb.jpg"></div>
<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
    <div class="order-container">
        <div class="order-header">
            <h2>주문 내역</h2>
            <span>최대 지난 3년간의 주문 내역까지 확인할 수 있어요</span>
        </div>
        <div class="order-header_line"></div>
        <div class="order-listbox">


<%--            <div class="order-list">--%>
<%--                <div class="order-time_detail">--%>
<%--                    <span>2023.03.20 (15시 49분)</span>--%>
<%--                    <a>주문내역 상세보기</a>--%>
<%--                </div>--%>
<%--                <div class="order-content">--%>
<%--                    <div class="img_content">--%>
<%--                        <img src="https://img-cf.kurly.com/shop/data/goods/1654669098671l0.jpg" alt="[하림] 닭가슴살 핫도그 5개입 상품 이미지">--%>
<%--                        <div class="content">--%>
<%--                            <dl><dt>상품명</dt><dd>[하림]닭가슴살 핫도그5개입</dd></dl>--%>
<%--                            <dl><dt>주문번호</dt><dd>23000015490029</dd></dl>--%>
<%--                            <dl><dt>결제방법</dt><dd>신용카드</dd></dl>--%>
<%--                            <dl><dt>결제금액</dt><dd>7,300원</dd></dl>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="order-state">--%>
<%--                        <span>배송완료</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="order-list_line"></div>--%>
<%--            </div>--%>



        </div>
        <div class="myOrder-notice">

        </div>
    </div>

</div>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>

    $(document).ready(function (){
        showList(); // 주문 목록 조회 함수 호출

    })

    let OrderListToHtml = function (orders) {
        let tmp = '';
        // console.log(orders);
        orders.forEach(function (order) {
            tmp += '<div class="order-list">'
            tmp += '<div class="order-time_detail">'
            tmp += '<span>' + moment(order.ord_tm).format("YYYY.MM.DD (hh시 mm분)") + '</span>'
            tmp += '<a href="/mypage/order/list/' + order.idx + '">주문내역 상세보기</a>'
            tmp += '</div>'
            tmp += '<div class="order-content">'
            tmp += '<div class="img_content">'
            tmp += '<img src=' + order.upload_path + ' alt="">'
            tmp += '<div class="content">'
            if (order.plist_tot == 1) {
                tmp += '<dl><dt>상품명</dt><dd>' + order.prod_nm + '</dd></dl>'
            } else {
                tmp += '<dl><dt>상품명</dt><dd>' + order.prod_nm + ' 외 ' + (order.plist_tot - 1) + '건</dd></dl>'
            }
            tmp += '<dl><dt>주문번호</dt><dd>' + order.idx + '</dd></dl>'
            tmp += '<dl><dt>결제방법</dt>'
            if (order.setl_mn_cd == 1) {
                tmp += '<dd>카카오페이</dd></dl>'
            } else if (order.setl_mn_cd == 2) {
                tmp += '<dd>네이버페이</dd></dl>'
            }
            if(order.state_cd == 5 || order.state_cd == 6){
                tmp += '<dl><dt>결제금액</dt><dd>0원</dd></dl>'
            }else {
                tmp += '<dl><dt>결제금액</dt><dd>' + formatPriceWithComma(order.tot_amt) + '원</dd></dl>'
            }
            tmp += '</div>'
            tmp += '</div>'
            tmp += '<div class="order-state">'
            if (order.state_cd == 1) {
                tmp += '<span>결제완료</span>'
            } else if (order.state_cd == 2) {
                tmp += '<span>배송준비중</span>'
            } else if (order.state_cd == 3) {
                tmp += '<span>배송중</span>'
            } else if (order.state_cd == 4) {
                tmp += '<span>배송완료</span>'
            } else if (order.state_cd == 5) {
                tmp += '<span>취소완료</span>'
            } else if (order.state_cd == 6) {
                tmp += '<span>환불완료</span>'
            }
            tmp += '</div>'
            tmp += '</div>'
            tmp += '<div class="order-list_line"></div>'
            tmp += '</div>'


        })
        return tmp;
    }

    let nolistToHtml = function (){
        let tmp = '';

        tmp += '<div>'
        tmp += '<svg width="0" height="60" viewBox="0 0 68 68">'
        tmp += '<img src="https://cdn-icons-png.flaticon.com/512/2298/2298276.png" width="100px" height="100px">'
        // tmp += '<path class="heartpath" stroke="#e2e2e2" d="M57.025 14.975c-5.3-5.3-13.889-5.3-19.186 0L34 18.812l-3.837-3.837c-5.3-5.3-13.89-5.3-19.19 0-5.296 5.297-5.296 13.886 0 19.186l3.838 3.837 18.482 18.485a1 1 0 0 0 1.414 0s0 0 0 0l18.482-18.485h0l3.837-3.837c5.3-5.3 5.3-13.89 0-19.186z"></path>'
        tmp += '</svg>'
        tmp += '</div>'
        tmp += '<strong class="strong-heart">주문내역이 없습니다.</strong>'
        tmp += '<button class="goToProd-btn">'
        tmp += '<span>주문하기</span>'
        tmp += '</button>'


        return tmp;
    }



    // 주문 목록 조회 함수
    let showList = function (){
        $.ajax({
            type:'GET',                                                 // 요청 메서드 // 상품후기 목록 가저오기
            url: '/mypage/order/lists',             // 요청 URI
            // headers : { "content-type": "application/json"},         // 요청 헤더
            // dataType : 'text',                                       // 전송받을 데이터의 타입 / 생략하면 기본이 JSON 이다
            // data : JSON.stringify(person),                           // 서버로 전송할 데이터. stringify()로 직렬화 필요.
            success : function(result){
                $(".order-listbox").html(OrderListToHtml(result));      // 서버로부터 응답이 도착하면 호출될 함수
                $(".count").html(result.length);
                if(result.length==0){
                    $(".myOrder-notice").html(nolistToHtml());
                }
            },
            error   : function(){ alert("error") }                      // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()

    }


    // 정규식 함수화
    let formatPriceWithComma = (price) => {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }


</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>

