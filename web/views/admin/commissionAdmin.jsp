<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.comvision.artBridge.admin.model.vo.*"%>
<%
	ArrayList<Relate> relateList = null; 
	if(request.getAttribute("relateList") != null){
		relateList = (ArrayList<Relate>)request.getAttribute("relateList");
	}

	ArrayList<Board> boardList = null; 
	if(request.getAttribute("boardList") != null){
		boardList = (ArrayList<Board>)request.getAttribute("boardList");
	}
	
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
	
	String value = "";
	String kind = "";
	String keyword = "";
	if(request.getAttribute("value") != null){
		value = (String)request.getAttribute("value");
		String[] arr = value.split(",");
		kind = arr[0];
		keyword = arr[1];
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Art Bridge</title>
<%@ include file="/views/common/head.jsp"%>
<style>
#searchWord {
	margin-left: 30%;
}
#addBtn {
	margin-left: 50%;
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
		<!-- // Header -->

		<!-- adminHeader -->
		<%@ include file="/views/common/adminHeader.jsp"%>
		<!-- //adminHeader -->

		<!-- 주석 영역 -->
		<div class="contents">
			<!-- contents 필수 사용 -->
			<div class="container">
				<!-- container 필수 사용 -->
				<div class="col-md-12">
					<div class="heading">
						<h2>연관검색어 관리</h2>
						<hr />
					</div>
					
					<br>
					
					<form action="<%=request.getContextPath()%>/insertRelate.ad" method="post" >
					<div id="searchWord">
						<input type="text" name="relate_name" style="width: 50%;" id="relate">
						<button name="mainBtn" class="btn btn-primary btn-sm" onclick="add();" id="insertRelate" >검색어 추가</button>
						<br><br>
					</div>
					<div style="overflow-Y : scroll; height:280px;">
						<table class="tbl-type02" >
							<colgroup>
								<col style="width: 10%;">
								<col style="width: *;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col" colspan="3">검색어</th>
								</tr>
							</thead>
							<tbody class="addsh2">
							<%if(relateList != null){ for(Relate r : relateList){%>
								<tr>
									<td><label><%= r.getRelate_no() %></label></td>
									<td><label><%= r.getRelate_name() %></label></td>
								</tr>								
							<% } } %> 
							</tbody>
						</table>
					</div>
					</form>
					<br><br>
				</div>
				<div class="heading">
					<h2>판매글 관리</h2>
				</div>
				<hr>
				<br>
				<div>
					<table class="tbl-type02">
						<colgroup>
							<col style="width: 20%;">
							<col style="width: *%;">
						</colgroup>
						<tbody>
							<tr>
								<td style="background: lightgray;">검색옵션</td>
								<td>
									<select name="national2" style="float: left; width: 200px;" id="selectBox">
										<% if(kind.equals("BOARD_NO")){ %>
										<option value="no" selected>글번호</option>
										<% }else{ %>
										<option value="no">글번호</option>
										<% } %>
										<% if(kind.equals("NICK_NAME")){ %>
										<option value="name" selected>작가명</option>
										<% }else{ %>
										<option value="name">작가명</option>
										<% } %>
										<% if(kind.equals("BOARD_TITLE")){ %>
										<option value="title"selected>제목</option>
										<% }else{ %>
										<option value="title">제목</option>
										<% } %>
									</select>
								</td>
							</tr>
							<tr>
								<td style="background: lightgray">검색어 입력</td>
								<td>
									<input type="text" style="float: left; width: 400px;" id="searchText" value="<%= keyword %>">
									<button type="submit" id="searchBtn" name="searchBtn" class="btn btn-primary btn-sm" style="padding: 5px 22px; float: right;" onclick="search();">검색</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<script>
					function search(){
						var value = "";
	
						if($("#selectBox").val() == "no"){
							value = "BOARD_NO";
						}else if($("#selectBox").val() == "name"){
							value = "NICK_NAME";
						}else if($("#selectBox").val() == "title"){
							value = "BOARD_TITLE";
						}
						value += "," + $("#searchText").val();

						location.href="<%= request.getContextPath() %>/selectCommision.ad?value=" + value;
					};
				</script>
				<br> <br>

				<button type="submit" id="deleteBtn" name="deleteBtn" class="btn btn-primary btn-sm" style="padding: 5px 22px; float: right;" onclick="del();">판매글	삭제</button>
				<br><br>
				<script>
					function del(){
						var str = "";
						
						$("input[name='chBox2']").each(function() {
							if ($(this).prop("checked") == true) {
								str += $(this).val() + "," ;
							}
						});
					
						if(str==""){
							location.href = '<%= request.getContextPath()%>/selectCommision.ad';		
						}else{
							location.href = '<%= request.getContextPath()%>/deleteCommission.ad?str='+str;
						}
					};
				</script>
	
				<table class="tbl-type02">
					<colgroup>
						<col style="width: 5%;">
						<col style="width: 8%;">
						<col style="width: 12%;">
						<col style="width: 20%;">
						<col style="width: *;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">선택</th>
							<th scope="col">NO</th>
							<th scope="col">작가명</th>
							<th scope="col">작성일</th>
							<th scope="col">게시글 제목</th>
						</tr>
					</thead>
					<tbody>
						<tr class="trtr">
						<%if(boardList != null) {for(Board b : boardList){%>
							<td><input type="checkbox" name="chBox2" value="<%=b.getBoard_no() %>"></td>
							<td class="num2"><label><%=b.getBoard_no() %></label></td>
							<td><label><%=b.getNick_name() %></label></td>
							<td><label><%=b.getBoard_date() %></label></td>
							<td><label><%=b.getBoard_title() %></label></td>
						</tr>
						<% } } %> 
					</tbody>
				</table>

	            <!--페이징 normal -->
				<div class="paginate">
					<a onclick="location.href='<%=request.getContextPath()%>/selectCommision.ad?pageName=commissionAdmin&currentPage=1&value=<%= value %>'" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a> 
					<% if(currentPage <=1){ %>
						<a disabled class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a> 
					<%}else{ %>
						<a onclick = "location.href='<%= request.getContextPath()%>/selectCommision.ad?pageName=commissionAdmin&currentPage=<%=currentPage -1%>&value=<%= value %>'" class="btn-prev" title="이전">
						<em class="blind">목록에서 이전 페이지 이동</em></a>
					<%} %>
					<span class="paging-numbers">
						<% for(int p = startPage; p <=endPage;p++){
							if(p==currentPage){%>
								<a disabled class="on"><%=p %><span class="blind">페이지로 이동</span></a>
							<%}else{ %>
								<a onclick= "location.href='<%= request.getContextPath()%>/selectCommision.ad?pageName=commissionAdmin&currentPage=<%=p%>&value=<%= value %>'"><%= p %><span class="blind">페이지로 이동</span></a>
							<%} %>
						<%} %>
					</span>
					<% if(currentPage >= maxPage){ %>
						<a disabled class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
					<%}else{ %>
						<a onclick = "location.href = '<%= request.getContextPath()%>/selectCommision.ad?pageName=commissionAdmin&currentPage=<%=currentPage +1%>&value=<%= value %>'" class="btn-next" title="다음">
						<span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
					<%} %>
						
					<a onclick = "location.href = '<%= request.getContextPath()%>/selectCommision.ad?pageName=commissionAdmin&currentPage=<%= maxPage %>&value=<%= value %>'" class="btn-last" title="끝">
					<span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
				</div>
	              <!--//페이징 normal -->
	              
			</div>
		</div>
		<!-- // 주석 영역 -->

		<!-- Footer -->
		<%@ include file="/views/common/footer.jsp"%>
		<!-- // Footer -->

	</div>
</body>
</html>