<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>

    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/modifyBrnd.css"/>
    <link rel="stylesheet" href="/css/upload.css"/>

    <link rel="stylesheet" href="/css/summernote-lite.css"/>

    <%@ include file="/WEB-INF/views/include/script.jsp" %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="/summernote/summernote-lite.js"></script>
    <script src="/summernote/lang/summernote-ko-KR.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="mypage-banner"><img src="https://product-image.kurly.com/cdn-cgi/image/quality=85/banner/main/pc/img/5743dc11-54b5-4140-a574-d0424e6414eb.jpg"></div>
<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebarSeller.jsp" %>
    <div class="mypage-content">
        <div class="brnd-modify-page">
            <div class="modify-content">
                <div class="mod-header">브랜드 수정</div>
                <div class="mod-box">
                    <form
                            class="mod-brnd-form"
                            action="/seller/modify/brnd"
                            method="post"
                    >
                        <div class="center-padding">
                            <div class="input-line">
                                <div class="input-label">
                                    <label for="cpnm">브랜드명<span>*</span></label>
                                </div>
                                <div class="input-box">
                                    <div class="input">
                                        <input
                                                name="cpnm"
                                                id="cpnm"
                                                type="text"
                                                placeholder="브랜드명을 입력해주세요"
                                                value="${seller.cpnm}"
                                        />
                                    </div>
                                    <div class="error-msg cpnm">
                                    </div>
                                </div>
                                <div class="btn-space">
                                    <button id="cpnm_duplicate_chk">중복확인</button>
                                </div>
                            </div>

                            <div class="input-line">
                                <div class="input-label">
                                    <label for="editordata">브랜드 내용<span>*</span></label>
                                </div>
                                <div class="input-box">
                                    <textarea class="summernote" name="editordata" id="editordata"></textarea>
                                </div>
                                <div class="btn-space"></div>
                            </div>
                            <div class="input-line">
                                <div class="input-label">
                                    <label>브랜드 배너이미지</label>
                                </div>
                                <div class="input-box">
                                    <div class="input">
                                        <label class="upload-label" for="upload_bnr">브랜드 이미지 선택 <img
                                                src="/img/upload_dir.png"></label>
                                        <div class="upload-input bnr">
                                            <input type="file" name="upload_bnr" id="upload_bnr">
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-space">
                                    <button id="bnr_upload_btn">업로드</button>
                                </div>
                            </div>
                            <div class="upload-result bnr">
                                <ul>

                                </ul>
                            </div>
                            <div class="input-line">
                                <div class="input-label">
                                    <label>브랜드 프로필</label>
                                </div>
                                <div class="input-box">
                                    <div class="input">
                                        <label class="upload-label" for="upload_profile">프로필 이미지 선택 <img
                                                src="/img/upload_dir.png"></label>
                                        <div class="upload-input profile">
                                            <input type="file" name="upload_profile" id="upload_profile">
                                        </div>
                                    </div>
                                </div>
                                <div class="btn-space">
                                    <button id="profile_upload_btn">업로드</button>
                                </div>
                            </div>
                            <div class="upload-result profile">
                                <ul>

                                </ul>
                            </div>
                            <div class="section-line bottom"></div>
                            <div class="btn-container">
                                <button class="mod-confirm" id="brnd-cancel">취소하기</button>
                                <button class="mod-confirm" id="brnd_modify">수정하기</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script src="/js/upload/common.js"></script>
<script src="/js/member/common.js"></script>
<script src="/js/member/msg.js"></script>
<script src="/js/member/regEx.js"></script>
<script>
    //summernote 렌더링
    $(".summernote").summernote({
        height: 450,
        lang: "ko-KR",
    });

    $(".summernote").summernote("code", "${seller.brnd_cn}"); //브랜드 내용 붙이기
    $("#cpnm_duplicate_chk").attr("disabled", true); //기본으로 disabled (같은값)

    //file upload
    let clone_bnr = $(".upload-input.bnr").clone();
    let clone_profile = $(".upload-input.profile").clone();

    //.uploadResult ul의 참조를 얻어온다.
    let bnr_upload_list = $(".upload-result.bnr ul");
    var profile_upload_list = $(".upload-result.profile ul");

    //file upload
    $("#bnr_upload_btn").on("click", function (e) { //업로드 버튼을 눌렀을 때 이벤트를 연결한다.
        e.preventDefault();
        var formData = new FormData();
        var inputFile = $("input[name='upload_bnr']");

        if (inputFile[0].files.length < 1) { //파일 선택 안 한 경우
            alert(bnr_upload_empty);
            return false;
        }

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
        var inputFile = $("input[name='upload_profile']");

        if (inputFile[0].files.length < 1) { //파일 선택 안 한 경우
            alert(profile_upload_empty);
            return false;
        }

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

    //keyup
    $("#cpnm").keyup(function () { //브랜드명
        let cpnm = $("#cpnm").val();
        let err_ref = $(".error-msg.cpnm");
        cpnmErrMsg(cpnm, err_ref);

        //브랜드명이 입력값과 같으면 중복확인 disabled
        $("#cpnm_duplicate_chk").attr("disabled", (cpnm == "${seller.cpnm}") ? true : false);
    });

    $("#cpnm_duplicate_chk").click(function (e) {
        e.preventDefault();
        let cpnm_ref = $("#cpnm");

        if (!validateBrndNameAlert(cpnm_ref)) return false;

        $.ajax({
            url: '/seller/duplicate/cpnm',
            data: {cpnm: cpnm_ref.val()},
            type: 'POST',
            success: function (msg) {
                if (msg == "OK") {
                    alert(available_cpnm);
                    $("#cpnm_duplicate_chk").attr("disabled", true); //버튼 비활성화
                    cpnm_ref.attr("readonly", true); //인풋 비활성화
                } else {
                    alert(duplicate_cpnm);
                    cpnm_ref.focus();
                }
            },
            error: function (err) {
                alert(error_msg);
            }
        }); //$.ajax
    });

    //수정 취소 버튼
    $("#brnd-cancel").click(function (e) {
       e.preventDefault();
       window.location.href = "/seller/read/brnd";
    });

    //수정 버튼
    $("#brnd_modify").click(function (e) {
        e.preventDefault();
        let form = $(".mod-brnd-form"); //form ref

        let cpnm_ref = $("#cpnm");
        let cpnm_chk_btn = $("#cpnm_duplicate_chk");

        if (!validateBrndNameAlert(cpnm_ref)) return false;
        if (!chkBrndNameAlert(cpnm_ref, cpnm_chk_btn)) return false;

        //브랜드 설명
        let summernoteContent = $(".summernote").summernote("code"); //썸머노트(설명)
        if (summernoteContent == "") {
            alert(brnd_content_empty);
            return false;
        }

        let form_str = ""; //전송할 <input> 문자열
        form_str += "<input type='hidden' name='brnd_cn' value='" + summernoteContent + "'>";

        let bnr_path = $(".upload-result.bnr ul li").data("upload-path");
        let profile_path = $(".upload-result.profile ul li").data("upload-path");

        if (bnr_path === undefined) bnr_path = "${seller.brnd_bnr_upload_path}"; //''가 아니라 undefined
        if (profile_path === undefined) profile_path = "${seller.brnd_upload_path}"; //''가 아니라 undefined

        form_str += "<input type='hidden' name='brnd_bnr_upload_path' value=" + bnr_path + ">" +
            "<input type='hidden' name='brnd_upload_path' value=" + profile_path + ">";

        form.append(form_str);
        form.submit();
    });
</script>
</body>
</html>
