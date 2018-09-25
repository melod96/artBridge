<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.comvision.artBridge.relate.model.vo.*, com.comvision.artBridge.board.model.vo.*"%>
  	<%
	ArrayList<Relate> list = null; 
	if((ArrayList<Relate>)request.getAttribute("list") != null){
		list = (ArrayList<Relate>)request.getAttribute("list");
	}

	ArrayList<Board> list2 = null; 
	if((ArrayList<Board>)request.getAttribute("blist") != null){
		list2 = (ArrayList<Board>)request.getAttribute("blist");
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
	
	/* int num = (int)request.getAttribute("num");
	
	PageInfo pi = null;
	int listCount = 0;
	int currentPage = 0;
	int maxPage = 0;
	int startPage = 0;
	int endPage = 0;
	
	if((PageInfo)request.getAttribute("pi") != null){
		pi = (PageInfo)request.getAttribute("pi");
		listCount = pi.getListCount();
		currentPage = pi.getCurrentPage();
		maxPage = pi.getMaxPage();
		startPage = pi.getStartPage();
		endPage = pi.getEndPage(); 
	}*/
	
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
						
					</div>
					
					<br>
					
					 <form action="<%=request.getContextPath()%>/insertRelate.ad" method="post" >
					<div id="searchWord">
						<input type="text" name="relate_name" style="width: 50%;" id="relate">
						<button name="mainBtn" class="btn btn-primary btn-sm"
							onclick="add();" id="insertRelate" >검색어 추가</button>
				
						<br> <br>
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
							<%if(list != null){for(Relate r : list){%>
								<tr>
									<td><label><%= r.getRelate_no() %></label></td>
									<td><label><%= r.getRelate_name() %></label></td>
								</tr>								
								<% }} %> 
							</tbody>
						</table>
					</div>

					<br> <br>
				
						</form>

				</div>
				<div class="heading">
					<h2>게시글 관리</h2>
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
								<td><select name="national2"
									style="float: left; width: 200px;" id="selectBox">
										<option value="no">글번호</option>
										<option value="name">작가명</option>
										<option value="title">제목</option>
								</select></td>
							</tr>

							<tr>
								<td style="background: lightgray">검색어 입력</td>
								<td><input type="text" style="float: left; width: 400px;" id="searchText">
									<button type="submit" id="searchBtn" name="searchBtn"
										class="btn btn-primary btn-sm"
										style="padding: 5px 22px; float: right;" onclick="search();">검색</button></td>
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

	console.log(value);
location.href="<%= request.getContextPath() %>/searchBoard.ad?value=" + value;

};
</script>
				<br> <br>

				<button type="submit" id="deleteBtn" name="deleteBtn"
					class="btn btn-primary btn-sm"
					style="padding: 5px 22px; float: right;" onclick="del();">게시글
					삭제</button>
				<br> <br>
				<script>
				function del(){
					
					var str2 = "";
						
					$("input[name='bdCk']").each(function() {
						if ($(this).prop("checked") == true) {
							str2 += $(this).val() + "," ;
						}
					});
					
					if(str2==""){
						location.href = '<%= request.getContextPath()%>/selectCommision.ad';
						console.log('1');
					}else{
						location.href = '<%= request.getContextPath()%>/deleteCommission.ad?str2='+str2;
						console.log('2');
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
						<%if(list2 != null){for(Board b : list2){%>
							<td><input type="checkbox" name="chBox2" value="<%=b.getBoard_no() %>"></td>
							<td class="num2"><label><%=b.getBoard_no() %></label></td>
							<td><label><%=b.getNick_name() %></label></td>
							<td><label><%=b.getBoard_date() %></label></td>
							<td><label><%=b.getBoard_title() %></label></td>
						</tr>
						<% }} %> 
					</tbody>
				</table>
				
				   <%
	              	              	if (num == 0) {
	              	              %>
	              
	              <!--페이징 search -->
	              
					<div class="paginate">
						<a onclick="location.href='<%=request.getContextPath()%>/searchBoard.ad?currentPage=<%=currentPage%>&value=<%=value%>'" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a> 
						<% if(currentPage <=1){ %>
							<a disabled class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a> 
						<%}else{ %>
							<a onclick = "location.href='<%= request.getContextPath()%>/searchBoard.ad?currentPage=<%=currentPage -1%>&value=<%=value%>'" class="btn-prev" title="이전">
							<em class="blind">목록에서 이전 페이지 이동</em></a>
						<%} %>
						<span class="paging-numbers">
							<% for(int p = startPage; p <=endPage;p++){
								if(p==currentPage){%>
									<a disabled class="on"><%=p %><span class="blind">페이지로 이동</span></a>
								<%}else{ %>
									<a onclick= "location.href='<%= request.getContextPath()%>/searchBoard.ad?currentPage=<%=p%>&value=<%=value%>'"><%= p %><span class="blind">페이지로 이동</span></a>
								<%} %>
							<%} %>
						</span>
						<% if(currentPage >= maxPage){ %>
							<a disabled class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%}else{ %>
							<a onclick = "location.href = '<%= request.getContextPath()%>/searchBoard.ad?currentPage=<%=currentPage +1%>&value=<%=value%>'" class="btn-next" title="다음">
							<span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%} %>
						
						<a onclick = "location.href = '<%= request.getContextPath()%>/searchBoard.ad?currentPage=<%=maxPage%>&value=<%=value%>'" class="btn-last" title="끝">
						<span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
					</div>
					
	              <!--//페이징 search -->
	              
	              <%}else{ %>
	              
	              <!--페이징 normal -->
	              
					<div class="paginate">
						<a onclick="location.href='<%=request.getContextPath()%>/selectCommision.ad?currentPage=1'" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a> 
						<% if(currentPage <=1){ %>
							<a disabled class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a> 
						<%}else{ %>
							<a onclick = "location.href='<%= request.getContextPath()%>/selectCommision.ad?currentPage=<%=currentPage -1%>'" class="btn-prev" title="이전">
							<em class="blind">목록에서 이전 페이지 이동</em></a>
						<%} %>
						<span class="paging-numbers">
							<% for(int p = startPage; p <=endPage;p++){
								if(p==currentPage){%>
									<a disabled class="on"><%=p %><span class="blind">페이지로 이동</span></a>
								<%}else{ %>
									<a onclick= "location.href='<%= request.getContextPath()%>/selectCommision.ad?currentPage=<%=p%>'"><%= p %><span class="blind">페이지로 이동</span></a>
								<%} %>
							<%} %>
						</span>
						<% if(currentPage >= maxPage){ %>
							<a disabled class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%}else{ %>
							<a onclick = "location.href = '<%= request.getContextPath()%>/selectCommision.ad?currentPage=<%=currentPage +1%>'" class="btn-next" title="다음">
							<span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%} %>
						
						<a onclick = "location.href = '<%= request.getContextPath()%>/selectCommision.ad?currentPage=<%=maxPage%>'" class="btn-last" title="끝">
						<span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
					</div>
					
	              <!--//페이징 normal -->
	              
				   <%} %>	              
				
			
			</div>
		</div>


		<!-- // 주석 영역 -->

		<!-- Footer -->
		<%@ include file="/views/common/footer.jsp"%>
		<!-- // Footer -->

	</div>
</body>
</html>