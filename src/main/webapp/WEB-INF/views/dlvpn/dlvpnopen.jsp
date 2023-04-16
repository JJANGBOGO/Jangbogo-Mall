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
        <input class="base_button" type="checkbox">
        <span style="margin-left: 12px;">기본 배송지로 저장</span>
      </label>
      <button class="update-button">저장</button>
      <button type="" class="delete-button">삭제</button>
    </div>
  </div>



</div>

<script>

  window.onload = function (){
    if("${address.is_default_yn}"=="Y"){
      document.querySelector('.dlvpn-label4').style.display = "none";
      document.querySelector('.delete-button').style.display = "none";
      document.querySelector('.update-button').style.marginTop = "20px";
    }

    // let addr_dtl = document.querySelector('.dlvpn-input1');
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

      var form = document.createElement('form');
      form.setAttribute('method', 'post');
      form.setAttribute('action', '<c:url value="/mypage/addressremove"/>?idx=${address.idx}');
      window.opener.document.body.appendChild(form);
      form.submit();
      <%--opener.parent.location='<c:url value="/mypage/addressremove?idx='+a+'"/>';--%>
      self.close()

    }
    document.querySelector('.update-button').addEventListener('click',save)
    function save(){
      let addr_dtl = document.querySelector('.dlvpn-input1').value;
      let rcpr_nm = document.querySelector('.dlvpn-input2').value;
      let rcpr_mobl_no = document.querySelector('.dlvpn-input3').value;
      let is_default_yn = document.querySelector('.base_button').checked;
      let idx = ${address.idx};

      var form = document.createElement('form');
      form.setAttribute('method', 'post');
      form.setAttribute('action', '<c:url value="/mypage/addressupdate?addr_dtl='+addr_dtl+'&rcpr_nm='+rcpr_nm+'&rcpr_mobl_no='+rcpr_mobl_no+'&is_default_yn='+is_default_yn+'&idx='+idx+'"/>');
      window.opener.document.body.appendChild(form);
      form.submit();
      <%--opener.parent.location='<c:url value="/mypage/addressupdate?addr_dtl='+addr_dtl+'&rcpr_nm='+rcpr_nm+'&rcpr_mobl_no='+rcpr_mobl_no+'&is_default_yn='+is_default_yn+'&idx='+idx+'"/>';--%>
      self.close()

    }



  }


</script>
</body>
</html>