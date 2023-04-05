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
    <link rel="stylesheet" href="/css/summernote-lite.css" />
<%--    자꾸 이 css 탓에 navbar와 전체 ui가 깨진다--%>
<%--    <link rel="stylesheet"--%>
<%--        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"--%>
<%--    />--%>
    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/validateUser.css"/>
    <%--    경로에 warning이 뜨면 카멜케이스로 명명 수정한다. mypage(x) myPage(o). 어길시 css 404--%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="mypage-banner"></div>
<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebarSeller.jsp" %>
    <div class="mypage-content">
        <div class="page-header">
            <h2>브랜드 수정</h2>
        </div>

    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/script.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
<script>
    //summernote
    $(".summernote").summernote({
        height: 450,
        lang: "ko-KR",
        callbacks: {
            onImageUpload: function (files) {
                $(".summernote").summernote("editor.insertImage", "/jinvicky.png");
            },
        },
    });

    $("#test").click(function (e) {
        e.preventDefault();
        let summernoteContent = $(".summernote").summernote("code"); //썸머노트(설명)
        console.log("summernoteContent : " + summernoteContent);
    });
</script>
</body>
</html>
