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
<!-- 결제api -->
	<script>
	var IMP = window.IMP; // 생략가능
	IMP.init('imp37293980'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	IMP.request_pay({
	    pg : 'html5_inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '아트브릿지',
	    amount : <%= totalPrice%>,
	    buyer_email : '<%=customer_email%>',
	    buyer_name : '<%=bank_name%>',
	    buyer_tel : '<%=customer_phone%>',
	    m_redirect_url : 'http://127.0.0.1:8001/artBridge/paymentending.pg'
	}, function(rsp) {
		if (rsp.success) {
			$("#imp_id").val(rsp.imp_uid);
			$("#apply").val(rsp.apply_num);
			document.getElementById("payb").click();
			System.out.println(rsp.imp_uid);
			System.out.println(rsp.apply_num);
	    } else {
	    	alert("결제 취소");
	        location.href="<%= request.getContextPath()%>/selectTransList.ts";
	    }
	});

	</script>
<form action="<%=request.getContextPath()%>/paymentending.pg" method ="post" name="pay">
<input type="hidden" value = "<%= customer_no %>" name="customer_no" />
<input type="hidden" value = "<%= orders_no %>" name = "orders_no" />
<input type="hidden" value="<%= totalPrice %>" name= "totalPrice" />
<input type="hidden" name = "imp_uid" id= "imp_id" />
<input type="hidden" name = "apply_num" id = "apply" />
<input type="submit" id= "payb"/>
</form>
	
</body>
</html>