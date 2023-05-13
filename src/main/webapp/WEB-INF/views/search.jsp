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
        <c:choose>
            <c:when test="${empty searchPdList}">
                <div class="not-found">검색 결과가 존재하지 않습니다</div>
            </c:when>
            <c:otherwise>
                <div class="search-result"><span>${searchKeyword}</span>에 대한 검색결과</div>
            </c:otherwise>
        </c:choose>
        <ul class="search-list">
            <c:forEach items="${searchPdList}" var="product">
                <li>
                    <a class="img-box" href="<c:url value='/product/${product.idx}' />">
                        <img src="${product.upload_path}" alt="product-img"/>
                        <div class="cart-btn" data-idx="${product.idx}"><i class="fa-solid fa-cart-shopping"></i></div>
                    </a>
                    <div class="product-desc">
                        <a class="title"><h3>${product.name}</h3></a>
                        <div class="calcPrice">
                        <c:if test="${product.dc_rate != 0}">
                        <div class="dcPrice">${product.dc_rate}%</div>
                        </c:if>
                        <div class="price" data-price="${product.prc}" data-dc-rate="${product.dc_rate}"></div>
                        </div>
                        <div class="review-cnt">후기 수: ${product.review_cnt}</div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script src="/js/member/msg.js"></script>
<script src="/js/order/format.js"></script>
<script>
    $(document).ready(function () {

        let price_ref = $(".price");
        let dc_rate = Number(price_ref.data("dc-rate"));
        let price_val = Number(price_ref.data("price"));

        let format_price = formatPriceWithComma(Math.floor(price_val - price_val * (dc_rate /100)));
        price_ref.html(format_price + "원");

        let addCart = (e, this_ref) => {
            e.preventDefault();
            let prod_idx = this_ref.data("idx");
            let prod_cnt = 1;

            let user_idx = "${sessionScope.idx}";
            if (user_idx === "") alert("로그인 후 이용해 주세요");

            $.ajax({
                type: 'POST',       // 요청 메서드 // 위시리스트에서 장바구니에 담기
                url: '/mypage/wishlists?prod_idx=' + prod_idx + '&prod_cnt=' + prod_cnt,  // 요청 URI
                success: function (result) {
                    if (result === "DEL_OK1") alert("장바구니에 상품이 담겼습니다");
                    if (result === "DEL_OK2") alert("장바구니에 상품이 담겼습니다\n이미 담은 상품의 수량을 추가했습니다");
                },
                error: function () {
                    alert("error");
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        }

        //탭 상품 리스트 장바구니 담기 버튼
        $(".cart-btn").on("click", function (e) {
            addCart(e, $(this));
        });
    });
</script>
</body>
</html>
