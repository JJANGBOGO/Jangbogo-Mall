<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>fastcampus</title>
  <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<div id="menu">
  <ul>
    <li id="logo">fastcampus</li>
    <li><a href="<c:url value='/'/>">Home</a></li>
    <li><a href="<c:url value='/board/list'/>">Board</a></li>
    <li><a href="<c:url value='/login/login'/>">login</a></li>
    <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
    <li><a href=""><i class="fas fa-search small"></i></a></li>
  </ul>
</div>
<script>
  let msg = "${msg}"
  if(msg=="add") alert("장바구니에 상품이 담겼습니다");
  if(msg=="addmore") alert("장바구니에 상품이 담겼습니다\n이미 담은 상품의 수량을 추가했습니다");
</script>
<div style="text-align:center">
  <table border="1">
    <tr>
      <th>상품번호</th>
      <th>회원번호</th>
      <th>찜상품등록일자</th>
      <th>최초등록일자</th>
      <th>최종수정일자</th>
      <th>최종생성자식별번호</th>
      <th>최종수정자식별번호</th>
    </tr>

    <c:forEach var="wishlist"  items="${list}">
      <form action="" id="form">
        <tr>
          <th>${wishlist.prod_idx}</th>  // 어떻게 wishlist.prod_idx 값을 Controller한테 전달해줄까
          <th>${wishlist.user_idx}</th>
          <th>${wishlist.reg_tm}</th>
          <th>${wishlist.crt_tm}</th>
          <th>${wishlist.crt_idx}</th>
          <th>${wishlist.upt_tm}</th>
          <th>${wishlist.upt_idx}</th>
          <button type="button" id="removeBtn" class="btn" value="${wishlist.prod_idx}" onclick="remove(${wishlist.prod_idx})">삭제</button> <%--삭제 버튼 태그에다 상품 번호 기록한다--%>
          <button type="button" id="insertBtn" class="btn" onclick= insertCart(${wishlist.prod_idx});>담기</button> <%--담기 버튼 --%>
        </tr>
      </form>
    </c:forEach>

  </table>
  <script>
    <%--$(document).ready(function(){--%>
    <%--  $("#removeBtn").on("click", function(){--%>
    <%--    if(!confirm("정말로 삭제하시겠습니까?")) return;--%>
    <%--    let prod_id = $("#removeBtn").val()--%>
    <%--    let form = $("#form");--%>
    <%--    form.attr("action", '<c:url value="/mypage/wishlistremove?prod_idx='+prod_idx+'"/>');--%>
    <%--    form.attr("method", "post");--%>
    <%--    form.submit();--%>
    <%--  });--%>
    <%--});--%>

    function remove(prod_idx){
      if(!confirm("정말로 삭제하시겠습니까")) return;
      let form = document.getElementById("form");
      form.setAttribute("action",'<c:url value="/mypage/removeWishlist?prod_idx='+prod_idx+'"/>')
      form.setAttribute("method", "post");
      form.submit();
      <%--location.href='<c:url value="/mypage/removeWishlist?prod_idx='+prod_idx+'"/>'--%>
    }

    function insertCart(prod_idx){
      if(!confirm("정말로 담을건가요?")) return;
      let form = document.getElementById("form");
      form.setAttribute("action",'<c:url value="/mypage/insertCart?prod_idx='+prod_idx+'"/>')
      form.setAttribute("method", "post");
      form.submit();
      <%--location.href='<c:url value="/mypage/wishlistremove?prod_idx='+prod_idx+'"/>'--%>
    }


  </script>
</div>
</body>
</html>