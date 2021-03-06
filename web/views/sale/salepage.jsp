<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.comvision.artBridge.board.model.vo.*,com.comvision.artBridge.files.model.vo.*, com.comvision.artBridge.relate.model.vo.*"%>
<%
	Member m = null;
	if (session.getAttribute("loginUser") != null) {
		m = (Member) session.getAttribute("loginUser");
	}
	ArrayList<Board> list = null;
	if ((ArrayList<Board>) request.getAttribute("list") != null) {
		list = (ArrayList<Board>) request.getAttribute("list");
	}
	ArrayList<Relate> rlist = null;
	if ((ArrayList<Relate>) request.getAttribute("rlist") != null) {
		rlist = (ArrayList<Relate>) request.getAttribute("rlist");
	}
	PageInfo pi = null;
	int listCount = 0;
	int currentPage = 0;
	int maxPage = 0;
	int startPage = 0;
	int endPage = 0;
	if ((PageInfo) request.getAttribute("pi") != null) {
		pi = (PageInfo) request.getAttribute("pi");
		listCount = pi.getListCount();
		currentPage = pi.getCurrentPage();
		maxPage = pi.getMaxPage();
		startPage = pi.getStartPage();
		endPage = pi.getEndPage();

	}
	ArrayList<HashMap<String, Object>> oplist = null;
	if ((ArrayList<HashMap<String, Object>>) request.getAttribute("oplist") != null) {
		oplist = (ArrayList<HashMap<String, Object>>) request.getAttribute("oplist");
	}
	ArrayList<HashMap<String, Object>> alist = null;
	if ((ArrayList<HashMap<String, Object>>) request.getAttribute("alist") != null) {
		alist = (ArrayList<HashMap<String, Object>>) request.getAttribute("alist");
	}
	int changenum = 0;
	if ((int) request.getAttribute("changenum") > 0) {
		changenum = (int) request.getAttribute("changenum");
	}
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
	border: solid 1px lightgray;
	padding: 14px 0px 0px 24px;
}

#tagList .tag_box {
	max-height: 126px;
	overflow: hidden;
	line-height: 230%;
}

#tagList .tag_box ol {
	margin: 0 20px 2px 0px;
	float: left;
}

.right {
	float: right;
}

.sBtn1 {
	width: 140px;
	background: #343434;
	color: white;
	text-align: center;
}

.sBtn1:hover {
	cursor: pointer;
}

#search {
	width: 192px;
	height: 32px;
	line-height: 140%;
}

#list_img .list_img_box {
	position: relative;
	width: 534px;
	height: 180px;
	margin-bottom: 42px;
	border: 1px solid #d3d3d3;
}

.left {
	float: left;
}

.paginate a:hover {
	cursor: pointer;
	border: 1px solid rgb(52, 152, 219);
}

#list_img .price {
	float: right;
	font-size: 24px;
	margin-top: -38px;
	margin-right:5px;
}
.tag21{
	cursor:pointer;
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
						<div class="left">
							<div class="ui action input">
								<form style="display: inline-block;"
									action="<%=request.getContextPath()%>/searchkeyword.bo"
									method="get">
									<input name="search" class="input-short form-inline"
										type="text" placeholder="텍스트를 입력하세요" style = "height:32px;">

									<button type="submit"
										class="btn btn-default btn-sg form-inline">검색</button>
								</form>

							</div>
						</div>
						<div class="right">
							<%
								if (m != null && m.getWriter_right() == 1) {
							%>
							<ul>
								<div class="sBtn1"
									style="height: 42px; line-height: 42px; margin-left: 10px;"
									onclick="location.href='<%=request.getContextPath()%>/selectPieceList.wr?memberNo=<%=m.getMember_no()%>'">작품
									등록 / 수정</div>
									<%-- <button type="button" class="btn btn-dark sBtn1" onclick="location.href='<%=request.getContextPath()%>/selectPieceList.wr?memberNo=<%=m.getMember_no()%>'">작품 등록 / 수정</button> --%>
							</ul>
							<%
								}
							%>
						</div>
					</div>
					<%
						if (changenum == 0) {
					%>
					<div class="right">
						<!-- option 태그 미완성 -->
						<li class="right" style="margin-left: 8px"><select
							class="form-control input-xshort" onchange="changeSelect()"
							name="sel">
								<option value="0" name="0">전체</option>
								<option value="1" name="1">최저가</option>
								<option value="2" name="2">최고가</option>
								<option value="3" name="3">인기순</option>
						</select></li>
					</div>
					<%
						} else if (changenum == 1) {
					%>
					<div class="right">
						<!-- option 태그 미완성 -->
						<li class="right" style="margin-left: 8px"><select
							class="form-control input-xshort" onchange="changeSelect()"
							name="sel" value="">
								<option value="0" name="0">전체</option>
								<option value="1" name="1" selected>최저가</option>
								<option value="2" name="2">최고가</option>
								<option value="3" name="3">인기순</option>
						</select></li>
					</div>
					<%
						} else if (changenum == 2) {
					%>
					<div class="right">
						<!-- option 태그 미완성 -->
						<li class="right" style="margin-left: 8px"><select
							class="form-control input-xshort" onchange="changeSelect()"
							name="sel" value="">
								<option value="0" name="0">전체</option>
								<option value="1" name="1" >최저가</option>
								<option value="2" name="2" selected>최고가</option>
								<option value="3" name="3">인기순</option>
						</select></li>
					</div>
					<%
						} else if (changenum == 3) {
					%>
					<div class="right">
						<!-- option 태그 미완성 -->
						<li class="right" style="margin-left: 8px"><select
							class="form-control input-xshort" onchange="changeSelect()"
							name="sel" value="">
								<option value="0" name="0">전체</option>
								<option value="1" name="1" >최저가</option>
								<option value="2" name="2">최고가</option>
								<option value="3" name="3" selected>인기순</option>
						</select></li>
					</div>
					<%
						}
					%>

					<script>
							function changeSelect(){
								var sel_val = document.all.sel.value;
								
								if(sel_val == "0"){
									location.href="<%=request.getContextPath()%>/selectSaleList.bo";
								}else{
									location.href="<%=request.getContextPath()%>/selectChangeList.sp?sel_val="+sel_val;
								}
							}
							
						</script>


					<br>

					<div id="tagList" style="margin-top: 50px;">
						<ul style="margin-bottom: 10px" id="hashtitle">
							<i class="fa fa-tag" style="margin-top: -3px; font-size: 18px"></i>
							<span class="fsize13">연관검색어</span>
						</ul>
						<ul class="tag_box">

							<%
								for (Relate r : rlist) {
							%>
							<ol>
								<a>#</a>
								<a class="tag21" onclick="relatesearch(this.text)"><%=r.getRelate_name()%></a>
							</ol>
							<%
								}
							%>


						</ul>

					</div>

					<script>
						function relatesearch(t){
							location.href="<%=request.getContextPath()%>/searchRelate.pg?relate="+t;
						}
					</script>
					<div class="clear" style="height: 30px;">&nbsp;</div>


					<div id="list_list" style="display: none;">
						<table cellspacing="0" cellpadding="0" border="0" width="100%">
							<tbody id="list_table"></tbody>
							<!-- id:listTable 에 리스트가 나옵니다. -->
						</table>
					</div>
					<%
						int i = 0;
						for (Board b : list) {
							i++;
					%>

					<div id="list_img" style="display: block;">
						<div class="list_img_box both left" id="test" style= "margin-left: 15px;">
							<ul>
								<ol style="height: 145px;">
									<%
										for (int j = 0; j < alist.size(); j++) {
												HashMap<String, Object> hhmap = alist.get(j);
												if (hhmap.get("board_no").equals(b.getBoard_no())) {
									%>
									<dl class="thumb3" style="display: inline-block; margin-left:10px;">
										<li style="display: inline-block;" id="thumbnail">
											<input type="hidden" value="<%=b.getBoard_no()%>" /> 
											<img src="<%=request.getContextPath() %><%=hhmap.get("files_root")%><%=hhmap.get("change_title") %>" alt="" style="width: 162px; height: 122px;" />
										</li>
									</dl>
									<%
										}
											}
									%>
								</ol>
								<ol style="height: 28px;">
									<dl class="left ellip" style="padding-left: 7px; width: 360px;">
										<a href="<%=request.getContextPath() %>/selectWriterView.wr?memberNo=<%=b.getMember_no() %>" title="이작가의 다른 작품보기"><%=b.getNick_name()%></a>&nbsp;&nbsp;/&nbsp;&nbsp;<%=b.getBoard_title()%>
									</dl>
								</ol>
								<ol>
									<%
										for (int k = 0; k < oplist.size(); k++) {
												HashMap<String, Object> hmap = oplist.get(k);
												if (hmap.get("board_no").equals(b.getBoard_no())) {
									%>
									<dl class="price"><%=hmap.get("options_price")%>~ </dl>
									<%
										break;
												}
											}
									%>
								</ol>
							</ul>
							<div class="clear" style="height: 10px;">&nbsp;</div>
						</div>



					</div>

					<%
						}
					%>



					<script>
					//체이닝 방식
						$(function(){
							$('#thumbnail img').mouseenter(function(){
								$(this).parent().css({"opacity":"0.8","cursor":"pointer"});
							}).mouseout(function(){
								$(this).parent().css({"opacity":"1"});
							}).click(function(){
								var num = $(this).parent().children("input").val();
								location.href="<%=request.getContextPath()%>/selectOneSalepage.bo?num="+ num;
											});
						});
					</script>



					<div id="paging" style='clear: both'></div>


					<div class="ad_banner5"></div>

					<div class="clear" style="height: 20px">&nbsp;</div>

					<!-- 페이징 처리 부분 -->
					<div class="paginate">
						<a
							onclick="location.href='<%=request.getContextPath()%>/selectSaleList.bo?currentPage=1'"
							class="btn-first" title="처음"><em class="blind">목록에서 처음
								페이지 이동</em></a>
						<%
							if (currentPage <= 1) {
						%>
						<a disabled class="btn-prev" title="이전"><em class="blind">목록에서
								이전 페이지 이동</em></a>
						<%
							} else {
						%>
						<a
							onclick="location.href='<%=request.getContextPath()%>/selectSaleList.bo?currentPage=<%=currentPage - 1%>'"
							class="btn-prev" title="이전"> <em class="blind">목록에서 이전
								페이지 이동</em></a>
						<%
							}
						%>
						<span class="paging-numbers"> <%
 	for (int p = startPage; p <= endPage; p++) {
 		if (p == currentPage) {
 %> <a disabled class="on"><%=p%><span
								class="blind">페이지로 이동</span></a> <%
 	} else {
 %> <a
							onclick="location.href='<%=request.getContextPath()%>/selectSaleList.bo?currentPage=<%=p%>'"><%=p%><span
								class="blind">페이지로 이동</span></a> <%
 	}
 %> <%
 	}
 %>
						</span>
						<%
							if (currentPage >= maxPage) {
						%>
						<a disabled class="btn-next" title="다음"><span class="spr"><em
								class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%
							} else {
						%>
						<a
							onclick="location.href = '<%=request.getContextPath()%>/selectSaleList.bo?currentPage=<%=currentPage + 1%>'"
							class="btn-next" title="다음"> <span class="spr"><em
								class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%
							}
						%>

						<a
							onclick="location.href = '<%=request.getContextPath()%>/selectSaleList.bo?currentPage=<%=maxPage%>'"
							class="btn-last" title="끝"> <span class="spr"><em
								class="blind">목록에서 끝 페이지 이동</em></span></a>
					</div>
					
					<div style = "height:50px;"></div>

					<!-- // 이 영역에서 작업하세요 -->
				</div>
			</div>
		</div>
		<!-- // contents area -->

		<%@ include file="/views/common/footer.jsp"%>

	</div>
</body>
</html>