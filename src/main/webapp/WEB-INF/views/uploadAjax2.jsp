<%--
  Created by IntelliJ IDEA.
  User: namgungjin
  Date: 2023/02/03
  Time: 11:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/upload.css">
</head>
<body>
<h1>Upload with Ajax</h1>

<div class="uploadDiv">
    <input type="file" name="uploadFile">
</div>

<div class="uploadResult profile">
    <ul>

    </ul>
</div>

<button id="uploadBtn">Upload</button>
<%--end of 1--%>


<div class="uploadDiv2">
    <input type="file" name="uploadFile2">
</div>

<div class="uploadResult bnr">
    <ul>

    </ul>
</div>

<button id="uploadBtn2">Upload</button>

<%--제이쿼리 스크립트를 추가한다.--%>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/js/upload/common.js"></script>
<script>
    $(document).ready(function () { //도큐먼트가 로드되었을

        var cloneObj = $(".uploadDiv").clone();
        var cloneObj2 = $(".uploadDiv2").clone();

        //.uploadResult ul의 참조를 얻어온다.
        var uploadResult = $(".uploadResult.profile ul");
        let uploadResult2 = $(".uploadResult.bnr ul");

        //

        $("#uploadBtn").on("click", function (e) { //업로드 버튼을 눌렀을 때 이벤트를 연결한다.
            e.preventDefault();
            var formData = new FormData();
            var inputFile = $("input[name='uploadFile']");

            var files = inputFile[0].files;

            for (var i = 0; i < files.length; i++) {
                //위에서 만든 확장자, 사이즈 체크 메서드를 초과한다.
                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }
                formData.append("uploadFile", files[i]);
            }

            $.ajax({
                //컨트롤러와 동일한 경로인지 확인한다.
                url: '/uploadAjaxAction',
                processData: false,
                contentType: false,
                //전송할 데이터와 타입이 맞는지 확인한다. 전송은 post지.
                data: formData,
                type: 'POST',
                dataType: "json",
                success: function (result) {
                    console.log("결괏값:: ", result);
                    uploadResult.append(showUploadedFile(result));
                    $(".uploadDiv").html(cloneObj.html());
                }
            });
        });

        //uploadBtn2
        $("#uploadBtn2").on("click", function (e) { //업로드 버튼을 눌렀을 때 이벤트를 연결한다.
            var formData = new FormData();
            var inputFile = $("input[name='uploadFile2']");

            var files = inputFile[0].files;
            console.log("파일들:: ", files);

            for (var i = 0; i < files.length; i++) {
                //위에서 만든 확장자, 사이즈 체크 메서드를 초과한다.
                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }
                formData.append("uploadFile", files[i]);
            }

            $.ajax({
                //컨트롤러와 동일한 경로인지 확인한다.
                url: '/uploadAjaxAction',
                processData: false,
                contentType: false,
                //전송할 데이터와 타입이 맞는지 확인한다. 전송은 post지.
                data: formData,
                type: 'POST',
                dataType: "json",
                success: function (result) {
                    console.log("결괏값:: ", result);
                    //업로드할 파일들을 추가하는 함수를 호출한다.
                    uploadResult2.append(showUploadedFile(result));
                    $(".uploadDiv2").html(cloneObj2.html()); //파일 초기화
                }
            });
        });
    });
</script>
</body>
</html>
