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
            <span class="span-notice">샛별배송</span> 지역입니다.
            <P class="p-notice">매일 새벽,문 앞까지 신선함을 전해드려요.</P>
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
    <div class="warning">
<%--        <strong class="strong-warning">--%>
<%--            샛별배송 지역 중 배송불가 장소 안내--%>
<%--        </strong>--%>
<%--        <p class="p-warning">--%>
<%--            관공서 / 학교 / 병원 / 시장 / 공단지역 / 산간지역 / 백화점 등--%>
<%--        </p>--%>
    </div>
</div>

<%@ include file="/WEB-INF/views/include/script.jsp" %>
<%--다음 카카오 주소 api--%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    $(document).ready(function () {
        let addr_base = "${addr}"; // 기본 배송지 ex) 서울 강남구 강남대로102길 11
        let zpcd = "${zonecode}";
        $('.p-base').text(addr_base); // 기본 배송지를 입력해준다

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
                    opener.parent.location = '<c:url value="/mypage/addresslist"/>';
                    self.close();
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

        });
        $(".button-base").click(function () {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
                    // console.log("22");
                    // console.log(addr);
                    <%--let link = '<c:url value="/mypage/dlvpninsertpage?addr='+addr+'&zonecode='+data.zonecode+'"/>';--%>
                    <%--// window.location.href= link;--%>

                    <%--var popupWidth = 550;--%>
                    <%--var popupHeight = 550;--%>
                    <%--var popupX = (window.screen.width / 2) - (popupWidth / 2);--%>
                    <%--var popupY= (window.screen.height / 2) - (popupHeight / 2);--%>
                    <%--window.open(link, '', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);--%>
                }

            }).open();
        });

    });



</script>
</body>
</html>
