<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/search.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="search-page">
    <div class="search-pd-content">
        <ul class="search-list">
            <c:forEach items="${searchPdList}" var="product">
                <li>
                    <a class="img-box">
                        <img src="${product.upload_path}" alt="product-img"/>
                        <div class="cart-btn"><i class="fa-solid fa-cart-shopping"></i></div>
                    </a>
                    <div class="product-desc">
                        <a class="title"><h3>${product.name}</h3></a>
                        <div class="price">${product.prc}원</div>
                        <div class="review-cnt">리뷰 수: ${product.review_cnt}</div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
</script>
</body>
</html>
