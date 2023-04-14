<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="<c:url value='/css/dlvpnlist.css'/>">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<div style="width: 1020px; width: 900px; margin: auto">
    <div class="dlvpn-top">
        <div class="dlvpn-notc">
            <span class="dlvpn-notc2">배송지 관리</span>
            <span class="dlvpn-notc3">배송지에 따라 상품정보 및 배송유형이 달라질 수 있습니다.</span>
        </div>
        <div class="dlvpn-insert">
            <button class="insertAddr">새 배송지 추가</button>
        </div>
    </div>
    <div class="dlvpn-column">
        <div class="dlvpn-choice">선택</div>
        <div class="dlvpn-address">주소</div>
        <div class="dlvpn-name">받으실 분</div>
        <div class="dlvpn-number">연락처</div>
        <div class="dlvpn-type">배송유형</div>
        <div class="dlvpn-change">수정</div>
    </div>
    <ul style="margin: 3px">
        <c:forEach var="addrlist" items="${addrList}" varStatus="i">
            <li>
                <div class="list">
                    <div class="list-checkbox"><label><input class="checkbox${addrlist.idx}" onclick="selected(${addrlist.idx})" type="checkbox" <c:if test="${addrlist.state_cd==1}"> checked </c:if>></label></div>
                    <div class="list-address"><div><c:if test="${addrlist.is_default_yn=='Y'}"><div class="base">기본 배송지</div></c:if>${addrlist.addr_base} ${addrlist.addr_dtl}</div></div>
                    <div class="list-name">${addrlist.rcpr_nm}</div>
                    <div class="list-number">${addrlist.rcpr_mobl_no}</div>
                    <div class="list-type"><div><span>샛별배송</span></div></div>
                    <div class="list-change"><button onclick=update(${addrlist.idx})><svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="evenodd"><path fill="none" d="M0 0h24v24H0z"></path><path d="m13.83 5.777 4.393 4.393-10.58 10.58H3.25v-4.394l10.58-10.58zm3.204-2.527c.418 0 .837.16 1.157.48l2.08 2.08a1.63 1.63 0 0 1 0 2.314l-2.157 2.156-4.394-4.394 2.157-2.156c.32-.32.738-.48 1.157-.48z" stroke="#ccc" stroke-width="1.5"></path></g></svg></button></div>
                </div>
            </li>
        </c:forEach>
    </ul>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // document.querySelector('button').addEventListener('click',update)

    function update(i){
        console.log(i)
        let link = '<c:url value="/mypage/addressopen?idx='+i+'"/>'
        var popupWidth = 500;
        var popupHeight = 500;
        var popupX = (window.screen.width / 2) - (popupWidth / 2);
        var popupY= (window.screen.height / 2) - (popupHeight / 2);
        window.name = "sky";
        window.open(link, '', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
    }
    // document.querySelector('.checkbox').addEventListener('click',selected)

    function selected(idx){
        let form = document.createElement('form'); // form 태그 생성
        let obj = document.createElement('input'); // input 태그 생성
        obj.setAttribute('type', 'hidden'); // type = "hidden"
        obj.setAttribute('name', 'idx'); // name = "idx" 라는 이름으로 값을 넘긴다 (중요)
        obj.setAttribute('value', idx); // value = "idx" (addrlist.idx) 값

        form.appendChild(obj); // form 태그의 자식으로 input 태그를 추가
        form.setAttribute('method', 'post'); // 전달 방식 : POST
        form.setAttribute('action', '<c:url value="/mypage/changestate"/>');  // 전달 컨트롤러 주소 : mypage/changestate
        document.body.appendChild(form); // body 태그의 자식으로 form 태그를 추가
        form.submit(); // 전달

    }

    document.querySelector('.insertAddr').addEventListener('click',insertAddr)
    function insertAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                let link = '<c:url value="/mypage/wishlist"/>'
                // window.location.href= link;

                var popupWidth = 500;
                var popupHeight = 500;
                var popupX = (window.screen.width / 2) - (popupWidth / 2);
                var popupY= (window.screen.height / 2) - (popupHeight / 2);
                window.open(link, '', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
            }
        }).open();

    }


</script>
</body>
</html>
