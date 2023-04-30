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
    <link rel="stylesheet" href="/css/myPage/productList.css?v=2"/>
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
            <c:forEach var="product" items="${productList}">
                <li class="product-item">
                    <div class="product-code">${product.seler_prod_cd}</div>
                    <div class="product-center">
                        <div class="product-img">
                            <img
                                    src="${pageContext.request.contextPath}/display?fileName=${product.upload_path}"
                                    alt="product"
                            />
                        </div>
                        <div class="product-desc">
                            <div class="product-title">
                                    ${product.name}
                            </div>
                            <div class="product-content">${product.content}</div>
                            <div class="star-grade">
                                <div class="starrr" data-ascr="${product.ascr}"></div>
                            </div>
                        </div>
                    </div>
                    <div class="product-right">
                        <div class="product-price">${product.prc}</div>
                        <div class="product-status">
                            <c:choose>
                                <c:when test="${product.reg_state_cd == 1}">
                                    승인 대기
                                </c:when>
                                <c:when test="${product.reg_state_cd == 2}">
                                    승인
                                </c:when>
                                <c:when test="${product.reg_state_cd == 3}">
                                    거절
                                </c:when>
                            </c:choose>
                        </div>
                        <div class="product-status">
                            <c:if test="${product.dsply_state_cd == 1}">
                                전시
                            </c:if>
                            <c:if test="${product.dsply_state_cd == 0}">
                                비전시
                            </c:if>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
        <button class="product-reg-btn">상품 등록하기</button>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script src="/js/starrr.js"></script>
<script>
    let msg = "${msg}";
    if (msg === "REG_PROD_OK") alert("상품 등록을 성공했습니다");

    $(document).ready(function () {
        $(".product-item").each(function () {
                let star_ref = $(this).find(".starrr");
                star_ref.starrr({rating: star_ref.data("ascr")});
            }
        );
        $(".starrr a").css("color", "rgb(243, 61, 61)"); //평점 색깔 변경


        $(".product-reg-btn").click(function () {
            window.location.href = "/seller/register/product";
        });
    });
</script>
</body>
</html>