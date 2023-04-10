<%--
  Created by IntelliJ IDEA.
  User: qpwo3
  Date: 2023-04-08
  Time: 오후 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <style>
    .modal {
      position: absolute;
      top: 0;
      left: 0;

      width: 100%;
      height: 100%;

      display: none;

      background-color: rgba(0, 0, 0, 0.4);
    }

    .modal.show {
      display: block;
    }

    .modal_body {
      position: absolute;
      top: 50%;
      left: 50%;

      width: 400px;
      height: 600px;

      padding: 40px;

      text-align: center;

      background-color: rgb(255, 255, 255);
      border-radius: 10px;
      box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

      transform: translateX(-50%) translateY(-50%);
    }

  </style>
</head>
<body>
<button class="open-modal-btn">문의작성하기</button>
<div class="modal">
  <form class="modal_body">
    title: <input type="text" name="title"><br>
    content: <input type="text" name="ctent"/><br/>
    writer: <input type="text" name="writer"><br>
    답변상태: <input type="number" name="res_state_cd" min="1" max="2"><br>
    공개여부: <input type="text" name="opub_yn"><br>
    <button id="sendBtn" type="button">등록</button>
    <button id="modBtn" type="button">수정</button>
  </form>
</div>

<div id="prodInqryList"></div>
<script>
  let prod_idx = 1;
  let showList = function(prod_idx) {
    $.ajax({
      type:'GET',       // 요청 메서드
      url: '/products?prod_idx='+prod_idx,  // 요청 URI
      success : function(result){
        $("#prodInqryList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
      },
      error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
    }); // $.ajax()
  }

  $(document).ready(function(){
    showList(prod_idx);

    $("#modBtn").click(function(){
      let idx = $(this).attr("data-idx")

      let ctent = $("input[name=ctent]").val();
      let title = $("input[name=title]").val();
      let writer = $("input[name=writer]").val();
      let res_state_cd = $("input[name=res_state_cd]").val();
      let opub_yn = $("input[name=opub_yn]").val();



      $.ajax({
        type:'PATCH',       // 요청 메서드
        url: '/products/'+idx,  // 요청 URI   // /product?prod_idx=1 POST
        headers : { "content-type": "application/json"}, // 요청 헤더
        data : JSON.stringify({idx:idx, title:title, ctent:ctent, opub_yn:opub_yn}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
        success : function(result){
          alert(result)
          showList(prod_idx); //갱신된 게시물 보여준다.
        },
        error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
      }); // $.ajax()
    });

    $("#sendBtn").click(function(){
      let ctent = $("input[name=ctent]").val();
      let title = $("input[name=title]").val();
      let writer = $("input[name=writer]").val();
      let res_state_cd = $("input[name=res_state_cd]").val();
      let opub_yn = $("input[name=opub_yn]").val();



      $.ajax({
        type:'POST',       // 요청 메서드
        url: '/products?prod_idx='+prod_idx,  // 요청 URI   // /product?prod_idx=1 POST
        headers : { "content-type": "application/json"}, // 요청 헤더
        data : JSON.stringify({prod_idx:prod_idx, title:title, ctent:ctent, writer:writer, res_state_cd:res_state_cd, opub_yn:opub_yn}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
        success : function(result){
          alert(result)
          showList(prod_idx); //갱신된 게시물 보여준다.
        },
        error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
      }); // $.ajax()
    });

    $("#prodInqryList").on("click", ".modBtn", function() {

      let idx = $(this).parent().attr("data-idx");
      let ctent = $("span.ctent", $(this).parent()).text();
      let title = $("span.title", $(this).parent()).text();
      let writer = $("span.writer", $(this).parent()).text();
      let opub_yn = $("span.opub_yn", $(this).parent()).text();


      //ctent의 내용 input에 전달
      $("input[name=ctent]").val(ctent);
      $("input[name=title]").val(title);
      $("input[name=writer]").val(writer);
      $("input[name=opub_yn]").val(opub_yn);

      //idx전달하기
      $("#modBtn").attr("data-idx", idx);
    });

    $("#prodInqryList").on("click", ".delBtn", function() { //prodInqryList 안에 있는 delBtn에 click 이벤트를 건다.
      let idx = $(this).parent().attr("data-idx");
      let prod_idx = $(this).parent().attr("data-prod_idx");

      $.ajax({
        type:'DELETE',       // 요청 메서드
        url: '/products/'+idx+'?prod_idx='+prod_idx,  // 요청 URI
        success : function(result){
          alert(result);
          showList(prod_idx);
        },
        error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
      }); // $.ajax()
    })
  });

  const modal = document.querySelector(".modal");
  const modalBtn = document.querySelector(".open-modal-btn");
  const body = document.getElementsByTagName("body");
  modalBtn.addEventListener("click", function() {
    modal.classList.toggle('show');
    if(modal.classList.contains('show')) {
      body.style.overflow = 'hidden';
    }
  });
  modal.addEventListener("click", (e)=>{
    if(e.target === modal) {
      modal.classList.toggle('show')
      if(!modal.classList.contains('show')) {
        body.style.overflow='auto';
      }
    }
  });

  let toHtml = function(inqrys) {
    let tmp = "<ul>";

    inqrys.forEach(function(inqry) {
      tmp += '<li data-idx=' + inqry.idx
      tmp += ' data-prod_idx=' + inqry.prod_idx + '>'
      tmp += ' title=<span class="title">' + inqry.title + '</span>'
      tmp += ' ctent=<span class="ctent">' + inqry.ctent + '</span>'
      tmp += ' writer=<span class="writer">' + inqry.writer + '</span>'
      tmp += ' res_state_cd=' + inqry.res_state_cd
      tmp += ' opub_yn=<span class="opub_yn">' + inqry.opub_yn + '</span>'
      tmp += ' wrt_tm=' + inqry.wrt_tm
      tmp += '<button class="delBtn">삭제</button>'
      tmp += '<button class="modBtn open-modal-btn">수정</button>'
      tmp += '</li>'
    })
    return tmp += "</ul>";
  }
</script>
</body>
</html>
