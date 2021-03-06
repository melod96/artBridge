<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.comvision.artBridge.board.model.vo.*"%>
<%
	ArrayList<Board> list = null; 
	if((ArrayList<Board>)request.getAttribute("list") != null){
		list = (ArrayList<Board>)request.getAttribute("list");
	}
	
	
	
	int num = (int)request.getAttribute("num");
	
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
ul.tab-menu li>a:hover {
	background: darkgray;
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
						<h2>메인 배너 관리</h2>
					</div>

					<hr>
					<div class="btn-center">
						
					</div>
					<h3 style="margin-left:25%;">판매글 목록</h3>
					<div class="boardSelect" style="margin-left:23%; margin-bottom:0.6%">
					<select id="selectBox" name="selectBox">
						<option value="no">작품번호</option>
						<option value="name">작가명</option>
						<option value="title">작품이름</option>
					</select>
					<input id="searchText" type="text">
					<button type="submit" name="mainBtn"
											class="btn btn-primary btn-sm" onclick="search();">검색</button>
											
											
										<!-- 	function del() {
							$("input:checkbox").each(function() {
								if ($(this).prop("checked") == true) {
									$(this).parent().parent().remove();
									i--;
								}

							});

						} -->
										
					<script>
						/* var Objs = $("selectBox option");
						for(i=1; i<Objs.length;i++){
							if(Objs.eq(i).text() == "작가명"
									)
						} */
						

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
						location.href="<%= request.getContextPath() %>/search.ad?value=" + value;
						
						};
					</script>
					
					</div>
					<div class="selTable">
						<table class="tbl-type02" style="width: 600px; margin: auto;">
							<colgroup>
								<col style="width: 10%;">
								<col style="width: 12%;">
								<col style="width: 15%;">
								<col style="width : *;">
							</colgroup>
							<thead>
								<tr>
									<th>
									</th>
									<th>
									작품번호
									</th>
									<th>
									작가명
									</th>
									<th>
									작품이름
									</th>
								</tr>
							</thead>
							<tbody>
							
							<%if(list != null){for(Board b : list){%>
								
								<tr>
									<td><input type="checkbox" id="check" name="check" value=<%=b.getBoard_no() %>></td>
									<td><label><%= b.getBoard_no() %></label></td>
									<td><label><%= b.getNick_name() %></label></td>
									<td colspan="5"><label><%= b.getBoard_title()%></label> 
								</tr>
							<% }} %>
							
							
							</tbody>
						</table>
						
					<%if(num == 1){ %>
						<!-- 페이징 처리 부분  mainAdmin -->
					<div class="paginate">
						<a onclick="location.href='<%=request.getContextPath()%>/selectMain.ad?currentPage=1'" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a> 
						<% if(currentPage <=1){ %>
							<a disabled class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a> 
						<%}else{ %>
							<a onclick = "location.href='<%= request.getContextPath()%>/selectMain.ad?currentPage=<%=currentPage -1%>'" class="btn-prev" title="이전">
							<em class="blind">목록에서 이전 페이지 이동</em></a>
						<%} %>
						
						
						<span class="paging-numbers">
							<% for(int p = startPage; p <=endPage;p++){
								if(p==currentPage){%>
									<a disabled class="on"><%=p %><span class="blind">페이지로 이동</span></a>
								<%}else{ %>
									<a onclick= "location.href='<%= request.getContextPath()%>/selectMain.ad?currentPage=<%=p%>'"><%= p %><span class="blind">페이지로 이동</span></a>
								<%} %>
							<%} %>
						</span>
						
						<% if(currentPage >= maxPage){ %>
					<!-- <a disabled class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a> -->
						<%}else{ %>
							<a onclick = "location.href = '<%= request.getContextPath()%>/selectMain.ad?currentPage=<%=currentPage +1%>'" class="btn-next" title="다음">
							<span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%} %>
						
						<a onclick = "location.href = '<%= request.getContextPath()%>/selectMain.ad?currentPage=<%=maxPage%>'" class="btn-last" title="끝">
						<span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
					</div>
					</div>
					
					<!--//페이징 처리-->
				<%}else{ %>
				
				<!-- 페이징 처리 부분 search-->
					<div class="paginate">
						<a onclick="location.href='<%=request.getContextPath()%>/search.ad?currentPage=1'" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a> 
						<% if(currentPage <=1){ %>
							<a disabled class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a> 
						<%}else{ %>
							<a onclick = "location.href='<%= request.getContextPath()%>/search.ad?currentPage=<%=currentPage -1%>'" class="btn-prev" title="이전">
							<em class="blind">목록에서 이전 페이지 이동</em></a>
						<%} %>
						
						
						<span class="paging-numbers">
							<% for(int p = startPage; p <=endPage;p++){
								if(p==currentPage){%>
									<a disabled class="on"><%=p %><span class="blind">페이지로 이동</span></a>
								<%}else{ %>
									<a onclick= "location.href='<%= request.getContextPath()%>/search.ad?currentPage=<%=p%>'"><%= p %><span class="blind">페이지로 이동</span></a>
								<%} %>
							<%} %>
						</span>
						
						<% if(currentPage >= maxPage){ %>
					<!-- <a disabled class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a> -->
						<%}else{ %>
							<a onclick = "location.href = '<%= request.getContextPath()%>/search.ad?currentPage=<%=currentPage +1%>'" class="btn-next" title="다음">
							<span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%} %>
						
						<a onclick = "location.href = '<%= request.getContextPath()%>/search.ad?currentPage=<%=maxPage%>'" class="btn-last" title="끝">
						<span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
					</div>
					</div>
				
				<%} %>
					<div class="btn-center">
						<button type="submit" name="mainBtn"
							class="btn btn-primary btn-sm" onclick="add();">추가하기</button>
					</div>
			
					<br>
					<br>
					<br>
					
					<script>
					
					
						var i = 1;
						function add() {
							<%-- <%ArrayList<Board> blist = null; 
	if((ArrayList<Board>)request.getAttribute("blist") != null){
		list = (ArrayList<Board>)request.getAttribute("blist");
	}%> --%>
						<%-- var str = "";
							if (i == 5) {
								alert('5개 이상 생성할 수 없습니다.')
							} else {
								$("input[id='check']").each(function() {
									if ($(this).prop("checked") == true) {
										str += $(this).val() + "," ;
									}

								});
									location.href = '<%= request.getContextPath()%>/deleteSale.ad?str='+str;
									var result = [];
									$.ajax({
										url:"deleteSale.ad",
										data:{str:str},
										type:"get",
										success:function(data){
											/* var result = blist.board_no; */
											result = hmap.blist;
											console.log(blist);
											$("#banner").val(result);
											
										},
										error:function(){
											console.log("실패");
										}
									});
							}
						}	 --%>
								/* $("input:checkbox").each(function() {
									if ($(this).prop("checked") == true) {
										$(this).parent().parent().appendTo(
												$(".trtr"));
										i++;
									}

								}); */
								
								//$('input:checkbox[name="check"]:checked').length{
									
									
								
									
									<%-- value += "," + $("#searchText").val();
									
									console.log(value);
								location.href="<%= request.getContextPath() %>/search.ad?value=" + value; --%>
									
								//}

							
								 /*  $(function() {
									$(
											"<tr><td><input type="+"checkbox"+">"
											+ "</td>"
											+"<td colspan="+"5"+">"
													+ "<input type = "+"text"+"value="+"빈 텍스트"+" readonly>"
													+ "</td></tr>").appendTo(
											$(".trtr"));
								}); */
								//i++;
							//} 
 
						//};

					/* 	function del() {
							$("input:checkbox").each(function() {
								if ($(this).prop("checked") == true) {
									$(this).parent().parent().remove();
									i--;
								}

							});

						} */
						//}
					</script>
					<h3 style="margin-left:25%;">메인 배너</h3>
					<div class="addTable">
						<table class="tbl-type02" style="width: 600px; margin: auto;">
							<colgroup>
								<col style="width: 15%;">
								<col style="width: *;">
							</colgroup>
							<thead>
								<tr>
									<th></th>
									<th>작품번호</th>
								</tr>
							</thead>
							<tbody class="trtr">
							<%-- <% if(blist!=null){for( Board b : blist){ %>
								<tr id="banner">
									<td><input type="checkbox" name=""></td>
									<td colspan="5">
									<input type="text" value="<%=b.getBoard_no()%>" readonly>
									</td>
								</tr>
								<% }}else{ %> --%>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td colspan="5">
									<input type="text" value="작품번호" readonly>
									</td>
								</tr>
								<%-- <%} %> --%>
							</tbody>
						</table>
					</div>
					<div class="btn-center">
						<!-- <button type="submit" class="btn btn-primary btn-md"
							style="margin-top: 10px;">저장</button> -->
									<button type="button" name="mainBtn"
							class="btn btn-default btn-sm" onclick="del();" id="del">삭제하기</button>
					</div>

					<br>
				

					<br> <br> <br> <br>
				</div>
			</div>
		</div>
		<!-- // 주석 영역 -->

		<!-- Footer -->
		<%@ include file="/views/common/footer.jsp"%>
		<!-- // Footer -->

	</div>
</body>
</html>