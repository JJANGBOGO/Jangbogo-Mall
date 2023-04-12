<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/upload.css" />

<%--    css import --%>
    <style>
        .upload-label {
            background: white;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h1>Upload with Ajax</h1>
<label class="upload-label" for="upload_bnr">브랜드 이미지 선택 <img src="/img/upload_dir.png"></label>
<div class="upload-input bnr">
    <input type="file" name="brnd_bnr_upload_path" id="upload_bnr">
</div>

<div class="upload-result bnr">
    <ul>

    </ul>
</div>

<button id="bnr_upload_btn">Upload</button>
<%--end of 1--%>

<label class="upload-label" for="upload_profile">브랜드 프로필 선택</label>
<div class="upload-input profile">
    <input type="file" name="brnd_upload_path" id="upload_profile">
</div>

<div class="upload-result profile">
    <ul>

    </ul>
</div>

<button id="profile_upload_btn">Upload</button>

<%--제이쿼리 스크립트를 추가한다.--%>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/js/upload/common.js"></script>
<script>
    $(document).ready(function () { //도큐먼트가 로드되었을

        let clone_bnr = $(".upload-input.bnr").clone();
        let clone_profile = $(".upload-input.profile").clone();

        //.uploadResult ul의 참조를 얻어온다.
        let bnr_upload_list = $(".upload-result.bnr ul");
        var profile_upload_list = $(".upload-result.profile ul");

        $("#bnr_upload_btn").on("click", function (e) { //업로드 버튼을 눌렀을 때 이벤트를 연결한다.
            e.preventDefault();
            var formData = new FormData();
            var inputFile = $("input[name='brnd_bnr_upload_path']");

            checkFileList(inputFile[0].files, formData);

            $.ajax({
                url: '/uploadAjaxAction',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                dataType: "json",
                success: function (result) {
                    bnr_upload_list.append(showUploadedFile(result));
                    $(".upload-input.bnr").html(clone_bnr.html());
                }
            });
        });

        //uploadBtn2
        $("#profile_upload_btn").on("click", function (e) {
            e.preventDefault();
            var formData = new FormData();
            var inputFile = $("input[name='brnd_upload_path']");

            checkFileList(inputFile[0].files, formData);

            $.ajax({
                url: '/uploadAjaxAction',
                processData: false,
                contentType: false,
                data: formData,
                type: 'POST',
                dataType: "json",
                success: function (result) {
                    profile_upload_list.append(showUploadedFile(result));
                    $(".upload-input.profile").html(clone_profile.html()); //파일 초기화
                }
            });
        });
    });
</script>
</body>
</html>
