<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page
	import="java.util.*, com.comvision.artBridge.transaction.model.vo.Transaction,
				 com.comvision.artBridge.board.model.vo.*, com.comvision.artBridge.files.model.vo.*,
				 com.comvision.artBridge.sale.model.vo.*, com.comvision.artBridge.message.model.vo.Message"%>
	<%Transaction t = null;
	if (request.getAttribute("t") != null) {
		t = (Transaction) request.getAttribute("t");
	}
	ArrayList<Requirements> rlist = null;
	if (request.getAttribute("rlist") != null) {
		rlist = (ArrayList<Requirements>) request.getAttribute("rlist");
	}
	Member m = null;
	if (session.getAttribute("loginUser") != null) {
		m = (Member) session.getAttribute("loginUser");
	}
	int totalPrice = 0;
	if (request.getAttribute("totalprice") != null) {
		totalPrice = (int) (request.getAttribute("totalprice"));
	} %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ArtBridge</title>
<%@ include file="/views/common/head.jsp"%>
<style type="text/css">
.detailinfo {
	background: white;
}

#right {
	float: right;
}

.cf {
	margin: 15px;
}
</style>
</head>
<body>
	<div id="all">

		<!-- Header -->

		<%@ include file="/views/common/header.jsp"%>
		<!-- // Header -->

		<section class="tit-area bg-yellow">
			<!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
			<div class="container">
				<h2>마이페이지</h2>
			</div>
		</section>

		<!-- contents area -->
		<div class="contents">
			<div class="container" style="width: 50%;">
				<div class="col-md-12">
					<!-- 이 영역에서 작업하세요 -->

					<div class="heading">
						<h2 class="tit1">명세표 재 요청</h2>

					</div>
					<div style="height: 30px;"></div>
					<div class="detailinfo">
						<br />
						<h4 class="cf">
							주문 번호 <span id="right"><%=t.getOrders_no() %></span>
						</h4>
						<h4 class="cf">
							주문 날짜 <span id="right"><%=t.getO_date() %></span>
						</h4>
						<h4 class="cf">
							구매자 <span id="right"><%=m.getNick_name() %></span>
						</h4>
						<h4 class="cf">
							판매자<span id="right"><%=t.getWrtNick() %></span>
						</h4>
						<h4 class="cf">
							옵션<span id="right"><%=rlist.get(0).getRequirements_content() %></span>
						</h4>
						<form action="<%=request.getContextPath()%>/writercommentupdate.pg" method="post">
						<input type="hidden" id= "plist" name = "pricelist" />
						<input type="hidden" id="clist" name = "commentlist"/>
						<input type="hidden" id="contlist" name = "contentlist"/>
						<input type="hidden" value = "<%=t.getOrders_no() %>" name = "orderno" />
							<div class="detailcomment">
								<div align="center" style="background: lightgray; height: 50px;">
									<h4 style="line-height: 50px; vertical-align: middle;">요구사항</h4>
								</div>
								<% int i = 0;for(Requirements r : rlist){ %>
								<label style="font-size: 15px;" class = "requirmentcontent" id = "content<%=i%>"><%=r.getRequirements_content() %></label>
								<div class="form-group">
									<label>가격 : </label> <input type="text"
										class="form-control input-short" id="price<%=i %>" name="payment" value = "<%=r.getRequirement_price()%>">
								</div>
								<div class="form-group">
									<label for="comment">Comment:</label>
									<textarea class="form-control" rows="5" id="comment<%=i%>"
										name="content"></textarea>
								</div>
								<%i++;} %>

								<div align="center">
									<button type="button" class="btn btn-default btn-lg"
										onclick="updatebtn();" id = "wriupdate">재요청</button>
										<button class="btn btn-default btn-lg btn-plus-design"
													type="button"
													onclick="location.href='<%=request.getContextPath()%>/selectTransListlhm.ts'">목록으로</button>
								</div>
						</form>
						<div style="height: 50px;"></div>
						<script>
									function updatebtn(){
										//코멘트랑 가격 정보를 요구사항의 크기 만큼 받아 온다.
										var pricelist = [];
										var commentlist= [];
										var contentlist = [];
										var count = document.getElementsByClassName("requirmentcontent").length; 
										
										for(var i = 1; i<count; i++){
											pricelist+=$("#price"+i).val()+"@";
											commentlist+=$("#comment"+i).val()+"@";
											contentlist+=$("#content"+i).text()+"@";
										}
										
										$("#plist").val(pricelist);
										$("#clist").val(commentlist);
										$("#contlist").val(contentlist);
									
										$("#wriupdate").attr("type","submit");
										
										$("#wriupdate").click();
									}
								</script>
						<!-- // 이 영역에서 작업하세요 -->
					</div>
				</div>
			</div>
			<!-- // contents area -->

			<%@ include file="/views/common/footer.jsp"%>
</body>
</html>