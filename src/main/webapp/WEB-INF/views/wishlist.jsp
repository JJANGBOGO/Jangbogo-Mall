<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <link rel="stylesheet" href="/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="/css/myPage/validateUser.css"/>
    <%--    경로에 warning이 뜨면 카멜케이스로 명명 수정한다. mypage(x) myPage(o). 어길시 css 404--%>
    <link rel="stylesheet" href="/css/wishlist.css">
    <link rel="stylesheet" href="/css/wishlistmodal.css">
</head>
<body>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<div class="mypage-banner"></div>
<div class="mypage-base">
    <%@ include file="/WEB-INF/views/include/sidebar.jsp" %>
    <div class="mypage-content">
        <div class="king">
            <div class="title">
                <h2 class="h2">
                    <span>찜한 상품(</span><span class="prdcnt"></span><span>)</span>
                </h2>
                <span class="titlespan">찜한 상품은 최대 200개까지 저장됩니다</span>
            </div>
            <div class="wishList">

            </div>
        </div>


        <div class="background">
            <div class="popup">
                <div class="b1">
                    <div class="c1">
                        <span class="c3">1</span>
                    </div>
                    <div class="d1">
                        <div class="e1">
                            <span class="span22">2</span><span class="span33">3</span>
                        </div>
                        <div class="f1">
                            <button class="button1" type="button"></button>
                            <%--                        <button class="button3" type="button"></button>--%>

                            <div class="count">

                            </div>
                            <button class="button2" type="button"></button>
                        </div>
                    </div>
                </div>
                <div class="totalprice">
                    <div class="total1">
                        <p class="total2">
                            합계
                        </p>
                        <div>
                  <span class="price"></span>
                            <span class="price-won">원</span>
                        </div>
                    </div>
                </div>
                <div id="close" class="btn-container">
                    <button class="cancle-btn">
                        <span class="cancle-cartBtn">취소</span>
                    </button>
                    <button class="insert-btn">
                        <span class="insert-cartBtn">장바구니 담기</span>
                    </button>
                    <input class="hidden_input" name="hidden_input" type="hidden" value="">
                </div>
            </div>
        </div>

    </div>
</div>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script>

    // 위시리스트 목록 조회
    let showList = function (){
        $.ajax({
            type:'GET',       // 요청 메서드 // 위시리스트 목록 가저오기
            url: '/mypage/wishlists',  // 요청 URI
            // headers : { "content-type": "application/json"}, // 요청 헤더
            // dataType : 'text', // 전송받을 데이터의 타입 / 생략하면 기본이 JSON 이다
            // data : JSON.stringify(person),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
            success : function(result){
                $(".wishList").html(listToHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
                $(".prdcnt").html(result.length);
            },
            error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()

    }
    // main()
    $(document).ready(function (){
        showList();

        // 위시리스트 장바구니 담기(추가)
        $(".insert-btn").click(function(){
            let prod_idx = $('input[name=hidden_input]').text(); // 상품번호
            let prod_cnt = $('.count').text();       // 장바구니에 담을 상품개수
            $.ajax({
                type:'POST',       // 요청 메서드 // 위시리스트에서 장바구니에 담기
                url: '/mypage/wishlists?prod_idx='+prod_idx+'&prod_cnt=' + prod_cnt,  // 요청 URI
                success : function(result){
                    document.querySelector(".background").className = "background";
                    $('.count').text(counter=1); // 카운터 1로 리셋
                    $('.button3').attr('class',"button1"); // 버튼 클래스이름 변경
                    if(result=="DEL_OK1") alert("장바구니에 상품이 담겼습니다");
                    if(result=="DEL_OK2") alert("장바구니에 상품이 담겼습니다\n이미 담은 상품의 수량을 추가했습니다");
                    showList(); // 서버로부터 응답이 도착하면 호출될 함수
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

        // 위시리시트 삭제
        $('.wishList').on("click",'.delBtn', function (){ //
            if(!confirm("정말로 삭제하시겠습니까?"))return;
            // let prod_idx = $(this).closest(".a").attr("data-idx");  // 이거 나중에 할거 다 하고 여쭤보기 (강의랑 조금 다름)
            let prod_idx = $(this).attr("data-idx");  // 이거 나중에 할거 다 하고 여쭤보기 (강의랑 조금 다름)

            $.ajax({
                type:'DELETE',       // 요청 메서드 // 삭제 버튼 클릭 시, 해당 위시리스트 상품 삭제 처리
                url: '/mypage/wishlists/'+prod_idx,  // 요청 URI
                success : function(result){
                    showList();
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });


        // 위시리스트 담기 버튼 클릭 (모달 창 오픈)
        $('.wishList').on("click",'.openBtn',function (e){
            let name = $(this).parent().siblings('.c').children('.name').text(); // 요소 선택자 나중에 더 이해하기
            let dc_price = $(this).parent().siblings('.c').children('.d').children('.span2').text(); // 요소 선택자 나중에 더 이해하기
            let price = $(this).parent().siblings('.c').children('.d').children('.span3').text(); // 요소 선택자 나중에 더 이해하기
            let prod_idx = $(this).parent().parent().parent().attr('data-idx'); // 요소 선택자 나중에 더 이해하기

            // let name = $(this).attr("data-name");  // 이거 나중에 할거 다 하고 여쭤보기 (강의랑 조금 다름)
            // let dc_price = $(this).attr("data-dc-price");
            // let price = $(this).attr("data-price");  // 이거 나중에 할거 다 하고 여쭤보기 (강의랑 조금 다름)
            // let prod_idx = $(this).attr("data-idx");  // 이거 나중에 할거 다 하고 여쭤보기 (강의랑 조금 다름)


            // 상품이름, 상품 할인가격, 상품 가격, 상품번호 값을 모달에 넣어준다
            $('.c3').text(name); // 상품이름 ex) 홈런볼
            $('.span22').text(dc_price); // 할인된 가격 ex) 1,500원
            $('.span33').text(price); // 원래 가격 ex) 1,700원
            $('.price').text(parseInt(dc_price.replace(',', "")).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")); // 기본 1개 가격 ex) 1,500원
            $('.hidden_input').text(prod_idx); // 상품 번호 ex) 1
            document.querySelector(".background").className = "background show"; // 모달창 오픈
            $('.count').text(counter=1); // 기본 장바구니 담는 개수 1개(default)
        });

        // 모달 창 취소 버튼
        var close1 = $('.background').on("click",'.cancle-btn',function (){
            document.querySelector(".background").className = "background";
            $('.count').text(counter=1); // 카운터 1로 리셋
            $('.button3').attr('class',"button1"); // 버튼 클래스이름 변경
        });


        let counter = 1;  // 장바구니 담기 카운터  // 처음 기본(default) 개수
        // 카운터 상품개수조절(-)버튼
        $('.button1').on('click',function (){
            $('.count').text(--counter);
            let price = counter * parseInt($('.span22').text().replace(',', ""));  // 콤마(,)제거 및 숫자 변환
            $('.price').text(formatPriceWithComma(price)); // 다시 콤마(,) 추가
            if(counter<2){                                  // 숫자 2보다 작으면(+) 버튼 비활성화
                $('.button3').attr('class',"button1");
            }
        });

        // 카운터 상품개수조절(+)버튼
        $('.button2').on('click',function (){
            $('.count').text(++counter);
            let price = counter * parseInt($('.span22').text().replace(',', ""));  // 콤마(,)제거 및 숫자 변환
            $('.price').text(formatPriceWithComma(price)); // 다시 콤마(,) 추가
            if(counter>1){                                 // 숫자 1보다 크면 마이너스(-) 버튼 활성화
                $('.button1').attr('class',"button3");
            }
        });


    });

    let listToHtml = function (wishlists){
        let tmp = "<div>";
<%--// ${"${msg}"}--%>
        wishlists.forEach(function (product){
            tmp += '<div class="a" data-idx = '+product.idx+'>'
            tmp +=      '<a href="">'
            tmp +=          '<img src='+product.resv_photo_upload_path+' alt="">'
            tmp +=      '</a>'
            tmp +=      '<div class="b">'
            tmp +=          '<div class="c">'
            tmp +=              '<a href="" class="name">'+product.name+'</a>'
            tmp +=                  '<div class="d">'
            if(product.dc_rate!=0){
                tmp += '<span class="span1" id="dc_rate">'+product.dc_rate+'%</span>'
                tmp += '<span class="span2" id="dc_prc">' +formatPriceWithComma(product.prc - (product.prc / 100 * product.dc_rate))+ '원</span>'
                tmp += '<span class="span3" id="prc">'+formatPriceWithComma(product.prc)+'원</span>'
            }else {
                tmp += '<span class="span2" id="prc">'+formatPriceWithComma(product.prc)+'원</span>'
            }
            tmp += '</div>'
            tmp += '</div>'
            tmp += '<div class="e">'
            tmp += '<button class="delBtn" type="button" data-idx = '+product.idx+'>삭제</button>'
            tmp += '<button class="openBtn" type="button" data-idx = '+product.idx+' data-name = '+product.name+' data-price = '+formatPriceWithComma(product.prc)+'원 data-name = '+product.name+' data-price = '+formatPriceWithComma(product.prc)+'원 data-dc-price = ' +formatPriceWithComma(product.prc - (product.prc / 100 * product.dc_rate))+ '원>담기</button>'
            tmp += '</div>'
            tmp += '</div>'
            tmp += '</div>'

        })
        return tmp + "</div>";
    }

    // 정규식 함수화
    let formatPriceWithComma = (price) => {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }
</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>

