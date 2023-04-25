<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/readBrnd.css?v=2"/>
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
                        src="/display?fileName=${seller.brnd_bnr_upload_path}"
                        alt="banner"
                />
            </div>
            <div class="brnd-profile">
                <div class="profile-circle">
                    <img
                            src="/display?fileName=${seller.brnd_upload_path}"
                            alt="profile"
                    />
                </div>
                <div>
                    <div class="brnd-title">${seller.cpnm}</div>
                    <div class="desc-flex">
                        <p>팔로워</p>
                        <p class="ctent">${seller.subs_cnt}</p>
                    </div>
                    <div class="desc-flex">
                        <p>대표 연락처</p>
                        <p class="ctent">${seller.repr_telno}</p>
                    </div>
                </div>
            </div>
            <div class="profile-tab">프로필 내용</div>
            <div class="brnd-intro">
                ${seller.brnd_cn}
            </div>
            <button class="modify-brnd">내 브랜드 수정하기</button>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script>
    let msg = "${msg}";
    if (msg === "MODIFY_BRND_OK") alert("브랜드 수정에 성공했습니다");
    if (msg === "EXCEPTION_ERR") alert("오류가 발생했습니다 다시 시도해 주세요");

    $(document).ready(function () {
        $(".modify-brnd").click(function () {
            window.location.href = "/seller/modify/brnd";
        });
    });
</script>
</body>
</html>