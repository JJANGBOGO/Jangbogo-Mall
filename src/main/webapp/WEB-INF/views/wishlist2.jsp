<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/validateUser.css"/>
    <%--    경로에 warning이 뜨면 카멜케이스로 명명 수정한다. mypage(x) myPage(o). 어길시 css 404--%>
    <link rel="stylesheet" href="/css/wishlist.css">
    <link rel="stylesheet" href="/css/wishlistmodal.css">
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="mypage-banner"></div>
<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
    <div class="mypage-content">

        <div class="king">
            <div class="title">
                <h2 class="h2">
                    찜한 상품(${totalCnt})
                </h2>
                <span class="titlespan">
          찜한 상품은 최대 200개까지 저장됩니다
        </span>
            </div>

            <c:forEach var="product" items="${list}" varStatus="i">
                <div class="a">
                    <a href="">
                        <img src="${product.resv_photo_upload_path}" alt="">
                    </a>

                    <div class="b">
                        <div class="c">
                            <a href="" id="name${product.idx}">${product.name}</a>
                            <div class="d">
                                    <%--만약 상품 할인율이 0이면 --%>
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
                                    onclick=show(${product.idx})><span class="css-ymwvow e4nu7ef1">담기</span></button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="background">
            <div class="popup">
                <div class="b1">
                    <div class="c1">
                        <span class="c3">1</span>
                    </div>
                    <div class="d1">
                        <div class="e1">
                            <span class="span22">2</span><span class="span33">3</span>
                        </div>
                        <div class="f1">
                            <button class="button1" type="button"></button>
                            <%--                        <button class="button3" type="button"></button>--%>

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
                        <span style="font-size: 16px; color: rgb(255, 255, 255);">장바구니 담기</span>
                    </button>
                    <input class="hidden_input" type="hidden" value="">
                </div>
            </div>
        </div>

    </div>
</div>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script>
    let msg = "${msg}"
    if(msg=="add") alert("장바구니에 상품이 담겼습니다");
    if(msg=="addmore") alert("장바구니에 상품이 담겼습니다\n이미 담은 상품의 수량을 추가했습니다");
    function remove(prod_idx) {
        if (!confirm("정말로 삭제하시겠습니까")) return;
        let form = document.createElement("form");
        form.setAttribute("action", '<c:url value="/mypage/removeWishlist?prod_idx='+prod_idx+'"/>')
        form.setAttribute("method", "post");
        document.body.appendChild(form);
        form.submit();
        <%--location.href='<c:url value="/mypage/removeWishlist?prod_idx='+prod_idx+'"/>'--%>
    }


    // 최종 담기 버튼 클릭시 insertCart 함수 실행
    document.querySelector('.insert-btn').addEventListener('click',insertCart);
    // 최종 장바구니에 담기 클릭 시
    function insertCart() {

        let form = document.createElement("form");
        let prod_idx = document.querySelector('.hidden_input').value;
        let prod_cnt = document.querySelector('.count').innerHTML;

        let obj = document.createElement('input');
        obj.setAttribute('type', 'hidden');
        // obj.setAttribute('name', 'userid');
        // obj.setAttribute('value', prod_idx);
        form.appendChild(obj);
        form.setAttribute('method', 'post');
        form.setAttribute("action", '<c:url value="/mypage/insertCart?prod_idx='+prod_idx+'&prod_cnt='+prod_cnt+'"/>')
        document.body.appendChild(form);
        form.submit();
    }


    // 담기 버튼(모달창 오픈)
    function show(ioo) {

        let name = document.getElementById("name" + ioo).innerText;  // ex) 홈런볼
        let prc = document.getElementById("prc" + ioo).innerText;    // ex) 1,200원
        let dc_prc = document.getElementById("dc_prc" + ioo).textContent; // ex) 1,100원

        // 상품이름, 상품 할인가격, 상품 가격, 상품번호 값을 모달에 넣어준다
        document.querySelector(".c3").innerHTML = name; // 상품이름 ex)
        // document.querySelector(".span11").innerHTML = dc_rate; // 할인율
        document.querySelector(".span22").innerHTML = dc_prc; // 할인된 가격
        document.querySelector(".span33").innerHTML = prc; // 원래 가격
        document.querySelector('.price').innerHTML = parseInt(dc_prc.replace(',', "")).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식으로 숫자만
        document.querySelector('.hidden_input').value = ioo;
        // 모달창 보이게 클레스 이름 변경
        document.querySelector(".background").className = "background show";

    }

    // 모달 취소버튼
    document.querySelector(".cancle-btn").addEventListener("click", close); // document.querySelector("#show").addEventListener("click", show);
    function close() {
        document.querySelector(".background").className = "background";
        counter = 1;
        count.innerHTML = counter;
        document.querySelector(".button3").className = "button1";
    }

    // 모달 카운터
    let counter = 1;
    const button1 = document.querySelector('.button1');
    const button2 = document.querySelector('.button2');
    const count = document.querySelector('.count');
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

        // console.log(document.querySelector(".span22").innerHTML.replace(',', ""));
        // console.log(parseInt(document.querySelector(".span22").innerHTML.replace(',', "")))

        let a = counter * parseInt(document.querySelector(".span22").innerHTML.replace(',', ""));
        price.innerHTML = a.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        // console.log(count.innerHTML);
        // console.log(document.querySelector('.hidden_input').value);

    })


</script>
</div>
</body>
</html>