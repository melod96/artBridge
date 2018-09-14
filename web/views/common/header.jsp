<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.comvision.artBridge.member.model.vo.Member"%>
<%
	Member loginUser = null;
	if(session.getAttribute("loginUser") != null){
		loginUser = (Member)session.getAttribute("loginUser");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--  -->

<title>Insert title here</title>
</head>
<body>

	<!-- Header -->
	<header>
	<div class="navbar-affixed-top" data-spy="affix" data-offset-top="200">
		<div class="navbar navbar-default yamm" role="navigation" id="navbar">

			<div class="container">
				<div class="navbar-header">
					<!-- 로고 -->
					<a class="navbar-brand home" href="../main/main.jsp"> <img
						src="/artBridge/image/logo.png" alt="Art Bridge logo">
					</a>
					<!-- // 로고 -->
					<!-- 토글버튼 -->
					<div class="navbar-buttons">
						<button type="button" class="navbar-toggle btn-template-main"
							data-toggle="collapse" data-target="#navigation">
							<span class="sr-only">Toggle navigation</span> <i
								class="fa fa-align-justify"></i>
						</button>
					</div>
					<!-- // 토글버튼 -->
				</div>
				<!-- 메뉴영역 -->
				<div class="navbar-collapse collapse" id="navigation">
					<ul class="nav navbar-nav navbar-right">
						<li class=""><a onclick = "location.href='/artBridge/selectList.bo'">일러스트 </a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle">이용안내</a>
							<ul class="dropdown-menu">
								<li><a href="../info/infoUseRequester.jsp"> 의뢰자 이용안내</a></li>
								<li><a href="../info/infoUseArtist.jsp">작가 이용안내</a></li>
								<li><a href="../info/infoUseOther.jsp">환불규정 및 유의사항</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle">고객센터</a>
							<ul class="dropdown-menu">
								<li><a href="../faq/faq_requester.jsp">자주하는 질문</a></li>
								<li><a href="../notice/noticeBoard.jsp">공지사항</a></li>
								<li><a href="#">광고상품 안내</a></li>
							</ul></li>

						<!-- 비로그인시 노출 -->
						<% if(loginUser == null){ %>
						<li><a href="#" data-toggle="modal"
							data-target="#login-modal" class="login"><span class="hidden-xs text-uppercase">로그인</span></a>
						</li>
						<li><a href="../member/joinForm.jsp" class="join">회원가입</a></li>
						<!-- // 비로그인시 노출 -->
						<% }else{ %>
						<!-- 로그인시 노출 -->
						<li class="dropdown"><a href="#"
							class="login dropdown-toggle">마이페이지</a>
							<ul class="dropdown-menu">
								<li><a href="#">마이페이지</a></li>
								<li><a href="#">쪽지함</a></li>
								<li><a href="#">주문 관리</a></li>
								<li><a href="#">회원 정보 수정</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="join dropdown-toggle"><%= loginUser.getNick_name() %>님</a>
							<ul class="dropdown-menu">
								<li><a href="<%= request.getContextPath() %>/logout.me">로그아웃</a></li>
							</ul></li>
						<li><a href="#" class="msg"> <span
								class="glyphicon glyphicon-envelope"></span> <span
								class="msg-num on">1</span>
						</a></li>
						<% } %>
						<!-- //로그인시 노출 -->
					</ul>
				</div>
				<div class="collapse clearfix" id="search">
					<form class="navbar-form" role="search">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search">
							<span class="input-group-btn">
								<button type="submit" class="btn btn-template-main">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</header>
	<!-- // Header -->

	<!-- Modal -->

	<%@ include file="loginModal.jsp" %>
	
	<!-- // Modal -->

</body>
</html>