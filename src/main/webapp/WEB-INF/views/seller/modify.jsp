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
    <title>Title</title>
    <link rel="stylesheet" href="/css/summernote-lite.css" />
    <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
</head>
<body>

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
