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
            <input class="input-defaultYN" type="checkbox">
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



<script>



</script>
</body>
</html>
