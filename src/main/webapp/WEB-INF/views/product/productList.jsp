<%--
  Created by IntelliJ IDEA.
  User: qpwo3
  Date: 2023-04-30
  Time: 오후 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <link rel="stylesheet" href="/css/productReview.css"/>
    <link rel="stylesheet" href="/css/productReviewModal.css"/>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <%@ include file="/WEB-INF/views/include/navbar.jsp" %>
    <link rel="stylesheet" href="/css/product/productList.css"/>
    <title>Title</title>
</head>
<body>
<div class="productList-main">
    <div id="container">
        <div class="category-banner">

        </div>
        <h3 class="category-name">상품</h3>
        <div class="product-main">
            <div class="products">
                <div class="mini-filter">
                    <div class="total-num"></div>
                </div>
                <div class="products-box">

                </div>
            </div>
        </div>
    </div>
</div>

<div role="presentation" class="modal_body">
    <div class="modal_back_body"></div>
    <div tabindex="0" data-test="sentinelStart"></div>
    <div class="modal-container" role="presentation" tabindex="-1">
        <div
                class="modal-paper"
                role="dialog"
                aria-labelledby="customized-dialog-title"
        >
            <div class="modal-product-info-wrap" class="css-155nkqq e1xnucib1">
                <div class="modal-product-info" class="css-1sjnt6v e1b27mtb8">
                    <div class="product-info-name-wrap" class="css-1066lcq e1b27mtb7">
                <span class="product-info-name" class="css-rsi182 e1b27mtb6">
                </span>
                    </div>
                    <div
                            class="product-info-price-wrap"
                    >
                        <div class="product-info-price">
                  <span class="price-dc">
                  </span>
                            <span class="price-origin">
                  </span>
                        </div>
                        <div
                                class="product-info-price-button"
                        >
                            <button
                                    type="button"
                                    aria-label="수량내리기"
                                    disabled=""
                                    class="down-scale"
                            ></button>
                            <div class="scale">1</div>
                            <button
                                    type="button"
                                    aria-label="수량올리기"
                                    class="up-scale"
                            ></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="total-info-wrap">
                <div class="total-info">
                    <div class="total-info-head">
                        <p class="total-info-name">합계</p>
                        <div>
                  <span class="total-info-num">

                  </span>
                            <span class="total-info-text">
                    원
                  </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-button-group">
                <button
                        class="button-back"
                        type="button"
                >
              <span class="button-back-text">
                취소
              </span>
                </button>
                <button
                        class="button-cart"
                        type="button"
                >
              <span class="button-cart-text">
                장바구니 담기
              </span>
                </button>
            </div>
        </div>
    </div>
    <div tabindex="0" data-test="sentinelEnd"></div>
</div>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
    let f_cate_idx = "${f_cate_idx}";

    let showProducts = function() {
        $.ajax({
        type: 'GET',
        url: '/productList/list',
        success: function(result) {
        $('.products-box').html(productToList(result));
        },
        error: function() { alert("GET productList Error") }
        })
    }



    let productToList = function(productLists) {
        let totalCnt = productLists.length;


        $('.total-num').html("총 "+totalCnt+"건");

        let tmp = "";
        productLists.sort(() => Math.random() -0.5);
        productLists.forEach(function(productList) {

            let price = productList.price;
            let dc_rate = productList.dc_rate;
            let calc_price = Math.floor(price - price * (dc_rate /100));
            let withComma = calc_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); // 할인가격 + 콤마

            let priceWithComma = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','); // 원래가격 + 콤마

            let url = "/product/"+ productList.prod_idx;

            tmp += '<a class="product" href='<c:url value="+url+" />'>'
            tmp += '<div class="product-img-wrap">'
            tmp += '<div '
            tmp += 'class="product-img">'
            tmp += '<span class="product-img-span" >'
            tmp += '<img class="product-img-img" sizes="100vw" src='+ productList.upload_path +' alt="상품이미지" />'
            tmp += '</span>'
            tmp += '<div class="product-button-wrap">'
            tmp += '<button class="wishlist-button" data-prod_idx=' + productList.prod_idx + '>'
            tmp += '<img '
            tmp += 'class="wishlist-button-img" '
            tmp += 'src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDUiIGhlaWdodD0iNDUiIHZpZXdCb3g9IjAgMCA0NSA0NSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGNpcmNsZSBmaWxsPSIjMkEwMDM4IiBvcGFjaXR5PSIuNSIgY3g9IjIyLjUiIGN5PSIyMi41IiByPSIyMi41Ii8+CiAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMTEuMDMgMTQuMzgpIiBzdHJva2U9IiNGRkYiIHN0cm9rZS1saW5lY2FwPSJzcXVhcmUiIHN0cm9rZS1saW5lam9pbj0icm91bmQiPgogICAgICAgICAgICA8cGF0aCBzdHJva2Utd2lkdGg9IjEuNCIgZD0ibTIwLjQ2IDIuOTEtMi4xNyA5LjIzSDUuODdMMy43MSAyLjkxeiIvPgogICAgICAgICAgICA8Y2lyY2xlIHN0cm9rZS13aWR0aD0iMS4yIiBjeD0iMTYuMzUiIGN5PSIxNi44NiIgcj0iMS43Ii8+CiAgICAgICAgICAgIDxjaXJjbGUgc3Ryb2tlLXdpZHRoPSIxLjIiIGN4PSI3LjgyIiBjeT0iMTYuODYiIHI9IjEuNyIvPgogICAgICAgICAgICA8cGF0aCBzdHJva2Utd2lkdGg9IjEuNCIgZD0iTTAgMGgzLjAybDEuNDEgNS45OCIvPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+Cg=="'
            tmp += 'alt="장바구니 아이콘" />'
            tmp += '</button>'
            tmp += '</div>'
            tmp += '</div>'
            tmp += '</div>'
            tmp += '<div id="product_info" class="product-info"'
            tmp += ' data-prod_idx=' + productList.prod_idx + '>'
            tmp += '<span class="product-title">'+ "["+ productList.brandName +"]"+ productList.name +'</span>'
            tmp += '<p class="product-content">'+ productList.ctent +'</p>'
            tmp += '<div class="product-price-wrap">'
            tmp += '<div class="product-price">'
            // if(productList.dc_rate != 0) {
            //     tmp += '<span class="dc_rate">' + productList.dc_rate + "%" + '</span>'
            // }
            // tmp += '<span class="price">' + withComma + '<span class="won">원</span>'

            if(productList.dc_rate != 0) {
                tmp += '<span class="dc_rate">' + productList.dc_rate + "%" + '</span>'
                tmp += '<span class="price">' + withComma + '<span class="won">원</span>'
                tmp += '<span class="price_val1">' + priceWithComma + '<span class="won1">원</span>'
            }else {
                tmp += '<span class="price_val2">' + priceWithComma + '<span class="won2">원</span>'

            }
            tmp += '</span>'
            tmp += '</div>'
            tmp += '</div>'
            tmp += '<div class="product-review">후기 '
            tmp += ' <span class="product-review-span"> &nbsp;'+ productList.review_cnt +'개'+'</span>'
            tmp += '</div>'
            tmp += '</div>'
            tmp += '</a>'
        })

        return tmp;
    }

    $(document).ready(function(){
        showProducts();

        $.ajax({
            type: 'GET',
            url: '/productList/list?prod_idx',
            success: function(result) {
                $('.products-box').html(productToList(result));
            },
            error: function() { alert("GET productList Error") }
        })


        $(".products-box").on("click",".wishlist-button", function (e) {
            e.preventDefault();

            let prod_idx = $(this).data("prod_idx");

            let user_idx = "${user_idx}";
            if(user_idx == "") {
                alert("회원만 장바구니 담기가 가능합니다.");
                return;
            }

            let title = $(this).parent().parent().parent().siblings().find(".product-title").text();

            let price = $(this).parent().parent().parent().siblings().find(".product-price-wrap").children().find(".price").text();
            let dc_rate = $(this).parent().parent().parent().siblings().find(".product-price-wrap").children().find(".dc_rate").text();

            let regex = /[^0-9]/g;
            let numPrice = price.replace(regex, "");
            let dcPrice = dc_rate.replace(regex, "");
            let withComma = numPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            $(".product-info-name").text(title);
            $(".price-origin").text(withComma+"원")

            let calcPrice = Math.floor(numPrice - numPrice * (dcPrice / 100));
            let calcPriceWithComma = calcPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            $(".price-dc").text(calcPriceWithComma+"원");
            $(".total-info-num").text(calcPriceWithComma);
            $(".modal_body").css("display", "block");
            $(".button-cart").data("prod_idx", prod_idx);
        })

        $(".button-back").click(function(e) {
            e.preventDefault();

            $(".scale").text("1")

            $(".modal_body").css("display", "none");
        })

        $(".button-cart").click(function(e) {
            e.preventDefault();

            let prod_idx = $(this).data("prod_idx");

            let prod_cnt = $(".scale").text();

            $.ajax({
                type: 'POST',
                url: '/productList/cart?prod_idx='+prod_idx+'&prod_cnt='+prod_cnt,
                success: function(msg) {
                    if(msg === "INSERT_OK") {
                        alert("장바구니에 상품이 담겼습니다.");
                    } else if (msg === "UPDATE_OK") {
                        alert("장바구니에 상품이 담겼습니다.\n이미 담은 상품의 수량을 추가했습니다.");
                    }
                },
                error: function() {alert("장바구니 담기에 문제가 발생했습니다.")}
            })
            $(".scale").text("1")

            $(".modal_body").css("display", "none");
        })

        $(".down-scale").click(function(e) {
            e.preventDefault();
            let num = parseInt($('.scale').text());
            if(!(num < 2)){
                let minusNum = num - 1;
                $('.scale').text(minusNum);
                let textNum = $('.scale').text();
                let regex = /[^0-9]/g;
                let origin = ($('.price-dc').text()).replace(regex, "");

                let calcPrice = (textNum * origin).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
                $('.total-info-num').text(calcPrice);
            }

            if($(".scale").text() == 1) {
                $(".up-scale").attr("disabled", false);
            }

        })

        $(".up-scale").click(function(e) {
            e.preventDefault();

            let init = parseInt($('.scale').text());
            if(init <= 9){
                let plusNum = init + 1;
                $('.scale').text(plusNum);
                let regex = /[^0-9]/g;
                let numPrice = ($('.price-dc').text()).replace(regex, "");
                let calcPrice = Math.floor(plusNum * parseInt(numPrice));
                let withComma = calcPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
                $('.total-info-num').text(withComma);
            }
            if($(".scale").text() > 1) {
                $(".down-scale").attr("disabled", false);
            }
            if($(".scale").text() == 10) {
                $(".up-scale").attr("disabled", true);
            }
        })
    })
</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>