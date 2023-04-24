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
        <div><input class="dlvpn-input1" type="text" placeholder="나머지 주소를 입력해 주세요" value="${address.addr_dtl}"></div>
      </div>
      <div class="dlvpn-box2">
        <label class="dlvpn-label2">받으실 분</label>
        <div><input class="dlvpn-input2" type="text" placeholder="이름을 입력해 주세요" value="${address.rcpr_nm}"></div>
      </div>
      <div class="dlvpn-box3">
        <label class="dlvpn-label3">휴대폰</label>
        <div><input class="dlvpn-input3" type="text" placeholder="번호를 입력해 주세요" value="${address.rcpr_mobl_no}"></div>
      </div>
    </div>

    <div>
      <label class="dlvpn-label4">
        <input class="base_button" type="checkbox">
        <span>기본 배송지로 저장</span>
      </label>
      <button class="update-button">저장</button>
      <button type="" class="delete-button">삭제</button>
    </div>
  </div>



</div>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script>

  window.onload = function (){
    // 만약 기본 배송지가 Y 이면 (삭제, 기본 배송지 저장) 버튼 안보이게하기
    if("${address.is_default_yn}"=="Y"){
      document.querySelector('.dlvpn-label4').style.display = "none";
      document.querySelector('.delete-button').style.display = "none";
      document.querySelector('.update-button').style.marginTop = "20px";
    }

    // let addr_dtl = document.querySelector('.dlvpn-input1');
    <%--if("${address.addr_dtl}"!=""){--%>
    <%--  document.querySelector('.dlvpn-input1').value = "${address.addr_dtl}";--%>
    // }
    <%--if("${address.rcpr_nm}"!=""){--%>
    <%--  document.querySelector('.dlvpn-input2').value = "${address.rcpr_nm}";--%>
    // }
    <%--if("${address.rcpr_mobl_no}"!=""){--%>
    <%--  document.querySelector('.dlvpn-input3').value = "${address.rcpr_mobl_no}"--%>
    // }


    // 배송지 상태 변경      ex).. [사용, 미사용, (삭제)]
    $(".delete-button").click(function(){
      if(!confirm("정말로 삭제하시겠습니까?"))return;
      let idx = ${address.idx}; // 배송지 번호
      let state_cd = ${address.state_cd}; // 배송지 상태코드

      $.ajax({
        type:'PATCH',       // 요청 메서드 // 삭제 버튼 클릭 시, 해당 배송지 상태(삭제) 처리
        url: '/mypage/address/delete',  // 요청 URI
        headers : { "content-type": "application/json"}, // 요청 헤더
        data : JSON.stringify({idx:idx,state_cd:state_cd}), // 서버로 전송할 데이터. stringify()로 직렬화 필요.
        success : function(result){
          // alert(result);
          opener.parent.location = '<c:url value="/mypage/address/list"/>';
          self.close();
        },
        error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
      }); // $.ajax()

    });

    // 배송지 정보 변경
    $(".update-button").click(function(){
      if(!confirm("정말로 변경하시겠습니까?"))return;
      let addr_dtl = document.querySelector('.dlvpn-input1').value;
      let rcpr_nm = document.querySelector('.dlvpn-input2').value;
      let rcpr_mobl_no = document.querySelector('.dlvpn-input3').value;
      let is_default_yn = document.querySelector('.base_button').checked;
      let idx = ${address.idx};

      $.ajax({
        type:'PATCH',       // 요청 메서드 //
        url: '/mypage/address/update',  // 요청 URI
        headers : { "content-type": "application/json"}, // 요청 헤더
        data : JSON.stringify({addr_dtl:addr_dtl,rcpr_nm:rcpr_nm,rcpr_mobl_no:rcpr_mobl_no,is_default_yn:is_default_yn,idx:idx}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
        success : function(result){
          opener.parent.location = '<c:url value="/mypage/address/list"/>';
          self.close();
        },
        error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
      }); // $.ajax()

    });


    <%--document.querySelector('.delete-button').addEventListener('click',remove);--%>

    <%--function remove() {--%>
    <%--  if(!confirm("정말로 삭제하시겠습니까"))return;--%>

    <%--  let a = ${address.idx};--%>

    <%--  var form = document.createElement('form');--%>
    <%--  form.setAttribute('method', 'post');--%>
    <%--  form.setAttribute('action', '<c:url value="/mypage/addressremove"/>?idx=${address.idx}');--%>
    <%--  window.opener.document.body.appendChild(form);--%>
    <%--  form.submit();--%>
    <%--  &lt;%&ndash;opener.parent.location='<c:url value="/mypage/addressremove?idx='+a+'"/>';&ndash;%&gt;--%>
    <%--  self.close()--%>

    <%--}--%>
    <%--document.querySelector('.update-button').addEventListener('click',save)--%>
    <%--function save(){--%>
    <%--  let addr_dtl = document.querySelector('.dlvpn-input1').value;--%>
    <%--  let rcpr_nm = document.querySelector('.dlvpn-input2').value;--%>
    <%--  let rcpr_mobl_no = document.querySelector('.dlvpn-input3').value;--%>
    <%--  let is_default_yn = document.querySelector('.base_button').checked;--%>
    <%--  let idx = ${address.idx};--%>

    <%--  var form = document.createElement('form');--%>
    <%--  form.setAttribute('method', 'post');--%>
    <%--  form.setAttribute('action', '<c:url value="/mypage/addressupdate?addr_dtl='+addr_dtl+'&rcpr_nm='+rcpr_nm+'&rcpr_mobl_no='+rcpr_mobl_no+'&is_default_yn='+is_default_yn+'&idx='+idx+'"/>');--%>
    <%--  window.opener.document.body.appendChild(form);--%>
    <%--  form.submit();--%>
    <%--  &lt;%&ndash;opener.parent.location='<c:url value="/mypage/addressupdate?addr_dtl='+addr_dtl+'&rcpr_nm='+rcpr_nm+'&rcpr_mobl_no='+rcpr_mobl_no+'&is_default_yn='+is_default_yn+'&idx='+idx+'"/>';&ndash;%&gt;--%>
    <%--  self.close()--%>

    <%--}--%>



  }


</script>
</body>
</html>