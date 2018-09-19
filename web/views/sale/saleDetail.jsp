<%@page import="com.comvision.artBridge.board.model.vo.Board, java.util.*, com.comvision.artBridge.files.model.vo.*, com.comvision.artBridge.relate.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	Board b = (Board)request.getAttribute("b"); 
	ArrayList<Files> flist = (ArrayList<Files>)request.getAttribute("flist");
	ArrayList<HashMap<String, Object>> oplist = (ArrayList<HashMap<String, Object>>)request.getAttribute("oplist");
	ArrayList<Relate> rlist = (ArrayList<Relate>)request.getAttribute("rlist");
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
	border: 1px solid black;
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
	background: lightgray;
	height: 50px;
	margin-bottom: 30px;
	font-size: 20px;
	color: black;
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
					<div class="left">
					<%for(Files f : flist){ %>
						<img src="<%=f.getFiles_root() %>" alt=""/>
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
								<span>제출 파일 유형</span> : <span>벡터파일 / jpg,png</span>
							</p>
							<p>
								<span>해상도</span> : <span>300dpi</span>
							</p>
							<p>
								<span>사이즈</span> : <span>A4</span>
							</p>
							<p>
								<span>수정 횟수</span> : <span>3회</span>
							</p>
							<p>
								<span>작업 기간</span> : <span>시작일로부터 15일</span>
							</p>
						</div>
						<div align="center" id="text">가격옵션</div>
						<form>
							<label>옵션</label> <select>
								<option>옵션을 선택하세요1</option>
								<option>옵션을 선택하세요2</option>
							</select><br> <label>요구사항 추가</label> <input type="text" id = "requirement">
							<button type="button" class="btn btn-primary btn-sm" onclick = "add()">추가</button>
							<script>
								function add(){
									var d = document.getElementById("requirement");
									d.innerHTML += "<input type = 'text'>";
								}
							</script>
							<div class="orderline"></div>
							<div id="payment">
								<ul align="right">
									<div class="totalTitle">
										결제 금액 : <span id="totals">0</span><font
											style="font-size: 24px">원</font>
									</div>
								</ul>
								<ul style="margin-top: 10px;" align="center">
									<button type="submit" class="btn btn-primary btn-mg">명세표
										보내기</button>
								</ul>
							</div>
							<div align="center" id="text">information</div>
							<div>
								<ul class="cf">

									<p>
										<span>작가등급</span> : <span>일반작가</span>
									</p>
									<p>
										<span>게시글 카테고리</span> : 
										<%for(Relate r : rlist){ %>
										<span>#<%= r.getRelate_name() %> </span>
										<%} %>
									</p>
									<p>슬롯</p>
									<input type="radio">
									<input type="radio">
									<input type="radio">
								</ul>
							</div>
						</form>
					</div>
					<div id="text">
						<p align="center"><%=b.getBoard_content() %></p>
					</div>
					<div style="height: 30px"></div>
					<p align="center">
						<a href="/artBridge/views/info/infoUseOther.jsp">환불 규정 및 구매자 유의사항</a>
					</p>

					<div style="height: 30px"></div>
					<p align="center">모든 이미지는 저작권이 있는 이미지 입니다. 무단 도용 및 복제를 금합니다.</p>

				</div>
				<div class="hugiheader">
					<div>
						<h4>이용후기</h4>
						<button type="button" class="btn btn-md">후기 작성</button>
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

	</div>
</body>
</html>