<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="<c:url value='/css/dlvpninsert.css'/>">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<div class="dlvpn-container">
    <div class="dlvpn-notice">
        <strong class="strong-notice">
            <span class="span-notice">새 배송지 추가</span>
<%--            <P class="p-notice">행복함을 전해드리는 JungsukMarket</P>--%>
        </strong>
    </div>
    <div class="addr-base">
        <p class="p-base">서울 용산구 이촌로 1 (지에스 한강에클라트)</p>
        <button class="button-base"><span><img>재검색</span></button>
    </div>
    <div class="addr-dtl">
        <input class="input-dtl" type="text" placeholder="나머지 주소를 입력해 주세요">
    </div>
    <div class="defaultYN">
        <label class="label-defaultYN">
            <input class="input-defaultYN" name="input-defaultYN" id="input-defaultYN" type="checkbox">
            <span>기본 배송지로 저장</span>
        </label>
    </div>
    <button class="savebutton">
        <span class="span-savebutton">저장</span>
    </button>

</div>

<%@ include file="/WEB-INF/views/include/script.jsp" %>
<%--다음 카카오 주소 api--%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    $(document).ready(function () {
        let addr_base = "${addr}"; // 기본 배송지 ex) 서울 강남구 강남대로102길 11
        let zpcd = "${zonecode}";
        $('.p-base').text(addr_base); // 기본 배송지를 입력해준다

        // 배송지 추가
        $(".savebutton").click(function () {
            let addr_dtl = $('.input-dtl').val(); // 배송지 상세 ex) 101동 1201호
            let is_default_yn = $('input[name=input-defaultYN]').is(":checked"); // 기본 배송지 선택여부 ex) true, false

            $.ajax({
                type:'POST',       // 요청 메서드
                url: '/mypage/address/insert',  // 요청 URI
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({addr_base:addr_base, addr_dtl:addr_dtl, is_default_yn:is_default_yn, zpcd:zpcd}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    // alert(result);
                    opener.parent.location = '<c:url value="/mypage/address/list"/>';
                    self.close();
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

        });
        $(".button-base").click(function () {
            window.self.close();       // 현재 페이지 닫기
            window.opener.KaKao_api(); // 부모창의 함수를 호출한다
        });

    });



</script>
</body>
</html>
