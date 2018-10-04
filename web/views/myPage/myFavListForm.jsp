<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.comvision.artBridge.fav.model.vo.*"%>
	<%
	ArrayList<HashMap<String, Object>> hlist = null;
	if ((ArrayList<HashMap<String, Object>>) request.getAttribute("hlist") != null) {
		hlist = (ArrayList<HashMap<String, Object>>) request.getAttribute("hlist");
	}
	ArrayList<Fav> flist = null;
	if ((ArrayList<Fav>) request.getAttribute("flist") != null) {
		flist = (ArrayList<Fav>) request.getAttribute("flist");
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
.tab-menu-content-form {
	padding-top: 15px;
}

.selectBox {
	float: right;
	margin-bottom: 20px;
}

.btn-outer-style {
	float: right;
	padding-bottom: 60px;
}

.btn-plus-design {
	padding: 2px 20px;
	font-size: 15px;
	margin-left: 0px;
}

.btn-cancel {
	background: #DBDBDB;
}

.btn-cancel:hover {
	background: #808080;
	color: white;
}

.btn {
	cursor: pointer;
}

.bookmark-list-wrap {
	width: 100%;
	padding: 0px 39px;
}

.bookmark-detailView-btn {
	cursor: pointer;
	font-size: 30px;
	font-weight: bold;
	padding-bottom: 15px;
}

.bookmark-list {
	margin: 0px 20px 50px;
	display: inline-block;
}

.bookmark-del-btn {
	position: absolute;
	left: 255px;
	color: #fcce18;
	font-weight: bold;
	font-size: 1.8em;
	cursor: pointer;
}

.bookmark-del-btn:hover {
	color: darkgray;
}

.frofile-box {
	overflow: hidden;
	position: relative;
	border: 1px solid #9e9e9e;
	padding: 30px;
	font-size: 16px;
	width: 1110px;
}

.img-in {
	overflow: hidden;
	width: 150px;
	height: 150px;
	/*background:url("/artBridge/image/common/img_profile.png") 0 0 no-repeat; background-size:100%;*/
	border: 1px solid #ddd;
	border-radius: 50%;
}

.img-in img {
	width: 100%;
}

.img-area {
	float: left;
	text-align: center;
}

.img-area input[type=file] {
	margin-top: 20px;
	width: 150px;
}

.input-area {
	margin-left: 40px;
	float: left;
	width: 585px;
}

.input-area label {
	vertical-align: top;
}

.input-area input[type="text"], .input-area textarea {
	display: inline-block;
	width: 515px;
	resize: none;
	margin-bottom: 10px;
}

.input-area textarea {
	margin-bottom: 0;
}

.input-area .info {
	margin-top: 5px;
}

.input-area .info li {
	font-size: 14px;
	margin-bottom: 3px;
	color: #428bca;
}

.input-area label[for=state1] {
	color: green;
	font-weight: bold;
}

.input-area label[for=state2] {
	color: red;
	font-weight: bold;
}

.state-area {
	margin-left: 20px;
	float: left;
	width: 250px;
}

.state-area li {
	position: relative;
	border-bottom: 1px solid #bdbdbd;
	margin-bottom: 10px;
}

.state-area li span {
	float: right;
}

.absol-btn {
	position: absolute;
	bottom: 30px;
	right: 30px;
}

.bord-wrap {
	overflow: hidden;
	width: 1110px;
	font-size: 16px;
}

.bord-wrap .piece-list {
	float: left;
	border: 1px solid #9e9e9e;
	padding: 20px;
	width: 545px;
	margin-left: 20px;
	margin-bottom: 20px;
	font-weight: bold;
}

.bord-wrap .piece-list.default {
	width: 100%;
	text-align: center;
	padding: 50px 0;
}

.bord-wrap .piece-list:nth-child(2n+1) {
	margin-left: 0;
}

.bord-wrap .seting-area {
	overflow: hidden;
	float: right;
}

.bord-wrap .seting-area li {
	float: left;
	margin-left: 10px;
}

.bord-wrap .seting-area li input {
	display: inline-block;
	width: 25px;
	height: 25px;
	background-size: 100% !important;
	border: none;
}

.bord-wrap .seting-area .btn-lock {
	background: url("/artBridge/image/common/ico_lock.png") 0 0 no-repeat;
}

.bord-wrap .seting-area .btn-lock.on {
	background: url("/artBridge/image/common/ico_unlock.png") 0 0 no-repeat;
}

.bord-wrap .seting-area .btn-edit {
	background: url("/artBridge/image/common/ico_repaint.png") 0 0 no-repeat;
}

.bord-wrap .seting-area .btn-del {
	background: url("/artBridge/image/common/ico_delete.png") 0 0 no-repeat;
}

.bord-wrap .img-area {
	float: none;
	overflow: hidden;
	width: 100%;
}

.bord-wrap .img-area .tmb {
	overflow: hidden;
	float: left;
	width: 32%;
}

.bord-wrap .img-area .tmb ~.tmb {
	margin-left: 1.9%;
}

.bord-wrap .img-area .tmb img {
	width: 100%;
}

.bord-wrap .info-area1 {
	overflow: hidden;
	margin-top: 20px;
}

.bord-wrap .info-area1 span {
	float: left;
	width: 30%;
}

.bord-wrap .info-area1 span:first-child {
	width: 40%;
}

.bord-wrap .info-area2 {
	overflow: hidden;
	margin-top: 10px;
}

.bord-wrap .info-area2 span {
	float: left;
}

.bord-wrap .info-area2 .price {
	float: right;
	font-size: 20px;
	font-weight: bold;
}

.heading {
	margin: 30px 0 10px 0 !important;
}

div.btn-right.add-some button {
	bottom: 0;
	top: auto;
}

.paginate {
	margin-bottom: 50px;
}

.btn-default {
	background-color: #e4e4e4;
	color: #4e4e4e;
}

.star_rating {
	display: inline-block;
	font-size: 0;
	letter-spacing: -4px;
	text-align: right;
}

.star_rating a {
	font-size: 25px;
	letter-spacing: 0;
	display: inline-block;
	color: #d6d6d6;
	text-decoration: none;
	line-height: 0.9;
	margin-top: -2px;
}

.star_rating a:first-child {
	margin-left: 0;
}

.star_rating a.on {
	color: #fcce18;
}
</style>
</head>
<body>
	<div id="all">

		<!-- Header -->
		<%@ include file="/views/common/header.jsp"%>
		<!-- // Header -->

		<!-- subHeader -->
		<%@ include file="/views/common/subHeader.jsp"%>
		<!-- //subHeader -->

		<!-- 주석 영역 -->
		<div class="contents">
			<!-- contents 필수 사용 -->
			<div class="container">
				<!-- container 필수 사용 -->
				<div class="col-md-12">

					<div class="heading">
						<h2 class="tit1">관심작가</h2>
					</div>

					<form action="" method="get" class="bookmark-menu tab-menu-content-form">
						<div class="bookmark-menu">
							<div id="bookmark-list-wrap" class="bookmark-menu bookmark-list-wrap">
							<%if(hlist!=null){
								for (int k = 0; k < flist.size(); k++) {
									HashMap<String, Object> hmap = hlist.get(k); %>
								<div class="frofile-box bookmark-list" style="width: 300px; padding: 5px 15px 15px 15px;">
									<a onclick="fav(this.id);" class="on bookmark-del-btn" id="<%=flist.get(k).getWriter_no()%>">★</a>
									<table style="margin-right: auto; margin-left: auto;">
										<tr>
											<td colspan="2" align="center" height="170px" style="padding-top: 15px; padding-bottom: 10px">
												<div class="img-in">
													<img src="<%=request.getContextPath() %><%=hmap.get("profile")%><%=hmap.get("change") %>" alt="default frofile image">
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2" style="text-align: center;">
											<a href="<%=request.getContextPath() %>/selectPieceList.wr?memberNo=<%=flist.get(k).getWriter_no()%>"class="bookmark-detailView-btn"><%=hmap.get("nick")%> 작가</a></td>
										</tr>
										<script>
											function fav(i){
												$.ajax({
													url:"favUpdate.sp",
													data:{writer_noo:i},
													type:"post",
													success:function(data){
														alert("관심작가 업데이트 성공!");
													},
													error:function(status, msg){
														alert("관심작가 업데이트 실패!");
													}
												});
											}
										</script>
										<tr>
											<td>
												<div class="state-area"
													style="margin-left: 0px; padding-left: 15px; padding-right: 15px;">
													<ul>
														<li>작품리스트 <span><%=hmap.get("bcount")%>개</span></li>
														<li>평점 <span>
																<p class="star_rating">
																	<!-- 별 갯수 평균으로 반영하기 -->
																	<a href="#" class="on">★</a> <a href="#" class="on">★</a>
																	<a href="#" class="on">★</a> <a href="#">★</a> 
																	<a href="#">★</a>
																</p> <%=hmap.get("grade")%>점
														</span>
														</li>
														<li>진행중인 의뢰 <span><%=hmap.get("orcount")%>건</span></li>
														<li>슬롯 갯수 <span><%=hmap.get("slot")%>개</span></li>
													</ul>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<%} }else{%>
									<h1>관심 작가가 없습니다</h1>
								<%} %>
							</div>
							<br><br><br><br>
						</div>
					</form>
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