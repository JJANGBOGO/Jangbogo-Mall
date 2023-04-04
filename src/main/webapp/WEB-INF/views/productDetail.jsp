<%--
  Created by IntelliJ IDEA.
  User: qpwo3
  Date: 2023-04-03
  Time: 오후 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <table board="1">
    <tr>
      <th>제목</th>
      <th>작성자</th>
      <th>작성날짜</th>
      <th>답변상태</th>
    </tr>
    <c:forEach var="prodInqryDtoEl" items="${prodInqryDto}">
      <tr>
        <td>${prodInqryDtoEl.title}</td>
        <td>${prodInqryDtoEl.writer}</td>
        <td><fmt:formatDate value="${prodInqryDtoEl.wrt_tm}" pattern="yyyy.MM.dd" type="date"/></td>
        <td>${prodInqryDtoEl.res_state_cd}</td>
      </tr>
    </c:forEach>
  </table>

</body>
</html>
