<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.comvision.artBridge.admin.model.vo.*"%>
<%
	String value = "";
	if(request.getAttribute("value") != null){
		value = (String)request.getAttribute("value");
	}

	ArrayList<Board> list = null; 
	if(request.getAttribute("list") != null){
		list = (ArrayList<Board>)request.getAttribute("list");
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
	
	String kind = "";
	if(request.getAttribute("kind") != null){
		kind = (String)request.getAttribute("kind");
	}
	
	String keyword = "";
	if(request.getAttribute("keyword") != null){
		keyword = (String)request.getAttribute("keyword");
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Art Bridge</title>
<%@ include file="/views/common/head.jsp"%>
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
						<h2 class="tit1">메인 배너 관리</h2>
					</div>
					<hr>
					<h3 style="margin-left:25%;">판매글 목록</h3>
					<div class="boardSelect" style="margin-left:23%; margin-bottom:0.6%">
					<select id="selectBox" name="selectBox">
						<% if(kind.equals("BOARD_NO")){ %>
						<option value="no" selected>작품번호</option>
						<% }else{ %>
						<option value="no">작품번호</option>
						<% } %>
						<% if(kind.equals("NICK_NAME")){ %>
						<option value="name" selected>작가명</option>
						<% }else{ %>
						<option value="name">작가명</option>
						<% } %>
						<% if(kind.equals("BOARD_TITLE")){ %>
						<option value="title"selected>작품이름</option>
						<% }else{ %>
						<option value="title">작품이름</option>
						<% } %>
					</select>
					<input id="searchText" type="text" value="<%= keyword %>">
					<button type="submit" name="mainBtn" class="btn btn-primary btn-sm" onclick="search();">검색</button>
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
							location.href="<%= request.getContextPath() %>/selectMain.ad?value=" + value;						
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
									<th></th>
									<th>작품번호</th>
									<th>작가명</th>
									<th>작품이름</th>
								</tr>
							</thead>
							<tbody>
							<% if(list != null){ for(Board b : list){ %>
								<tr>
									<td><input type="checkbox" id="check" name="check" value=<%= b.getBoard_no() %>></td>
									<td><label><%= b.getBoard_no() %></label></td>
									<td><label><%= b.getNick_name() %></label></td>
									<td colspan="5"><label><%= b.getBoard_title()%></label> 
								</tr>
							<% } } %>
							</tbody>
						</table>
					
					<!-- 페이징 처리 부분  mainAdmin -->
					<div class="paginate">
						<a onclick="location.href='<%=request.getContextPath()%>/selectMain.ad?pageName=mainAdmin&currentPage=1&value=<%= value %>'" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a> 
						<% if(currentPage <=1){ %>
							<a disabled class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a> 
						<%}else{ %>
							<a onclick = "location.href='<%= request.getContextPath()%>/selectMain.ad?pageName=mainAdmin&currentPage=<%=currentPage -1%>&value=<%= value %>'" class="btn-prev" title="이전">
							<em class="blind">목록에서 이전 페이지 이동</em></a>
						<%} %>
						<span class="paging-numbers">
							<% for(int p = startPage; p <=endPage;p++){
								if(p==currentPage){%>
									<a disabled class="on"><%=p %><span class="blind">페이지로 이동</span></a>
								<%}else{ %>
									<a onclick= "location.href='<%= request.getContextPath()%>/selectMain.ad?pageName=mainAdmin&currentPage=<%=p%>&value=<%= value %>'"><%= p %><span class="blind">페이지로 이동</span></a>
								<%} %>
							<%} %>
						</span>
						
						<% if(currentPage >= maxPage){ %>
					<!-- <a disabled class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a> -->
						<%}else{ %>
							<a onclick = "location.href = '<%= request.getContextPath()%>/selectMain.ad?pageName=mainAdmin&currentPage=<%=currentPage +1%>&value=<%= value %>'" class="btn-next" title="다음">
							<span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%} %>
						
						<a onclick = "location.href = '<%= request.getContextPath()%>/selectMain.ad?pageName=mainAdmin&currentPage=<%=maxPage%>&value=<%= value %>'" class="btn-last" title="끝">
						<span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
					</div>
					</div>
					<!--//페이징 처리-->
				
					<div class="btn-center">
						<button type="submit" name="mainBtn"
							class="btn btn-primary btn-sm" onclick="add();">추가하기</button>
					</div>
					
					<br><br><br>
					
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
							</tbody>
						</table>
					</div>
					<div class="btn-center">
						<button type="button" name="mainBtn" class="btn btn-default btn-sm" onclick="del();" id="del">삭제하기</button>
					</div>
					
					<br><br><br><br><br>
					
				</div>
			</div>
		</div>
		<!-- // 주석 영역 -->

		<!-- Footer -->
		<%@ include file="/views/common/footer.jsp"%>
		<!-- // Footer -->

	</div>
	
	<script>
		function add(){
			var str = "";
			
			$("input[id='check']").each(function(){
				if($(this).prop("checked") == true){
					str += $(this).val() + "," ; 
				}
			});
			
			if(str == ""){
				location.href = '<%= request.getContextPath()%>/selectMain.ad';
			}else{
				location.href = '<%= request.getContextPath()%>/insertMainSale.ad?str='+str;
			}
		}
		
		function del(){
			var str = "";
				
			$("input[name='bdCk']").each(function() {
				if ($(this).prop("checked") == true) {
					str += $(this).val() + "," ;
				}
			});
			
			if(str==""){
				location.href = '<%= request.getContextPath()%>/selectMain.ad';
			}else{
				location.href = '<%= request.getContextPath()%>/deleteMain.ad?str='+str;
			}
		};
	
		$(function() {
			$.ajax({
				//서블렛 주소
				url : "autoSelect.ad",
				//방식
				type : "get",
				//서블렛에서 성공적으로 data를 받아 왔을 때 실행 할 함수
				success : function(data) {
					for(var key in data){
						//데이터에 따라 생성될 행(tr)들이 추가될 table body의 class명 trtr을 명시하는 변수 선언 
						var $trtr = $(".trtr");
						//생성될 tr태그를 선언 (*닫기 태그는  하지 않아도 자동 생성 된다.)
						var $tr = $("<tr>");
						//tr태그 안의 td태그 선언
						var $checkTd = $("<td><input name='bdCk' type='checkbox' value='"+data[key].board_no+"'>");
						var $noTd = $("<td colspan='5'>");
						var $input = $("<input name='bdNo' type='text' readonly>").val(data[key].board_no);
							
						//생성한 $tr에 $checkTd를 추가(테이블 형식에따라 순서를 맞춰줘야 한다.)
						$tr.append($checkTd);
							
						//$noTd에 $input을 추가 후 $tr에 $noTd를 추가
						$noTd.append($input);
						$tr.append($noTd);

						//마지막으로 $tr을 $trtr이라는 table body에 추가
						$trtr.append($tr);
					}
				},
				error : function() {
					alert("메인 베너로 설정된 글이 없습니다.")
				}
			});
		});
	</script>

</body>
</html>