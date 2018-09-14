<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ArtBridge</title>
<%@ include file="/views/common/head.jsp" %>
<style type="text/css">
.info {
	border: 1px solid black;
}

.payment {
	border: 1px solid black;
}

.payment p {
	margin: 15px;
}

.infotable th {
	margin: 15px;
	text-align: center;
	width: 500px;
	font-size: 15px;
}
</style>
</head>
<body>
	<div id="all">

		<!-- Header -->

		<%@ include file="/views/common/header.jsp"%>
		<section class="tit-area bg-gray">
			<!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
			<div class="container">
				<h2>결제하기</h2>
			</div>
		</section>

		<!-- contents area -->
		<div class="contents">
			<div class="container">
				<div class="col-md-12">
					<!-- 이 영역에서 작업하세요 -->

					<div class="heading">
						<h2 class="tit1">결제하기</h2>
					</div>
					<br>
					<div class="datail">
						<div class="info">
							<!--<p><span>판매자 : </span><span>토비</span></p>
				<p><span>구매자 : </span><span>페이커</span></p>
				<p><span>옵션 : </span><span>상체</span></p>-->
							<table class="infotable">
								<tr style="border: 1px solid black;">
									<th style="font-size: 20px;">No</th>
									<th style="font-size: 20px;">요구사항</th>
									<th style="font-size: 20px;">판매가</th>
								</tr>
								<tr>
									<th>1</th>
									<th>머리띠 추가</th>
									<th>3000원</th>
								</tr>
								<tr></tr>
							</table>

						</div>
						<div>
							<h5>
								<p>
									<span>판매자 : </span><span>토비</span>
								</p>
								<p>
									<span>구매자 : </span><span>페이커</span>
								</p>
								<p>
									<span>옵션 : </span><span>상체</span>
								</p>
							</h5>
							<h3 align="right">
								<span>합계 : </span><span>00000원</span>
							</h3>
						</div>
						<br>
						<div class="payment">
							<p>
								<span>주문자</span><span><input type="text" value="이상혁"></span><span
									style="float: right">입금은행 : 농협 351-0298-7776-43 예금주 :
									(주)아트브릿지</span>
							</p>
							<p>
								<span>이메일</span><span><input type="text" value="">
									@ <input type="text" value=""></span> <span><select
									class="form-inline input-xshort">
										<option>직접입력</option>
										<option>naver.com</option>
										<option>hanmail.net</option>
										<option>gmail.com</option>
										<option>nate.com</option>
										<option>hotmail.com</option>
								</select><span> <span style="float: right">입금자명 <input
											type="text" value="이상혁"></span>
							</p>
							<p>
								<span>전화번호</span><span><input type="text"
									value="01000000000"></span>
							</p>
						</div>
					</div>
					<div class="btn-center">
						<button type="button" class="btn btn-primary btn-lg">결제하기</button>
						<button type="submit" class="btn btn-default btn-lg">취소</button>
					</div>
					<!-- // 이 영역에서 작업하세요 -->
				</div>
			</div>
		</div>
		<!-- // contents area -->

		<%@ include file="/views/common/footer.jsp"%>
</body>
</html>