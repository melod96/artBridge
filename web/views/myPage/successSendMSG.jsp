<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.comvision.artBridge.message.model.vo.*,com.comvision.artBridge.admin.model.vo.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Art Bridge</title>
<%@ include file="/views/common/head.jsp"%>
<style>
ul.tab-menu li>a:hover { background: darkgray; }
</style>
</head>
<body>
	<div id="all">

		<!-- Header -->
		<%@ include file="/views/common/header.jsp"%>
		<!-- // Header -->

		<%@ include file="/views/common/adminHeader.jsp"%>



		<!-- 주석 영역 -->
		<div align="center">
		<h2>전송 완료</h2>
		<br>
		<br>
		
			<button type="reset" id="backPageBtn" name="searchBtn" class="btn btn-primary btn-lg" style="padding: 2px 30px; background: gray;  margin-right: 10px; margin-bottom:30px;"
				onclick = 'location.href="/artBridge/selectMsgAll.my?memberNo=<%= loginUser.getMember_no() %>"'>목록으로 이동</button>
		</div>
		<!-- // 주석 영역 -->

		<!-- Footer -->
		<%@ include file="/views/common/footer.jsp"%>
		<!-- // Footer -->


	</div>
	
	
</body>
</html>