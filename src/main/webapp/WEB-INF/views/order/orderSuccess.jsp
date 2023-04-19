<%--
  Created by IntelliJ IDEA.
  User: jiwoo
  Date: 2023/04/17
  Time: 1:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>카카오페이 승인</title>
    </head>
    <body>
        카카오페이 결제가 정상적으로 완료되었습니다.<br/><br/>

        결제일시:     ${model.approved_at}<br/>
        주문번호:    ${model.partner_order_id}<br/>
        상품명:    ${model.item_name}<br/>
        상품수량:    ${model.quantity}<br/>
        결제금액:    ${model.amount.total}<br/>
        결제방법:    ${model.payment_method_type}<br/>
    </body>
</html>
