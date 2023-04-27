<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/validateUser.css"/>
    <%--    경로에 warning이 뜨면 카멜케이스로 명명 수정한다. mypage(x) myPage(o). 어길시 css 404--%>
    <link rel="stylesheet" href="/css/wishlist.css">
    <link rel="stylesheet" href="/css/wishlistmodal.css">

    <style>
        .order-container{
            width: 820px;
        }
        .order-header{
            display: flex;
            align-items: center;
        }

        .order-header h2{
            font-weight: 500;
            font-size: 24px;
            color: rgb(51, 51, 51);
            letter-spacing: -0.5px;
            line-height: 48px;
        }
        .order-header span{
            padding-left: 11px;
            font-size: 14px;
            letter-spacing: -0.3px;
            color: rgb(153, 153, 153);
            line-height: 20px;
        }

        .order-header_line{
            border-bottom: 2px solid rgb(51, 51, 51);
        }

        .order-listbox{
            padding-top: 20px;
        }
        .order-list{
            padding: 16px 20px;
            margin-bottom: 14px;
        }

        .order-time_detail{
            display: flex;
            padding: 8px 0px 13px;
            -webkit-box-pack: justify;
            justify-content: space-between;
            border-bottom: 1px solid rgb(221, 223, 225);
        }
        .order-time_detail span{
            font-size: 16px;
            font-weight: 700;
            line-height: 1.31;
            color: rgb(51, 51, 51);
        }
        .order-time_detail a{
            font-size: 12px;
            color: rgb(51, 51, 51);
            cursor: pointer;
        }
        .order-content{
            display: flex;
            /* flex-direction: row; */
            /* -webkit-box-pack: justify; */
            justify-content: space-between;
            padding: 14px 0px 16px;
        }
        .order-content .img_content{
            display: flex;
            align-items: center;
        }
        .img_content img{
            width: 70px;
            height: 85px;
            margin-right: 20px;
            background-color: rgb(245, 245, 245);
        }
        .img_content .content dl{
            display: flex;
            padding-top: 6px;
            flex-direction: row;
            color: rgb(0, 0, 0);
            line-height: 20px;
            margin: 0px

        }
        .img_content .content dl dt{
            width: 50px;
            line-height: 1.58;
            margin-right: 10px;
            font-size: 12px;
            color: rgb(51, 51, 51);
        }
        .img_content .content dl dd{
            flex: 1 1 0%;
            font-weight: 550;
            /* color: rgb(51, 51, 51);
            display: -webkit-box;
            overflow: hidden;
            word-break: break-all;
            white-space: normal;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical; */
            line-height: 1.36;
            font-size: 14px;
        }
        .order-state{
            display: flex;
            align-items: center;
        }
        .order-state span{
            font-size: 16px;
            font-weight: 550;
            /* text-align: right; */
            margin-right: 20px;
            color: rgb(51, 51, 51);
        }

    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="mypage-banner"></div>
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
    </div>

</div>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>

    $(document).ready(function (){
        showList();

    })

    let OrderListToHtml = function (orders){
        let tmp = '';
        console.log(orders);
        orders.forEach(function (order){
            tmp += '<div class="order-list">'
            tmp += '<div class="order-time_detail">'
            tmp += '<span>'+moment(order.ord_tm).format("YYYY.MM.DD (hh시 mm분)")+'</span>'
            tmp += '<a>주문내역 상세보기</a>'
            tmp += '</div>'
            tmp += '<div class="order-content">'
            tmp += '<div class="img_content">'
            tmp += '<img src='+order.upload_path+' alt="">'
            tmp += '<div class="content">'
            tmp += '<dl><dt>상품명</dt><dd>'+order.prod_nm+' 외 '+(order.plist_tot-1)+'건</dd></dl>'
            tmp += '<dl><dt>주문번호</dt><dd>'+order.idx+'</dd></dl>'
            tmp += '<dl><dt>결제방법</dt>'
            if(order.setl_mn_cd==1){
                tmp += '<dd>카카오페이</dd></dl>'
            }else if(order.setl_mn_cd==2){
                tmp += '<dd>네이버페이</dd></dl>'
            }
            tmp += '<dl><dt>결제금액</dt><dd>'+formatPriceWithComma(order.tot_amt)+'원</dd></dl>'
            tmp += '</div>'
            tmp += '</div>'
            tmp += '<div class="order-state">'
            if(order.state_cd==1){
                tmp += '<span>주문완료</span>'
            }else if(order.state_cd==2){
                tmp += '<span>배송준비중</span>'
            }else if(order.state_cd==3){
                tmp += '<span>배송출발</span>'
            }else if(order.state_cd==4){
                tmp += '<span>배송완료</span>'
            }else if(order.state_cd==5){
                tmp += '<span>취소완료</span>'
            }else if(order.state_cd==6){
                tmp += '<span>환불완료</span>'
            }
            tmp += '</div>'
            tmp += '</div>'
            tmp += '<div class="order-list_line"></div>'
            tmp += '</div>'


        })
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

