<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Art Bridge</title>
<style>
ul.tab-menu li>a:hover {
	background: darkgray;
}
</style>
<%@ include file="/views/common/head.jsp"%>
</head>
<body>
<section class="tit-area bg-yellow"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
            <div class="container">
                <h2>관리자 페이지</h2>
                <ul class="tab-menu">
                    <li><a onclick = "location.href='<%= request.getContextPath() %>/selectMain.ad'">메인관리 </a></li>
                    <li><a href="/artBridge/views/admin/commissionAdmin.jsp">커미션 관리</a></li>
                    <li><a href="/artBridge/views/admin/customerQna.jsp" >고객문의 관리</a></li>
                    <li><a href="/artBridge/views/admin/memberAdmin.jsp">회원 관리</a></li>
                    <li><a href="/artBridge/views/admin/transactionAdmin.jsp">거래내역 관리</a></li>
                    <li><a href="/artBridge/views/admin/noticeInsertForm.jsp">공지사항</a></li>
                </ul>
            </div>
        </section>
</body>
</html>