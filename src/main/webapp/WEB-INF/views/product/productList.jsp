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
    <link rel="stylesheet" href="/css/product/productList.css"/>
    <title>Title</title>
</head>
<body>
<div class="productList-main">
    <div id="container">
        <div class="category-banner">

        </div>
        <h3 class="category-name">상품</h3>
<%--        <ul class="cate-list">--%>
<%--&lt;%&ndash;            <li class="cate-name"></li>&ndash;%&gt;--%>
<%--        </ul>--%>
        <div class="product-main">
            <div class="products">
                <div class="mini-filter">
                    <div class="total-num"></div>
                    <ul class="filter-main">
                        <li class="filter-name-wrap">
                            <a href="" class="filter-name">신상품순</a>
                        </li>
                        <li class="filter-name-wrap">
                            <a href="" class="filter-name">판매량순</a>
                        </li>
                        <li class="filter-name-wrap">
                            <a href="" class="filter-name">혜택순</a>
                        </li>
                        <li class="filter-name-wrap">
                            <a href="" class="filter-name">낮은 가격순</a>
                        </li>
                        <li class="filter-name-wrap">
                            <a href="" class="filter-name">높은 가격순</a>
                        </li>
                    </ul>
                </div>
                <div class="products-box">

                </div>
                <div class="page-handler-box">
                    <a href="" class="paging-button">
                        <img
                                src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUA…gAIPi/8X/4QwwE5PBQJADAAKSG3cyVhtXAAAAAElFTkSuQmCC"
                                alt="이전 페이지로 이동하기 아이콘"
                        />
                    </a>
                    <a class="paging-button" href=""></a>
                    <a href="" class="paging-button">
                        <img
                                src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUA…8nwECQEwCHEwGhAlRBgA2mht3SwgzrwAAAABJRU5ErkJggg=="
                                alt="다음 페이지로 이동하기 아이콘"
                        />
                    </a>
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
                  [델리치오] 호주산 목초육 안심 스테이크 250g (냉장)
                </span>
                    </div>
                    <div class="product-info-point" class="css-e7dd1m e1b27mtb5">
                        적립제외상품
                    </div>
                    <div
                            class="product-info-price-wrap"
                            class="css-1sr55yd e1b27mtb4"
                    >
                        <div class="product-info-price" class="css-0 e1b27mtb3">
                  <span class="price-dc" class="css-1jjhy4o e1b27mtb2">
                    18,320원
                  </span>
                            <span class="price-origin" class="css-16pwusi e1b27mtb1">
                    22,900원
                  </span>
                        </div>
                        <div
                                class="product-info-price-button"
                                class="e1b27mtb0 css-2v1lnp e1cqr3m40"
                        >
                            <button
                                    type="button"
                                    aria-label="수량내리기"
                                    disabled=""
                                    class="down-scale"
                                    class="css-1e90glc e1hx75jb0"
                            ></button>
                            <div class="scale" class="count css-6m57y0 e1cqr3m41">1</div>
                            <button
                                    type="button"
                                    aria-label="수량올리기"
                                    class="up-scale"
                                    class="css-18y6jr4 e1hx75jb0"
                            ></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="total-info-wrap" class="css-uy4qy4 e1xnucib0">
                <div class="total-info" class="css-1fttcpj e9qarb89">
                    <div class="total-info-head" class="css-1066lcq e9qarb88">
                        <p class="total-info-name" class="css-pp0jbi e9qarb87">합계</p>
                        <div>
                  <span class="total-info-num" class="css-6zcwtk e9qarb86">
                    18,320
                  </span>
                            <span class="total-info-text" class="css-1h22y54 e9qarb85">
                    원
                  </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-button-group" class="css-1toes8l e1vslu8h0">
                <button
                        class="button-back"
                        class="css-wg85j7 e4nu7ef3"
                        type="button"
                >
              <span class="button-back-text" class="css-ymwvow e4nu7ef1">
                취소
              </span>
                </button>
                <button
                        class="button-cart"
                        class="css-1qirdbn e4nu7ef3"
                        type="button"
                >
              <span class="button-cart-text" class="css-ymwvow e4nu7ef1">
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

    // let showCategory = function() {
    //     $.ajax({
    //         type: 'GET',
    //         url: '/productList/category',
    //         success: function(result) {
    //             console.log("dsaas");
    //             console.log("result"+result);
    //             alert("alert!!!");
    //             $('.cate-list').html(cateListToHtml(result));
    //         },
    //         error: function() { alert("GET productList Error") }
    //     })
    // }

    <%--let cateListToHtml = function(cateNames) {--%>
    <%--    // let tmp = "";--%>

    <%--        console.log("ddddd"+cateNames.id);--%>
    <%--    // cateNames.forEach(function(cateName) {--%>
    <%--        // console.log("f_cate_idx!!!"+cateName.id);--%>
    <%--        &lt;%&ndash;tmp += '<li class="cate-name"><a href="<c:url value='/productList/ffloor/{}'  />"></a></li>'&ndash;%&gt;--%>
    <%--    //     tmp += '<li class="cate-name">cateName.cate_name</li>'--%>
    <%--    // })--%>
    <%--    // return tmp;--%>
    <%--}--%>


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
        productLists.forEach(function(productList) {


            let test = productList.price;
            let withComma = test.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

            let url = "/product/"+ productList.prod_idx;

            tmp += '<a class="product" href='<c:url value="+url+" />'>'
            tmp += '<div class="product-img-wrap">'
            tmp += '<div '
            tmp += 'class="product-img">'
            tmp += '<span class="product-img-span" >'
            tmp += '<img class="product-img-img" sizes="100vw" src='+ productList.upload_path +' alt="상품이미지" />'
            tmp += '</span>'
            tmp += '<div class="product-button-wrap">'
            tmp += '<button class="wishlist-button" onclick="return false;">'
            tmp += '<img '
            tmp += 'class="wishlist-button-img"'
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
            tmp += '<span class="price">' + withComma + '<span class="won">원</span>'
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
            url: '/productList/list?prod_idx'+prod_idx,
            success: function(result) {
                $('.products-box').html(productToList(result));
            },
            error: function() { alert("GET productList Error") }
        })


        $(".products-box").on("click",".wishlist-button", function (e) {
            e.preventDefault();
            // alert("show!!")
            // $('.modal_body').attr('class', ' show');
            // $('.modal_body').addClass('show')
            // alert("alert!!");
            $('.modal_body').css('display', 'block');

        })

        // $(".button-back").on("click")
    })
</script>
</body>
</html>