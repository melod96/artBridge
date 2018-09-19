<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.comvision.artBridge.board.model.vo.*,com.comvision.artBridge.files.model.vo.*, com.comvision.artBridge.relate.model.vo.*"%>
<%ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	ArrayList<Files> filelist = (ArrayList<Files>)request.getAttribute("filelist");
	ArrayList<Relate> rlist = (ArrayList<Relate>)request.getAttribute("rlist");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<HashMap<String,Object>> oplist = (ArrayList<HashMap<String,Object>>)request.getAttribute("oplist");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ArtBridge</title>
<%@ include file="/views/common/head.jsp"%>
<style type="text/css">
#cate_banner ul {
	display: inline-block;
	margin-top: 20px;
	margin-right: 10px;
}

.list_top {
	display: inline-block;
	float: left;
}

.left {
	display: inline-block;
}

#tagList {
	border: solid 1px black;
}

#tagList .tag_box {
	max-height: 126px;
	overflow: hidden;
	line-height: 230%;
}

#tagList .tag_box ol {
	margin: 0 20px 18px 0px;
	float: left;
}

.right {
	float: right;
}
.sBtn1{
	width:140px;
	background:#343434;
	color:white;
	text-align:center;
}
.sBtn1:hover{
	cursor:pointer;
}
#search{
	width:192px;
	height:32px;
	line-height:140%;
}
#list_img .list_img_box {
    position: relative;
    width: 534px;
    height: 244px;
    margin-bottom: 42px;
    border: 1px solid #d3d3d3;
    }
.left{
	float:left;
}
.paginate a:hover{
	cursor:pointer;
	border:1px solid rgb(52,152,219);
}
</style>
</head>
<body>
	<div id="all">

		<%@ include file="/views/common/header.jsp"%>
		<!-- // Header -->

		<section class="tit-area bg-blue">
			<!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
			<div class="container">
				<h2>일러스트</h2>
			</div>
		</section>

		<!-- contents area -->
		<div class="contents">
			<div class="container">
				<div class="col-md-12">
					<!-- 이 영역에서 작업하세요 -->


					<div class="clear" style="height: 50px;">&nbsp;</div>

					<div id="listFocus" class="clear" style="height: 6px;">&nbsp;</div>
					<div id="list_top" class="cf">

						<div class="ui action input">
							<form style="display: inline-block;" action="<%= request.getContextPath() %>/searchkeyword.bo" method="get">
								<input name="search" class="input-short form-inline" type="text"
									placeholder="텍스트를 입력하세요">
								<!--			<input id="" name="" class="form-control input-short" type="text" placeholder="텍스트를 입력하세요">-->

								<button type="submit" class="btn btn-default btn-sg form-inline">검색</button>
							</form>
							<!-- option 태그 미완성 -->
							<li class="left" style="margin-left: 8px">
							<select	class="form-control input-xshort" onchange="changeSelect()" name = "sel">
								<option value="0" name="0">전체</option>	
								<option value="1"name="1">최저가</option>
								<option value="2"name="2">최고가</option>
								<option value="3"name="3">거래완료율</option>
								<option value="4"name="4">별점</option>
							</select></li>
							<ul class="right">
								<div class="sBtn1" style="height: 42px; line-height: 42px;"
									onclick="">작품 등록 / 수정</div>
							</ul>

						</div>
						<script>
							function changeSelect(){
								var sel_val = document.all.sel.value;
								
								if(sel_val == "0"){
									location.href="<%=request.getContextPath()%>/selectList.bo";
								}else if(sel_val=="1"){
									$.ajax({
										url:"selectChangeList.bo",
										data:{sel_val:sel_val},
										type:"get",
										success:function(data){
											console.log("서버 전송 성공");
										},
										error:function(status, msg){
											console.log("서버 전송 실패");
										}
									});
								}else if(sel_val=="2"){
									$.ajax({
										url:"selectChangeList.bo",
										data:{sel_val:sel_val},
										type:"get",
										success:function(data){
											console.log("서버 전송 성공");
										},
										error:function(status, msg){
											console.log("서버 전송 실패");
										}
									});
								}else if(sel_val=="3"){
									$.ajax({
										url:"selectChangeList.bo",
										data:{sel_val:sel_val},
										type:"get",
										success:function(data){
											console.log("서버 전송 성공");
										},
										error:function(status, msg){
											console.log("서버 전송 실패");
										}
									});
								}else{
									$.ajax({
										url:"selectChangeList.bo",
										data:{sel_val:sel_val},
										type:"get",
										success:function(data){
											console.log("서버 전송 성공");
										},
										error:function(status, msg){
											console.log("서버 전송 실패");
										}
									});
								}
									
							}
						</script>

					</div>
					
					<br>

					<div id="tagList">
						<ul style="margin-bottom: 10px" id="hashtitle">
							<i class="fa fa-tag" style="margin-top: -3px; font-size: 18px"></i>
							<span class="fsize13">연관검색어</span>
						</ul>
						<ul class="tag_box">

							
							<%for(Relate r : rlist){ %>
								<ol>
									<a href="" class="tag21">#<%= r.getRelate_name() %></a>
								</ol>								
							<%} %>
							

						</ul>

					</div>
					<div class="clear" style="height: 30px;">&nbsp;</div>


					<form name="listForm" method="post" action="">
						<div id="list_list" style="display: none;">
							<table cellspacing="0" cellpadding="0" border="0" width="100%">
								<tbody id="list_table"></tbody>
								<!-- id:listTable 에 리스트가 나옵니다. -->
							</table>
						</div>
						<!-- <img src="/artBridge/image/saletest/salepageimg.jpg" alt="" /> -->
						<%
							int i = 0;
							for(Board b :list){
							HashMap<String,Object> hmap = oplist.get(i);
							i++;
						%>
							<div id="list_img" style="display: block;">
							<div class="list_img_box both left">
								<ul>
									<ol style="height: 145px;">
											<%for(Files f : filelist){ %>
												<dl class="thumb3" style="margin: 5px; display:inline-block;">
												<%-- <li style="background: url(<%= f.getFiles_root()%>) no-repeat center 15%"></li> --%>
												<li style="display:inline-block;" id = "thumbnail">
												<input type="hidden" value = "<%=b.getBoard_no() %>" />
													<img src="<%=f.getFiles_root() %>" alt=""/>
												</li>
												</dl>
											<%} %>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href=""
												title="이작가의 다른 작품보기"><%= b.getNick_name() %></a>&nbsp;&nbsp;/&nbsp;&nbsp;<%= b.getBoard_title() %>
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 101%; overflow: hidden">
												<img src="">
											</div>
										</dl>
										<dl class="price"><%=hmap.get("options_price") %>~</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
						
							
						
						</div>

						<%} %>

						
					</form>
					
					<script>
					//체이닝 방식
						$(function(){
							$('#thumbnail img').mouseenter(function(){
								$(this).parent().css({"opacity":"0.8","cursor":"pointer"});
							}).mouseout(function(){
								$(this).parent().css({"opacity":"1"});
							}).click(function(){
								var num = $(this).parent().children("input").val();
								location.href="<%= request.getContextPath()%>/selectOneSalepage.bo?num=" + num;
							});
						});
					</script>



					<div id="paging" style='clear: both'></div>


					<div class="ad_banner5"></div>

					<div class="clear" style="height: 20px">&nbsp;</div>
					
					<!-- 페이징 처리 부분 -->
					<div class="paginate">
						<a onclick="location.href='<%=request.getContextPath()%>/selectSaleList.bo?currentPage=1'" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a> 
						<% if(currentPage <=1){ %>
							<a disabled class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a> 
						<%}else{ %>
							<a onclick = "location.href='<%= request.getContextPath()%>/selectSaleList.bo?currentPage=<%=currentPage -1%>'" class="btn-prev" title="이전">
							<em class="blind">목록에서 이전 페이지 이동</em></a>
						<%} %>
						<span class="paging-numbers">
							<% for(int p = startPage; p <=endPage;p++){
								if(p==currentPage){%>
									<a disabled class="on"><%=p %><span class="blind">페이지로 이동</span></a>
								<%}else{ %>
									<a onclick= "location.href='<%= request.getContextPath()%>/selectSaleList.bo?currentPage=<%=p%>'"><%= p %><span class="blind">페이지로 이동</span></a>
								<%} %>
							<%} %>
						</span>
						<% if(currentPage >= maxPage){ %>
							<a disabled class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%}else{ %>
							<a onclick = "location.href = '<%= request.getContextPath()%>/selectSaleList.bo?currentPage=<%=currentPage +1%>'" class="btn-next" title="다음">
							<span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%} %>
						
						<a onclick = "location.href = '<%= request.getContextPath()%>/selectSaleList.bo?currentPage=<%=maxPage%>'" class="btn-last" title="끝">
						<span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
					</div>
					
					<!-- // 이 영역에서 작업하세요 -->
				</div>
			</div>
		</div>
		<!-- // contents area -->

		<%@ include file="/views/common/footer.jsp"%>

	</div>
</body>
</html>