<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>fastcampus</title>
  <link rel="stylesheet" href="<c:url value='/css/wishlist.css'/>">
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

  <style>
    /*img{*/
    /*  float: left;*/
    /*  padding-left: 15px;*/
    /*}*/

    /*.b{*/
    /*  width: 200px;*/
    /*  padding-top: 10px;*/
    /*  padding-bottom: 10px;*/
    /*  clear: both;*/
    /*  border-bottom: dotted 1px black;*/
    /*  float: left;*/

    /*}*/
    /*.c{*/
    /*  width: 700px;*/
    /*  padding-left:120px;*/
    /*  float: left;*/
    /*}*/
    /*a {*/
    /*  text-decoration: none;*/
    /*}*/


  </style>

</head>
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
<%--<h1>찜한 상품(${totalCnt}) 찜한 상품은 최대 200개까지 지정됩니다.</h1>--%>
<%--<hr />--%>
<script>
  let msg = "${msg}"
  if(msg=="add") alert("장바구니에 상품이 담겼습니다");
  if(msg=="addmore") alert("장바구니에 상품이 담겼습니다\n이미 담은 상품의 수량을 추가했습니다");
</script>

<div class="title">
  <h2 class="h2">
    찜한 상품(${totalCnt})
  </h2>
  <span class="titlespan">
      찜한 상품은 최대 200개까지 저장됩니다
    </span>
</div>
<c:forEach var="product"  items="${list2}">
  <div class="a">
    <a href="">
      <img src="${product.resv_photo_upload_path}" alt="">
    </a>

    <div class="b">
      <div class="c">
        <a href="">${product.name}</a>
        <div class="d">
                                 <%--   != 대신에 ne도 가능--%>
          <c:if test="${product.dc_rate != 0}">
            <span class="span1">${product.dc_rate}%</span>
          </c:if>
          <span class="span2">${product.prc - (product.prc / 100 * product.dc_rate)}원</span><span class="span3">${product.prc}원</span>
        </div>
      </div>

      <div class="e">
        <button class="css-1h4lltl e4nu7ef3" type="button" width="104" height="36" radius="4" onclick=remove(${product.idx})>연습</button>

        <button class="css-1h4lltl e4nu7ef3" type="button" width="104" height="36" radius="4" onclick=remove(${product.idx})>삭제</button>
        <button class="css-102v0ri e4nu7ef3" type="button" width="104" height="36" radius="4" onclick= insertCart(${product.idx})><span class="css-ymwvow e4nu7ef1"><img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNiAzNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTM2IDM2SDBWMGgzNnoiLz4KICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSg1LjE2NCA2LjU0NykiIHN0cm9rZT0iIzVmMDA4MCIgc3Ryb2tlLWxpbmVjYXA9InNxdWFyZSIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjciPgogICAgICAgICAgICA8cGF0aCBkPSJtMjUuNjggMy42Ni0yLjcyIDExLjU3SDcuMzdMNC42NiAzLjY2eiIvPgogICAgICAgICAgICA8Y2lyY2xlIGN4PSIyMC41MiIgY3k9IjIwLjc4IiByPSIyLjE0Ii8+CiAgICAgICAgICAgIDxjaXJjbGUgY3g9IjkuODEiIGN5PSIyMC43OCIgcj0iMi4xNCIvPgogICAgICAgICAgICA8cGF0aCBkPSJNMCAwaDMuOGwxLjc2IDcuNSIvPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==" alt="" class="css-1m3kac1 e4nu7ef0">담기</span></button>
      </div>
    </div>
  </div>
<%--<div class="a">--%>
<%--  <div class="b">--%>
<%--    <a href="">--%>
<%--      <img src="https://img-cf.kurly.com/cdn-cgi/image/quality=85,width=676/shop/data/goods/1648202993377l0.jpg" alt="홈런볼" width="70" height="80">--%>
<%--    </a>--%>
<%--  </div>--%>
<%--  <div class="c">--%>
<%--    <a href="이 상품 페이지 링크" class="">홈런볼</a>--%>
<%--    <div>--%>
<%--      <span>1%</span>--%>
<%--      <span>1200원</span>--%>
<%--      <span>1500원</span>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>
  </c:forEach>


<div style="text-align:center">
  <table border="1">

    <tr>
      <th>상품번호</th>
      <th>상품이름</th>
      <th>상품가격</th>
      <th>상품할인율</th>
      <th>상품할인된가격</th>
      <th>상품썸네일파일경로</th>
    </tr>

    <c:forEach var="wishlist"  items="${list2}">
      <form action="" id="form">
        <tr>
          <th>${wishlist.idx}</th>
          <th>${wishlist.name}</th>
          <th>${wishlist.prc}</th>
          <th>${wishlist.dc_rate}%</th>
          <th></th>
          <th>${wishlist.resv_photo_upload_path}</th>
          <button type="button" id="removeBtn" class="btn" value="${wishlist.idx}" onclick="remove(${wishlist.idx})">삭제</button> <%--삭제 버튼 태그에다 상품 번호 기록한다--%>
          <button type="button" id="insertBtn" class="btn" onclick= insertCart(${wishlist.idx});>담기</button> <%--담기 버튼 --%>
          <button class="css-1h4lltl e4nu7ef3" type="button" width="104" height="36" radius="4" onclick=remove(${wishlist.idx})>삭제</button>
          <button class="css-102v0ri e4nu7ef3" type="button" width="104" height="36" radius="4" onclick= insertCart(${wishlist.idx})><span class="css-ymwvow e4nu7ef1"><img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNiAzNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTM2IDM2SDBWMGgzNnoiLz4KICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSg1LjE2NCA2LjU0NykiIHN0cm9rZT0iIzVmMDA4MCIgc3Ryb2tlLWxpbmVjYXA9InNxdWFyZSIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjciPgogICAgICAgICAgICA8cGF0aCBkPSJtMjUuNjggMy42Ni0yLjcyIDExLjU3SDcuMzdMNC42NiAzLjY2eiIvPgogICAgICAgICAgICA8Y2lyY2xlIGN4PSIyMC41MiIgY3k9IjIwLjc4IiByPSIyLjE0Ii8+CiAgICAgICAgICAgIDxjaXJjbGUgY3g9IjkuODEiIGN5PSIyMC43OCIgcj0iMi4xNCIvPgogICAgICAgICAgICA8cGF0aCBkPSJNMCAwaDMuOGwxLjc2IDcuNSIvPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg==" alt="" class="css-1m3kac1 e4nu7ef0">담기</span></button>
<%--          <th>${wishlist.prod_idx}</th>  // 어떻게 wishlist.prod_idx 값을 Controller한테 전달해줄까--%>
<%--          <th>${wishlist.user_idx}</th>--%>
<%--          <th>${wishlist.reg_tm}</th>--%>
<%--          <th>${wishlist.crt_tm}</th>--%>
<%--          <th>${wishlist.crt_idx}</th>--%>
<%--          <th>${wishlist.upt_tm}</th>--%>
<%--          <th>${wishlist.upt_idx}</th>--%>
<%--          <button type="button" id="removeBtn" class="btn" value="${wishlist.prod_idx}" onclick="remove(${wishlist.prod_idx})">삭제</button> &lt;%&ndash;삭제 버튼 태그에다 상품 번호 기록한다&ndash;%&gt;--%>
<%--          <button type="button" id="insertBtn" class="btn" onclick= insertCart(${wishlist.prod_idx});>담기</button> &lt;%&ndash;담기 버튼 &ndash;%&gt;--%>
        </tr>
      </form>
    </c:forEach>

  </table>
  <script>

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