<%@page import="com.comvision.artBridge.board.model.vo.Board, java.util.*, com.comvision.artBridge.files.model.vo.*, com.comvision.artBridge.relate.model.vo.*,com.comvision.artBridge.member.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	Board b = (Board)request.getAttribute("b"); 
	ArrayList<Files> flist = (ArrayList<Files>)request.getAttribute("flist");
	ArrayList<HashMap<String, Object>> oplist = (ArrayList<HashMap<String, Object>>)request.getAttribute("oplist");
	ArrayList<Relate> rlist = (ArrayList<Relate>)request.getAttribute("rlist");
	Rating ra = (Rating)request.getAttribute("r");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ArtBridge</title>
<%@ include file="/views/common/head.jsp" %>
<style type="text/css">
.hugi {
	border: solid 1px gray;
}

.hugi th {
	margin: 15px;
	text-align: center;
	width: 500px;
	font-size: 15px;
}

.left {
	float: left;
}

.hugiheader {
	display: inline-block;
}

.right {
	border: 1px solid black;
	float: right;
	width: 330px;
}

.right img {
	margin-left: 115px;
	margin-top: 30px;
	margin-bottom: 20px;
	width: 90px;
	height: 90px;
}

.right #text {
	background: #8cbae8;
	height: 50px;
	margin-bottom: 30px;
	font-size: 18px;
	color: black;
	line-height:50px;
	vertical-align:middle;
}

.right #text span {
	
}

#receive {
	background: rgb(169, 221, 241);
	border-radius: 15px;
	width: 30%;
	margin-left: auto;
	margin-right: auto;
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

					<div class="left_title">
						<h5>작품 번호 : <%= b.getBoard_no() %></h5>
						<h2>
							<a href=""><%= b.getNick_name() %></a> - <%= b.getBoard_title() %>
						</h2>
					</div>
					<div>
					<div class="left" style = "width:740px;">
					<%for(Files f : flist){ %>
						<img src="<%=f.getFiles_root() %>" alt="" style = "width:732px;"/>
					<%} %>
					</div>
					<div class="right">
						<img src="/artBridge/image/saletest/salepageimg.jpg" id="img">
						<p align="center">
							<a href=""><%= b.getNick_name() %></a>
						</p>
						<ol id="receive" align="center">접수중
						</ol>
					
						<ol align="center">
						<div class="rateit" data-rateit-value="2.5" data-rateit-ispreset="true" data-rateit-readonly="true"></div>

							평점
							<font class="lsp0">2.5</font>
						</ol>
						<div align="center" style="margin-bottom: 15px;">
							<button type="button" class="btn btn-primary">작가에게 쪽지보내기</button>
						</div>
						<div align="center" id="text">상세옵션</div>
						<div>
							<p>
								<span>제출 파일 유형</span><span style="float:right;"><%= b.getSubmit_file_type() %></span>
							</p>
							<p>
								<span>해상도</span><span style="float:right;"><%= b.getResolution() %>dpi</span>
							</p>
							<p>
								<span>사이즈</span><span style="float:right;"><%= b.getSubmit_size() %></span>
							</p>
							<p>
								<span>수정 횟수</span><span style="float:right;">3회</span>
							</p>
							<p>
								<span>작업 기간</span><span style="float:right;">시작일로부터 <%=b.getWorking_period() %>일</span>
							</p>
						</div>
						<div align="center" id="text">가격옵션</div>
						<form>
							<label>옵션</label> <select style= "width:200px;float:right;" onchange="changeSelect()" name = "sel">
							<option value="0">옵션을 선택해주세요</option>
							<%for(int i=0; i<oplist.size(); i++){
								HashMap<String,Object> hmap = oplist.get(i);%>
								<option value = "<%= hmap.get("options_price")%>"><%= hmap.get("options_name") %> - <%= hmap.get("options_price") %></option>
								<%} %>
							</select><br> <label>요구사항 추가</label>
							<button type="button" class="btn btn-primary btn-sm" onclick = "add()" style="float:right;">추가</button>
							<div id = "requirement">
							<input type="text" style="width:320px;">
							</div> 
							<script>
								function add(){
									var d = document.getElementById("requirement");
									d.innerHTML += "<input type = 'text' style='width:320px;''>";
								}
							</script>
							<div class="orderline"></div>
							<div id="payment">
								<ul align="right">
									<div class="totalTitle">
										최소 결제 금액 : <span id="totals"></span><font
											style="font-size: 24px">원</font>
									</div>
								</ul>
								<ul style="margin-top: 10px;" align="center">
									<button type="submit" class="btn btn-primary btn-mg">명세표 보내기</button>
								</ul>
							</div>
							<script>
								function changeSelect(){
									var sel_val = document.all.sel.value;
									
									document.getElementById("totals").innerHTML = sel_val;
								}
							</script>
							<div align="center" id="text">information</div>
							<div>
								<ul class="cf">

									<p>
										<span>작가등급</span><span style="float:right;"><%= ra.getRating_name() %></span>
									</p>
									<p>
										<span>게시글 카테고리</span>
										<%for(Relate r : rlist){ %>
										<span style="float:right;">#<%= r.getRelate_name() %>&nbsp; </span>
										<%} %>
									</p>
									<p>슬롯</p>
									<%for(int i = 0; i<ra.getSlot(); i++){%>
									<input type="radio">
									<%} %>
								</ul>
							</div>
						</form>
					</div>
					</div>

				</div>
					<div id="textinfo">
						<p align="center"><%=b.getBoard_content() %></p>
					</div>
					<div style="height: 30px"></div>
					<p align="center">
						<a href="/artBridge/views/info/infoUseOther.jsp">환불 규정 및 구매자 유의사항</a>
					</p>

					<div style="height: 30px"></div>
					<p align="center">모든 이미지는 저작권이 있는 이미지 입니다. 무단 도용 및 복제를 금합니다.</p>
				<div class="hugiheader">
					<div style = "display:inline-block;">
						<h4>이용후기</h4>
						<button type="button" class="btn btn-md" data-toggle="modal" data-target="#hugiModal">후기 작성</button>
					</div>
					<div class="hugi">
						<table>
							<th>번호</th>
							<th>평점</th>
							<th>내용</th>
							<th>작성자</th>
							<th>작성일</th>
						</table>
					</div>
					<!-- // 이 영역에서 작업하세요 -->
				</div>
			</div>
		</div>
		<!-- // contents area -->

		<%@ include file="/views/common/footer.jsp"%>
		<!-- modal -->
		<%@ include file = "/views/sale/hugi.jsp" %>
	</div>
</body>
</html>