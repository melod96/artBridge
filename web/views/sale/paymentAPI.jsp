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
<input type="hidden" value="<%= totalPrice %>" name= "totalPrice" />
<!-- 결제api -->
	<script>
	{
		  "code": 0,
		  "message": null,
		  "response": {
		    "access_token": "fc9eca588ef8a8021ca79139df0cab2f01175634",
		    "now": 1537875426,
		    "expired_at": 1537877226
		  }
		}
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
	    m_redirect_url : 'http://127.0.0.1:8001/artBridge/paymentending.pg'
	}, function(rsp) {
	    if ( rsp.success ) {
	        /* var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num; */
	        /* jQuery.ajax({
				url:"/paymentending.pg",
				type:"post",
				headers: { "Content-Type": "application/json" },
				data:{ imp_uid : rsp.imp_uid,merchant_uid:rsp.merchant_uid,customer_no:customer_no,orders_no:orders_no,totalPrice:rsp.paid_amount},
				success:function(data){
					console.log("서버 전송 성공");
				},
				error:function(status, msg){
					console.log("서버 전송 실패");
				} */
				//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		    	jQuery.ajax({
		    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
		    		type: 'POST',
		    		dataType: 'json',
		    		data: {
			    		imp_uid : rsp.imp_uid,,merchant_uid:rsp.merchant_uid
			    		//기타 필요한 데이터가 있으면 추가 전달
		    		}
			}).done(function(data) {

		        console.log('호출끝남');

		        //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우

		        if ( rsp.success ) {

		          var msg = '결제가 완료되었습니다.';

		          msg += '\n고유ID : ' + rsp.imp_uid;

		          msg += '\n상점 거래ID : ' + rsp.merchant_uid;

		          msg += '\n결제 금액 : ' + rsp.paid_amount;

		          msg += '카드 승인번호 : ' + rsp.apply_num;



		          alert(msg);

		          window.location = '/'; //완료페이지로 이동

		        } else {

		          console.log('결제실패함');

		          //[3] 아직 제대로 결제가 되지 않았습니다.

		          //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.

		        }

		      }).fail(function (data) {

		         console.log("결제 fail");



		         window.location = '/payments/complete?id=' + rsp.imp_uid 

		        });

		    } else {

		      console.log('결제취소');

		        var msg = '결제에 실패하였습니다.';

		        msg += '에러내용 : ' + rsp.error_msg;



		        alert(msg);

		        window.history.go(-4); //실패

		    }

		          });

	</script>
</body>
</html>