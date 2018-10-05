<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.comvision.artBridge.member.model.vo.Member"%>


	<!-- 	* 마이페이지 탭 메뉴 -->
	<!--loginUser를 여기서 또 받으면 기존 header와 중복되서 오류나기 때문에
		여기선 loginUser를 선언하지 않는다. (Header와 함께 include한다는 조건하에) -->
	
		<section class="tit-area bg-yellow">	<!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
		<div class="container">
			<h2>마이 페이지</h2>
			<ul class="tab-menu">
<%-- 				<li><a href="<%= request.getContextPath() %>/selectTransList.ts" onclick="anotherHidden(this.id);" id="order-menu">주문관리</a></li> --%>
				<li><a href="<%= request.getContextPath() %>/selectTransList.ts" onclick="anotherHidden(this.id);" id="order-menu">주문관리</a></li>
				<li><a href="<%= request.getContextPath() %>/selectMsgAll.my?memberNo=<%=loginUser.getMember_no()%>" onclick="anotherHidden(this.id);" id="msg-menu">쪽지함</a></li>
				<li><a href="<%= request.getContextPath() %>/selectFavList.fv" onclick="anotherHidden(this.id);" id="bookmark-menu">관심작가</a></li>
				<li><a href="#" onclick="anotherHidden(this.id);" id="memberinfo-menu">회원정보수정</a></li>
				<% if(loginUser.getWriter_right() == 1){ %>
				<li><a href="selectPieceList.wr?memberNo=<%=loginUser.getMember_no() %>" onclick="anotherHidden(this.id);" id="mywork-menu"">내작품관리</a></li>
				<% } %>
			</ul>
		</div>
		</section>
		
		
	
<!-- 	//마이페이지 탭 메뉴 -->