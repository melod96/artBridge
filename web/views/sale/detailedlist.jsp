<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ArtBridge</title>
<%@ include file="/views/common/head.jsp" %>
<style type="text/css">
.detailinfo {
	background: lightgray;
	width: 50%;
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
			<div class="container">
				<div class="col-md-12">
					<!-- 이 영역에서 작업하세요 -->

					<div class="heading">
						<h2>명세표 확인</h2>
					</div>
					<div class="detailinfo" align="center">
						<h2>
							<명세표>
						</h2>
						<h4>
							날짜<span>2018-00-00</span>
						</h4>
						<h4>
							게시글번호<span>0001</span>
						</h4>
						<h4>
							구매자<span>누군가</span>
						</h4>
						<h4>
							판매자<span>토비</span>
						</h4>
						<h4>
							옵션<span>상체</span>
						</h4>
						<div class="detailcomment">
							<h4>요구사항</h4>
							<form>
								<span>1. 와라라라랄</span> <input type="text" value="3000" readonly><br>
								<br> <span>코멘트</span> <input type="text"
									placeholder="내용을 입력해주세요"><br>
								<br> <span>2. 와라라라랄</span> <input type="text" value="3000"
									readonly><br>
								<br> <span>코멘트</span> <input type="text"
									placeholder="내용을 입력해주세요"><br>
								<br> <span>3. 와라라라랄</span> <input type="text" value="3000"
									readonly><br>
								<br> <span>코멘트</span> <input type="text"
									placeholder="내용을 입력해주세요"><br>
								<br>
								<h3>
									<span>총 금액</span><span>00000원</span>
								</h3>
								<input type="checkbox" id="agree"><label for="agree">약관동의</label>
								<br>
								<br>
								<button type="reset" class="btn btn-default btn-mg">거래
									취소</button>
								<button type="submit" class="btn btn-primary btn-mg">거래
									수락</button>
								<br>
								<br>

								<button type="button" class="btn btn-default btn-mg">재요청</button>

							</form>
							<div style="height: 50px;"></div>
							<!-- // 이 영역에서 작업하세요 -->
						</div>
					</div>
				</div>
				<!-- // contents area -->

				<%@ include file="/views/common/footer.jsp"%>
</body>
</html>