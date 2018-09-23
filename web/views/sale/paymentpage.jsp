<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ArtBridge</title>
<%@ include file="/views/common/head.jsp"%>

<style type="text/css">
.payment {
	border: 1px solid lightgray;
}
.infotable{
	border: 1px solid lightgray;
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

#order_goods {
	width: 100%;
	border: 1px solid lightgray;
}

#order_goods .h_line {
	border-left: 1px solid lightgray;
}

#order_goods #order_goods2 {
	width: 366px;
	margin: 33px auto;
}

#order_goods #order_goods2 dl {
	margin-bottom: 14px;
}

.cf:after {
	content: "";
	display: block;
	clear: both;
	visibility: hidden;
	width: 0;
	height: 0;
	font-size: 0;
}

#order_goods #order_goods1 {
	margin: 33px 0;
	width: 358px;
}

#order_goods #order_goods1 .n_name {
	font-size: 22px;
}

#order_goods #order_goods1 .goods_name {
	margin-top: 7px;
}

#order_goods #order_goods1 .line_height {
	margin-bottom: 14px;
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
					<table cellspacing="0" id="order_goods">
						<tbody>
							<tr>
								<td width="234">
									<div class="thumb" style="cursor: default;">
										<li
											style="background: url(image/goods_img2/1475.jpg) no-repeat center top;"></li>
									</div>
								</td>
								<td width="403">
									<table id="order_goods1" cellspacing="0" border="0">
										<tbody>
											<tr>
												<td>
													<dl class="n_name">N 작가
													</dl>
													<dl class="goods_name">일러스트 성의껏 그려드려요!&nbsp;
													</dl>
													<dl class="clear" style="height: 10px"></dl>

													<dl class="left_right_li line_height cf">
														<li style="width: 270px; float: left;">메인 옵션 : 상체</li>
														<li class="lsp0">30,000원</li>
													</dl>

												</td>
											</tr>
										</tbody>
									</table>

								</td>
								<td class="h_line">
									<table id="order_goods2" cellspacing="0" border="0">
										<tbody>
											<tr>
												<td>
													<dl class="left_right_li cf">
														<li class="lsp" style="float: left;">제출 파일 유형</li>
														<li class="lsp0" style="float: right;">jpg</li>
													</dl>
													<dl class="left_right_li cf">
														<li class="lsp" style="float: left;">해상도</li>
														<li class="lsp0" style="float: right;">72dpi</li>
													</dl>
													<dl class="left_right_li cf">
														<li class="lsp" style="float: left;">사이즈</li>
														<li class="lsp0" style="float: right;">1500px</li>
													</dl>
													<dl class="left_right_li cf">
														<li class="lsp" style="float: left;">수정 횟수</li>
														<li class="lsp0" style="float: right;">3회</li>
													</dl>
													<dl class="left_right_li cf" style="height: 0">
														<li class="lsp" style="float: left;">작업 기간</li>
														<li style="float: right;">시작일로부터 <font class="lsp0"
															style="float: right;">7일</font></li>
													</dl>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="datail" style="margin-top: 15px;">
						<div class="info">
							<table class="infotable">
								<tr style = "border-bottom:1px solid lightgray;">
									<th style="font-size: 16px;">No</th>
									<th style="font-size: 16px;">요구사항</th>
									<th style="font-size: 16px;">가격</th>
								</tr>
								<tr>
									<th>1</th>
									<th>머리띠 추가</th>
									<th>3000원</th>
								</tr>
							</table>
							<h3 align="right">
								<span>합계 : </span><span>00000원</span>
							</h3>
						</div>
						<br>
						<form action="">
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
						</form>
					</div>
					<div class="btn-center">
						<button type="button" class="btn btn-primary btn-lg"
							onclick="paymentE()">결제하기</button>
						<button type="submit" class="btn btn-default btn-lg">취소</button>
					</div>
					<script>
						function paymentE(){
							window.open("http://127.0.0.1:8001/artBridge/views/sale/paymentAPI.jsp","(주)아트브릿지 결제","width=700px,height=600px");
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