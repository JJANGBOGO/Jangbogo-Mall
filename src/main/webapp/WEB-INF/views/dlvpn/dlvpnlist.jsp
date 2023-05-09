<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/validateUser.css"/>
    <%--    경로에 warning이 뜨면 카멜케이스로 명명 수정한다. mypage(x) myPage(o). 어길시 css 404--%>


</head>
<body>

<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<link rel="stylesheet" href="<c:url value='/css/dlvpnlist.css'/>">

<div class="mypage-banner"></div>
<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
    <div class="mypage-content">

        <div>
            <div class="dlvpn-top">
                <div class="dlvpn-notc">
                    <span class="dlvpn-notc2">배송지 관리</span>
                    <span class="dlvpn-notc3">배송지에 따라 상품정보 및 배송유형이 달라질 수 있습니다.</span>
                </div>
                <div class="dlvpn-insert">
                    <button class="insertAddr">+ 새 배송지 추가</button>
                </div>
            </div>
            <div class="dlvpn-column">
                <div class="dlvpn-choice">선택</div>
                <div class="dlvpn-address">주소</div>
                <div class="dlvpn-name">받으실 분</div>
                <div class="dlvpn-number">연락처</div>
<%--                <div class="dlvpn-type">배송유형</div>--%>
                <div class="dlvpn-change">수정</div>
            </div>
            <div class="dlvpnList">

            </div>
            <div class="dlvpn-notice">

            </div>

        </div>

    </div>
</div>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<%--다음 카카오 주소 api--%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


    // 배송지 추가(버튼) 클릭 시 파업창 오픈(카카오 api)
    $(".insertAddr").click(function () {
        KaKao_api();
    });

    // 배송지 수정(버튼) 클릭 시 파업창 오픈
    $('.dlvpnList').on("click", '.update-btn', function (e) {
        let idx = $(this).parent().parent().parent('li').attr('data-idx');
        let link = '<c:url value="/mypage/address/updatePage?idx='+idx+'"/>'
        popUp(link);
    });


    // 배송지 목록 조회
    let showList = function () {
        $.ajax({
            type: 'GET',       // 요청 메서드 // 배송지 목록 가저오기
            url: '/mypage/address/lists',  // 요청 URI
            // headers : { "content-type": "application/json"}, // 요청 헤더
            // dataType : 'text', // 전송받을 데이터의 타입 / 생략하면 기본이 JSON 이다
            // data : JSON.stringify(person),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
            success: function (result) {
                $(".dlvpnList").html(listToHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
                if(result.length==0){
                    $(".dlvpn-notice").html(nolistToHtml());
                }
            },
            error: function () {
                alert("error1")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    }

    // main()
    $(document).ready(function () {
        showList();

        // 배송지 선택 상태 변경
        $('.dlvpnList').on("click", '.checkbox', function () {
            let idx = $(this).parent().parent().parent().parent().attr('data-idx');
            $.ajax({
                type: 'PATCH',       // 요청 메서드 // 배송지 선택 상태 변경
                url: '/mypage/address/state/' + idx,  // 요청 URI
                success: function (result) {
                    alert("배송지 선택이 완료되었습니다")
                    showList();    // 서버로부터 응답이 도착하면 호출될 함수
                },
                error: function () {
                    alert("error2")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        })
    })

    let listToHtml = function (dlvpns) {
        let tmp = '<ul>';

        dlvpns.forEach(function (dlvpn) {
            tmp += '<li data-idx=' + dlvpn.idx + '>'
            tmp += '<div class="list">'
            if (dlvpn.state_cd == 1) {
                tmp += '<div class="list-checkbox"><label><input class="checkbox" type="checkbox" checked></label></div>'
            } else {
                tmp += '<div class="list-checkbox"><label><input class="checkbox" type="checkbox"></label></div>'
            }
            if (dlvpn.is_default_yn == 'Y') {
                tmp += '<div class="list-address"><div><div class="base">기본 배송지</div>' + dlvpn.addr_base + ' ' + dlvpn.addr_dtl + '</div></div>'
            } else {
                tmp += '<div class="list-address"><div></div>' + dlvpn.addr_base + ' ' + dlvpn.addr_dtl + '</div>'
            }
            tmp += '<div class="list-name">' + dlvpn.rcpr_nm + '</div>'
            tmp += '<div class="list-number">' + formatMpnoWithHyphen(dlvpn.rcpr_mobl_no) + '</div>'
            // tmp += '<div class="list-type"><div><span class="dlvpn-span-type">샛별배송</span></div></div>'
            tmp += '<div class="list-change"><button class="update-btn"><svg width="24" height="24" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="evenodd"><path fill="none" d="M0 0h24v24H0z"></path><path d="m13.83 5.777 4.393 4.393-10.58 10.58H3.25v-4.394l10.58-10.58zm3.204-2.527c.418 0 .837.16 1.157.48l2.08 2.08a1.63 1.63 0 0 1 0 2.314l-2.157 2.156-4.394-4.394 2.157-2.156c.32-.32.738-.48 1.157-.48z" stroke="#ccc" stroke-width="1.5"></path></g></svg></button></div>'
            tmp += '</div>'
            tmp += '</li>'
        })
        return tmp + '</ul>';
    }

    let nolistToHtml = function (){
        let tmp = '';

        tmp += '<div>'
        tmp += '<svg width="0" height="60" viewBox="0 0 68 68">'
        tmp += '<img src="https://cdn-icons-png.flaticon.com/512/879/879766.png" width="100px" height="100px">'
        // tmp += '<path class="heartpath" stroke="#e2e2e2" d="M57.025 14.975c-5.3-5.3-13.889-5.3-19.186 0L34 18.812l-3.837-3.837c-5.3-5.3-13.89-5.3-19.19 0-5.296 5.297-5.296 13.886 0 19.186l3.838 3.837 18.482 18.485a1 1 0 0 0 1.414 0s0 0 0 0l18.482-18.485h0l3.837-3.837c5.3-5.3 5.3-13.89 0-19.186z"></path>'
        tmp += '</svg>'
        tmp += '</div>'
        tmp += '<strong class="strong-heart">배송지를 추가해주세요.</strong>'
        tmp += '<button class="goToProd-btn">'
        tmp += '<span>새 배송지 추가</span>'
        tmp += '</button>'

        return tmp;
    }

    // 배송지가 없을때 새 배송지 추가(버튼) 클릭 시 파업창 오픈(카카오 api)
    $('.dlvpn-notice').on("click", '.goToProd-btn', function () {
        KaKao_api();
    })


    // 카카오 주소 api 함수선언
    function KaKao_api() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                let link = '<c:url value="/mypage/address/insertPage?addr='+addr+'&zonecode='+data.zonecode+'"/>';
                // window.location.href= link;

                var popupWidth = 550;
                var popupHeight = 550;
                var popupX = (window.screen.width / 2) - (popupWidth / 2);
                var popupY = (window.screen.height / 2) - (popupHeight / 2);
                window.open(link, '', 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left=' + popupX + ', top=' + popupY);
            }
        }).open();
    }

    function popUp(link) {
        var popupWidth = 550;
        var popupHeight = 550;
        var popupX = (window.screen.width / 2) - (popupWidth / 2);
        var popupY = (window.screen.height / 2) - (popupHeight / 2);
        window.open(link, '', 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left=' + popupX + ', top=' + popupY);
    }

    // 정규식 함수화
    // 기   능 : 인자값을 문자열로 변환한 뒤, 정규식을 활용하여 각 자리에 하이픈을 삽입해준다.
    let formatMpnoWithHyphen = (mpno) => {
        return mpno.toString().replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
    }

</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>

