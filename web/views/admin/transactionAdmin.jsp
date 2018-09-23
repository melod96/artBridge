<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.comvision.artBridge.transaction.model.vo.*, com.comvision.artBridge.board.model.vo.*"%>
	<%
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
		<!-- //Header -->
		
		<%@ include file="/views/common/adminHeader.jsp"%>

		<!-- 주석 영역 -->
		<div class="contents">
			<!-- contents 필수 사용 -->
			<div class="container">
				<!-- container 필수 사용 -->
				<div class="col-md-12">
					<div class="heading">
						<h2>거래내역 관리</h2>
					</div>

					<hr>

					<br>

					<div>
						<table class="tbl-type02">
							<tbody>

								<tr>
									<td style="background: lightgray; width: 200px;">접수일</td>
									<td style="text-align: left;">&nbsp; <input type="radio"
										name="date" value="W" id="whole"> <label for="whole">전체</label>
										<input type="radio" name="date" value="P" id="period" checked>
										<label for="period">기간</label>&nbsp;&nbsp; <input type="date"
										name="date"> <label style="font-weight: bold">&nbsp;~&nbsp;</label>
										<input type="date" name="date">

									</td>
								</tr>

								<tr>
									<td style="background: lightgray">검색옵션</td>
									<td><select class="form-control input-short">
											<option>전체</option>
											<option>구매자명</option>
											<option>구매자ID</option>
											<option>작가명</option>
											<option>작가ID</option>
									</select></td>
								</tr>
								<tr>
									<td style="background: lightgray;">검색어 입력</td>
									<td><input id="" name="" class="form-control input-mid"
										type="text" placeholder="검색어를 입력하세요" style="float: left;">
										<button type="submit" name="mainBtn"
											class="btn btn-primary btn-md" style="float: right;">검색</button>
									</td>
								</tr>


							</tbody>
						</table>
					</div>

					<br> <br>
					<div>
						<p style="font-weight: bold; float: left;">※진행상황 프로세스 :</p>
						<p style="float: left; font-weight: bold;">결제대기</p>
						<p style="float: left;">&nbsp;→&nbsp;</p>

						<p style="float: left; font-weight: bold;">결제완료</p>
						<p style="float: left;">&nbsp;→&nbsp;</p>

						<p style="float: left; color: blue; font-weight: bold;">컨펌 1단계</p>
						<p style="float: left;">&nbsp;→&nbsp;</p>

						<p style="float: left; color: blue; font-weight: bold;">컨펌 2단계</p>
						<p style="float: left;">&nbsp;→&nbsp;</p>

						<p style="float: left; color: blue; font-weight: bold;">컨펌 3단계</p>
						<p style="float: left;">&nbsp;→&nbsp;</p>

						<p style="float: left; font-weight: bold;">거래완료</p>
						<p style="float: left;">&nbsp;/&nbsp;</p>

						<p style="float: left; font-weight: bold;">환불완료</p>

					</div>
					<br> <br>

					<table class="tbl-type02">
						<colgroup>
							<col style="width: 7%;">
							<col style="width: 8.5%;">
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: 12%;">
							<col style="width: 12%;">
							<col style="width: 10%;">
							<col style="width: *;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">거래번호</th>
								<th scope="col">구매자</th>
								<th scope="col">구매자ID</th>
								<th scope="col">거래작가</th>
								<th scope="col">작가ID</th>
								<th scope="col">진행상황</th>
								<th scope="col">접수일</th>
								<th scope="col">결제금액</th>
								<th scope="col">게시글</th>

							</tr>
						</thead>
						<tbody>
							<%if(list != null){for(Transaction t : list){%>
							<tr style="height: 50px;">
								<td><label><%= t.getOrders_no() %></label></td>
								<td><label><%= t.getCusName() %></td>
								<td><label><%= t.getCusId() %></td>
								<td><label><%= t.getWrtNick() %></td>
								<td><label><%= t.getWrtId() %></td>
								<td><label><%= t.getPay_status() %></td>
								<td><label><%= t.getO_date() %></td>
								<td><label><%= t.getPayment() %></td>
								<td><label><%= t.getBoard_title() %></td>
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

					<div class="paginate">
						<a href="#" class="btn-first" title="처음"><em class="blind">목록에서
								처음 페이지 이동</em></a> <a href="#" class="btn-prev" title="이전"><em
							class="blind">목록에서 이전 페이지 이동</em></a> <span class="paging-numbers">
							<a href="#">1<span class="blind">페이지로 이동</span></a> <a href="#"
							class="on">2<span class="blind">페이지로 이동</span></a> <a href="#">3<span
								class="blind">페이지로 이동</span></a> <a href="#">4<span
								class="blind">페이지로 이동</span></a> <a href="#">5<span
								class="blind">페이지로 이동</span></a>
						</span> <a href="#" class="btn-next" title="다음"><span class="spr"><em
								class="blind">목록에서 다음 페이지 이동</em></span></a> <a href="#" class="btn-last"
							title="끝"><span class="spr"><em class="blind">목록에서
									끝 페이지 이동</em></span></a>
					</div>


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