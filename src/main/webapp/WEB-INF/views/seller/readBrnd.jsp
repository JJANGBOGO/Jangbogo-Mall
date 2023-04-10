<%--
  Created by IntelliJ IDEA.
  User: namgungjin
  Date: 2023/04/05
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/readBrnd.css"/>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="mypage-banner"></div>
<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebarSeller.jsp" %>
    <div class="mypage-content">
        <div class="brnd-content">
            <div class="banner">
                <img
                        src="https://product-image.kurly.com/category/banner/pc/ee9e633f-1e0f-49b9-b9e0-9888942d4b47.jpg"
                        alt="배너 이미지"
                        class="css-1217fb7 e13967gz0"
                />
            </div>
            <div class="brnd-profile">
                <div class="profile-circle">
                    <img
                            data-v-7bfb2c04=""
                            src="https://image.idus.com/image/files/3017ad1c2263419fba7d9b276abceb7f.jpg"
                            alt="artist thumbnail"
                            class="artist-thumbnail"
                    />
                </div>
                <div>
                    <div class="brnd-title">쿼카는 시리얼이 좋은뎅</div>
                    <div class="follower-cnt">
                        <p>팔로워</p>
                        <p class="cnt-num">69</p>
                    </div>
                </div>
            </div>
            <div class="profile-tab">프로필 내용</div>
            <div class="brnd-intro">
                <p>
                    쿼카는 옛날부터 시리얼이 좋더라구~ 그렇지만 너희들도 특별히 줄게!
                </p>
                <p>나는 특별히 그릭요거트에 그라놀라가 좋더라~ 너희도 그렇지?</p>
            </div>
            <button class="modify-brnd">내 브랜드 수정하기</button>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script>
    $(".modify-brnd").click(function () {
        window.location.href = "/seller/modify/brnd";
    })
</script>
</body>
</html>
