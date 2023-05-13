<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page session="true" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/index.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="mySlides_container">
    <a href="/product/10018">
    <img class="mySlides"
         src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/a646798f-0e48-4aff-b7c4-cef62dc29ff2.png"
    />
    </a>
    <a href="/product/10019">
    <img class="mySlides"
         src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/16d20266-b93a-4147-9ac7-59e07898a4c7.jpg"
    />
    </a>
    <a href="/product/21">
        <img class="mySlides"
             src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/6bd451dd-ced9-446a-a229-5207ce1268c9.jpg"
        />
    </a>
<%--    <img class="mySlides"--%>
<%--         src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/edc9e6db-ee42-47ab-9157-552fce0b3fbc.jpg"--%>
<%--    />--%>
<%--    <img class="mySlides"--%>
<%--         src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/edc9e6db-ee42-47ab-9157-552fce0b3fbc.jpg"--%>
<%--    />--%>
<%--    <img class="mySlides"--%>
<%--         src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/9cef1d54-72cc-4f02-b63e-495170a02d5d.jpg"--%>
<%--    />--%>
</div>
<div class="category-header">
    <h2>놓치면 후회하는 특별 상품들</h2>
</div>
<div class="category-section">
    <ul class="tab-list">
        <li>
            <button class="tab-button" data-a="0">전체보기</button>
        </li>
        <li>
            <button class="tab-button" data-a="1">과일</button>
        </li>
        <li>
            <button class="tab-button" data-a="2">채소</button>
        </li>
        <li>
            <button class="tab-button" data-a="3">수산물</button>
        </li>
        <li>
            <button class="tab-button" data-a="4">육류</button>
        </li>
        <li>
            <button class="tab-button" data-a="5">간편요리</button>
        </li>
    </ul>
    <div class="tab-content">
        <ul class="thum-list"></ul>
        <ul class="thum-list"></ul>
        <ul class="thum-list"></ul>
        <ul class="thum-list"></ul>
        <ul class="thum-list"></ul>
        <ul class="thum-list"></ul>
    </div>
</div>
<a class="see-pd-all" href="/productList">전체 보기&gt;</a>
<div class="magazine">
    <a href="" class="collection-link">
        <div class="img-box">
            <img class="main-img" id="article_img"/>
        </div>
        <div class="mg-content">
            <strong>오늘의 장바구니 추천</strong>
            <p>봄을 맞아 하는 일이 모두 잘되시길 기원합니다. 맛있는 음식이 힘을 북돋아 줄거에요!</p>
        </div>
    </a>
    <div class="col-products">
        <ul class="products-box"></ul>
        <a class="see-pd-all" href="/productList">전체 보기&gt;</a>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="/js/member/msg.js"></script>
<script src="/js/order/format.js"></script>
<script>
    let msg = "${msg}";
    if (msg === "EXCEPTION_ERR") alert("예상치 못한 오류가 발생했습니다. 불편을 끼쳐드려 죄송합니다.");
    if (msg === "WITHDRAW_OK") alert(withdraw_ok);
</script>
<script>
    let ctg_arr = ["00", "01", "02", "03", "04", "06"]; //탭 카테고리. 최대 6개, 수정 시, 카테고리 탭 텍스트도 같이 수정할 것.

    let renderPdList = (list, tab_id) => {//상품리스트를 html로 구현
        let list_ref = $(".thum-list").eq(tab_id); //0,1,2,3,4,5
        let str = "";
        list.sort(() => Math.random() - 0.5); //랜덤 돌리기
        list.forEach((obj, i) => {
            if (i > 7) return; //카테고리당 4개만 보여줌

            //가격 할인율 계산 ,추가

            let dc_rate = obj.dc_rate;
            let price_val = obj.prc;

            let format_price = formatPriceWithComma(Math.floor(price_val - price_val * (dc_rate /100)));
            //
            str += '<li>'
                + '<a class="img-box" href="/product/' + obj.idx + '">'
                + '<img src="' + obj.upload_path + '"alt="product-img" />'
                + '<div class="cart-btn"><i id="cart_btn" class="fa-solid fa-cart-shopping" data-idx="' + obj.idx + '"></i></div>'
                + '</a>'
                + '<div class="thum-desc">'
                + '<a class="title"><h3>[' + obj.cpnm + '] ' + obj.name + '</h3></a>'
                + '<span>'+ dc_rate +'%</span>'
                + '<div class="price">' + format_price + '원</div>'
                + '<div class="review-cnt">후기: ' + obj.review_cnt + '</div>'
                + '</div>'
                + '</li>';
        });
        list_ref.append(str);
    }

    let reqPdPromise = (cate_idx) => { //카테고리 idx로 해당 상품 리스트를 가져오는 promise
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '/list/pd',
                data: {category: cate_idx},
                type: 'GET',
                success: function (list) {
                    resolve(list);
                },
                error: function () {
                    reject(error_msg);
                }
            }); //$.ajax
        });
    }

    let renderArticleList = (list) => { // 2번째 매거진 부분
        let str = "";
        let list_ref = $(".products-box");
        list.sort(() => Math.random() - 0.5);
        list.forEach((obj, i) => {

            let dc_rate = obj.dc_rate;
            let price_val = obj.prc;

            let format_price = formatPriceWithComma(Math.floor(price_val - price_val * (dc_rate /100)));
            //
            if (i === 0) $("#article_img").attr("src", obj.upload_path);
            if (i > 3) return; //카테고리당 4개만 보여줌
            str += '<li>'
                + '<a href="/product/' + obj.idx + '">'
                + '<span class="pd-img">'
                + '<img src="' + obj.upload_path + '"/>'
                + '</span>'
                + '<span class="pd-desc">'
                + '<p>[' + obj.cpnm + '] ' + obj.name + '</p>'
                + '<div class="pd-price">' + format_price + '원</div>'
                + '</span>'
                + '<div class="cart-btn-box">'
                + '<button id="cart_btn" data-idx="' + obj.idx + '">'
                + '<i class="fa-solid fa-cart-shopping"></i>'
                + '담기'
                + '</button>'
                + '</div>'
                + '</a>'
                + '</li>';
        });
        list_ref.append(str);
    };

    $(document).ready(function () {
        // 탭 초기화
        $(".tab-button").eq(0).addClass("on");
        $(".thum-list").eq(0).addClass("show");

        //ajax로 5개 카테고리 상품리스트 + 전체 리스트 출력 (4개씩 출력)
        $.each(ctg_arr, function (idx, item) {
            reqPdPromise(item).then(list => renderPdList(list, idx));
        });

        let random_ctg = Math.floor(Math.random() * ctg_arr.length); //카테고리 배열 중 한 개 값 선택
        reqPdPromise(ctg_arr[random_ctg]).then(list => renderArticleList(list)); //카테고리

        // 탭 클릭 함수
        $(".tab-list").click(function (e) {
            let data_id = e.target.dataset.a;
            //remove prev
            $(".tab-button").removeClass("on");
            $(".thum-list").removeClass("show");

            $(".tab-button").eq(data_id).addClass("on");
            $(".thum-list").eq(data_id).addClass("show");
        });

        //장바구니 담기 버튼
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
                    if (result == "DEL_OK1") alert("장바구니에 상품이 담겼습니다");
                    if (result == "DEL_OK2") alert("장바구니에 상품이 담겼습니다\n이미 담은 상품의 수량을 추가했습니다");
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        }

        //탭 상품 리스트 장바구니 담기 버튼
        $(".thum-list").on("click", ".fa-solid.fa-cart-shopping", function (e) {
            addCart(e, $(this));
        });

        // 매거진 부분 장바구니 담기 버튼
        $(".products-box").on("click", "#cart_btn", function (e) {
            addCart(e, $(this));
        });

        //slideshow
        var myIndex = 0;
        carousel();

        function carousel() {
            var i;
            var x = document.getElementsByClassName("mySlides");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            myIndex++;
            if (myIndex > x.length) {
                myIndex = 1
            }
            x[myIndex - 1].style.display = "block";
            setTimeout(carousel, 2000); // Change image every 2 seconds
        }
    }); // end of ready
</script>
</body>
</html>


