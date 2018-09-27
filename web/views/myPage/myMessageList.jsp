<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.comvision.artBridge.message.model.vo.*, com.comvision.artBridge.admin.model.vo.*"%>
 <% 
	ArrayList<Message> mlist= (ArrayList<Message>)request.getAttribute("mlist");
	
	int num = (int)request.getAttribute("num");
	
	String search="";
	
		if(num == 0){
			search = (String)request.getAttribute("search");
			}
		
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); 
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

		<%@ include file="/views/common/adminHeader.jsp"%>

		<!-- 주석 영역 -->
		<div class="contents">
			<!-- contents 필수 사용 -->
			<div class="container">
				<!-- container 필수 사용 -->
				<div class="col-md-12">
					<div class="heading">
						<h2>쪽지 함</h2>
					</div>

					<hr>

					<br>
					 <script>
							//radio : '전체'클릭시 date박스 비활성화.
						$(function() {
							$("#whole").click(function() {
									$("input[name='date1']").attr("disabled",true);
									$("input[name='date2']").attr("disabled",true);
								});
							$("#period").click(function() {
								$("input[name='date1']").attr("disabled",false);
								$("input[name='date2']").attr("disabled",false);
							});

						});
					</script> 
					<div>
						<form action="<%= request.getContextPath() %>/selectList.msg?pageName=customerAdmin&currentPage=1" method="post">
							<table class="tbl-type02">

								<tbody>

									<tr>
										<td style="background: lightgray; width: 200px;">접수일</td>
										<td style="text-align: left;">&nbsp; 
										
										<input type="radio"	name="dateRadio" value="W" id="whole" checked>
										<label for="whole">전체</label>
										
										<input type="radio" name="dateRadio" value="P" id="period">
										<label for="period">기간</label>&nbsp;&nbsp;
											<input type="date" id="date1" name="date1" disabled="disabled">
												<label style="font-weight: bold">&nbsp;~&nbsp;</label>
											<input type="date" id="date2" name="date2" disabled="disabled" >


										</td>
									</tr>




									<tr>
										<td style="background: lightgray">답변상태</td>
										<td><select class="form-control input-short" id="searchSelect1" name="searchSelect1">
												<option value="se1Option1" id="se1Option1">전체</option>
												<option value="se1Option2" id="se1Option2">접수</option>
												<option value="se1Option3" id="se1Option3">답변완료</option>
										</select></td>
									</tr>
									<tr>
										<td style="background: lightgray">검색옵션</td>
										<td><select class="form-control input-short" id="searchSelect2" name="searchSelect2">
												<option value="se2Option1" id="se2Option1">전체</option>
												<option value="se2Option2" id="se2Option2">이름</option>
												<option value="se2Option3" id="se2Option3">제목</option>
										</select></td>
									</tr>
									<tr>
										<td style="background: lightgray;">검색어 입력</td>
										<td><input id="" name="searchWords" class="form-control input-mid"
											type="text" placeholder="검색어를 입력하세요" style="float: left;">
											<button type="submit" id="searchBtn1"  id="searchWords" name="searchWords" value=""
												class="btn btn-primary btn-md" style="float: right;"
												onclick="search();">검색</button></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
					
						<%int no = 0; int yes =0; int result = 0;
						
						if(mlist != null){for(Message m : mlist){
							
								if(m.getCheck_date() == null){
									no++;
								}else{
									yes++;
								}
								
						} result = no + yes;
						}
								%>
					<br> <br>
					<%-- <div>
						<p style="font-weight: bold; float: left;">총 접수건수 :
						<p style="color: red; float: left; font-weight: bold"><%=result %></p>
						<p style="float: left;">건/</p>

						<p style="font-weight: bold; float: left;">미 답변건수 :
						<p style="color: red; float: left; font-weight: bold"><%=no %></p>
						<p style="float: left;">건/</p>

						<p style="font-weight: bold; float: left;">답변완료 :
						<p style="color: red; float: left; font-weight: bold"><%=yes %></p>
						<p style="float: left;">건</p>

					</div> --%>
					
					<br> <br>
					<script>
						function del3() {
							$("input[name=chBox3]").each(function() {
								if ($(this).prop("checked") == true) {
									$(this).parent().parent().remove();

								}
							});

							var m = 1;
							$(".num3").each(function() {
								$(this).text(m);
								m++;
							});

						}
					</script>

					<table class="tbl-type02">
						<colgroup>
							<col style="width: 5%;">
							<col style="width: 5%;">
							<col style="width: 10%;">
							<col style="width: 18%;">
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="height: *;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">NO</th>
								<th scope="col">확인 날짜</th>
								<th scope="col">접수일</th>
								<th scope="col">이름</th>
								<th scope="col">구분</th>
								<th scope="col">제목</th>

							</tr>
						</thead>
						
						<tbody class="tbody">
						
						
						<%
						if(mlist != null){for(Message m : mlist){
									String writer = "";			
								if(m.getMem_name().equals("관리자")){	
									writer = "관리자";
								}else{
									if(m.getWriter_right() == 0){
										writer = "일반";
									}else if(m.getWriter_right() == 1){
										writer = "작가";
									}
								}
								String date = "";
								if(m.getMem_name().equals("관리자")){
									date = "<관리자 답변>";
								}else{
									if(m.getCheck_date() == null){
										
										date = "미확인";
										
									}else{
										date = ""+m.getCheck_date();
									}
									
								}
								
								%>
								
								
								<tr>
									<td><input type="checkbox" name="msgNo" value=<%=m.getMsg_no() %>></td>
									<td class="num3"><%=m.getMsg_no() %></td>
									<td><%=date %></td>
									<td><%=m.getMsg_date() %></td>
									<td><%=m.getMem_name() %></td>
									<td><%=writer%></td>	
									<td><div style="float: left;">
											&nbsp;&nbsp;<a onclick = "location.href='<%= request.getContextPath() %>/selectDetail.msg?msg_no=<%=m.getMsg_no() %>'" id="customerQna"><%=m.getMsg_title() %></a>
										</div></td>
								</tr>
							<% }} %>

							
						</tbody>
					</table>
					
					
					<!--페이징-->
					
					<%if(num == 1){ %>
						<!-- 페이징 처리 부분  normal -->
					<div class="paginate">
						<a onclick="location.href='<%=request.getContextPath()%>/selectList.msg?currentPage=1'" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a> 
						<% if(currentPage <=1){ %>
							<a disabled class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a> 
						<%}else{ %>
							<a onclick = "location.href='<%= request.getContextPath()%>/selectList.msg?currentPage=<%=currentPage -1%>'" class="btn-prev" title="이전">
							<em class="blind">목록에서 이전 페이지 이동</em></a>
						<%} %>
						
						
						<span class="paging-numbers">
							<% for(int p = startPage; p <=endPage;p++){
								if(p==currentPage){%>
									<a disabled class="on"><%=p %><span class="blind">페이지로 이동</span></a>
								<%}else{ %>
									<a onclick= "location.href='<%= request.getContextPath()%>/selectList.msg?currentPage=<%=p%>'"><%= p %><span class="blind">페이지로 이동</span></a>
								<%} %>
							<%} %>
						</span>
						
						<% if(currentPage >= maxPage){ %>
					<!-- <a disabled class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a> -->
						<%}else{ %>
							<a onclick = "location.href = '<%= request.getContextPath()%>/selectList.msg?currentPage=<%=currentPage +1%>'" class="btn-next" title="다음">
							<span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%} %>
						
						<a onclick = "location.href = '<%= request.getContextPath()%>/selectList.msg?currentPage=<%=maxPage%>'" class="btn-last" title="끝">
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
					
					
					
					
					
					<!--//페이징-->
					 
					<br> <br>
				</div>
			</div>
		</div>

		<!-- // 주석 영역 -->

		<!-- Footer -->
		<%@ include file="/views/common/footer.jsp"%>
		<!-- // Footer -->


	</div>
	
	<script>
	//All select 자동 출력 구문
	
	
	
	
	
	
	
	
	
	
	
	
	//All Select 자동 출력 구문 -ajax
	/*
	$(function(){
		$.ajax({
			url : "autoSelectMSG.ad",
			type : "get",
			success : function(data){
				for(var key in data){
					var $tbody = $(".tbody");
					var $tr = $("<tr>");
						var $td1 = $("<td><input type='checkbox' name='chBox3'>");
						var $td2 = $("<td class='msgNo' value='"+data[key].msg_no+"'>");
						
							var str ="";
							if(data[key].ckeck_date == null){
								str = "접수중";
							}else{
								str = "답변완료";
							}
						var $td3 = $("<td value='"+ str +"'>");
						
						var $td4 = $("<td value='"+ data[key].msg_date +"'>");
						var $td5 = $("<td value='"+ data[key].mem_name +"'>");
						
							var str2 = "";
							if(data[key].writer_right == 0){
								str2 = "작가";
							}else{
								str2 = "일반";
							}
						var $td6 = $("<td value='"+ str2 +"'>");
						
						var $td7 = $("<td>");
						var $td77 = $("<div style='float : left;'>&nbsp;&nbsp;");
							var $td777 = $("<a href='customerQna.jsp'>");
								var $td7777 = $("<u>"+data[key].msg_content);
								
						$tr.append($td1);
						$tr.append($td2);
						$tr.append($td3);
						$tr.append($td4);
						$tr.append($td5);
						$tr.append($td6);
							
									$td777.append($td7777);
								$td77.append($td777);
							$td7.append($td77);
						$tr.append($td7);
						
						$tbody.append($tr);
						
				}
			},
			error : fucntion(){
				console.log("아따 에러여");
			} 
			
		});
	});
	*/
	
	</script>
</body>
</html>