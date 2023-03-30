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
    <style>
        .uploadResult {
            width: 100%;
            background-color: gray;
        }

        .uploadResult ul {
            display: flex;
            flex-flow: row;
            justify-content: center;
            align-items: center;
        }

        .uploadResult ul li {
            list-style: none;
            padding: 10px;
        }

        .uploadResult ul li img {
            width: 20px;
        }

        .uploadResult ul li span {
            color: white;
        }

        .bigPictureWrapper {
            position: absolute;
            display: none;
            justify-content: center;
            align-items: center;
            top: 0%;
            width: 100%;
            height: 100%;
            background-color: gray;
            z-index: 100;
            background: rgba(255, 255, 255, 0.5);
        }

        .bigPicture {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .bigPicture img {
            width: 600px;
        }
    </style>
</head>
<body>
<h1>Upload with Ajax</h1>

<div class="uploadDiv">
    <input type="file" name="uploadFile" multiple>
</div>

<%--.uploadResult를 작성한다. 자식으로 ul을 가진다. --%>
<div class="uploadResult">
    <ul>

    </ul>
</div>

<div class="bigPictureWrapper">
    <%--    지니야 제발 이름좀 제대로 복붙을 하든지 확인을 좀 해라.ㅏ--%>
    <div class="bigPicture">

    </div>
</div>

<button id="uploadBtn">Upload</button>

<%--제이쿼리 스크립트를 추가한다.--%>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
    <%--    최상단에 위치해야 reference error가 안뜬다.--%>

    function showImage(fileCallPath) {
        // alert(fileCallPath);

        $(".bigPictureWrapper").css("display", "flex").show();
        $(".bigPicture")
            .html("<img src='/display?fileName=" + encodeURI(fileCallPath) + "'>")
            .animate({width: '100%', height: '100%'}, 1000); //애니메이션 효과를 추가한다.
    }

    $(document).ready(function () { //도큐먼트가 로드되었을


        var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
        var maxSize = 5242880; //5MB

        function checkExtension(fileName, fileSize) {
            //1. fileSize가 최대를 넘는 지 확인한다.
            if (fileSize >= maxSize) {
                alert("파일 사이즈 초과");
                return false;
            }

            //파일 종류가 정규식을 통과하는 지 확인한다.
            if (regex.test(fileName)) {
                alert("해당 종류의 파일은 업로드 할 수 없습니다.");
                return false;
            }
            return true;
        }

        //.uploadDiv를 클론한 객체를 생성한다.
        var cloneObj = $(".uploadDiv").clone();

        //.uploadResult ul의 참조를 얻어온다.
        var uploadResult = $(".uploadResult ul");


        //업로드한 파일들을 <li>태그로 감싸서 추가하는 foreach문을 돌린다. => showUploadFile();
        function showUploadedFile(uploadResultArr) {
            var str = "";

            $(uploadResultArr).each(function (i, obj) {
                if (!obj.image) {
                    //fileCallPath 선언한다.
                    var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);

                    var fileLink = fileCallPath.replace(new RegExp((/\\/g), "/"));

                    //왜 resources에 있는 걸 못찾는 지 나도 모르겠다.....
                    // str += "<li><a href='/download?fileName="+ fileCallPath + "'>" + "<img src='/resources/img/attach.png'>" + obj.fileName + "</a></li>";

                    str += "<li><div><a href='/download?fileName=" + fileCallPath + "'>" +
                        "<img src='/resources/img/attach.png'>" + obj.fileName + "</a>" +
                        "<span data-file=\'" + fileCallPath + "\' data-type='file'>X</span>" + "</div></li>";

                } else {
                    var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

                    var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
                    originPath = originPath.replace(new RegExp(/\\/g), "/");

                    // str += "<li><a href=\"javascript:showImage(\'"+originPath +"\')\"><img src='/display?fileName="+fileCallPath + "'></a></li>";
                    str += "<li><a href=\"javascript:showImage(\'" + originPath + "\')\">" +
                        "<img src='display?fileName=" + fileCallPath + "'></a>" +
                        "<span data-file=\'" + fileCallPath + "\' data-type='image'>X</span></li>";
                }
            });
            uploadResult.append(str);
        }





        $("#uploadBtn").on("click", function (e) { //업로드 버튼을 눌렀을 때 이벤트를 연결한다.
            var formData = new FormData();
            var inputFile = $("input[name='uploadFile']");

            var files = inputFile[0].files;
            console.log("파일들:: ", files);

            for (var i = 0; i < files.length; i++) {
                //위에서 만든 확장자, 사이즈 체크 메서드를 초과한다.
                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }

                //formData에 내가 선택한 파일들을 추가한다.
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
                    showUploadedFile(result);

                    //html 뭔지 알아보자.
                    $(".uploadDiv").html(cloneObj.html());
                }
            });
        });

        //원본 이미지 div 화면을 클릭 시 다시 사라지게 하는 이벤트 처리.
        $(".bigPictureWrapper").on("click", function (e) {
            $(".bigPicture").animate({width: '0%', height: '0%'}, 100);
            setTimeout(() => {
                $(this).hide();
            }, 1000);
        });

        //span태그인 X를 클릭했을 떄 동작할 함수를 연결
        $(".uploadResult").on("click", "span", function(e) {
            var targetFile = $(this).data("file");
            var type = $(this).data("type");
            console.log(targetFile, "$$$$");

            //ajax 성공시 브라우저에서도 해당 li태그를 지워야 한다.
            var targetLi = $(this).closest("li");

            $.ajax({
                url: '/deleteFile',
                data: {fileName: targetFile, type: type},
                dataType: 'text',
                type: 'POST',
                success: function(result) {
                    alert(result+ "result");

                    //controller에서 삭제에 성공하면 targetLi를 지운다.
                    targetLi.remove();
                }
            }); //$.ajax
        });

    });
</script>
</body>
</html>
