<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="<c:url value='/css/dlvpnupdate.css'/>">

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

</head>
<body>
<div>

  <div class="dlvpn-container">
    <h2 class="title">배송지 수정</h2>
    <div class="dlvpn-box">
      <div class="dlvpn-box1">
        <label class="dlvpn-label1">${address.addr_base}</label>
        <div><input class="dlvpn-input1" type="text" placeholder="나머지 주소를 입력해 주세요"></div>
      </div>
      <div class="dlvpn-box2">
        <label class="dlvpn-label2">받으실 분</label>
        <div><input class="dlvpn-input2" type="text" placeholder="이름을 입력해 주세요"></div>
      </div>
      <div class="dlvpn-box3">
        <label class="dlvpn-label3">휴대폰</label>
        <div><input class="dlvpn-input3" type="text" placeholder="번호를 입력해 주세요"></div>
      </div>
    </div>

    <div>
      <label class="dlvpn-label4">
        <input type="checkbox">
        <span style="margin-left: 12px;">기본 배송지로 저장</span>
      </label>
      <button class="save-button">저장</button>
      <button class="delete-button">삭제</button>
    </div>
  </div>



</div>

<script>

  window.onload = function (){

    let addr_dtl = document.querySelector('.dlvpn-input1');
    if("${address.addr_dtl}"!=""){
      console.log("h2");
      document.querySelector('.dlvpn-input1').value = "${address.addr_dtl}";
    }
    if("${address.rcpr_nm}"!=""){
      document.querySelector('.dlvpn-input2').value = "${address.rcpr_nm}";
    }
    if("${address.rcpr_mobl_no}"!=""){
      document.querySelector('.dlvpn-input3').value = "${address.rcpr_mobl_no}"
    }
    document.querySelector('.delete-button').addEventListener('click',remove);

    function remove() {
      if(!confirm("정말로 삭제하시겠습니까"))return;

      let a = ${address.idx};
      <%--let b = "<c:out value='${address.rcpr_nm}'/>";--%>
      // console.log(a);
      // console.log(b);
      opener.parent.location='<c:url value="/mypage/addressremove?idx='+a+'"/>';
      self.close()
      <%--let form = document.createElement("form");--%>
      <%--let obj = document.createElement('input');--%>
      <%--obj.setAttribute('type', 'hidden');--%>
      <%--form.appendChild(obj);--%>
      <%--form.setAttribute("action", '<c:url value="/mypage/addressremove?idx='+a+'"/>');--%>
      <%--form.setAttribute("method", "post");--%>
      <%--document.body.appendChild(form);--%>

      <%--form.submit();--%>
      // opener.parent.location.reload();


    }

  }


</script>
</body>
</html>