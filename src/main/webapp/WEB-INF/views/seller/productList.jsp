<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--   별점 css --%>
    <link href="/css/starrr.css"/>
    <link
            rel="stylesheet"
            href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css"
    />
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
            integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
            crossorigin="anonymous"
    />
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/productList.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="mypage-banner"></div>
<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebarSeller.jsp" %>
    <div class="mypage-content">
        <div class="page-header">
            <h2>상품 리스트</h2>
        </div>
        <ul class="seller-products">
            <li class="product-item">
                <div class="product-code">B1007</div>
                <div class="product-center">
                    <div class="product-img">
                        <img
                                src="https://image.idus.com/image/files/18b85d3431994eb28a247543ca2119a3_320.jpg"
                                alt="product"
                        />
                    </div>
                    <div class="product-desc">
                        <div class="product-title">
                            3일전 선주문순 순차배송! 줄서서먹는 찹쌀약과
                        </div>
                        <div class="product-content">주문시 제작</div>
                        <div class="star-grade">
                            <div class="starrr"></div>
                        </div>
                    </div>
                </div>
                <div class="product-right">
                    <div class="product-price">8000원</div>
                    <div class="product-status">승인 대기</div>
                    <div class="product-status">재고 있음</div>
                </div>
            </li>
        </ul>
        <button class="product-reg-btn">상품 등록하기</button>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script src="/js/starrr.js"></script>
<script>
    $(document).ready(function () {
        let grade = 3;

        $(".starrr").starrr({
            rating: grade,
        });

        $(".starrr a").css("color", "rgb(243, 61, 61)"); //start color

        $(".product-reg-btn").click(function() {
            window.location.href = "/seller/register/product";
        });
    });
</script>
</body>
</html>
