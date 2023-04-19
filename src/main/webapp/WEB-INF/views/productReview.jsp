<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2023/04/19
  Time: 11:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<%--    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>--%>
<%--    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>--%>
<%--    <link rel="stylesheet" href="/css/myPage/validateUser.css"/>--%>

    <title>Title</title>

    <style>
        .review-container{
            margin: 0 auto;
            position: relative;
            width: 1010px;
            padding-bottom: 100px;
        }
        .review-section{
            padding: 72px 0;
        }
        .review-header{
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header{
            font-size: 24px;
            font-weight: 500;
            line-height: 41px;
        }
        .review-button{
            height: 40px;
            width: 120px;
            border-radius: 3px;
            border: 0 none;
            color: #fff;
            background-color: #f58412;
            cursor: pointer;
        }


        .review-box{
            position: relative;
            width: 100%;
            margin-top: 34px;
            border-top: 1px solid #333;
        }
        .review-count{
            position: absolute;
            top: -28px;
            width: 100%;
            font-size: 13px;
            line-height: 16px;
        }
        .count{
            font-weight: 500;
        }
        .review-list{
            display: flex;
            padding: 30px 0px 19px 20px;
            border-bottom: 1px solid rgb(244, 244, 244);
            font-size: 14px;
            font-weight: 400;
            line-height: 19px;
        }
        .list-side{
            flex: 0 0 225px;
        }
        .side-headerbox{
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            margin: 15px 0px 7px;
        }
        .rank{
            display: inline-block;
            /* height: 18px; */
            border: 1px solid #f58412;
            border-radius: 3px;
            padding: 3px 4px 3px 5px;
            margin-right: 4px;
            font-weight: 500;
            font-size: 11px;
            line-height: 10px;
            /* text-align: center; */
            /* word-break: keep-all; */
            background-color: #f58412;
            color: rgb(255, 255, 255);
        }
        .name{
            font-weight: 400;
        }
        .review-article{
            width: 1000px;
        }
        .article-name{
            font-size: 15px;
            font-weight: 400;
            /* line-height: 19px; */
            color: rgb(153, 153, 153);
            /* display: -webkit-box; */
            /* overflow: hidden; */
            /* word-break: break-all;
            white-space: normal;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical; */
        }
        .article-content{
            padding-top: 12px;
            /* word-break: break-word; */
            white-space: pre-line;
            font-weight: 400;
            /* font-size: 14px; */
            /* line-height: 19px; */
            color: rgb(51, 51, 51);
            padding-right: 20px;
        }
        .article-footer{
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            padding-top: 19px;
            padding-right: 20px;
            not:selector;
        }
        .article-date{
            color: rgb(153, 153, 153);
        }
        .article-updateBtn{
            border: 1px solid #f58412;
            border-radius: 3px;
            font-weight: 500;
            font-size: 12px;
            height: 40px;
            width: 80px;
            cursor: pointer;
            background: white;
        }
        .thumbsUpBtn{
            display: flex;
            align-items: center;
            height: 32px;
            padding: 0px 13px 0px 11px;
            border: 1px solid rgb(226, 226, 226);
            border-radius: 20px;
            font-size: 11px;
            line-height: 20px;
            color: rgb(153, 153, 153);
            margin-left: 10px;
            width: 89px;
            cursor: pointer;
        }
        .thumbsUp{
            width: 15px;
            height: 15px;
            margin-right: 4px;
            background: url("data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTQiIGhlaWdodD0iMTQiIHZpZXdCb3g9IjAgMCAxNCAxNCIgZmlsbD0ibm9uZSIKICAgICB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogIDxwYXRoCiAgICBkPSJNNC4wNDgzNyAxMi45OTk4SDIuMjE5MzVDMS41NDU5MiAxMi45OTk4IDEgMTIuNDYyNiAxIDExLjc5OTlWNy41OTk5MkMxIDYuOTM3MTggMS41NDU5MiA2LjM5OTkzIDIuMjE5MzUgNi4zOTk5M0g0LjA0ODM3TTguMzE2MDggNS4xOTk5NVYyLjc5OTk4QzguMzE2MDggMS44MDU4OCA3LjQ5NzIgMSA2LjQ4NzA2IDFMNC4wNDgzNyA2LjM5OTkzVjEyLjk5OTlIMTAuOTI1NUMxMS41MzM1IDEzLjAwNjYgMTIuMDUzNyAxMi41NzE1IDEyLjE0NDggMTEuOTc5OUwxMi45ODYyIDYuNTc5OTNDMTMuMDM5OSA2LjIzMTg1IDEyLjkzNTUgNS44NzgxMiAxMi43MDA4IDUuNjEyNDVDMTIuNDY2IDUuMzQ2NzggMTIuMTI0NiA1LjE5NTk2IDExLjc2NjggNS4xOTk5NUg4LjMxNjA4WiIKICAgIHN0cm9rZT0iIzk5OTk5OSIgc3Ryb2tlLXdpZHRoPSIxLjEiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIKICAgIHN0cm9rZS1saW5lam9pbj0icm91bmQiLz4KPC9zdmc+Cg==") center center no-repeat;
        }
        .footer-box{
            align-items: center;
            display: flex;

        }
    </style>
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



<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
    let prod_idx = 1 // 상품번호

    // 상품후기 목록 조회
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
    // main()
    $(document).ready(function (){
        showList();

    });



    let ReviewListToHtml = function (reviews){
        let tmp = '';
        reviews.forEach(function (review){
            tmp += '<div class="review-list">'
            tmp += '<div class="list-side">'
            tmp += '<div class="side-headerbox">'
            tmp += '<span class="rank">베스트</span>'
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
            tmp += '<span>좋아요 13</span>'
            tmp += '</button>'
            tmp += '</div>'
            tmp += '<button class="article-updateBtn">후기수정</button>'
            tmp += '</div>'
            tmp += '</div>'
            tmp += '</article>'
            tmp += '</div>'

        })
        return tmp;
    }

</script>


</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>
