<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.comvision.artBridge.fBoard.model.vo.*"%>
<% 
/* 	ArrayList<FreeBoard> list= (ArrayList<FreeBoard>)request.getAttribute("list"); */
ArrayList<FreeBoard> list = null; 
if(request.getAttribute("list") != null){
	list = (ArrayList<FreeBoard>)request.getAttribute("list");
}

	String search="";
		
	PageInfo pi = null;
	int listCount = 0;
	int currentPage = 0;
	int maxPage = 0;
	int startPage = 0;
	int endPage = 0;
	if(request.getAttribute("pi") != null){
		pi = (PageInfo)request.getAttribute("pi");
		listCount = pi.getListCount();
		currentPage = pi.getCurrentPage();
		maxPage = pi.getMaxPage();
		startPage = pi.getStartPage();
		endPage = pi.getEndPage();
	
		}
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Art Bridge</title>
	<%@ include file="/views/common/head.jsp" %>
    <style type="text/css">
      .heading{margin-bottom:20px !important;}
      .paginate{margin-bottom:50px;}
      .tbl-type01 input{display:inline-block;}
      .tbl-type01 button{width:80px;}
      .btn-right{text-align:right; margin:30px 0 10px;}
      .btn-right button{position:relative; top:0;}
      .tbl-type02 .tit{text-align:left; padding:12px; cursor:pointer;}
    </style>
    <script>
    	
		
    </script>
</head>
<body>
    <div id="all">
       
        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
        <!-- // Header -->

        <!-- contents area -->
        <div class="contents">
        <section class="tit-area" style="background:#bb85cf"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
            <div class="container">
                <h2 class="tit1">자유게시판</h2>
            </div>
        </section>
            <div class="container">
                <div class="col-md-12">
	             
	                
		             <form action="<%=request.getContextPath()%>/searchFree.fb" method="get">
		                <!-- 검색 테이블 영역 -->
		                <table class="tbl-type01">
		                    <colgroup>
		                        <col style="width: 200px;">
		                        <col style="width: *">
		                    </colgroup>
		                    <tbody>
		                        <tr>
		                            <th>제목검색</th>
		                            <td>
		                              <input name="search" class="form-control input-mid" type="text" placeholder="검색할 제목을 입력하세요">
		                              <button type="submit" class="btn btn-primary" style="display:inline-block; margin-top:0px;">검색</button>
		                            </td>
		                        </tr>
		                    </tbody>
		                </table>
	                	<!-- // 검색 테이블 영역 -->
		                <!-- 공지사항 리스트  -->
		                <table class="tbl-type02 table-hover">
		                    <colgroup>
		                        <col style="width: 80px;">
		                        <col style="width: *px;">
		                        <col style="width: 150px">
		                        <col style="width: 80px;">
		                         <col style="width: 150px;">
		                    </colgroup>
		                    <thead>
		                        <tr>
		                            <th scope="col">NO</th>
		                            <th scope="col">글제목</th>
		                            <th scope="col">작성자</th>
		                            <th scope="col">조회수</th>
		                            <th scope="col">작성일</th>
		                        </tr>
		                    </thead>
		                    <tbody>
								 <%
									if (list != null) {for (FreeBoard f : list) {
								%> 
								<tr>
								<td><%=f.getBoard_no()%></td>
								<td id="freeTit" class="tit"
										onclick="location.href='<%=request.getContextPath()%>/selectFreeBoardDetail.fb?num=<%=f.getBoard_no()%>'"><%=f.getBoard_title()%></td>
								<td><%=f.getNick_name()%></td>
								<td><%=f.getBoard_count()%></td>
								<td><%=f.getBoard_date()%></td>
								<%-- 	<td><%=b.getBoard_no()%></td>
									<td id="noticeTit" class="tit"
										onclick="location.href='<%=request.getContextPath()%>/selectFBoardDetail.nb?num=<%=b.getnBoard_No()%>'"><%=b.getBoard_Title()%></td>
									<td><%=b.getnCount()%></td>
									<td><%=b.getnDate()%></td> --%>
								</tr>
							<%
										}
									}
								%>


							</tbody>
		                </table>
	                </form>
	                
	                <!-- // 공지사항 리스트  -->
	                
	                 <!--페이징 normal -->
				<div class="paginate">
					<a onclick="location.href='<%=request.getContextPath()%>/selectFreeBoardList.fb?pageName=freeBoard&currentPage=1'" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a> 
					<% if(currentPage <=1){ %>
						<a disabled class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a> 
					<%}else{ %>
						<a onclick = "location.href='<%= request.getContextPath()%>/selectFreeBoardList.fb?pageName=freeBoard&currentPage=<%=currentPage -1%>'" class="btn-prev" title="이전">
						<em class="blind">목록에서 이전 페이지 이동</em></a>
					<%} %>
					<span class="paging-numbers">
						<% for(int p = startPage; p <=endPage;p++){
							if(p==currentPage){%>
								<a disabled class="on"><%=p %><span class="blind">페이지로 이동</span></a>
							<%}else{ %>
								<a onclick= "location.href='<%= request.getContextPath()%>/selectFreeBoardList.fb?pageName=freeBoard&currentPage=<%=p%>'"><%= p %><span class="blind">페이지로 이동</span></a>
							<%} %>
						<%} %>
					</span>
					<% if(currentPage >= maxPage){ %>
						<a disabled class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
					<%}else{ %>
						<a onclick = "location.href = '<%= request.getContextPath()%>/selectFreeBoardList.fb?pageName=freeBoard&currentPage=<%=currentPage +1%>'" class="btn-next" title="다음">
						<span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
					<%} %>
						
					<a onclick = "location.href = '<%= request.getContextPath()%>/selectFreeBoardList.fb?pageName=freeBoard&currentPage=<%=maxPage%>'" class="btn-last" title="끝">
					<span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
				</div>
	              <!--//페이징 normal -->
	             
	            <%--   <%
	              	              	if (num == 0) {
	              	              %>
	              
	                <!-- 페이징 영역 -->
	                <div class="paginate">
						<a onclick="location.href='<%=request.getContextPath()%>/selectFreeBoardList.fb?currentPage=1'" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a> 
						<% if(currentPage <=1){ %>
							<a disabled class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a> 
						<%}else{ %>
							<a onclick = "location.href='<%= request.getContextPath()%>/selectFreeBoardList.fb?currentPage=<%=currentPage -1%>'" class="btn-prev" title="이전">
							<em class="blind">목록에서 이전 페이지 이동</em></a>
						<%} %>
						<span class="paging-numbers">
							<% for(int p = startPage; p <=endPage;p++){
								if(p==currentPage){%>
									<a disabled class="on"><%=p %><span class="blind">페이지로 이동</span></a>
								<%}else{ %>
									<a onclick= "location.href='<%= request.getContextPath()%>/selectFreeBoardList.fb?currentPage=<%=p%>'"><%= p %><span class="blind">페이지로 이동</span></a>
								<%} %>
							<%} %>
						</span>
						<% if(currentPage >= maxPage){ %>
							<a disabled class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%}else{ %>
							<a onclick = "location.href = '<%= request.getContextPath()%>/selectFreeBoardList.fb?currentPage=<%=currentPage +1%>'" class="btn-next" title="다음">
							<span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%} %>
						
						<a onclick = "location.href = '<%= request.getContextPath()%>/selectFreeBoardList.fb?currentPage=<%=maxPage%>'" class="btn-last" title="끝">
						<span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
					</div>
	                <!-- // 페이징 영역 -->
	              
				   <% }%>	               --%>
	            
            </div>
        </div>
        <!-- // contents area -->

        <!-- Footer -->
        <%@ include file="/views/common/footer.jsp" %>
       <!-- // Footer -->

    </div>
</body>
</html>



 <%-- <div class="outer">
		<br>
		<h2 align="center">게시판</h2>
		<div class="tableArea">
			<table align="center" id="listArea">
				<tr>
					<th width="100px">글번호</th>
					<th width="100px">카테고리</th>
					<th width="300px">글제목</th>
					<th width="100px">작성자</th>
					<th width="100px">조회수</th>
					<th width="150px">작성일</th>				
				</tr>
				
				<% for(Board b : list){
					%>
					<tr>
						<td><%= b.getBid()%></td>
						<td><%= b.getCategory()%></td>
						<td><%= b.getbTitle()%></td>
						<td><%= b.getbWriter()%></td>
						<td><%= b.getbCount()%></td>
						<td><%= b.getbDate()%></td>
						
					</tr>
				<%} %>
			</table>
		</div>
		
		<div class="searchArea" align="center">
			<select id="searchCondition" name="searchCondition">
				<option>----</option>
				<option value="category">카테고리</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			
			<input type="search">
			<button type="submit">검색하기</button>
			<% if(loginUser != null){%>
				<button onclick="location.href='views/board/boardInsertForm.jsp'">작성하기</button>
			<%} %>
		</div>
		
		
		
		
		
	</div> 
 --%>
