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
    <img class="mySlides"
         src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/edc9e6db-ee42-47ab-9157-552fce0b3fbc.jpg"
    />
    <img class="mySlides"
         src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/9cef1d54-72cc-4f02-b63e-495170a02d5d.jpg"
    />
    <img class="mySlides"
         src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/edc9e6db-ee42-47ab-9157-552fce0b3fbc.jpg"
    />
    <img class="mySlides"
         src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/9cef1d54-72cc-4f02-b63e-495170a02d5d.jpg"
    />
    <img class="mySlides"
         src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/edc9e6db-ee42-47ab-9157-552fce0b3fbc.jpg"
    />
    <img class="mySlides"
         src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/9cef1d54-72cc-4f02-b63e-495170a02d5d.jpg"
    />
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
        <ul class="thum-list" data-id="00"></ul>
        <ul class="thum-list" data-id="01"></ul>
        <ul class="thum-list" data-id="02"></ul>
        <ul class="thum-list" data-id="03"></ul>
        <ul class="thum-list" data-id="04"></ul>
        <ul class="thum-list" data-id="05"></ul>
    </div>
</div>
<a class="see-pd-all" href="">전체 보기&gt;</a>
<div class="magazine">
    <a href="" class="collection-link">
        <div class="img-box">
            <img
                    src="https://product-image.kurly.com/cdn-cgi/image/quality=85,width=1230/main/random-collection/article/pc/img/31b222c9-5995-4a1f-af82-06346c4f186d.png"
                    alt=""
                    class="main-img"
            />
        </div>
        <div class="mg-content">
            <strong>컬리 추천 꼬치 대백과</strong>
            <p>
                봄향기 나는 3월의 시작. 여행이나 캠핑을 준비한다면 주목하세요.
                저녁식사를 빛내줄 컬리의 꼬치를 모두 모아봤어요. 남녀노소 좋아하는
                닭꼬치부터 자꾸만 당기는 마시멜로까지. 간단한 맥주 안주로도 바비큐
                안주로도 제격입니다. 다양한 컬리 추천 꼬치들과 함께 멋진 저녁 시간을
                완성하세요.
            </p>
        </div>
    </a>
    <div class="col-products">
        <ul class="products-box">
            <li>
                <a href="">
              <span class="pd-img">
                <img
                        src="https://img-cf.kurly.com/cdn-cgi/image/quality=85,width=144/shop/data/goods/1648209013487l0.jpeg"
                        alt=""
                />
              </span>
                    <span class="pd-desc">
                <p>[더플랜]왕의 안주</p>
                <div class="pd-price">10,900원</div>
              </span>
                    <div class="cart-btn-box">
                        <button>
                            <i class="fa-solid fa-cart-shopping"></i>
                            담기
                        </button>
                    </div>
                </a>
            </li>
            <li>
                <a href="">
              <span class="pd-img">
                <img
                        src="https://img-cf.kurly.com/cdn-cgi/image/quality=85,width=144/shop/data/goods/1648209013487l0.jpeg"
                        alt=""
                />
              </span>
                    <span class="pd-desc">
                <p>[더플랜]왕의 안주</p>
                <div class="pd-price">10,900원</div>
              </span>
                    <div class="cart-btn-box">
                        <button>
                            <i class="fa-solid fa-cart-shopping"></i>
                            담기
                        </button>
                    </div>
                </a>
            </li>
            <li>
                <a href="">
              <span class="pd-img">
                <img
                        src="https://img-cf.kurly.com/cdn-cgi/image/quality=85,width=144/shop/data/goods/1648209013487l0.jpeg"
                        alt=""
                />
              </span>
                    <span class="pd-desc">
                <p>[더플랜]왕의 안주</p>
                <div class="pd-price">10,900원</div>
              </span>
                    <div class="cart-btn-box">
                        <button>
                            <i class="fa-solid fa-cart-shopping"></i>
                            담기
                        </button>
                    </div>
                </a>
            </li>
            <li>
                <a href="">
              <span class="pd-img">
                <img
                        src="https://img-cf.kurly.com/cdn-cgi/image/quality=85,width=144/shop/data/goods/1648209013487l0.jpeg"
                        alt=""
                />
              </span>
                    <span class="pd-desc">
                <p>[더플랜]왕의 안주</p>
                <div class="pd-price">10,900원</div>
              </span>
                    <div class="cart-btn-box">
                        <button>
                            <i class="fa-solid fa-cart-shopping"></i>
                            담기
                        </button>
                    </div>
                </a>
            </li>
            <a class="see-pd-all" href="">전체 보기&gt;</a>
        </ul>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="/js/member/msg.js"></script>
<script>
    let msg = "${msg}";
    if (msg == "EXCEPTION_ERR") alert("예상치 못한 오류가 발생했습니다. 불편을 끼쳐드려 죄송합니다.");
</script>
<script>
    //상품리스트를 html로 구현
    let renderPdList = (list, tab_id) => {
        let list_ref = $(".thum-list").eq(tab_id); //0,1,2,3,4,5
        let str = "";
        if (tab_id === 0) list.sort(()=> Math.random() - 0.5); //전체 탭인 경우 list 랜덤돌리기
        list.forEach((obj, i) => {
            if (i > 3) return; //카테고리당 4개만 보여줌
            str += '<li>'
                + '<a class="img-box">'
                + '<img src="' + obj.upload_path + '"alt="product-img" />'
                + '<div class="cart-btn"><i class="fa-solid fa-cart-shopping"></i></div>'
                + '</a>'
                + '<div class="thum-desc">'
                + '<a class="title"><h3>' + obj.name + '</h3></a>'
                + '<div class="price">' + obj.prc + '원</div>'
                + '<div class="review-cnt">리뷰 수: ' + obj.review_cnt + '</div>' //아직 dto에 추가 안함
                + '</div>'
                + '</li>';
        });
        list_ref.append(str);
    }
    //상품리스트 호출 ajax, create, append 상품 리스트
    let reqPdList = (cate_idx, tab_id) => {
        $.ajax({
            url: '/list/pd',
            data: {category: cate_idx},
            type: 'GET',
            success: function (list) {
                renderPdList(list, tab_id);
            },
            error: function (err) {
                alert(error_msg);
            }
        }); //$.ajax
    };

    $(document).ready(function () {
        // 탭 초기화
        $(".tab-button").eq(0).addClass("on");
        $(".thum-list").eq(0).addClass("show");

        //ajax로 5개 카테고리 상품리스트 + 전체 리스트 출력 (4개씩 출력)
        reqPdList("00", 0); //전체, tab_id
        reqPdList("01", 1); //과일, tab_id
        reqPdList("02", 2); //채소, tab_id
        reqPdList("03", 3); //생선, tab_id
        reqPdList("04", 4); //육류, tab_id
        reqPdList("06", 5); //간식과 디저트, tab_id

        // 탭 클릭 함수
        $(".tab-list").click(function (e) {
            let data_id = e.target.dataset.a;
            //remove prev
            $(".tab-button").removeClass("on");
            $(".thum-list").removeClass("show");

            $(".tab-button").eq(data_id).addClass("on");
            $(".thum-list").eq(data_id).addClass("show");
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
    });
</script>
</body>
</html>


