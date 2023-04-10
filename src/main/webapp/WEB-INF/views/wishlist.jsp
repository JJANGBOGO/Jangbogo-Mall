<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>fastcampus</title>
  <link rel="stylesheet" href="<c:url value='/css/wishlist.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/wishlistmodal.css'/>">

    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

  <style>


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

<c:forEach var="product" items="${list2}" varStatus="i">
    <div class="a">
        <a href="">
            <img src="${product.resv_photo_upload_path}" alt="">
        </a>

        <div class="b">
            <div class="c">
                <a href="" id="name${product.idx}">${product.name}</a>
                <div class="d">

                    <c:choose>
                        <c:when test="${product.dc_rate != 0}">
                            <span class="span1" id="dc_rate${product.idx}">${product.dc_rate}%</span>
                            <span class="span2" id="dc_prc${product.idx}"><fmt:formatNumber value="${product.prc - (product.prc / 100 * product.dc_rate)}" pattern="#,###"/>원</span>
                            <span class="span3" id="prc${product.idx}"><fmt:formatNumber value="${product.prc}" pattern="#,###"/>원</span>
                        </c:when>
                        <c:otherwise>
                            <span class="span2" id="dc_prc${product.idx}"><fmt:formatNumber value="${product.prc}" pattern="#,###"/>원</span>
                            <span class="span3" id="prc${product.idx}"></span>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>

            <div class="e">
                <button class="css-1h4lltl e4nu7ef3" type="button" width="104" height="36" radius="4"
                        onclick=remove(${product.idx})>삭제
                </button>
                <button class="css-102v0ri e4nu7ef3" type="button" width="104" height="36" radius="4"
                        onclick=show(${product.idx})><span class="css-ymwvow e4nu7ef1"><img
                        src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzYiIGhlaWdodD0iMzYiIHZpZXdCb3g9IjAgMCAzNiAzNiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTM2IDM2SDBWMGgzNnoiLz4KICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSg1LjE2NCA2LjU0NykiIHN0cm9rZT0iIzVmMDA4MCIgc3Ryb2tlLWxpbmVjYXA9InNxdWFyZSIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjciPgogICAgICAgICAgICA8cGF0aCBkPSJtMjUuNjggMy42Ni0yLjcyIDExLjU3SDcuMzdMNC42NiAzLjY2eiIvPgogICAgICAgICAgICA8Y2lyY2xlIGN4PSIyMC41MiIgY3k9IjIwLjc4IiByPSIyLjE0Ii8+CiAgICAgICAgICAgIDxjaXJjbGUgY3g9IjkuODEiIGN5PSIyMC43OCIgcj0iMi4xNCIvPgogICAgICAgICAgICA8cGF0aCBkPSJNMCAwaDMuOGwxLjc2IDcuNSIvPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg=="
                        alt="" class="css-1m3kac1 e4nu7ef0">담기</span></button>

            </div>
        </div>
    </div>

</c:forEach>

<div class="background">
    <div class="popup">
        <div class="b1">
            <div class="c1">
                <span class="c3"></span>
            </div>
            <div class="d1">
                <div class="e1">
                    <span class="span22"></span><span class="span33"></span>
                </div>
                <div class="f1">
                    <button class="button1" type="button"></button>
                    <div class="count">

                    </div>
                    <button class="button2" type="button"></button>
                </div>
            </div>
        </div>
        <div class="totalprice">
            <div class="total1">
                <p class="total2">
                    합계
                </p>
                <div style="padding-top: 15px">
              <span class="price">
                66,000
              </span>
                    <span style="font-weight: 600 ;vertical-align: 3px; margin-right: 5px">
                 원
              </span>
                </div>
            </div>
        </div>
        <div id="close" class="btn-container">
            <button class="cancle-btn">
                <span style="font-size: 16px;">취소</span>
            </button>
            <button class="insert-btn">
                <span style="font-size: 16px;">장바구니 담기</span>
            </button>
            <input class="hidden_input" type="hidden" value="">
        </div>
    </div>
</div>


<%--<div style="text-align:center">--%>

<script>

    function remove(prod_idx) {
        if (!confirm("정말로 삭제하시겠습니까")) return;
        let form = document.getElementById("form");
        form.setAttribute("action", '<c:url value="/mypage/removeWishlist?prod_idx='+prod_idx+'"/>')
        form.setAttribute("method", "post");
        form.submit();
        <%--location.href='<c:url value="/mypage/removeWishlist?prod_idx='+prod_idx+'"/>'--%>
    }
    // 최종 장바구니에 담기 클릭 시
    function insertCart(prod_idx) {    // map으로 주는 방법을 생각해보자? ㅇㄴ
        // if(!confirm("정말로 담을건가요?")) return;
        console.log(prod_idx);
        let form = document.createElement("form");
        <%--form.setAttribute("action",'<c:url value="/mypage/insertCart?prod_idx='+prod_idx+'"/>')--%>
        <%--form.setAttribute("method", "post");--%>
        <%--form.submit();--%>

        // let f = document.createElement('form');

        let obj;
        obj = document.createElement('input');
        obj.setAttribute('type', 'hidden');
        // obj.setAttribute('name', 'userid');
        // obj.setAttribute('value', prod_idx);

        form.appendChild(obj);
        form.setAttribute('method', 'post');
        form.setAttribute("action", '<c:url value="/mypage/insertCart?prod_idx='+prod_idx+'"/>')
        document.body.appendChild(form);
        form.submit();
        <%--location.href='<c:url value="/mypage/wishlistremove?prod_idx='+prod_idx+'"/>'--%>
    }


    // 담기 버튼(모달창 오픈)
    function show(ioo) {
        let name = document.getElementById("name" + ioo).innerText;
        let prc = document.getElementById("prc" + ioo).innerText;
        let dc_prc = document.getElementById("dc_prc" + ioo).innerText;

        document.querySelector(".c3").innerHTML = name;
        // document.querySelector(".span11").innerHTML = dc_rate;
        document.querySelector(".span22").innerHTML = dc_prc;
        document.querySelector(".span33").innerHTML = prc;

        document.querySelector(".insert-btn").setAttribute("onclick", "insertCart(" + ioo + ")"); // 그리고 여기다 개수도 넣어줘야함
        console.log(document.querySelector(".insert-btn").getAttribute("onclick"));

        document.querySelector('.hidden_input').value = ioo;

        document.querySelector(".background").className = "background show";

    }

    function close() {
        document.querySelector(".background").className = "background";
        counter = 1;
        count.innerHTML = counter;
    }


    // 모달 취소버튼
    document.querySelector(".cancle-btn").addEventListener("click", close);
    // document.querySelector("#show").addEventListener("click", show);

    // 모달 카운터
    let counter = 1;
    const button1 = document.querySelector('.button1');
    const button2 = document.querySelector('.button2');
    const count = document.querySelector('.count');

    // if (count.innerHTML == 1) {
    //     document.querySelector(".button1").className = "button3";
    //
    // }
    count.innerHTML = counter;

    // 모달 카운터 (-)마이너스 버튼
    button1.addEventListener("click", () => {

        count.innerHTML = --counter;
        let price = document.querySelector('.price');
        let a = counter * parseInt(document.querySelector(".span22").innerHTML.replace(',', ""));
        price.innerHTML = a.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");


    })
    // 모달 카운터 (+)플러스 버튼
    button2.addEventListener('click', () => {

        count.innerHTML = ++counter;
        let price = document.querySelector('.price');

        console.log(document.querySelector(".span22").innerHTML.replace(',', ""));
        console.log(parseInt(document.querySelector(".span22").innerHTML.replace(',', "")))

        let a = counter * parseInt(document.querySelector(".span22").innerHTML.replace(',', ""));
        price.innerHTML = a.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        console.log(count.innerHTML);
        console.log(document.querySelector('.hidden_input').value);

    })


</script>
</div>
</body>
</html>