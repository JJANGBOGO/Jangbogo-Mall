<%--
  Created by IntelliJ IDEA.
  User: han
  Date: 2023/05/07
  Time: 6:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/validateUser.css"/>

    <%--    경로에 warning이 뜨면 카멜케이스로 명명 수정한다. mypage(x) myPage(o). 어길시 css 404--%>
    <style>
        .user_inqry-container{
            width: 820px;
        }

        .user_inqry-header{
            display: flex;
            flex-direction: row;
            -webkit-box-align: center;
            align-items: center;
        }

        .header-content{
            font-weight: 600;
            font-size: 24px;
            color: rgb(51, 51, 51);
            letter-spacing: -0.5px;
            line-height: 48px;
        }

        .user_inqry-columnbox{
            display: flex;
            width: 100%;
            padding: 20px 0px;
            border-bottom: 1px solid rgb(51, 51, 51);
            border-top: 2px solid rgb(51, 51, 51);
        }

        .column-title{
            -webkit-box-flex: 1;
            flex-grow: 1;
            text-align: center;
            line-height: 20px;
            font-weight: 400;
            color: rgb(51, 51, 51);
        }

        .column-reg_tm{
            flex-basis: 100px;
            text-align: center;
            line-height: 20px;
            font-weight: 400;
            color: rgb(51, 51, 51);
        }

        .column-resp_state_cd{
            flex-basis: 100px;
            text-align: center;
            line-height: 20px;
            font-weight: 400;
            color: rgb(51, 51, 51);
        }

        .user_inqry-div{
            display: flex;
        }

        .user_inqry-title{
            width: 620px;
            padding: 20px;
            line-height: 22px;
            font-size: 15px;
        }

        .user_inqry-reg_tm{
            padding: 20px 0px;
            color: rgb(76, 76, 76);
            width: 100px;
            text-align: center;
            font-size: 15px;
            line-height: 22px;
            border-bottom: 1px solid rgb(244, 244, 244);
            color: rgb(153, 153, 153);
            /*margin-right: 12px;*/
        }

        .user_inqry-resp_state_cd{
            padding: 20px 0px;
            color: rgb(76, 76, 76);
            width: 100px;
            text-align: center;
            font-size: 15px;
            line-height: 22px;
            border-bottom: 1px solid rgb(244, 244, 244);
            color: rgb(153, 153, 153);
            /*margin-right: 6px;*/
        }
        .user_inqry-resp_state_cd span{
            color: #f58412;
        }

        .user_inqry-answer-box{
            padding: 20px 20px 30px;
            background-color: rgb(250, 250, 250);
        }



        .user_inqry-answer-category{
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            line-height: 20px;
            letter-spacing: -0.075em;
            margin-bottom: 20px;
        }

        .answer-category1{
            font-size: 14px;
            /* font-family: "Noto Sans", serif; */
            color: rgb(153, 153, 153);
        }
        .answer-category2{
            display: inline-block;
            width: 16px;
            height: 16px;
            background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDE2IDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0wIDBIMTZWMTZIMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0zMzkgLTEzNTUpIHRyYW5zbGF0ZSgwIDY0KSB0cmFuc2xhdGUoMCAxMjcxKSB0cmFuc2xhdGUoMzM5IDIwKSIvPgogICAgICAgICAgICAgICAgICAgICAgICA8cGF0aCBzdHJva2U9IiM5OTkiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgZD0iTTQgNUwxMCA1IDEwIDExIiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMzM5IC0xMzU1KSB0cmFuc2xhdGUoMCA2NCkgdHJhbnNsYXRlKDAgMTI3MSkgdHJhbnNsYXRlKDMzOSAyMCkgcm90YXRlKDQ1IDcgOCkiLz4KICAgICAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo=);
            margin: 0px 5px;
        }
        .answer-category3{
            font-size: 14px;
            /* font-family: "Noto Sans", serif; */
            color: rgb(153, 153, 153);
        }
        .user_inqry-answer-question{
            display: flex;
        }

        .user_inqry-answer-question div{
            width: 744px;
            margin-top: 3px;
            margin-left: 12px;
        }
        .user_inqry-img{
            width: 24px;
            height: 24px;
            display: block;
            background-image: url(data:image/png;base64,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);
            background-position: center center;
            background-repeat: no-repeat;
            background-size: contain;
        }

        .user_inqry-answer-question div span{
            font-size: 15px;
        }

        .user_inqry-answer-question div div{
            max-width: 744px;
            margin-top: 20px;
        }

        .user_inqry-UpdAndDel_btn{
            width: 100%;
            display: flex;
            -webkit-box-pack: end;
            justify-content: flex-end;
            -webkit-box-align: center;
            align-items: center;
            margin-top: 20px;
        }

        .user_inqry-UpdAndDel_btn .Update_btn{
            padding: 6px 10px;
            border: none;
            font-size: 13px;
            color: rgb(153, 153, 153);
            background-color: transparent;
            cursor: pointer;
        }
        .user_inqry-UpdAndDel_btn span{
            margin-top: 15px;
            margin-left: 40px;
        }

        .user_inqry-UpdAndDel_btn .Delet_btn{
            padding: 6px 10px;
            border: none;
            font-size: 13px;
            color: rgb(153, 153, 153);
            background-color: transparent;
            cursor: pointer;
        }

        .user_inqry_btn{
            position: relative;
            min-height: 44px;
            margin-top: 20px;
            text-align: center;
        }

        .user_inqry_btn button{
            position: absolute;
            bottom: 0px;
            right: 0px;

            width: 120px;
            height: 44px;
            border-radius: 3px;
            color: rgb(255, 255, 255);
            background-color: #f58412;
            border: 0px none;
        }
        .user_inqry_btn button span{
            color: white;
        }

        .response{
            display: flex;
            padding: 22px 14px 30px;
            align-items: flex-start;
        }

        .response .img span{
            width: 24px;
            height: 24px;
            display: block;
            background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaq34qz0latEE0Y8-EgPfxSmTE32HIuVvGARnxGsDej5ZaeQuXWi3vkQRbQYDzzAjwWak&usqp=CAU);
            background-position: center center;
            background-repeat: no-repeat;
            background-size: contain;
        }

        .response .text{
            margin-left: 12px;
            padding-top: 2px;
            font-size: 14px;
            word-break: break-all;
            line-height: 19px;
            letter-spacing: -0.5px;
        }

        .btn-box{
            width: 100%;
            display: flex;
            -webkit-box-pack: end;
            justify-content: flex-end;
            -webkit-box-align: center;
            align-items: center;
            margin-top: 20px;
        }
        .goToinqry-btn{
            cursor: pointer;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="mypage-banner"></div>
<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
    <%--    여기다가--%>
    <div class="user_inqry-container">
        <div class="user_inqry-header">
            <h2 class="header-content">1:1 문의</h2>
        </div>
        <div class="user_inqry-columnbox">
            <div class="column-title">제목</div>
            <div class="column-reg_tm">작성일</div>
            <div class="column-resp_state_cd">답변상태</div>
        </div>
        <ul class="user_inqry-box">
            <li class="user_inqry-li">
                <div class="user_inqry-div">
                    <div class="user_inqry-title"><div>상품 후기 문의</div></div>
                    <div class="user_inqry-reg_tm"><span>2023.05.07</span></div>
                    <div class="user_inqry-resp_state_cd"><span>답변대기</span></div>
                </div>
            </li>
            <li class="user_inqry-answer-li">
                <div class="user_inqry-answer-box">

                    <div class="user_inqry-answer-category">
                        <span class="answer-category1">기타문의</span>
                        <span class="answer-category2"></span>
                        <span class="answer-category3">기타(직접 입력)</span>
                    </div>

                    <div class="user_inqry-answer-question">
                        <div>
                            <span class="user_inqry-img"></span>
                        </div>
                        <div>
                            <span>상품 후기는 삭제가 불가능한가요?</span>
                            <div></div>
                        </div>
                    </div>
                    <div class="">
                        <div class="response">
                            <div class="img"><span></span></div>
                            <div class="text"><div>null</div></div>

                        </div>
                        <div class="reg_tm">

                            <div class="user_inqry-UpdAndDel_btn">

                                <span style="margin-left: 40px;">2023.02.81</span>

                                <div class="btn-box">
                                    <button class="Update_btn">수정</button>
                                    <div></div>
                                    <button class="Delet_btn">삭제</button>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>

            </li>
        </ul>
        <div class="none-user_inqry">게시글이 없습니다.</div>
        <div class="user_inqry_btn">
            <div></div>
            <button class="goToinqry-btn"><span>문의하기</span></button>
        </div>
    </div>
    <div id="review"></div>



</div>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script>
    $(document).ready(function () {
        let msg = "${msg}"
        if(msg=="INSERT_OK"){ alert("성공적으로 등록되었습니다.")}

        // 문의하기 버튼 클릭 시 (문의작성 페이지로 이동)
        $('.user_inqry-container').on("click", '.goToinqry-btn', function () {
            location.href = "/mypage/inquiry";
        })
    })

</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>
