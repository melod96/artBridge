<%@page
	import="com.comvision.artBridge.board.model.vo.Board, java.util.*,com.comvision.artBridge.sale.model.vo.Requirements,com.comvision.artBridge.files.model.vo.Files"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Member m = null;
	if(session.getAttribute("loginUser") != null){
		m = (Member)session.getAttribute("loginUser");
	}
	Board b = null;
	if ((Board) request.getAttribute("b") != null) {
		b = (Board) request.getAttribute("b");
	}
	ArrayList<Requirements> rlist = null;
	if ((ArrayList<Requirements>) request.getAttribute("rlist") != null) {
		rlist = (ArrayList<Requirements>) request.getAttribute("rlist");
	}
	Files f = null;
	if ((Files) request.getAttribute("f") != null) {
		f = (Files) request.getAttribute("f");
	}
	int totalPrice = 0;
	if (request.getAttribute("totalPrcie") != null) {
		totalPrice = (int)(request.getAttribute("totalPrcie"));
	}
	int orders_no = 0;
	if(request.getAttribute("orders_no")!= null){
		orders_no = (int)(request.getAttribute("orders_no"));
	}
%>
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

.infotable {
	border: 1px solid lightgray;
}

.payment p {
	margin: 15px;
	margin-left: 5px;
	margin-right: 5px;
}

.payment span {
	margin-left: 5px;
	margin-right: 5px;
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
									<div class="thumb" style="cursor: default;" align="center">
										<img src="<%=request.getContextPath() %><%=f.getFiles_root()%><%=f.getChange_title() %>" alt=""
											style="width: 162px; height: 122px;" />
									</div>
								</td>
								<td width="403">
									<table id="order_goods1" cellspacing="0" border="0">
										<tbody>
											<tr>
												<td>
													<dl class="n_name"><%=b.getNick_name()%>
														작가
													</dl>
													<dl class="goods_name"><%=b.getBoard_title()%>&nbsp;
													</dl>
													<dl class="clear" style="height: 10px"></dl>

													<dl class="left_right_li line_height cf">
														<li style="width: 270px; float: left;">메인 옵션 : <%=rlist.get(0).getRequirements_content()%></li>
														<li class="lsp0"><%=rlist.get(0).getRequirement_price()%>원</li>
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
														<li class="lsp0" style="float: right;"><%=b.getSubmit_file_type()%></li>
													</dl>
													<dl class="left_right_li cf">
														<li class="lsp" style="float: left;">해상도</li>
														<li class="lsp0" style="float: right;"><%=b.getResolution()%>dpi</li>
													</dl>
													<dl class="left_right_li cf">
														<li class="lsp" style="float: left;">사이즈</li>
														<li class="lsp0" style="float: right;"><%=b.getSubmit_size()%></li>
													</dl>
													<dl class="left_right_li cf">
														<li class="lsp" style="float: left;">수정 횟수</li>
														<li class="lsp0" style="float: right;">3회</li>
													</dl>
													<dl class="left_right_li cf" style="height: 0">
														<li class="lsp" style="float: left;">작업 기간</li>
														<li style="float: right;">시작일로부터&nbsp; <font
															class="lsp0" style="float: right;"> <%=b.getWorking_period()%>일
														</font></li>
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
								<tr style="border-bottom: 1px solid lightgray;">
									<th style="font-size: 16px;">No</th>
									<th style="font-size: 16px;">요구사항</th>
									<th style="font-size: 16px;">가격</th>
								</tr>
								<%
									int i = 1;
									for (Requirements r : rlist) {
								%>
								<tr>
									<th><%=i%></th>
									<th><%=r.getRequirements_content()%></th>
									<th><%=r.getRequirement_price()%>원</th>
								</tr>
								<%
									i++;
									}
								%>
							</table>
							<h3 align="right">
								<span>합계 : </span><span><%=totalPrice%>원</span>
							</h3>
						</div>
						<br>
						<form action="<%=request.getContextPath()%>/paymentAPIinfo.pg" method="post">
						<input type="hidden" value = "<%=m.getMember_no() %>" name = "customer_no" />
						<input type="hidden" value = "<%=totalPrice %>" name = "total_Price" />
						<input type="hidden" value = "<%=orders_no %>" name = "orders_no" />
							<div class="payment">
								<p>
									<span>주문자</span><span><input type="text" value="<%=m.getNick_name()%>"></span><span
										style="float: right">입금은행 : 농협 351-0298-7776-43 예금주 :
										(주)아트브릿지</span>
								</p>
								<p>
									<span>이메일</span><span><input type="text" name="email1"> @ <input
										type="text" id="emailauto"  name="email2"></span> <select
										class="form-inline input-xshort" onchange="emailautos()"
										name="emaildrop" style="height: 28px;">
										<option value="">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="nate.com">nate.com</option>
										<option value="hotmail.com">hotmail.com</option>
									</select>
									<script>
										function emailautos() {
											var email_val = document.all.emaildrop.value;
											console.log(email_val);

											document
													.getElementById("emailauto").value = email_val;
										}
									</script>
									<span style="float: right"><span>입금자명</span><input
										type="text" name="bank_name"></span>
								</p>
								<p>
									<span>전화번호</span><span><input type="text" name="phone"></span>
								</p>
							</div>
					</div>
					<div class="btn-center">
						<button type="submit" class="btn btn-primary btn-lg">결제하기</button>
						<button class="btn btn-default btn-lg" data-toggle="modal" type = "button"
							data-target="#myModal">취소</button>
					</div>
						</form>
					<!-- <script>
						function paymentE() {
							
							window.open(
											"http://127.0.0.1:8001/artBridge/views/sale/paymentAPI.jsp",
											"(주)아트브릿지 결제",
											"width=900px,height=700px");
						}
					</script> -->
					<!-- // 이 영역에서 작업하세요 -->
				</div>
			</div>
		</div>
		<!-- // contents area -->
		<!-- The Modal -->
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">주문 취소</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">주문을 취소하시겠습니까?</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-dark" onclick = "location.href='<%= request.getContextPath() %>/selectTransList.ts'">네</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">아니요</button>
					</div>

				</div>
			</div>
		</div>
		<div style = "height:50px;"></div>

		<%@ include file="/views/common/footer.jsp"%>
</body>
</html>