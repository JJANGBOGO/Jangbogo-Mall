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
            <span id="prod-dc">${list.dc_rate}%</span>
            <span id="prod-price"></span>
            <span id="prod-unit">원</span>
          </h2>
          <span id="defore-dc">
              <span class="defore-dc-span"></span>원
            </span>
          <div id="info-table" class="css-iqoq9n e6qx2kx2">
            <div class="seller">
              <div class="sellerColumn">판매자</div>
              <div class="seller-info">
                <p class="seller-name">컬리</p>
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
                        <span class="m-price-origin"><span class="m-price-origin-span"></span>원</span>
                        <span class="m-price-dc"><span class="m-price-dc-span"></span>원</span>
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
                    <i class="fa-regular fa-heart"></i>
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

          </div>
        </div>
        <div id="detail">

        </div>
        <div id="review"></div>
        <div id="inquiry">
          <div class="prodInqry-wrap">
            <div class="prodInqry">
              <button class="open-modal"><span>문의하기</span></button>
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
                    </div>
                  </div>
                  <div class="inqry_content">
                    <div class="content">
                      <span>내용</span>
                    </div>
                    <div class="content_input">
                      <input id="modal-ctent" type="text" />
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
              <div class="inqry-notice-wrap">
                <div class="inqry-notice">
                  <div class="notice_title">
                    <span id="notice-title-span">공지</span>
                  </div>
                  <div class="text">
                    <span>공지내용</span>
                  </div>
                </div>
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
  <div id="prod_idx">${prod_idx}</div>
  <div id="sessionID" style="display: none">${session_idx}</div>
  <div class="footer"></div>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script src="https://kit.fontawesome.com/cc28ed1241.js" crossorigin="anonymous"></script>
<script>

  let showDescription = function(prod_idx) {
    $.ajax({
      type: 'GET',
      url: '/product/productDetail/description?prod_idx='+prod_idx,
      success: function(result) {
        $('.description-wrap').html(DescriptionToList(result));
      },
      error: function() { alert("GET description Error") }
    })
  }

  let DescriptionToList = function(fileLists) {
    let tmp = "";
    fileLists.forEach(function(fileList){
      tmp += ''
    })
  }

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
    let finalNum = number - number * (dcRate / 100);
    let withComma = finalNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

    return withComma;
  }

  let packingTypeToString = function() {
    let packingType = $('.packing-name').text();
    // let packingType = "Hello,miso"
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
    let prod_idx = $('#prod_idx').text();
    showInqryList(prod_idx);
    showProdDetailList(prod_idx);
    packingTypeToString();
    showImage();
    showDescription(prod_idx);
    showDetail(prod_idx);
    prodInqryImage();

    $('.cartBtn').click(function() {
      let prod_cnt = $('.num').text();

      $.ajax({
        type: 'POST',
        url: '/cart?prod_idx='+prod_idx+'&prod_cnt='+prod_cnt,
        success: function(result) {
          alert(result);
        },
        error: function() {alert("수정권한이 없습니다")}
      })
    })

    $('.wishlistBtn').click(function(e) {
      let value = $('.wishlistBtn').data('heart');
      // console.log("value="+value);
      let changedVal = "";
      if(value == "empty") {
        let classi = $('.wishlistBtn').find('i').attr('class', 'fa-solid fa-heart'); //클래스 이름을 변경해줘 //이미지를 바꿔줘
        console.log("classi="+classi);
        $('.wishlistBtn').data('heart', "full"); //dataset 값을 변경해줘
        // value = $('.wishlistBtn').data('heart');
      } else if (value == "full" ){
        $('.wishlistBtn').find('i').attr('class', 'fa-regular fa-heart'); //이미지를 바꿔줘
        $('.wishlistBtn').data('heart', "empty");
        // changedVal = $('.wishlistBtn').data('heart');
      }

      $.ajax({
        type: 'POST',
        url: '/wishlist?prod_idx='+prod_idx,
        success: function(result) {
          alert(result);
        },
        error: function() {alert("수정권한이 없습니다")}
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
      console.log(num);
      if(!(num < 2)){
        let minusNum = num - 1;
        console.log("minusNum="+minusNum)
        console.log(typeof minusNum);
        $('.num').text(minusNum);
        console.log("typeof=="+typeof $('.num').text());
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
      $(".modal").css("display", "none");

      $("input[id=modal-title]").val("");
      $("input[id=modal-ctent]").val("");
      $("input[type=checkbox]").prop("checked", false);
      return;
    })

    $(".closeBtn").click(function() {
      $(".modal").css("display", "none");

      $("input[id=modal-title]").val("");
      $("input[id=modal-ctent]").val("");
      $("input[type=checkbox]").prop("checked", false);

      return;
    })

    $(".open-modal").click(function(e) {
      target = $(e.target);
      let p = $(target).offset();

      let divTop = p.top + 400;
      let divLeft = p.left - 500;

      $('#modal-body').css({"z-index": '10', "top": divTop, "left": divLeft, "position": "absolute"}).show();


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

    // $("#sendBtn").click(function() {
    $(".inqry_button").on("click", "#sendBtn", function() {
      let ctent = $("input[id=modal-ctent]").val();
      let title = $("input[id=modal-title]").val();
      let prod_idx = $('#prod_idx').text();

      if(title.trim()=='') {
        alert("제목을 입력해주세요");
        $("input[id=modal-title]").focus();
        return;
      }

      if(ctent.trim()=='') {
        alert("내용을 입력해주세요");
        $("input[id=modal-ctent]").focus();
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
      $("input[id=modal-ctent]").val("");
    });

    // 동적으로 생성되는, 문의에 달려있는 "수정" 버튼을 누르면
    $("#table").on("click", ".modBtn", function(e) {

      target = $(e.target).closest("tr");
      let p = $(target).offset();

      let divTop = p.top + 0;
      let divLeft = p.left + 350;

      $('#modal-body').css({"z-index": '10', "top": divTop, "left": divLeft, "position": "absolute"}).show();

      let user_idx = $(this).closest("tr").attr("data-user_idx");
      //수정 버튼이 포함되어 있는 tr 라인 안에 들어있는 idx를 가져온다.
      //title과 ctent의 내용들도 가져와서 변수에 담는다.
      let idx = $(this).closest("tr").attr("data-idx");
      let ctent = $(this).closest("tr").children().children().children().find('div:eq(1)[name=text]').children().text();
      let inquiry_idx = $(this).closest("tr").attr("data-idx");
      let dtoArr = $(".modBtn").closest("tr").siblings("tr[data-idx=" + inquiry_idx + "]");
      let title = dtoArr[0].dataset.title;

      if(user_idx != $('#sessionID').text()) {
        alert("수정권한이 없습니다.");
        return;
      }

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
      $("input[id=modal-ctent]").val(ctent);

      //모달이 열린다.
      $(".modal").css("display", "block");

    });

    $(".inqry_button").on("click", "#modBtn", function() {

      //속성 data-idx의 값을 저장한다.
      let idx = $(this).attr("data-idx");
      console.log("id 수정 버튼을 눌렀을 때 = "+idx);
      //동일하게 불러온 정보를 변수에 저장한다.
      let newTitle = $("input[id=modal-title]").val();
      let newCtent = $("input[id=modal-ctent]").val();
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
        error: function() {alert("수정권한이 없습니다")}
      })
      //모달을 안보이게 한다.
      $(".modal").css("display", "none");

      //input란에 있던 정보를 없앤다
      $("input[id=modal-title]").val("");
      $("input[id=modal-ctent]").val("");

      let inqryButton = $(".inqry_button");
      console.log("inqryButton = "+ inqryButton)
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
      if(user_idx != $('#sessionID').text()) {
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
  });

  let InqrytoHtml = function(inqrys) {  //GetMapping통해서 정보 들어온다.

    let tmp = "<tbody>";
    tmp += "<tr>";
    tmp += "<th>제목</th>";
    tmp += "<th>작성자</th>";
    tmp += "<th>작성일</th>";
    tmp += "<th>답변상태</th></tr>";



    inqrys.forEach(function(inqry) {
      // console.log(inqry.res_state_cd);
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
      // console.log("?????", now24Date)


      tmp += '<tr id="noticeBlock" data-idx=' + inqry.idx
      tmp += ''
      tmp += ' data-prod_idx=' + inqry.prod_idx
      tmp += ' data-title=' + inqry.title
      tmp += ' data-ctent='+ inqry.ctent
      tmp += ' data-opub_yn='+ inqry.opub_yn + '>'
      tmp += '<td id="noticeBlock-title" class="title" data-opub_yn=' + inqry.opub_yn + '><span id="title-text">' + inqry.title + '</span></td>'
      tmp += '<td class="name" data-user_idx=' + inqry.user_idx + '>' + inqry.writer + '</td>'
      tmp += '<td class="reg_date" >' + now24Date+ '</td>'
      tmp += '<td id="res-state-cd" class="response_state" >'+res_state_cd+'</td>'
      tmp += '</tr>'
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
      tmp +=    '<button class="modBtn">수정</button>'
      tmp +=    '<button class="delBtn">삭제</button>'
      tmp += '</div>'
      tmp += '</div>'
      tmp += '</div>'
      tmp += '</td>'
      tmp += '</tr>'
    })
    return tmp += "</tbody>";
  }
</script>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>
