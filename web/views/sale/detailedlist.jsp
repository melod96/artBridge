<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<h2 class="tit1">명세표 작가 코멘트</h2>

					</div>
					<div style="height: 30px;"></div>
					<div class="detailinfo">
						<br />
						<h4 class="cf">
							주문 번호 <span id="right">0001</span>
						</h4>
						<h4 class="cf">
							주문 날짜 <span id="right">2018-00-00</span>
						</h4>
						<h4 class="cf">
							구매자 <span id="right">누군가</span>
						</h4>
						<h4 class="cf">
							판매자<span id="right">토비</span>
						</h4>
						<h4 class="cf">
							옵션<span id="right">상체</span>
						</h4>
						<form>
						<input type="hidden" name= "pricelist" id = "pricelistlist" />
						<input type="hidden" name = "commentlist" id = "commentlistlist" />
							<div class="detailcomment">
								<div align="center" style="background: lightgray; height: 50px;">
									<h4 style="line-height: 50px; vertical-align: middle;">요구사항</h4>
								</div>
								<label for="usr" style="font-size: 15px;">와라라라라</label>
								<div class="form-group">
									<label for="pwd">가격 : </label> <input type="password"
										class="form-control input-short" id="pwd" name="payment">
								</div>
								<div class="form-group">
									<label for="comment">Comment:</label>
									<textarea class="form-control" rows="5" id="comment"
										name="content"></textarea>
								</div>

								<div align="center">
									<button type="button" class="btn btn-default btn-lg"
										onclick="updatebtn();" id = "wriupdate">재요청</button>
								</div>
						</form>
						<div style="height: 50px;"></div>
						<script>
									function updatebtn(){
										//코멘트랑 가격 정보를 요구사항의 크기 만큼 받아 온다.
										var pricelist = [];
										var commentlist= [];
										
										$("#pricelistlist").val() = pricelist;
										$("#commentlistlist").val() = commentlist;
									
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