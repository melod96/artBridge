<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.comvision.artBridge.member.model.vo.Member, com.comvision.artBridge.board.model.vo.PageInfo"%>
<%
	ArrayList<Member> list = null;
	if(request.getAttribute("list") != null){
		list = (ArrayList<Member>)request.getAttribute("list");
	}
	
	PageInfo pi = null;
	int listCount = 0;
	int currentPage = 0;
	int maxPage = 0;
	int startPage = 0;
	int endPage = 0;
	int limit = 0;
	if(request.getAttribute("pi") != null){
		pi = (PageInfo)request.getAttribute("pi");
		listCount = pi.getListCount();
		currentPage = pi.getCurrentPage();
		maxPage = pi.getMaxPage();
		startPage = pi.getStartPage();
		endPage = pi.getEndPage();
		limit = pi.getLimit();
	}
	String searchCondition = null;
	if(request.getParameter("searchCondition") != null){
		searchCondition = (String)request.getAttribute("searchCondition");
	}
	String searchWords = null;
	if(request.getParameter("searchWords") != null){
		searchWords = (String)request.getAttribute("searchWords");
	}
	String userDivision = null;
	if(request.getParameter("userDivision") != null){
		userDivision = (String)request.getAttribute("userDivision");
	}
	String writerGrade = null;
	if(request.getParameter("writerGrade") != null){
		writerGrade = (String)request.getAttribute("writerGrade");
	}
	String writerRec = null;
	if(request.getParameter("writerRec") != null){
		writerRec = (String)request.getAttribute("writerRec");
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
.reqWriterForm-Area-Style{ position:absolute; width:740px; background:white; padding-bottom:50px; left:50%; margin-left:-370px; }


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
						<h2>회원 관리</h2>
					</div>
					<hr>
					<br>
					<form action="<%= request.getContextPath() %>/selectMemberList.ad?pageName=memberAdmin&currentPage=1" method="post">
						<div>
							<table class="tbl-type02">
								<colgroup>
									<col style="width: 20%;">
									<col style="width: *;">
								</colgroup>
								<tbody>
									<tr>
										<td style="background: lightgray; width: 200px;">검색옵션</td>
										<td><select class="form-control input-short" id="searchCondition" name="searchCondition">
												<option>전체</option>
												<option value="name" id="name">이름</option>
												<option value="id" id="id">아이디</option>
												<option value="phone" id="phone">연락처</option>
												<option value="email" id="email">이메일</option>
										</select></td>
									</tr>
									<tr>
										<td style="background: lightgray">검색어 입력</td>
										<td><input type="text" style="width: 500px; float: left;" id="searchWords" name="searchWords" value="">
										</td>
									</tr>
									<tr>
										<td style="background: lightgray">사용자 구분</td>
										<td><select class="form-control input-short" id="userDivision" name="userDivision">
												<option>전체</option>
												<option value="writer" id="writer">작가</option>
												<option value="nomal" id="nomal">일반사용자</option>
										</select></td>
									</tr>
									<tr>
										<td style="background: lightgray;">작가 등급</td>
										<td><select class="form-control input-short" style="float: left;" id="writerGrade" name="writerGrade">
												<option id="0">전체</option>
												<option value="1" id="1">신입작가</option>
												<option value="2" id="2">일반작가</option>
												<option value="3" id="3">인기작가</option>
												<option value="4" id="4">블랙작가</option>
										</select>
										</td>
									</tr>
									<tr>
										<td style="background: lightgray;">작가 승인</td>
										<td><select class="form-control input-short" style="float: left;" id="writerRec" name="writerRec">
												<option>전체</option>
												<option value="rec" id="rec">승인</option>
												<option value="norec" id="norec">미승인</option>
										</select>
											<button type="submit" name="mainBtn"
												class="btn btn-primary btn-md" style="float: right;">검색</button>
									</tr>
								</tbody>
							</table>
							<script>
								$(function(){
									<% if(searchCondition != null){ 
										switch(searchCondition){ 
										case "name" : %>
										$("#name").prop("selected","selected");
									<% break; case "id" : %>
										$("#id").prop("selected","selected");
									<% break; case "phone" : %>
										$("#phone").prop("selected","selected");
									<% break; case "email" : %>
										$("#email").prop("selected","selected");
									<% break;}
										} %>
										
									<% if(searchWords != null){ %>
										$("#searchWords").val("<%= searchWords %>");
									<% } %>
									
									<% if(userDivision != null){ 
										switch(userDivision){ 
										case "writer" : %>
										$("#writer").prop("selected","selected");
									<% break; case "nomal" : %>
										$("#nomal").prop("selected","selected");
									<% break;}
										} %>
									
									<% if(writerGrade != null){ 
										switch(writerGrade){
										case "0" : %>
										$("#0").prop("selected","selected");
									<% break; case "1" : %>
										$("#1").prop("selected","selected");
									<% break; case "2" : %>
										$("#2").prop("selected","selected");
									<% break; case "3" : %>
										$("#3").prop("selected","selected");
									<% break; case "4" : %>
										$("#4").prop("selected","selected");
									<% break;}
										} %>
										
										<% if(writerRec != null){ 
											switch(writerRec){
											case "rec" : %>
											$("#rec").prop("selected","selected");
										<% break; case "norec" : %>
											$("#norec").prop("selected","selected");
										<% break;}
											} %>
									
								});
							</script>
						</div>
					</form>

					<br> <br>

					<button type="submit" class="btn btn-danger btn-md"
						style="padding: 5px 22px; float: right;" onclick="del4();">계정삭제</button>
			
					<br>
					
					
					
					
					
					
					
					<script>
      				/* 	 function popupOpen() {

       					var popUrl = "/artBridge/views/admin/userPop.jsp"; //팝업창에 출력될 페이지 URL

                     
				        var popupX = (window.screen.width / 2 ) - (580 / 2);
					    // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
					
					    var popupY= (window.screen.height / 2 ) - (300 / 2);
					    // 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
					
					    var popOption = "width=578, height=301, resizable=no, scrollbars=no, status=no, top="+popupY+", left=" + popupX 
					    //팝업창 옵션(optoin)
					    window.open(popUrl,"", popOption);
					
					    }  */
					    //=================del4 함수 부분======================
					
						function del4(){
							$("input[name=chBox4]").each(function() {
								if ($(this).prop("checked") == true) {
									$(this).parent().parent().remove();					
								}
							});

							var n = 1;
							
							$(".num4").each(function() {
								$(this).text(n);
								n++;
							});
						}  

  				 	</script>
					<br>

					<table class="tbl-type02">
						<colgroup>
							<col style="width: 5%;">
							<col style="width: 7%;">
							<col style="width: 8%;">
							<col style="width: 8%;">
							<col style="width: 12%;">
							<col style="width: 12%;">
							<col style="width: 15%;">
							<col style="width: 15%">
							<col style="width: 10%">
							<col style="width: *;">
							
						</colgroup>
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">NO</th>
								<th scope="col">구분</th>
								<th scope="col">등급</th>
								<th scope="col">이름</th>
								<th scope="col">ID</th>
								<th scope="col">연락처</th>
								<th scope="col">메일</th>
								<th scope="col">가입일</th>
								<th scope="col">작가요청</th>
							</tr>
						</thead>
						<tbody>
							<% if(list != null){for(Member m : list){
								String wrt = "";
								if(m.getWriter_right() == 0){
									if(m.getWriter_request_no() > 0){
										wrt = "미승인";
									}
								
								}
								
								%>
								<tr>
									<input type="hidden" value="<%= m.getMember_no() %>" />
									<td><input type="checkbox" name="chBox4"></td>
									<td><%= m.getMember_no() %></td>
									<% 	String right = null;
										if(m.getWriter_right() != 0){
											right = "작가";
										}else{
											right = "일반";
										}
									%>
									<td><%= right %></td>
									<%
										String rating_name = null;
										if(m.getRating_name() != null){
											rating_name = m.getRating_name();
										}else{
											rating_name = "-";
										}
									%>
									<td><%= rating_name %></td>
									<td><%= m.getName() %></td>
									<td><%= m.getId() %></td>
									<td><%= m.getPhone() %></td>
									<td><%= m.getEmail() %></td>
									<td><%= m.getEnroll_date() %></td>
									<td style="font-weight:bold">
										 <a style="color:orangered;"onclick="popupOpen2();"><%= wrt %></a> 
									</td>								
								</tr>
								
							<% }} %>
					
		</script>
								<script>
							
						/* 	 function popupOpen2() {

       					var popUrl = "/artBridge/views/admin/writerPop.jsp"; //팝업창에 출력될 페이지 URL

                     
				        var popupX = (window.screen.width / 2 ) - (580 / 2);
					    // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
					
					    var popupY= (window.screen.height / 2 ) - (300 / 2);
					    // 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
					
					    var popOption = "width=578, height=301, resizable=no, scrollbars=no, status=no, top="+popupY+", left=" + popupX 
					    //팝업창 옵션(optoin)
					    window.open(popUrl,"", popOption);
					
					    }  */
							</script>

						</tbody>
					</table>
					
					<!-- 페이징 -->
	
					<div class="paginate" align="center">
					<a class="btn-first" title="처음" onclick="location.href='<%= request.getContextPath() %>/selectMemberList.ad?pageName=memberAdmin&currentPage=1'"><em class="blind">목록에서 처음 페이지 이동</em></a>
					<% if(currentPage <= 1){ %>
						<a class="btn-prev" title="이전" disabled><em class="blind">목록에서 이전 페이지 이동</em></a>
					<% }else{ %>
						<a class="btn-prev" title="이전" onclick="location.href='<%= request.getContextPath() %>/selectMemberList.ad?pageName=memberAdmin&cuttentPage=<%= currentPage - 1 %>'"><em class="blind">목록에서 이전 페이지 이동</em></a>
					<% } %>
					
					<span class="paging-numbers">
					<% 
						for(int p = startPage; p <= endPage; p++){ 
							if(p == currentPage){
					%>
								<a class="on" disabled><%= p %><span class="blind">페이지로 이동</span></a>
					<% 		}else{ %>
								<a onclick="location.href='<%= request.getContextPath() %>/selectMemberList.ad?pageName=memberAdmin&currentPage=<%= p %>'"><%= p %><span class="blind">페이지로 이동</span></a>
					<% 		
							}
						}		
					%>
					</span>
					
					<% if(currentPage >= maxPage){ %>
						<a class="btn-next" title="다음" disabled><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
					<% }else{ %>
						<a class="btn-next" title="다음" onclick="location.href'<%= request.getContextPath() %>/selectMemberList.ad?pageName=memberAdmin&currentPage=<%= currentPage + 1 %>'"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
					<% } %>
					
					<a class="btn-last" title="끝" onclick="location.href='<%= request.getContextPath() %>/selectMemberList.ad?pageName=memberAdmin&currentPage=<%= maxPage %>'"><span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
					</div>
					
					<!-- //페이징 -->
					
					<br> <br>
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