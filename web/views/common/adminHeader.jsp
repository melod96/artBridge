<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
ul.tab-menu li>a:hover {
	background: darkgray;
}
</style>

<%
	String pageName = "";
	if(request.getParameter("pageName") != null){
		pageName = request.getParameter("pageName");
	}
%>

<script>
	$(function(){
		<% switch(pageName){
			case "mainAdmin" : %>
			$("#mainAdmin").css({"background":"white", "color":"black"});
		<% break;
			case "commissionAdmin" :%>
			$("#commissionAdmin").css({"background":"white", "color":"black"});
		<% break; 
			case "memberAdmin" : %>
			$("#memberAdmin").css({"background":"white", "color":"black"});
		<% break;
			case "customerAdmin" : %>
			$("#customerAdmin").css({"background":"white", "color":"black"});
			<% break;
			case "customerQna" : %>
			$("#customerAdmin").css({"background":"white", "color":"black"});
			<% break;
			case "transactionAdmin" : %>
			$("#transactionAdmin").css({"background":"white", "color":"black"});
			<% break;
			default : %>
			$("#mainAdmin").css({"background":"white", "color":"black"});
		<% break;
		} %>
	});
</script>

<section class="tit-area bg-yellow"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
	<div class="container">
		<h2>관리자 페이지</h2>
		<ul class="tab-menu">
		<li><a onclick = "location.href='<%= request.getContextPath() %>/selectMain.ad?pageName=mainAdmin'" id="mainAdmin">메인관리 </a></li>
		<li><a onclick="location.href='<%= request.getContextPath() %>/selectCommision.ad?pageName=commissionAdmin'" id="commissionAdmin">커미션 관리</a></li>
		<li><a href="/artBridge/views/admin/customerAdmin.jsp" id="customerAdmin">고객문의 관리</a></li>
		<li><a onclick = "location.href='<%= request.getContextPath() %>/selectMemberListClone.ad?pageName=memberAdmin'" id="memberAdmin">회원 관리</a></li>
		<li><a onclick = "location.href='<%= request.getContextPath() %>/selectTrs.ad?pageName=transactionAdmin'" id="transactionAdmin">거래내역 관리</a></li>
		<li><a href="/artBridge/views/admin/noticeInsertForm.jsp">공지사항</a></li>
		<li><a onclick = "location.href='<%= request.getContextPath() %>/selectRating.ad?pageName=ratingAdmin'" id="ratingAdmin">등급 관리</a></li>
		</ul>
	</div>
</section>
