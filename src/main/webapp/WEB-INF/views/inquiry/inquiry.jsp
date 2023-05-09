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
        .inqry_write-container{
            width: 820px;
        }
        .inqry_write-header{
            padding-bottom: 27px;
        }
        .inqry_write-header h2{
            font-weight: 600;
            font-size: 24px;
            color: rgb(51, 51, 51);
            letter-spacing: -0.5px;
            line-height: 48px;
            margin: 0;
        }
        .inqry_write-box{
            width: 820px;
            padding: 4px 20px;
            border-top: 2px solid rgb(51, 51, 51);
        }
        .inqry_writet-type{
            width: 100%;
            display: inline-flex;
            padding: 12px 0px;
            -webkit-box-align: start;
            align-items: start;
        }
        .inqry_writet-type_name{
            width: 140px;
            font-size: 14px;
            line-height: 44px;
        }
        .inqry_writet-type_name label span{
            color: red;
        }
        .inqry_write-tpye_select{
            display: flex;
            width: 82%;
        }

        .inqry_write-tpye-inputbox{
            margin-right: 5px;
            width: 100%;
            height: 44px;
            padding: 0px 11px 1px 15px;
            border-radius: 4px;
            border: 1px solid rgb(221, 221, 221);
            line-height: 1.5;
            display: flex;
            align-items: center;
        }

        #First_inqry_idx{
            width: 100%;
            font-size: 16px;
            border: none;
        }

        .inqry_write-tpye-inputbox2{
            width: 100%;
            height: 44px;
            padding: 0px 11px 1px 15px;
            border-radius: 4px;
            border: 1px solid rgb(221, 221, 221);
            line-height: 1.5;
            display: flex;
            align-items: center;
        }

        #Second_inqry_idx{
            width: 100%;
            font-size: 16px;
            border: none;
        }

        .inqry_wirte-title{
            display: flex;
            padding: 12px 0px;
            -webkit-box-align: start;
            align-items: start;
        }

        .inqry_writet-title_name{
            width: 140px;
            font-size: 14px;
            line-height: 44px;
        }

        .inqry_writet-title_name label span{
            color: red;
        }

        .inqry_wirte-title-input{
            width: 639px;
        }

        .inqry_wirte-title-input div input{
            width: 100%;
            height: 44px;
            padding: 0px 11px 1px 15px;
            border-radius: 4px;
            border: 1px solid rgb(221, 221, 221);
            font-weight: 400;
            font-size: 16px;
            line-height: 42px;
            color: rgb(51, 51, 51);
            outline: none;
            /* /* box-sizing: border-box; */
        }

        .inqry_wirte-content{
            display: flex;
            padding: 12px 0px;
            -webkit-box-align: start;
            align-items: start;
        }

        .inqry_wirte-content_name{
            width: 140px;
            font-size: 14px;
            line-height: 44px;
        }

        .inqry_wirte-content_name label span{
            color: red;
        }
        .inqry_wirte-content_textCover{
            width: 640px;
        }
        .inqry_wirte-content_text{
            position: relative;
            display: flex;
            flex-direction: column;
            height: 536px;
            background-color: rgb(255, 255, 255);
            border: 1px solid rgb(221, 221, 221);
            border-radius: 4px;
        }
        .inqry_wirte-content_text textarea{
            display: block;
            /* width: 100%; */
            height: 100%;
            padding: 15px 16px;
            font-size: 16px;
            line-height: 21px;
            word-break: break-all;
            z-index: 1;
            background: none;
            border-radius: 4px;
            color: rgb(51, 51, 51);
            outline: none;
            resize: none;
            border: none;
        }

        .inqry_writet-insert_btn{
            display: flex;
            -webkit-box-pack: center;
            justify-content: center;
            -webkit-box-align: center;
            align-items: center;
            padding-top: 40px;
        }

        .inqry_writet-insert_btn button{
            cursor: pointer;
            width: 160px;
            height: 56px;
            padding: 0px 10px;
            text-align: center;
            letter-spacing: 0px;
            font-size: 16px;
            line-height: 20px;
            color: white;
            cursor: pointer;
            background-color: rgb(221, 221, 221);
            font-family: "Noto Sans", sans-serif;
            font-weight: 500;
            border-radius: 3px !important;
            border: none;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="mypage-banner"></div>
<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
<%--    여기다가--%>
    <div class="inqry_write-container">
        <div class="inqry_write-header">
            <h2>1:1 문의</h2>
        </div>
        <div class="inqry_write-box">
            <form action="/mypage/inquiry" method="post">
                <div class="inqry_writet-type">
                    <div class="inqry_writet-type_name">
                        <label>유형<span>*</span></label>
                    </div>
                    <div class="inqry_write-tpye_select">
                        <div class="inqry_write-tpye-inputbox">
                            <select name="inqry_idx" id="First_inqry_idx">
                                <option value="0" selected>선택</option>
                                <option value=100>주문/결제/반품/교환문의</option>
                                <option value=200>이벤트/쿠폰/적립금문의</option>
                                <option value=300>상품문의</option>
                                <option value=400>배송문의</option>
                                <option value=500>상품누락문의</option>
                                <option value=600>기타문의</option>
                            </select>
                        </div>

                        <div class="inqry_write-tpye-inputbox2">
                            <select name="id" id="Second_inqry_idx">
                                <option value="0">선택</option>
                            </select>
                        </div>

                    </div>
                </div>
                <div class="inqry_wirte-title">
                    <div class="inqry_writet-title_name">
                        <label>제목<span>*</span></label>
                    </div>
                    <div class="inqry_wirte-title-input">
                        <div>
                            <input name="title" placeholder="제목을 입력해주세요">
                        </div>
                    </div>
                </div>
                <div class="inqry_wirte-content">
                    <div class="inqry_wirte-content_name">
                        <label>내용<span>*</span></label>
                    </div>
                    <div class="inqry_wirte-content_textCover">
                        <div class="inqry_wirte-content_text">
                            <textarea name="ctent"></textarea>
                        </div>
                    </div>
                </div>
                <div class="inqry_writet-insert_btn">
                    <button class="insert_btn">등록</button>
                </div>
            </form>
        </div>
    </div>

</div>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script>
    $(document).ready(function () {

        $("select[name=inqry_idx]").change(function (e) {
            //val은 대분류에만 해당하며, 카테고리 테이블의 id값과 일치함 //카테고리 아이디 받아서 배송방식 엮어오기

            let val = $("#First_inqry_idx option:selected").val(); //value값 출력됨 //"100"
            // alert(val);

            if (val == 100) {
                $("#Second_inqry_idx").html(S_1).on("click", function (e) {
                    //선택된 요소의 id값
                    id = $("#Second_inqry_idx option:selected").attr("id"); //0101
                    // $(".input-box.category").data("inqryID", "2dh21iuh12y21dh82121hd9");

                })
            }
            if (val == 200) {
                $("#Second_inqry_idx").html(S_2).on("click", function (e) {
                    //선택된 요소의 id값
                    id = $("#Second_inqry_idx option:selected").attr("id"); //0101
                    // $(".input-box.inqrygory").data("inqryID", "2dh21iuh12y21dh82121hd9");

                })
            }

            if (val == 300) {
                $("#Second_inqry_idx").html(S_3).on("click", function (e) {
                    //선택된 요소의 id값
                    id = $("#Second_inqry_idx option:selected").attr("id"); //0101
                    // $(".input-box.inqrygory").data("inqryID", "2dh21iuh12y21dh82121hd9");

                })
            }

            if (val == 400) {
                $("#Second_inqry_idx").html(S_4).on("click", function (e) {
                    //선택된 요소의 id값
                    id = $("#Second_inqry_idx option:selected").attr("id"); //0101
                    // $(".input-box.inqrygory").data("inqryID", "2dh21iuh12y21dh82121hd9");

                })
            }

            if (val == 500) {
                $("#Second_inqry_idx").html(S_5).on("click", function (e) {
                    //선택된 요소의 id값
                    id = $("#Second_inqry_idx option:selected").attr("id"); //0101
                    // $(".input-box.inqrygory").data("inqryID", "2dh21iuh12y21dh82121hd9");

                })
            }

            if (val == 600) {
                $("#Second_inqry_idx").html(S_6).on("click", function (e) {
                    //선택된 요소의 id값
                    id = $("#Second_inqry_idx option:selected").attr("id"); //0101
                    // $(".input-box.inqrygory").data("inqryID", "2dh21iuh12y21dh82121hd9");

                })
            }


        })
        // 문의하기 버튼 클릭
        $('.insert_btn').click(function (){
          let form = $('.inqry_wirte-btn');
          alert("문의가 등록되었습니다");
          form.submit();
        })


    })

    function S_1() {
        let tmp = "<option>선택</option>";
        tmp += "<option value=101 id=101>주문취소 해주세요</option>";
        tmp += "<option value=102 id=102>상품 반품을 원해요</option>";
        tmp += "<option value=103 id=103>상품 교환을 원해요</option>";
        tmp += "<option value=104 id=104>주문/결제는 어떻게 하나요?</option>";
        tmp += "<option value=105 id=105>오류로 주문/결제가 안 돼요</option>";
        tmp += "<option value=106 id=106>기타(직접입력)</option>";
        return tmp;
    }

    function S_2() {
        let tmp = "<option>선택</option>";
        tmp += "<option value=201 id=201>쿠폰 관련 문의드려요</option>";
        tmp += "<option value=202 id=202>적립금 관련 문의드려요</option>";
        tmp += "<option value=203 id=203>이벤트 관련 문의드려요</option>";
        tmp += "<option value=204 id=204>증정품 관련 문의드려요</option>";
        tmp += "<option value=205 id=205>할인 관련 문의드려요</option>";
        tmp += "<option value=206 id=206>기타(직접입력)</option>";
        return tmp;
    }

    function S_3() {
        let tmp = "<option>선택</option>";
        tmp += "<option value=301 id=301>불량상품 환불 해주세요</option>";
        tmp += "<option value=302 id=302>파손 상품 환불 해주세요</option>";
        tmp += "<option value=303 id=303>상품에 대해 알려주세요</option>";
        tmp += "<option value=304 id=304>기타(직접입력)</option>";
        return tmp;
    }

    function S_4() {
        let tmp = "<option>선택</option>";
        tmp += "<option value=401 id=401>상품이 다른곳으로 갔어요</option>";
        tmp += "<option value=402 id=402>배송 상품이 안 왔어요</option>";
        tmp += "<option value=403 id=403>배송정보 변경 해주세요</option>";
        tmp += "<option value=404 id=404>포장 상태가 좋지 않아요</option>";
        tmp += "<option value=405 id=405>상품이 회수되지 않았어요</option>";
        tmp += "<option value=406 id=406>배송비에 대해 궁금합니다</option>";
        tmp += "<option value=404 id=404>기타(직접입력)</option>";
        return tmp;
    }

    function S_5() {
        let tmp = "<option>선택</option>";
        tmp += "<option value=501 id=501>누락된 상품 환불 해주세요</option>";
        tmp += "<option value=502 id=502>다른 상품 와서 환불원해요</option>";
        tmp += "<option value=503 id=503>기타(직접입력)</option>";
        return tmp;
    }

    function S_6() {
        let tmp = "<option>선택</option>";
        tmp += "<option value=601 id=601>로그인/회원 문의하고 싶어요</option>";
        tmp += "<option value=602 id=602>이용 중 오류가 발생했어요</option>";
        tmp += "<option value=603 id=603>컬리패스에 대해 알고 싶어요</option>";
        tmp += "<option value=604 id=604>퍼플박스에 대해 알고싶어요</option>";
        tmp += "<option value=605 id=605>컬리에게 제안하고 싶어요</option>";
        tmp += "<option value=606 id=606>기타(직접입력)</option>";
        return tmp;
    }
</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>

