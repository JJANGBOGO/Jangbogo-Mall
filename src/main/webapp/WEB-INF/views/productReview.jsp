<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2023/04/19
  Time: 11:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <link rel="stylesheet" href="/css/productReview.css"/>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<%--    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>--%>
<%--    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>--%>
<%--    <link rel="stylesheet" href="/css/myPage/validateUser.css"/>--%>
    <title>Title</title>

</head>
<body>
<div class="review-container">
    <section class="review-section">
        <header class="review-header">
            <h2 class="header">상품 후기</h2>
            <div class="">
                <button class="review-button" type="button">작성하기</button>
            </div>
        </header>

        <div class="review-box">
            <div class="review-count">
                <span>총 </span><span class="count">14,291</span><span>개</span>
            </div>
            <div class="review-lists">

            </div>

        </div>
    </section>
</div>



<%--모달--%>

<div class="reviewUpdate-container">
    <div></div>
    <div class="reviewUpdate-background">
        <div class="reviewUpdate-modal">
            <header class="review-title">
                <h2>후기 수정</h2>
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
                            <textarea class="content">
                            </textarea>
                            <span></span>
                        </div>
                    </div>
                    <div class="body-warning">
                        <label class="warning-side"></label>
                        <ul class="warning-ul">
                            <li style="color: rgb(153, 153, 153); margin-top: 15px"> *  상품과 무관하거나 반복되는 동일 단어/문장을 사용하여 후기로 볼 수 없는 글, 판매자와 고객의 후기 이용을 방해한다고 판단되는 경우, 배송 박스, 구매 상품을 구분할 수 없는 전체 사진, 화면캡쳐, 음란 및 부적절하거나 불법적인 내용은 통보없이 삭제 및 적립금 회수될 수 있습니다.</li>
                            <li style="color: rgb(153, 153, 153); margin-top: 15px"> *  전화번호, 이메일, 주소, 계좌번호 등 개인정보가 노출되지 않도록 주의해주세요.</li>
                        </ul>
                    </div>
                    <div class="body-footer">
                        <label class="footer-side"></label>
                        <label class="opub-label">
                            <input class="opubCheckbox" type="checkbox">
                            <span>후기 비공개하기</span>
                        </label>
<%--                        <button class="opubBtn">--%>
<%--                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12 24C18.6274 24 24 18.6274 24 12C24 5.37258 18.6274 0 12 0C5.37258 0 0 5.37258 0 12C0 18.6274 5.37258 24 12 24Z" fill="#5f0080"></path><path d="M7 12.6667L10.3846 16L18 8.5" stroke="#fff" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg>--%>
<%--                            <span>후기 비공개하기</span>--%>
<%--                        </button>--%>
                    </div>
                    <div class="footerBtn">
                        <button class="cancleBtn" onclick="return false;">취소</button>
                        <button class="updateBtn" onclick="return false;">수정</button>
                        <button class="insertBtn" onclick="return false;">등록</button>
                        <input class="hidden-idx" type="hidden" value="">
                    </div>
                </form>
            </div>

        </div>

    </div>
</div>


<%--모달끝--%>

<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>

    let prod_idx = 1 // 상품번호

    // 상품후기 목록 조회 함수
    let showList = function (){
        $.ajax({
            type:'GET',       // 요청 메서드 // 상품후기 목록 가저오기
            url: '/product/review/list?prod_idx='+prod_idx,  // 요청 URI
            // headers : { "content-type": "application/json"}, // 요청 헤더
            // dataType : 'text', // 전송받을 데이터의 타입 / 생략하면 기본이 JSON 이다
            // data : JSON.stringify(person),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
            success : function(result){
                $(".review-lists").html(ReviewListToHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
                $(".count").html(result.length);
            },
            error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()

    }

    // main() 처음 페이지 이동시 실행 함수
    $(document).ready(function (){
        <%--console.log("${sessionScope.nickName}");--%>
        <%--console.log(${idx});--%>
        <%--console.log(${sessionScope.idx})--%>
        <%--console.log("${sessionScope.email}");--%>
        <%--console.log("${email}")--%>
        <%--console.log("${nickName}")--%>
        <%--console.log()--%>
        <%--console.log("${pd}");--%>

        // 상품후기 조회 함수 호출
        showList();

        // 후기수정 버튼 클릭 시(수정 모달창 오픈)
        $('.review-lists').on("click",'.article-updateBtn', function (){

            let upload_path = $(this).attr('data-upload_path');                 // 상품 이미지 url 변수 선언
            let name = $(this).parent().siblings('.article-title').text();      // 상품 이름     변수 선언
            let content = $(this).parent().siblings('.article-content').text(); // 상품 후기 내용 변수 선언
            let idx = $(this).attr('data-idx');                                 // 상품 후기 일련번호 변수 선언
            let user_idx = $(this).attr('data-user_idx');
            if(user_idx!=${sessionScope.idx}){
                alert("작성자만 수정할 수 있습니다")
                return;
            }

            $('.review-title').children('h2').text('후기 수정'); // 수정 모달창에 타이틀  -> '후기 수정'으로 변경

            $('.body-footer').css("display","flex");           // 수정 모달창에 비공개체크박스 보이게 하기
            $('.insertBtn').css("display","none");              // 수정 모달창에 '등록' 버튼 안 보이게 하기
            $('.updateBtn').css("display","block");             // 수정 모달창에 '수정' 버튼 보이게 하기

            $('.img-name').text(name);                          // 수정 모달창에 상품이름 추가
            $('.title-img').children().attr("src",upload_path); // 수정 모달창에 이미지 추가
            // $('.content').text(content);                        // 수정 모달창에 후기 내용 추가
            $('.content').val(content);                         // 수정 모달창에 후기 내용 추가
            $('.hidden-idx').attr("value",idx);                 // 수정 모달창에(input) 후기 일련번호 추가

            openModal();                                        // 수정 모달창 오픈
        })

        // 수정창 (X버튼) 클릭
        $('.reviewUpdate-container').on("click",'.closeXBtn', function (){ //
            closeModal();
        })

        // 수정창 (취소 버튼) 클릭
        $('.reviewUpdate-container').on("click",'.cancleBtn', function (){ //
            closeModal();
        })

        // 수정 모달창 (수정) 버튼 클릭
        $(".updateBtn").click(function(){
            if(!confirm("수정하신 내용으로 후기 내용을 변경하시겠습니까?"))return;
            let ctent = $('.content').val();
            let opub_yn = $('.opubCheckbox').is(':checked');
            let idx = $('.hidden-idx').val();
            $.ajax({
                type:'PATCH',       // 요청 메서드 //
                url: '/product/review/'+idx,  // 요청 URI
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({ctent:ctent,opub_yn:opub_yn}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    // alert(result);
                    closeModal();
                    showList();

                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

        });


        // 작성하기 버튼 클릭 시(작성 모달창 오픈)
        $(".review-button").click(function(){

            $('.review-title').children('h2').text('후기 작성'); // 작성 모달창에 타이틀  -> '후기 작성'으로 변경

            $('.updateBtn').css("display","none");               // 작성 모달창에 '수정' 버튼 안 보이게 하기
            $('.insertBtn').css("display","block");              // 작성 모달창에 '등록' 버튼 보이게 하기
            $('.body-footer').css("display","none");             // 작성 모달창에 비공개체크박스 안 보이게 하기
            // $('.content').val("");                      // 작성 내용 빈칸으로 초기화

            openModal(); // 작성 모달창 오픈하기

        });

        // 작성 모달창 (등록) 버튼 클릭
        $(".insertBtn").click(function(){
            if(!confirm("작성하신 내용으로 후기 등록하시겠습니까?"))return;
            let ctent = $('.content').val(); // 후기내용
                                             // 상품번호
                                             // 주문번호???
            $.ajax({
                type:'POST',       // 요청 메서드 //
                url: '/product/review' ,  // 요청 URI
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({ctent:ctent,prod_idx:prod_idx}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    alert(result);
                    closeModal();
                    showList();

                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

        });


    });


    let ReviewListToHtml = function (reviews){
        console.log(${idx});
        console.log(${sessionScope.idx})
        console.log("${sessionScope.email}");
        console.log("${email}")
        console.log("${nickname}")
        console.log()
        let tmp = '';
        reviews.forEach(function (review){
            if((review.user_idx==${idx} && review.opub_yn=="N") || review.opub_yn=="Y"){ // 작성자만 자신이 작성한 비공개 후기를 볼 수 있다
                tmp += '<div class="review-list">'
                tmp += '<div class="list-side">'
                tmp += '<div class="side-headerbox">'
                if(review.rnk_cd==2){   // 등급코드(2) 베스트
                    tmp += '<span class="rank2">베스트</span>'
                }else {                 // 등급코드(1) 일반
                    tmp += '<span class="rank">일반</span>'
                }
                tmp += '<span class="name">'+review.writer+'</span>'
                tmp += '</div>'
                tmp += '</div>'
                tmp += '<article class="review-article">'
                tmp += '<div>'
                tmp += '<div class="article-title">'
                tmp += '<h3 class="article-name">'+review.name+'</h3>'
                tmp += '</div>'
                tmp += '<p class="article-content">'+review.ctent+'</p>'
                tmp += '<div class="article-footer">'
                tmp += '<div class="footer-box">'
                tmp += '<span class="article-date">'+moment(review.reg_tm).format("YYYY-MM-DD")+'</span>'
                tmp += '<button class="thumbsUpBtn">'
                tmp += '<span class="thumbsUp"></span>'
                tmp += '<span>좋아요 '+review.like_cnt+'</span>'
                tmp += '</button>'
                tmp += '</div>'
                tmp += '<button class="article-updateBtn" data-upload_path='+review.resv_photo_upload_path+' data-idx='+review.idx+' data-user_idx='+review.user_idx+'>후기수정</button>'
                tmp += '</div>'
                tmp += '</div>'
                tmp += '</article>'
                tmp += '</div>'
            }


        })
        return tmp;
    }

    // 함수 모음
    let closeModal = function (){ // 모달 닫기 함수선언
        $('.content').val("");                      // 작성 내용 빈칸으로 초기화
        $(".reviewUpdate-container").css("display", "none");
        $("body").css("overflow","visible");
    }
    let openModal = function (){
        $(".reviewUpdate-container").css("display", "block");
        $("body").css("overflow","hidden");
    }



</script>


</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>
