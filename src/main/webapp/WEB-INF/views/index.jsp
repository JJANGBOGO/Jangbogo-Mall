<%--
  Created by IntelliJ IDEA.
  User: namgungjin
  Date: 2023/02/05
  Time: 11:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page session="true" %>

<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/main.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<%--지우팀장님 슬라이드쇼--%>
<div class="mySlides_container">
    <img class="mySlides"
         src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/edc9e6db-ee42-47ab-9157-552fce0b3fbc.jpg"/>
    <img class="mySlides"
         src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/9cef1d54-72cc-4f02-b63e-495170a02d5d.jpg"/>
    <img class="mySlides"
         src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/edc9e6db-ee42-47ab-9157-552fce0b3fbc.jpg"/>
    <img class="mySlides"
         src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/9cef1d54-72cc-4f02-b63e-495170a02d5d.jpg"/>
    <img class="mySlides"
         src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/edc9e6db-ee42-47ab-9157-552fce0b3fbc.jpg"/>
    <img class="mySlides"
         src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/9cef1d54-72cc-4f02-b63e-495170a02d5d.jpg"/>
</div>
<%--남궁진 탭--%>
<div class="category-header">
    <h2>놓치면 후회하는 특가 상품</h2>
</div>
<div class="category-section">
    <ul class="tab-list">
        <li>
            <button class="tab-button" data-a="0">전체보기</button>
        </li>
        <li>
            <button class="tab-button" data-a="1">1</button>
        </li>
        <li>
            <button class="tab-button" data-a="2">2</button>
        </li>
        <li>
            <button class="tab-button" data-a="3">3</button>
        </li>
        <li>
            <button class="tab-button" data-a="4">4</button>
        </li>
        <li>
            <button class="tab-button" data-a="5">5</button>
        </li>
    </ul>
    <div class="tab-content">
        <!-- 1번째 탭 -->
        <ul class="thum-list">
            <li>
                <a class="img-box">
                    <img
                            src="https://sitem.ssgcdn.com/45/50/86/item/1000492865045_i1_290.jpg"
                            alt=""
                    />
                    <div class="cart-btn">
                        <i></i>
                    </div>
                </a>
                <div class="thum-desc">
                    <a class="title">
                        <h3>스타벅스 커피 전품목 세일</h3>
                    </a>
                    <div class="price">5000원~</div>
                    <div class="review-cnt">후기 999+</div>
                    <div class="point">적립금 130원</div>
                </div>
            </li>
            <li>
                <a class="img-box">
                    <img
                            src="https://sitem.ssgcdn.com/45/50/86/item/1000492865045_i1_290.jpg"
                            alt=""
                    />
                    <div class="cart-btn">
                        <i></i>
                    </div>
                </a>
                <div class="thum-desc">
                    <a class="title">
                        <h3>스타벅스 커피 전품목 세일</h3>
                    </a>
                    <div class="price">5000원~</div>
                    <div class="review-cnt">후기 999+</div>
                    <div class="point">적립금 130원</div>
                </div>
            </li>
            <li>
                <a class="img-box">
                    <img
                            src="https://sitem.ssgcdn.com/45/50/86/item/1000492865045_i1_290.jpg"
                            alt=""
                    />
                    <div class="cart-btn">
                        <i></i>
                    </div>
                </a>
                <div class="thum-desc">
                    <a class="title">
                        <h3>스타벅스 커피 전품목 세일</h3>
                    </a>
                    <div class="price">5000원~</div>
                    <div class="review-cnt">후기 999+</div>
                    <div class="point">적립금 130원</div>
                </div>
            </li>
            <li>
                <a class="img-box">
                    <img
                            src="https://sitem.ssgcdn.com/45/50/86/item/1000492865045_i1_290.jpg"
                            alt=""
                    />
                    <div class="cart-btn">
                        <i></i>
                    </div>
                </a>
                <div class="thum-desc">
                    <a class="title">
                        <h3>스타벅스 커피 전품목 세일</h3>
                    </a>
                    <div class="price">5000원~</div>
                    <div class="review-cnt">후기 999+</div>
                    <div class="point">적립금 130원</div>
                </div>
            </li>
        </ul>

        <!-- 2번째 탭 -->
        <ul class="thum-list">
            <li>
                <a class="img-box">
                    <img
                            src="//sitem.ssgcdn.com/30/30/81/item/1000420813030_i1_290.jpg"
                            alt=""
                    />
                    <div class="cart-btn">
                        <i></i>
                    </div>
                </a>
                <div class="thum-desc">
                    <a class="title">
                        <h3>스타벅스 커피 전품목 세일</h3>
                    </a>
                    <div class="price">5000원~</div>
                    <div class="review-cnt">후기 999+</div>
                    <div class="point">적립금 130원</div>
                </div>
            </li>
            <li>
                <a class="img-box">
                    <img
                            src="//sitem.ssgcdn.com/30/30/81/item/1000420813030_i1_290.jpg"
                            alt=""
                    />
                    <div class="cart-btn">
                        <i></i>
                    </div>
                </a>
                <div class="thum-desc">
                    <a class="title">
                        <h3>스타벅스 커피 전품목 세일</h3>
                    </a>
                    <div class="price">5000원~</div>
                    <div class="review-cnt">후기 999+</div>
                    <div class="point">적립금 130원</div>
                </div>
            </li>
            <li>
                <a class="img-box">
                    <img
                            src="//sitem.ssgcdn.com/30/30/81/item/1000420813030_i1_290.jpg"
                            alt=""
                    />
                    <div class="cart-btn">
                        <i></i>
                    </div>
                </a>
                <div class="thum-desc">
                    <a class="title">
                        <h3>스타벅스 커피 전품목 세일</h3>
                    </a>
                    <div class="price">5000원~</div>
                    <div class="review-cnt">후기 999+</div>
                    <div class="point">적립금 130원</div>
                </div>
            </li>
            <li>
                <a class="img-box">
                    <img
                            src="//sitem.ssgcdn.com/30/30/81/item/1000420813030_i1_290.jpg"
                            alt=""
                    />
                    <div class="cart-btn">
                        <i></i>
                    </div>
                </a>
                <div class="thum-desc">
                    <a class="title">
                        <h3>스타벅스 커피 전품목 세일</h3>
                    </a>
                    <div class="price">5000원~</div>
                    <div class="review-cnt">후기 999+</div>
                    <div class="point">적립금 130원</div>
                </div>
            </li>
        </ul>

        <!-- 3 -->
        <ul class="thum-list">
            <li>
                <a class="img-box">
                    <img
                            src="//sitem.ssgcdn.com/44/97/53/item/1000043539744_i1_290.jpg"
                            alt=""
                    />
                    <div class="cart-btn">
                        <i></i>
                    </div>
                </a>
                <div class="thum-desc">
                    <a class="title">
                        <h3>스타벅스 커피 전품목 세일</h3>
                    </a>
                    <div class="price">5000원~</div>
                    <div class="review-cnt">후기 999+</div>
                    <div class="point">적립금 130원</div>
                </div>
            </li>
        </ul>

        <!-- 4 -->
        <ul class="thum-list">
            <li>
                <a class="img-box">
                    <img
                            src="//sitem.ssgcdn.com/24/61/03/item/0000000036124_i1_290.jpg"
                            alt=""
                    />
                    <div class="cart-btn">
                        <i></i>
                    </div>
                </a>
                <div class="thum-desc">
                    <a class="title">
                        <h3>스타벅스 커피 전품목 세일</h3>
                    </a>
                    <div class="price">5000원~</div>
                    <div class="review-cnt">후기 999+</div>
                    <div class="point">적립금 130원</div>
                </div>
            </li>
        </ul>
    </div>
</div>
<a class="see-pd-all" href="">전체 보기 &gt;</a>
<!-- magazine -->
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
            <a class="see-pd-all" href="">전체 보기 &gt;</a>
        </ul>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script>
    let msg ="${msg}";
    if (msg == "EXCEPTION_ERR") alert("예상치 못한 오류가 발생했습니다. 불편을 끼쳐드려 죄송합니다.");
</script>
<script>
    $(document).ready(function () {
        // 처음에는 맨 첫번째 탭을 보여준다.
        $(".tab-button").eq(0).addClass("on");
        $(".thum-list").eq(0).addClass("show");

        $(".tab-list").click(function (e) {
            let data_id = e.target.dataset.a;
            // let data_id = $(e.target.dataset.a); 하지 말자~

            //remove prev
            $(".tab-button").removeClass("on");
            $(".thum-list").removeClass("show");

            $(".tab-button").eq(data_id).addClass("on");
            $(".thum-list").eq(data_id).addClass("show");
        });

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


