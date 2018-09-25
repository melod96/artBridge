<%@page import="jdk.management.resource.internal.TotalResourceContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int totalPrice = (int)request.getAttribute("totalPrice");
	String customer_email = (String)request.getAttribute("customer_email");
	String customer_phone = (String)request.getAttribute("customer_phone");
	String bank_name = (String)request.getAttribute("bank_name");
	int customer_no = (int)request.getAttribute("customer_no");
	int orders_no = (int)request.getAttribute("orders_no");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="/views/common/head.jsp"%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
body{padding:none;}
</style>
</head>
<body>
<input type="hidden" value = "<%= customer_no %>" name="customer_no" />
<input type="hidden" value = "<%= orders_no %>" name = "orders_no" />
<!-- 결제api -->
	<script>
	var IMP = window.IMP; // 생략가능
	IMP.init('imp37293980'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	IMP.request_pay({
	    pg : 'html5_inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '아트브릿지',
	    amount : <%=totalPrice%>,
	    buyer_email : '<%=customer_email%>',
	    buyer_name : '<%=bank_name%>',
	    buyer_tel : '<%=customer_phone%>',
	    buyer_addr : '서울특별시 강남구 역삼동',
	    buyer_postcode : '123-456',
	    m_redirect_url : 'http://127.0.0.1:8001/artBridge/paymentending.pg'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        $.ajax({
				url:"paymentending.pg",
				type:"post",
				headers: { "Content-Type": "application/json" },
				data:{customer_no:customer_no,orders_no:orders_no,totalPrice:totalPrice},
				success:function(data){
					console.log("서버 전송 성공");
				},
				error:function(status, msg){
					console.log("서버 전송 실패");
				}
			}).done(function (data) {

	        })
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
	</script>
</body>
</html>