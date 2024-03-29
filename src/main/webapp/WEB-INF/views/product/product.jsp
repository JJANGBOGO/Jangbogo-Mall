<%--
  Created by IntelliJ IDEA.
  User: qpwo3
  Date: 2023-04-08
  Time: 오후 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
  <link rel="stylesheet" href="/css/productReview.css"/>
  <link rel="stylesheet" href="/css/productReviewModal.css"/>
  <%@ include file="/WEB-INF/views/include/header.jsp" %>
  <%@ include file="/WEB-INF/views/include/navbar.jsp" %>
  <link rel="stylesheet" href="/css/product/product.css"/>
  <title>Title</title>
</head>
<body>
<div id="top">

  <div id="body" class="css-n48rgu ex9g73v0">

    <div class="body-wrap" >
      <div id="main" class="main">
        <div id="prod-img" class="prod-img" data-imgUrl=${list.image_path}></div>
        <section class="info-block">
          <div id="prod-title-wrap">
            <div id="prod-title">
              <h1>[${findBrand.brandName}]${list.name}</h1>
            </div>
            <h2 class="prod-ctent">${list.content}</h2>
          </div>
          <h2 class="prod-price-info">
            <c:choose>
              <c:when test="${list.dc_rate != 0}">
                <span id="prod-dc">${list.dc_rate}%</span>
              </c:when>
            </c:choose>
            <span id="prod-price"></span>
            <span id="prod-unit">원</span>
          </h2>
<%--          <c:choose>--%>
<%--            <c:when test="${list.dc_rate >= 0} ">--%>
          <c:if test="${list.dc_rate > 0 }">
              <span id="defore-dc">
                  <span class="defore-dc-span" style="color: #b5b5b5"></span>원
              </span>
          </c:if>
<%--            </c:when>--%>
<%--          </c:choose>--%>
          <div id="info-table" class="css-iqoq9n e6qx2kx2">
            <div class="seller">
              <div class="sellerColumn">판매자</div>
              <div class="seller-info">
                <p class="seller-name">${findBrand.brandName}</p>
              </div>
            </div>
            <div class="packingType">
              <div class="packingColumn">포장타입</div>
              <div class="packing-info">
                <p class="packing-name">${dlvryMethod.dlvry_type},${dlvryMethod.packing_type}</p>
                <p class="packing-content">
                  ${dlvryMethod.dlvry_warn}
                </p>
              </div>
            </div>
            <div class="salesUnit">
              <div class="salesUnitColumn">판매단위</div>
              <div class="salesUnit-info">
                <p class="salesUnit-content">${list.unit}</p>
              </div>
            </div>
            <div class="volume">
              <div class="volColumn">중량/용량</div>
              <div class="vol-info">
                <p class="vol-content">${list.weight}</p>
              </div>
            </div>
            <div class="origin">
              <div class="originColumn">원산지</div>
              <div class="origin-info">
                <p class="origin-content">${list.origin}</p>
              </div>
            </div>
            <div class="expDate">
              <div class="expDateColumn">유통기한(또는 소비기한)정보</div>
              <div class="expDate-info">
                <p class="expDate-content">
                  ${list.guid}
                </p>
              </div>
            </div>
            <div class="notice">
              <div class="noticeColumn">안내사항</div>
              <div class="notice-info">
                <p class="notice-content">
                  ${list.warn}
                </p>
              </div>
            </div>
          </div>
          <div class="selectItem-block" css-1bp09d0 e17iylht1>
            <div class="selectItem-wrap" class="css-2lvxh7 e1qy0s5w0">
              <div class="selectItem" class="css-e6zlnr epzddad2">
                <div class="selectItemColumn">상품선택</div>
                <div class="countItem-block">
                  <div class="countItem">
                    <div class="itemName">
                      <span class="itemName-content">${list.name}</span>
                    </div>
                    <div
                            class="countBlock-wrap"
                    >
                      <div class="countBlock">
                        <button class="downCount">수량내리기</button>
                        <div class="num" data-min="1" data-max="10">1</div>
                        <button class="upCount">수량올리기</button>
                      </div>
                      <div class="m-price">
                        <c:choose>
                          <c:when test="${list.dc_rate > 0}">
                              <span class="m-price-origin"><span class="m-price-origin-span"></span>원</span>
                              <span class="m-price-dc"><span class="m-price-dc-span"></span>원</span>
                          </c:when>
                          <c:when test="${list.dc_rate == 0}">
                            <span class="m-price-dc"><span class="m-price-dc-span"></span>원</span>
                          </c:when>
                        </c:choose>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="totalprice-wrap">
              <div class="totalprice">
                <div class="totalprice-content">
                  <span class="price-before">총 상품금액 :</span>
                  <span class="price"></span>
                  <span class="price-after">원</span>
                </div>
                <div class="acc-block">

                </div>
              </div>
            </div>
            <div class="cart-wrap">
              <button class="wishlistBtn" data-heart="empty">
                  <span class="btn-wrap">
                        <c:choose>
                          <c:when test="${msg eq 'no'}">
                            <i class="fa-regular fa-heart" id="heartBtn"></i>
                          </c:when>
                          <c:otherwise>
                            <i class="fa-solid fa-heart" id="heartBtn"></i>
                          </c:otherwise>
                        </c:choose>
                  </span>
              </button>
              <div class="cartBtn-wrap">
                <button class="cartBtn">
                  <span class="cartBtn-content">장바구니 담기</span>
                </button>
              </div>
            </div>
          </div>
        </section>
      </div>
      <div id="product-desc">
        <div id="description">
          <div class="description-wrap">
            <c:forEach items="${fileList}" var="file">
              <img src="${file.UPLOAD_PATH}">
            </c:forEach>
          </div>
        </div>
        <div id="detail">

        </div>
        <%----------------------상품 후기  -----------------------%>

        <div class="review-container">
          <section class="review-section">
            <header class="review-header">
              <h2 class="header">상품 후기</h2>

            </header>

            <div class="review-box" id="abc">
              <div class="review-count">
                <span>총 </span><span class="count"></span><span>개</span>
              </div>
              <div class="review-lists">

              </div>

            </div>
            <div class="pageHandler-container">

            </div>
          </section>
        </div>



        <%-- 후기 수정 모달--%>
        <div class="reviewUpdate-container">
          <div></div>
          <div class="reviewUpdate-background">
            <div class="reviewUpdate-modal">
              <header class="review-title">
                <h2>후기 수정</h2>
                <button class="closeXBtn">
                  <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg"><g clip-path="url(#clip0_2073_60924)"><path d="M26 26L6 6" stroke="#999" stroke-linecap="square" stroke-width="0"></path><path d="M6 26L26 6" stroke="#999" stroke-linecap="square" stroke-width="0"></path></g><path fill-rule="evenodd" clip-rule="evenodd" d="M6.28431 5.58859L6.35355 5.64645L16 15.293L25.6464 5.64645C25.8417 5.45118 26.1583 5.45118 26.3536 5.64645C26.5271 5.82001 26.5464 6.08944 26.4114 6.28431L26.3536 6.35355L16.707 16L26.3536 25.6464C26.5488 25.8417 26.5488 26.1583 26.3536 26.3536C26.18 26.5271 25.9106 26.5464 25.7157 26.4114L25.6464 26.3536L16 16.707L6.35355 26.3536C6.15829 26.5488 5.84171 26.5488 5.64645 26.3536C5.47288 26.18 5.4536 25.9106 5.58859 25.7157L5.64645 25.6464L15.293 16L5.64645 6.35355C5.45118 6.15829 5.45118 5.84171 5.64645 5.64645C5.82001 5.47288 6.08944 5.4536 6.28431 5.58859Z" fill="#999"></path></svg>
                </button>
              </header>
              <div class="review-body">
                <div class="body-title">
                  <span class="title-img"><img src="https://img-cf.kurly.com/shop/data/goods/1654669098671l0.jpg"></span>
                  <div class="">
                    <span class="img-name">[하림] 닭가슴살 핫도그 5개입</span>
                  </div>
                </div>
                <form>
                  <div class="body-content">
                    <label class="content-side">
                      내용
                      <sup style="color: rgb(250, 98, 47);">*</sup>
                    </label>
                    <div class="content-box">
                      <textarea class="content"></textarea>
                      <div id="review_cnt">(0 / 3000)</div>
                      <span></span>
                    </div>
                  </div>
                  <div class="body-warning">
                    <label class="warning-side"></label>
                    <ul class="warning-ul">
                      <li> *  상품과 무관하거나 반복되는 동일 단어/문장을 사용하여 후기로 볼 수 없는 글, 판매자와 고객의 후기 이용을 방해한다고 판단되는 경우, 배송 박스, 구매 상품을 구분할 수 없는 전체 사진, 화면캡쳐, 음란 및 부적절하거나 불법적인 내용은 통보없이 삭제 및 적립금 회수될 수 있습니다.</li>
                      <li> *  전화번호, 이메일, 주소, 계좌번호 등 개인정보가 노출되지 않도록 주의해주세요.</li>
                    </ul>
                  </div>
                  <div class="body-footer">
                    <label class="footer-side"></label>
                    <label class="opub-label">
                      <input class="opubCheckbox" type="checkbox">
                      <span>후기 비공개하기</span>
                    </label>
                  </div>
                  <div class="footerBtn">
                    <button class="cancleBtn" onclick="return false;">취소</button>
                    <button class="updateBtn" onclick="return false;">수정</button>
                    <input class="hidden-idx" type="hidden" value="">
                  </div>
                </form>
              </div>

            </div>

          </div>
        </div>
        <%-- 후기 수정 모달 끝--%>

        <%---------------------- 상품 후기 끝 ------------------------%>
        <div id="review"></div>
        <div id="inquiry">
          <div class="prodInqry-wrap">
            <div class="prodInqry">
              <c:if test="${session_idx ne null && list.seler_idx ne session_idx}">
                <button class="open-modal" ><span>문의하기</span></button>
              </c:if>

              <div class="modal">
                <div id="modal-body" class="modal_body">
                  <div class="inqry_head">
                    <h4>상품 문의하기</h4>
                    <button type="button" class="xBtn">
                      <span></span>
                    </button>
                  </div>
                  <div class="inqry_sub">
                    <img
                            src="https://img-cf.kurly.com/shop/data/goods/1655775819130l0.jpg"
                    />
                    <div>
                      <span>${list.name}</span>
                    </div>
                  </div>
                  <div class="inqry_title">
                    <div class="title">
                      <span>제목</span>
                    </div>
                    <div class="title_input">
                      <input id="modal-title" type="text" />
                      <div id="title_text_cnt" class="text_cnt">(0 / 50)</div>
                    </div>
                  </div>
                  <div class="inqry_content">
                    <div class="content">
                      <span>내용</span>
                    </div>
                    <div class="content_input">
                      <textarea id="modal-ctent"></textarea>
                      <div id="ctent_text_cnt" class="text_cnt">(0 / 3000)</div>
                    </div>
                  </div>
                  <div class="inqry_secret">
                    <div class="secret_head"></div>
                  </div>
                  <div class="inqry_button">
                    <button class="closeBtn">취소</button>
                    <button class="register" id="sendBtn">등록</button>
                  </div>
                </div>
              </div>




              <div class="inqry-head">
                <span>상품문의</span>
                <ul>
                  <li class="warn_1">
                    상품에 대한 문의를 남기는 공간입니다. 해당 게시판의
                    성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수
                    있습니다.
                  </li>
                  <li class="warn_2">
                    배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은
                    마이컬리 내 1:1문의에 남겨주세요.
                  </li>
                </ul>
              </div>
              <div class="inqry-body">
                <div id="prodInqryList">
                  <table id="table"></table>
                </div>
              </div>
              <div class="paging-container">


              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</div>
<div id="prod_idx" style="display: none">${prod_idx}</div>
<div id="sessionID" style="display: none">${session_idx}</div>
<div class="footer"></div>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://kit.fontawesome.com/cc28ed1241.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/include/script.jsp" %>
<script>
  let prod_idx = ${prod_idx};
  let showDetail = function(prod_idx) {
    $.ajax({
      type: 'GET',
      url: '/product/productDetail/detail?prod_idx='+prod_idx,
      success: function(infoList) {
        $('#detail').html(DetailToList(infoList));
      },
      error: function() { alert("GET detail Error") }
    })
  }

  let DetailToList = function(infoList) {

    let tmp = '<div class="detail-wrap">';
    tmp += '<h3>상품고시정보</h3>';
    tmp += '<ul class="detail-product-ul">';
    tmp += '<li class="prod-warn">주의사항</li>';
    tmp += '<li class="prod-warn-text">'+ infoList.warn +'</li>';
    tmp += '<li class="prod-info">상품 안내사항</li>';
    tmp += '<li class="prod-info-text">'+ infoList.guid +'</li>';
    tmp += '</ul></div>';

    return tmp;
  }

  let showInqryList = function(prod_idx) {
    $.ajax({
      type:'GET',       // 요청 메서드
      url: '/product/inqry/list?prod_idx='+prod_idx,  // 요청 URI
      success : function(result){
        $('#table').html(InqrytoHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
      },
      error : function() { alert("GETerror") } // 에러가 발생했을 때, 호출될 함수
    }); // $.ajax()
  }

  let showProdDetailList = function(prod_idx) {
    $.ajax({
      type: 'GET',
      url: '/product/productDetail/list?prod_idx='+prod_idx,
      success: function(result) {
        $('#prod-price').html(dcNumberToPrice(result));
        $(".m-price-dc-span").html(dcNumberToPrice(result));
        $(".m-price-origin-span").html(numberToPrice(result));
        $(".defore-dc-span").html(numberToPrice(result));
        $(".price").html(dcNumberToPrice(result));
      },
      error: function() {alert("error")}
    })
  }

  let showImage = function() {
    //태그안에 들어가있는 주소를 불러와
    let imgAddress = $('.prod-img').data("imgurl");
    $('#prod-img').css({"background-image":"url("+imgAddress+")"});
  }

  let prodInqryImage = function() {
    let imgAddress = $('.prod-img').data("imgurl");
    $('.inqry_sub').find('img').attr('src', imgAddress);
  }

  let numberToPrice = function(info) {
    let number = info.price;
    let withComma = number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    return withComma;
  }

  let dcNumberToPrice = function(info) {
    let number = info.price;
    let dcRate = info.dc_rate;
    let finalNum = Math.floor(number - number * (dcRate / 100));
    let withComma = finalNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

    return withComma;
  }

  let packingTypeToString = function() {
    let packingType = $('.packing-name').text();
    // , 콤마를 기준으로 문자열을 잘라서
    //첫 번째 요소가 1이면 냉장/ 2이면 냉동/ 3이면 상온
    let first = packingType.split(',')[0];
    let dlvryType = "";
    let packageType = "";
    if(first == 1) {
      dlvryType = "냉장"
    } else if(first == 2) {
      dlvryType = "냉동";
    } else if(first == 3) {
      dlvryType = "상온";
    }
    //두 번째 요소가 1이면 종이박스 / 2이면 아이스박스
    let second = packingType.split(',')[1];
    if(second == 1) {
      packageType = "종이박스"
    } else if(second == 2) {
      packageType = "아이스박스";
    }
    //변경해서
    //return 첫 번째 요소 + "(" + 두 번째 요소 + ")";
    $('.packing-name').text(dlvryType + "(" + packageType + ")");
  }

  $(document).ready(function(){

    showInqryList(prod_idx);
    showProdDetailList(prod_idx);
    packingTypeToString();
    showImage();
    showDetail(prod_idx);
    prodInqryImage();

    $('.cartBtn').click(function() {

      // 로그인이 안되어있으면 로그인 페이지로 이동한다
      if(${sessionScope.idx == null}){
        alert("로그인하셔야 본 서비스를 이용하실 수 있습니다.")
        location.href = "<c:url value='/user/login'/>";
        return;
      }

      let prod_cnt = $('.num').text();

      $.ajax({
        type: 'POST',
        url: '/cart?prod_idx='+prod_idx+'&prod_cnt='+prod_cnt,
        success: function(msg) {
          if(msg === "INSERT_OK") {
            alert("장바구니에 상품이 담겼습니다")
          } else if(msg === "UPDATE_OK") {
            alert("상품의 개수가 추가되었습니다")
          }
        },
        error: function(msg) {
          if(msg === "INSERT_ERR") alert("진행중 오류가 발생했습니다")}
      })
    })

    $('.wishlistBtn').click(function(e) {

      // 로그인이 안되어있으면 로그인 페이지로 이동한다
      if(${sessionScope.idx == null}){
        alert("로그인하셔야 본 서비스를 이용하실 수 있습니다.")
        location.href = "<c:url value='/user/login'/>";
        return;
      }

      let value = $('.wishlistBtn').find('i').attr('class');
      if(value == "fa-solid fa-heart"){
        $('.wishlistBtn').find('i').attr('class','fa-regular fa-heart');
      }else if(value == "fa-regular fa-heart"){
        $('.wishlistBtn').find('i').attr('class','fa-solid fa-heart');
      }

      $.ajax({
        type: 'POST',
        url: '/wishlist?prod_idx='+prod_idx,
        success: function(msg) {
          if(msg === "INSERT_OK") {
            alert("관심상품으로 등록되었습니다")
          } else if(msg === "DELETE_OK") {
            alert("관심상품 등록이 취소되었습니다")
          }
        },
        error: function() {alert("잘못된 요청입니다")}
      })

    })

    $('.price').text($('.m-price-dc-span').text());

    $('.upCount').click(function() {
      //초기 숫자 1에
      let init = parseInt($('.num').text());
      if(init <= 9){
        let plusNum = init + 1;
        $('.num').text(plusNum);
        //기존에 태그에 들어가 있는 문자열을 가져와서
        //콤마를 뺀 숫자만을 구하고
        let regex = /[^0-9]/g;
        let numPrice = ($('.m-price-dc-span').text()).replace(regex, "");
        //콤마를 뺀 숫자에 늘어난 숫자 2를 곱해줘
        let calcPrice = plusNum * parseInt(numPrice);
        //곱해준 값에 콤마를 붙이고
        let withComma = calcPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        //.price 공간에 넣어줘
        $('.price').text(withComma);
        //최대 숫자 10이 되기 전까지 올려줘
      }

    })

    $('.downCount').click(function() {
      //.num 내부의 텍스트를 가져와서 변수에 저장
      let num = parseInt($('.num').text());
      if(!(num < 2)){
        let minusNum = num - 1;
        $('.num').text(minusNum);
        let textNum = $('.num').text();
        let regex = /[^0-9]/g;
        let origin = ($('.m-price-dc-span').text()).replace(regex, "");
        //num * origin 계산후 콤마 찍어서 변수에 저장
        let calcPrice = (textNum * origin).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        //.price 내부에 입력
        $('.price').text(calcPrice);
        //num의 값이 num <= 1 일때까지만
      }
    })

    $(".xBtn").click(function() {
      $('body').css("overflow","visible");

      $(".modal").css("display", "none");

      $("input[id=modal-title]").val("");
      $("#modal-ctent").val("");
      $("input[type=checkbox]").prop("checked", false);
      $("#title_text_cnt").text("(0 / 50)");
      $("#ctent_text_cnt").text("(0 / 3000)");
      return;
    })

    $(".closeBtn").click(function() {
      $('body').css("overflow","visible");

      $(".modal").css("display", "none");

      $("input[id=modal-title]").val("");
      $("#modal-ctent").val("");
      $("input[type=checkbox]").prop("checked", false);
      $("#title_text_cnt").text("(0 / 50)");
      $("#ctent_text_cnt").text("(0 / 3000)");
      return;
    })

    $(".open-modal").click(function(e) {
      $('body').css("overflow","hidden");
      target = $(e.target);
      let p = $(target).offset();

      let session_idx = "${session_idx}";
      if(session_idx == "") {
        alert("회원만 문의 작성이 가능합니다.")
        location.href = "<c:url value='/user/login'/>";
        return;
      }

      let inqryButton = $(".inqry_button");
      if(inqryButton[0].children[1].textContent == '수정') {
        // 태그 제거 해줌
        let inqryButton = $(".inqry_button");
        inqryButton[0].children[1].remove();
        //태그 생성
        let modBtn = $('<button class="register" id="sendBtn">등록</button>');
        inqryButton.append(modBtn);
      }

      $(".modal").css("display", "block");
    })

    $("textarea#modal-ctent").on('keyup', function() {
      $('#ctent_text_cnt').html("("+$("textarea#modal-ctent").val().length+" / 3000)");

      if($("textarea#modal-ctent").val().length > 3000) {
        $("textarea#modal-ctent").val($("textarea#modal-ctent").val().substring(0, 3000));
        $('#ctent_text_cnt').html("(3000 / 3000)");
        alert("작성 가능 문자수를 초과하셨습니다");
      }
    })

    $("#modal-title").on('keyup', function() {
      $('#title_text_cnt').html("("+$("#modal-title").val().length+" / 50)");

      if($(this).val().length > 50) {
        $(this).val($(this).val().substring(0, 50));
        $('#title_text_cnt').html("(50 / 50)");
        alert("작성 가능 문자수를 초과하셨습니다");
      }
    })

    $(".inqry_button").on("click", "#sendBtn", function() {
      $('body').css("overflow","visible");

      let ctent = $("#modal-ctent").val();
      let title = $("input[id=modal-title]").val();

      let prod_idx = $('#prod_idx').text();

      if(title.trim()=='') {
        alert("제목을 입력해주세요");
        $("input[id=modal-title]").focus();
        return;
      }

      if(ctent.trim()=='') {
        alert("내용을 입력해주세요");
        $("#modal-ctent").focus();
        return;
      }

      $.ajax({
        type:'POST',       // 요청 메서드
        url: '/product/inqry/write?prod_idx='+prod_idx,  // 요청 URI   // /product?prod_idx=1 POST
        headers : { "content-type": "application/json"}, // 요청 헤더
        data : JSON.stringify({prod_idx:prod_idx, title:title, ctent:ctent}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
        success : function(){
          alert("문의가 등록되었습니다.");
          showInqryList(prod_idx);
        },
        error   : function(){ alert("Wrterror") } // 에러가 발생했을 때, 호출될 함수
      }); // $.ajax()

      //모달을 안보이게 한다.
      $(".modal").css("display", "none");

      //input란에 있던 정보를 없앤다
      $("input[id=modal-title]").val("");
      $("#modal-ctent").val("");
      $("#title_text_cnt").text("(0 / 50)");
      $("#ctent_text_cnt").text("(0 / 3000)");
    });

    // 동적으로 생성되는, 문의에 달려있는 "수정" 버튼을 누르면
    $("#table").on("click", ".modBtn", function(e) {

      target = $(e.target).closest("tr");
      let user_idx = $(this).closest("tr").attr("data-user_idx");
      //수정 버튼이 포함되어 있는 tr 라인 안에 들어있는 idx를 가져온다.
      //title과 ctent의 내용들도 가져와서 변수에 담는다.
      let idx = $(this).closest("tr").attr("data-idx");
      let ctent = $(this).closest("tr").children().children().children().find('div:eq(1)[name=text]').children().html();

      let inquiry_idx = $(this).closest("tr").attr("data-idx");
      let dtoArr = $(".modBtn").closest("tr").siblings("tr[data-idx=" + inquiry_idx + "]");
      let title = dtoArr[0].dataset.title;

      if(user_idx != "${sessionScope.idx}") {
        alert("수정권한이 없습니다.");
        return;
      }

      $("#modal-title").on('keyup', function() {
        $('#title_text_cnt').html("("+$("#modal-title").val().length+" / 50)");

        if($(this).val().length > 50) {
          $(this).val($(this).val().substring(0, 50));
          $('#title_text_cnt').html("(50 / 50)");
          alert("작성 가능 문자수를 초과하셨습니다");
        }
      })

      $("#modal-ctent").on('keyup', function(e) {
        $('#ctent_text_cnt').html("("+$("#modal-ctent").val().length+" / 3000)");

        if($(this).val().length > 3000) {
          $(this).val($(this).val().substring(0, 3000));
          $('#ctent_text_cnt').html("(3000 / 3000)");
          alert("작성 가능 문자수를 초과하셨습니다");
        }
      })

      let inqryButton = $(".inqry_button");

      //버튼을 "수정"으로 변경
      if(inqryButton[0].children[1].textContent == '등록') {
        // 태그 제거 해줌
        let inqryButton = $(".inqry_button");
        inqryButton[0].children[1].remove();
        //태그 생성
        let modBtn = $('<button class="register" id="modBtn">수정</button>');
        inqryButton.append(modBtn);

      }

      //idx값을 새로 생성한 태그에 사용자 정의 속성으로 전달
      $("#modBtn")[0].setAttribute("data-idx", idx);

      //게시물에 있던 내용들을 옮겨왔다.
      $("input[id=modal-title]").val(title);
      $("#modal-ctent").val(ctent);

      //기존 문자열 길이값 가져오기
      let title_cnt = ctent.length;
      $('#title_text_cnt').html("("+title_cnt+" / 50)");

      let ctent_cnt = ctent.length;
      $('#ctent_text_cnt').html("("+ctent_cnt+" / 3000)");

      //모달이 열린다.
      $(".modal").css("display", "block");

    });

    $(".inqry_button").on("click", "#modBtn", function() {

      //속성 data-idx의 값을 저장한다.
      let idx = $(this).attr("data-idx");
      //동일하게 불러온 정보를 변수에 저장한다.
      let newTitle = $("input[id=modal-title]").val();
      let newCtent = $("textarea[id=modal-ctent]").val();

      let prod_idx = $('#prod_idx').text();
      //등록 버튼을 눌러 새롭게 정보를 저장한다.
      $.ajax({
        type:'PATCH',
        url: '/product/inqry/'+idx+'?prod_idx='+prod_idx,
        headers: {"content-type": "application/json"},
        data: JSON.stringify({title:newTitle, ctent:newCtent}),
        success: function() {
          alert("수정되었습니다.")
          showInqryList(prod_idx);
        },
        error: function() {alert("수정중 오류가 발생했습니다.")}
      })
      //모달을 안보이게 한다.
      $(".modal").css("display", "none");

      //input란에 있던 정보를 없앤다
      $("input[id=modal-title]").val("");
      $("input[id=modal-ctent]").val("");

      let inqryButton = $(".inqry_button");
      // console.log("inqryButton = "+ inqryButton)
      inqryButton[0].children[1].remove();
      //태그 생성
      let sendBtn = $('<button class="register" id="sendBtn">등록</button>');
      inqryButton.append(sendBtn);
      return;
    });


    $("#table").on("click", ".delBtn", function() { //prodInqryList 안에 있는 delBtn에 click 이벤트를 건다.

      let user_idx = $(this).closest("tr").attr("data-user_idx");
      let idx = $(this).closest("tr").attr("data-idx");
      let prod_idx = $('#prod_idx').text();
      // let prod_idx = $(this).closest("tr").attr("data-prod_idx");
      if(user_idx != "${sessionScope.idx}") {
        alert("삭제권한이 없습니다.")
        return;
      }

      $.ajax({
        type:'DELETE',       // 요청 메서드
        url: '/product/inqry/list/'+idx+'?prod_idx='+prod_idx,  // 요청 URI
        success : function(){
          alert("삭제되었습니다.");
          showInqryList(prod_idx);
        },
        error   : function(){ alert("삭제권한이 없습니다.") } // 에러가 발생했을 때, 호출될 함수
      }); // $.ajax()
    })


    //  ----------------  상품 후기  ---------------------

    $('.content').on('keyup', function() {
      $('#review_cnt').html("("+$(this).val().length+" / 3000)");
      console.log($(this));
      if($(this).val().length > 3000) {
        $(this).val($(this).val().substring(0, 3000));
        $('#review_cnt').html("(3000 / 3000)");
        alert("작성 가능 문자수를 초과하셨습니다")
      }
    })


    // 상품후기 조회 함수 호출
    showList();

    // 후기수정 버튼 클릭 시(수정 모달창 오픈)
    $('.review-lists').on("click",'.article-updateBtn', function (){
      let upload_path = $(this).attr('data-upload_path');                 // 상품 이미지 url 변수 선언
      let name = $(this).parent().siblings('.article-title').text();      // 상품 이름     변수 선언
      let content = $(this).parent().siblings('.article-content').text(); // 상품 후기 내용 변수 선언
      let nowLength = content.length;

      // $('.content').keydown(function (){
      //     let newLength = $(this).val().length;
      //     if(newLength>nowLength){
      //         $('.updateBtnDefault').attr("class","updateBtn");
      //         // $('.updateBtn').attr("class","updateBtnDefault");
      //     }else if(newLength<=nowLength){
      //         $('.updateBtn').attr("class","updateBtnDefault");
      //     }
      // })
      $('#review_cnt').html("("+nowLength+" / 3000)");
      let idx = $(this).attr('data-idx');                                 // 상품 후기 일련번호 변수 선언
      let user_idx = $(this).attr('data-user_idx');
      if(user_idx!="${sessionScope.idx}"){
        alert("작성자만 수정할 수 있습니다")
        return;
      }

      $('.img-name').text(name);                              // 수정 모달창에 상품이름 추가
      $('.title-img').children().attr("src",upload_path);     // 수정 모달창에 이미지 추가
      // $('.content').text(content);                         // 수정 모달창에 후기 내용 추가
      $('.content').val(content);                             // 수정 모달창에 후기 내용 추가
      $('.hidden-idx').attr("value",idx);                     // 수정 모달창에(input) 후기 일련번호 추가

      openModal();                                            // 수정 모달창 오픈
    })

    // 수정창 (X버튼) 클릭
    $('.reviewUpdate-container').on("click",'.closeXBtn', function (){ //
      closeModal();
    })

    // 수정창 (취소 버튼) 클릭
    $('.reviewUpdate-container').on("click",'.cancleBtn', function (){ //
      closeModal();
    })

    // 수정 모달창 (수정) 버튼 클릭 시
    $('.reviewUpdate-background').on("click",'.updateBtn', function (){
      if(!confirm("수정하신 내용으로 후기 내용을 변경하시겠습니까?"))return;
      let ctent = $('.content').val();
      let opub_yn = $('.opubCheckbox').is(':checked');
      let idx = $('.hidden-idx').val();
      $.ajax({
        type:'PATCH',                                           // 요청 메서드 //
        url: '/product/review/'+idx,                            // 요청 URI
        headers : { "content-type": "application/json"},        // 요청 헤더
        data : JSON.stringify({ctent:ctent,opub_yn:opub_yn}),   // 서버로 전송할 데이터. stringify()로 직렬화 필요.
        success : function(result){
          // alert(result);
          closeModal();
          showList();

        },
        error   : function(){ alert("error") }                  // 에러가 발생했을 때, 호출될 함수
      }); // $.ajax()

    });

    // 페이징 버튼 클릭 시(해당 페이지 목록 조회)
    $('.pageHandler-container').on("click",'a', function (){ // a태그 클릭 시
      let page = $(this).attr('data-page');
      // alert(page);
      $.ajax({
        type:'GET',                                                 // 요청 메서드 // 상품후기 목록 가저오기
        url: '/product/review/list?prod_idx='+prod_idx+'&page='+page,             // 요청 URI  // 상품번호 (하드코딩)
        // headers : { "content-type": "application/json"},         // 요청 헤더
        // dataType : 'text',                                       // 전송받을 데이터의 타입 / 생략하면 기본이 JSON 이다
        // data : JSON.stringify(person),                           // 서버로 전송할 데이터. stringify()로 직렬화 필요.
        success : function(result){
          $(".review-lists").html(ReviewListToHtml(result["list"]));      // 서버로부터 응답이 도착하면 호출될 함수
          $(".pageHandler-container").html(PageHandlerToHtml(result["pageHandler"]));
          $(".count").html(result["totalCnt"]);
          $('.review-count').attr("tabindex",-1);
          $('.review-count').focus();
        },
        error   : function(){ alert("error") }                      // 에러가 발생했을 때, 호출될 함수
      }); // $.ajax()

    })



  });

  $("#table").on("click", '#noticeBlock', function() {
    let test = $(this).next(); // 클릭한 요소의 next() 요소의 참조를 가저온다  //class="accordion-wrap"
    // alert(test.css('display')=='table-row');
    if(test.css('display')=='table-row'){
      test.css('display','none')
    }else {
      test.css('display','table-row')
    }
  })



  let InqrytoHtml = function(inqrys) {  //GetMapping통해서 정보 들어온다.

    let tmp = "<tbody>";
    tmp += "<tr>";
    tmp += "<th>제목</th>";
    tmp += "<th>작성자</th>";
    tmp += "<th>작성일</th>";
    tmp += "<th>답변상태</th></tr>";



    inqrys.forEach(function(inqry) {
      let res_state_cd = "";
      if(inqry.res_state_cd == 1) {
        res_state_cd = "답변대기";
      } else if(inqry.res_state_cd == 2) {
        res_state_cd = "답변완료"
      }


      let timeStamp = Date.now();
      // [2]. 타임 스탬프 >> Date 로 변환
      let reg_date = new Date(inqry.wrt_tm);
      let answer_date = new Date(inqry.ans_write_time);
      // [3]. moment 라이브러리 사용해 24시간 형태 날짜 및 시간 확인
      let now24Date = moment(reg_date).format("YYYY-MM-DD");
      let now24Date2 = moment(answer_date).format("YYYY-MM-DD");

      tmp += '<tr id="noticeBlock" data-idx=' + inqry.idx
      tmp += ' data-prod_idx=' + inqry.prod_idx
      tmp += ' data-title=' + inqry.title
      tmp += ' data-ctent='+ inqry.ctent
      tmp += ' data-opub_yn='+ inqry.opub_yn + '>'
      tmp += '<td id="noticeBlock-title" style="border-bottom: 1px solid rgb(244, 244, 244)" class="title" data-opub_yn=' + inqry.opub_yn + ' data-idx='+ inqry.idx +'><span id="title-text">' + inqry.title + '</span></td>'
      tmp += '<td class="name" data-user_idx=' + inqry.user_idx + '>' + inqry.writer + '</td>'
      tmp += '<td class="reg_date" >' + now24Date+ '</td>'
      tmp += '<td id="res-state-cd" class="response_state" >'+res_state_cd+'</td>'
      tmp += '</tr>'
      if(inqry.res_state_cd == 2) {
      tmp += '<tr class="accordion-wrap" data-idx=' + inqry.idx
      tmp += ' data-prod_idx='+ inqry.prod_idx
      tmp += ' data-user_idx='+ inqry.user_idx
      tmp += ' data-opub_yn='+ inqry.opub_yn + '>'
      tmp += '<td class="accordion" colspan="4">'
      tmp += '<div class="request-wrap">'
      tmp += '<div class="request">'
      tmp += '<div class="img">'
      tmp += '<span class="glasses">'
      tmp += '</span>'
      tmp += '</div>'
      tmp += '<div id="noticeBlock-ctent" name="text" class="text">'
      tmp += '<span>' + inqry.ctent
      tmp += '</span>'
      tmp += '</div>'
      tmp += '</div>'
      tmp += '</div>'
      tmp += '<div class="response-wrap">'
      tmp += '<div class="response">'
      tmp += '<div class="img">'
      tmp += '<span>'
      tmp += '</span>'
      tmp += '</div>'
      tmp += '<div class="text">'
      tmp += '<div>' + inqry.ans_content
      tmp += '</div>'
      tmp += '</div>'
      tmp += '</div>'
      tmp += '<div class="reg_date"><span>' + now24Date2 + '</span>'
      tmp += '<div class="btnGroup" id="btnGroup">'
      tmp += '<button class="modBtn">수정</button>'
      tmp += '<button class="delBtn">삭제</button>'
      tmp += '</div>'
      tmp += '</div>'
      tmp += '</div>'
      }else{
        tmp += '<tr class="accordion-wrap" data-idx=' + inqry.idx
        tmp += ' data-prod_idx='+ inqry.prod_idx
        tmp += ' data-user_idx='+ inqry.user_idx
        tmp += ' data-opub_yn='+ inqry.opub_yn + '>'
        tmp += '<td class="accordion" colspan="4">'
        tmp += '<div class="request-wrap">'
        tmp += '<div class="request">'
        tmp += '<div class="img">'
        tmp += '<span class="glasses">'
        tmp += '</span>'
        tmp += '</div>'
        tmp += '<div id="noticeBlock-ctent" name="text" class="text" style="display: flex">'
        tmp += '<span class="span" style="display: block;width: 770px;margin-right: 73px;">' + inqry.ctent
        tmp += '</span>'
        tmp += '<div class="btnGroup" id="btnGroup" style="width: 70px; height: 20px;">'
        tmp += '<button class="modBtn">수정 &nbsp;</button>'
        tmp += '<button class="delBtn"> &nbsp; 삭제</button>'
        tmp += '</div>'
        tmp += '</div>'
        tmp += '</div>'
        tmp += '</div>'
      }
      tmp += '</td>'
      tmp += '</tr>'
    })
    return tmp += "</tbody>";
  }

  // -------- 상품 후기 -------
  // 상품 후기 목록 뿌려주기
  let ReviewListToHtml = function (reviews){
    <%--console.log(${idx});--%>
    <%--console.log(${sessionScope.idx})--%>
    <%--console.log("${sessionScope.email}");--%>
    <%--console.log("${email}")--%>
    <%--console.log("${nickname}")--%>
    let tmp = '';
    reviews.forEach(function (review){
      if((review.user_idx=="${sessionScope.idx}" && review.opub_yn=="N" && review.state_cd !=2) || review.opub_yn=="Y" && review.state_cd !=2){ // 작성자만 자신이 작성한 비공개 후기를 볼 수 있다
        tmp += '<div class="review-list">'
        tmp += '<div class="list-side">'
        tmp += '<div class="side-headerbox">'
        if(review.user_idx=="${sessionScope.idx}"){
          tmp += '<div class="my-review">'
          tmp += '<span class="rank2">나의 후기</span>'
          if(review.opub_yn=='Y'){
            tmp += '<span class="rank3">공개</span>'
          }else if(review.opub_yn=='N'){
            tmp += '<span class="rank3">비공개</span>'
          }
          tmp += '</div>'
        }
        if(review.rnk_cd==2){   // 등급코드(2) 베스트
          // tmp += '<span class="rank2">베스트</span>'
        }else {                 // 등급코드(1) 일반
          tmp += '<span class="rank">일반</span>'
        }
        tmp += '<span class="name">'+review.writer+'</span>'
        tmp += '</div>'
        tmp += '</div>'
        tmp += '<article class="review-article">'
        tmp += '<div>'
        tmp += '<div class="article-title">'
        tmp += '<h3 class="article-name">'+review.name+'</h3>'
        tmp += '</div>'
        tmp += '<p class="article-content">'+review.ctent+'</p>'
        tmp += '<div class="article-footer">'
        tmp += '<div class="footer-box">'
        tmp += '<span class="article-date">'+moment(review.reg_tm).format("YYYY-MM-DD")+'</span>'
        // tmp += '<button class="thumbsUpBtn">'
        // tmp += '<span class="thumbsUp"></span>'
        // tmp += '<span>좋아요 '+review.like_cnt+'</span>'
        // tmp += '</button>'
        tmp += '</div>'
        tmp += '<button class="article-updateBtn" data-upload_path='+review.upload_path+' data-idx='+review.idx+' data-user_idx='+review.user_idx+'>후기수정</button>'
        tmp += '</div>'
        tmp += '</div>'
        tmp += '</article>'
        tmp += '</div>'
      }

    })
    return tmp;
  }

  // 상품 후기 페이징 뿌려주기
  let PageHandlerToHtml = function (ph){
    let tmp = '';
    // console.log(ph.sc.page);

    tmp += '<div class="paging">'
    if(ph.totalCnt==null || ph.totalCnt==0){
      tmp += '<div class="review-notice">'
      tmp += '<svg width="60" height="60" viewBox="0 0 68 68">'
      tmp += '<path class="heartpath" stroke="#e2e2e2" d="M57.025 14.975c-5.3-5.3-13.889-5.3-19.186 0L34 18.812l-3.837-3.837c-5.3-5.3-13.89-5.3-19.19 0-5.296 5.297-5.296 13.886 0 19.186l3.838 3.837 18.482 18.485a1 1 0 0 0 1.414 0s0 0 0 0l18.482-18.485h0l3.837-3.837c5.3-5.3 5.3-13.89 0-19.186z"></path>'
      tmp += '</svg>'
      tmp += '<strong class="strong-heart"> 게시물이 없습니다. </strong>'
      tmp += '</div>'

    }
    if(ph.showPrev){
      tmp += '<a class="page" data-page='+(ph.beginPage-1)+'>&lt;</a>'
    }
    for(let i=ph.beginPage; i<=ph.endPage; i++){
      if(i==ph.sc.page){
        tmp += '<a class="page active" data-page="'+i+'">'+i+'</a>'
      }else {
        tmp += '<a class="page" data-page="'+i+'">'+i+'</a>'
      }
    }
    if(ph.showNext){
      tmp += '<a class="page" data-page='+(ph.endPage+1)+'>&gt;</a>'
    }
    tmp += '</div>'

    return tmp;
  }

  // 상품후기 목록 조회 함수
  let showList = function (){
    $.ajax({
      type:'GET',                                                 // 요청 메서드 // 상품후기 목록 가저오기
      url: '/product/review/list?prod_idx='+prod_idx,             // 요청 URI
      // headers : { "content-type": "application/json"},         // 요청 헤더
      // dataType : 'text',                                       // 전송받을 데이터의 타입 / 생략하면 기본이 JSON 이다
      // data : JSON.stringify(person),                           // 서버로 전송할 데이터. stringify()로 직렬화 필요.
      success : function(result){
        $(".review-lists").html(ReviewListToHtml(result["list"]));      // 서버로부터 응답이 도착하면 호출될 함수
        $(".pageHandler-container").html(PageHandlerToHtml(result["pageHandler"]));
        $(".count").html(result["totalCnt"]);
      },
      error   : function(){ alert("error") }                      // 에러가 발생했을 때, 호출될 함수
    }); // $.ajax()

  }

  // 모달 닫기 함수
  let closeModal = function (){
    $('.content').val("");    // 작성 내용 빈칸으로 초기화
    $(".reviewUpdate-container").css("display", "none");
    $("body").css("overflow","visible");
  }
  // 모달 오픈 함수
  let openModal = function (){
    $(".reviewUpdate-container").css("display", "block");
    $("body").css("overflow","hidden");
  }


</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>