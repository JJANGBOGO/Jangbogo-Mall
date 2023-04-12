var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
var maxSize = 5242880; //5MB

function checkExtension(fileName, fileSize) {
    if (fileSize >= maxSize) {
        alert("파일 사이즈 초과");
        return false;
    }

    if (regex.test(fileName)) {
        alert("해당 종류의 파일은 업로드 할 수 없습니다.");
        return false;
    }
    return true;
}

//checkExtension() for 반복
function checkFileList(files, formData) {
    for (let i = 0; i < files.length; i++) {
        //위에서 만든 확장자, 사이즈 체크 메서드를 초과한다.
        if (!checkExtension(files[i].name, files[i].size)) {
            return false;
        }
        formData.append("uploadFile", files[i]);
    }
}

function showUploadedFile(uploadResultArr) { //업로드 리스트 str 반환
    let str = "";

    $(uploadResultArr).each(function (i, obj) {
        if (!obj.image) {
            //fileCallPath 선언한다.
            var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);

            //attach.png 아직 없음
            str += "<li><div>" + "<img src='/resources/img/attach.png'>" +
                "<span data-file=\'" + fileCallPath + "\' data-type='file'>X</span>" + "</div></li>";

        } else {
            var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

            var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
            originPath = originPath.replace(new RegExp(/\\/g), "/");

            str += "<li>" + "<img src='display?fileName=" + fileCallPath + "'>" +
                "<span data-file=\'" + fileCallPath + "\' data-type='image'><img src='/img/cancel_btn.png'></span></li>";
        }
    });
    return str;
}

//삭제, span태그인 X를 클릭했을 떄 동작할 함수를 연결
$(".upload-result").on("click", "span", function (e) {
    var targetFile = $(this).data("file");
    var type = $(this).data("type");

    //ajax 성공시 브라우저에서도 해당 li태그를 지워야 한다.
    var targetLi = $(this).closest("li");

    $.ajax({
        url: '/deleteFile',
        data: {fileName: targetFile, type: type},
        dataType: 'text',
        type: 'POST',
        success: function (result) {
            alert(result + "result");

            //controller에서 삭제에 성공하면 targetLi를 지운다.
            targetLi.remove();
        }
    }); //$.ajax
});

