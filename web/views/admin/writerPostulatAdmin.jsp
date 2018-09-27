<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.comvision.artBridge.member.model.vo.*"%>
	<%
	ArrayList<Member> list = null;
	if(request.getAttribute("list") != null){
		list = (ArrayList<Member>)request.getAttribute("list");
	}
	%>
	<%-- <%
	ArrayList<Transaction> list = null; 
	if((ArrayList<Transaction>)request.getAttribute("list") != null){
		list = (ArrayList<Transaction>)request.getAttribute("list");
	}
	

	int num = (int)request.getAttribute("num");
	String value="";
	
		if(num == 0){
			value = (String)request.getAttribute("value");
			}
		
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); 
	%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Art Bridge</title>
<%@ include file="/views/common/head.jsp"%>
<style>
ul.tab-menu li>a:hover {
	background: darkgray;
}

hr{
border-color:darkgray;

}

</style>
</head>
<body>
	<div id="all">

		<!-- Header -->
		<%@ include file="/views/common/header.jsp"%>
		<!-- //Header -->
		
		<%@ include file="/views/common/adminHeader.jsp"%>

		<!-- 주석 영역 -->
		<div class="contents">
			<!-- contents 필수 사용 -->
			<div class="container">
				<!-- container 필수 사용 -->
				<div class="col-md-12">
					<div class="heading">
						<h2>작가 전환</h2>
					</div>
					
					<br>

					<br>
					<br>
					
					<div style="height:900px; width:1000px; border:1px solid gray; margin:auto; padding-top:80px; padding-left:50px; padding-right:50px;">
						
						<h3 style="text-align:center;">작 가 &nbsp; 회 원 &nbsp; 전 환 &nbsp; 신 청</h3>
						<br>
						<br>
						<br>
							<%if(list != null){for(Member m : list){%>
						<label style="font-size:20px; float:left;">*&nbsp;ID&nbsp;:&nbsp;<a><%=m.getId() %></a></label>
						<label style="font-size:20px; float:right;">*&nbsp;닉네임&nbsp;:&nbsp;<a><%=m.getNick_name() %></a></label>
						<br>
						<br>
						<label style="font-size:20px; float:left;">*&nbsp;은행명&nbsp;:&nbsp;<a><%=m.getBank() %></a></label>
						<label style="font-size:20px; float:right;">*&nbsp;계좌번호&nbsp;:&nbsp;<a><%=m.getAccount() %></a></label>
						
						<br>
						<br>
						<br>
						<hr>
						<br>
							<div style="height:292px; width:292px; border:1px solid gray; float:left;"></div>
							<div style="height:292px; width:292px; border:1px solid gray; float:left; margin-left:10px;"></div>
							<div style="height:292px; width:292px; border:1px solid gray; float:left; margin-left:10px;"></div>
							<p style="color:gray;">* 작가 등록을 위한 관리자 승인용 이미지 파일<p>
							
						<br>
						<br>
						<br>
							
						<div>
						<button type="button" name="mainBtn"
							class="btn btn-danger btn-lg" onclick="del();" id="del" style="float:right;">취소</button>
						<button type="button" name="mainBtn"
							class="btn btn-primary btn-lg" onclick="add();" id="add" style="float:right; margin-right:10px;"
							>승인</button>
							</div>
					</div>
					<% }} %>
				
					
	              
	              <!--페이징 search -->
	             <%--  
					<div class="paginate">
						<a onclick="location.href='<%=request.getContextPath()%>/selectTrs.ad?currentPage=<%=currentPage%>&value=<%=value%>'" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a> 
						<% if(currentPage <=1){ %>
							<a disabled class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a> 
						<%}else{ %>
							<a onclick = "location.href='<%= request.getContextPath()%>/selectTrs.ad?currentPage=<%=currentPage -1%>&value=<%=value%>'" class="btn-prev" title="이전">
							<em class="blind">목록에서 이전 페이지 이동</em></a>
						<%} %>
						<span class="paging-numbers">
							<% for(int p = startPage; p <=endPage;p++){
								if(p==currentPage){%>
									<a disabled class="on"><%=p %><span class="blind">페이지로 이동</span></a>
								<%}else{ %>
									<a onclick= "location.href='<%= request.getContextPath()%>/selectTrs.ad?currentPage=<%=p%>&value=<%=value%>'"><%= p %><span class="blind">페이지로 이동</span></a>
								<%} %>
							<%} %>
						</span>
						<% if(currentPage >= maxPage){ %>
							<a disabled class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%}else{ %>
							<a onclick = "location.href = '<%= request.getContextPath()%>/selectTrs.ad?currentPage=<%=currentPage +1%>&value=<%=value%>'" class="btn-next" title="다음">
							<span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%} %>
						
						<a onclick = "location.href = '<%= request.getContextPath()%>/selectTrs.ad?currentPage=<%=maxPage%>&value=<%=value%>'" class="btn-last" title="끝">
						<span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
					</div>
					
	              <!--//페이징 search -->
	              
	              <%}else{ %> --%>
	              
	              <!--페이징 normal -->
	              
				<%-- 	<div class="paginate">
						<a onclick="location.href='<%=request.getContextPath()%>/selectTrs.ad?currentPage=1'" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a> 
						<% if(currentPage <=1){ %>
							<a disabled class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a> 
						<%}else{ %>
							<a onclick = "location.href='<%= request.getContextPath()%>/selectTrs.ad?currentPage=<%=currentPage -1%>'" class="btn-prev" title="이전">
							<em class="blind">목록에서 이전 페이지 이동</em></a>
						<%} %>
						<span class="paging-numbers">
							<% for(int p = startPage; p <=endPage;p++){
								if(p==currentPage){%>
									<a disabled class="on"><%=p %><span class="blind">페이지로 이동</span></a>
								<%}else{ %>
									<a onclick= "location.href='<%= request.getContextPath()%>/selectTrs.ad?currentPage=<%=p%>'"><%= p %><span class="blind">페이지로 이동</span></a>
								<%} %>
							<%} %>
						</span>
						<% if(currentPage >= maxPage){ %>
							<a disabled class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%}else{ %>
							<a onclick = "location.href = '<%= request.getContextPath()%>/selectTrs.ad?currentPage=<%=currentPage +1%>'" class="btn-next" title="다음">
							<span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%} %>
						
						<a onclick = "location.href = '<%= request.getContextPath()%>/selectTrs.ad?currentPage=<%=maxPage%>'" class="btn-last" title="끝">
						<span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
					</div>
					 
		 	   <%} %>	      --%>         

	              <!--//페이징 normal -->
	              
			
					<br> <br>
				</div>
			</div>
		</div>

		<!-- // 주석 영역 -->

		<!-- Footer -->
		<%@ include file="/views/common/footer.jsp"%>
		<!-- // Footer -->
		

	</div>

    </div>
  </div>
 </div> 
</body>
</html>