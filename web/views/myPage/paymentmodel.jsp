<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, com.comvision.artBridge.transaction.model.vo.Transaction,
				 com.comvision.artBridge.board.model.vo.*, com.comvision.artBridge.files.model.vo.*,
				 com.comvision.artBridge.sale.model.vo.*, com.comvision.artBridge.message.model.vo.Message"%>
<%
	Transaction t = null;
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
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/views/common/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="all">

		<!-- Header -->

		<%@ include file="/views/common/header.jsp"%>
		<!-- // Header -->

		<section class="tit-area bg-yellow"> <!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
		<div class="container">
			<h2>마이페이지</h2>
		</div>
		</section>

		<!-- contents area -->
		<div class="contents">
			<div class="container" style="width: 50%;">
				<div class="col-md-12">
					<!-- 이 영역에서 작업하세요 -->

					<%
						if (t != null) {
					%>
					<form action="<%=request.getContextPath()%>/paymentpage.pg" method="post">
					<input type="hidden" name = "orders_no" value = "<%=t.getOrders_no() %>" />
					<input type="hidden" name = "customer_no" value = "<%= m.getMember_no() %>" />
					<input type="hidden" name= "writer_no" value = "<%= t.getWrtNo()%>" />
					<input type="hidden" name = "total" value = "<%=totalPrice %>" />
						<div id="stmtModalArea" class="w3-modal"
							onclick="stmtDisplayNone();"></div>
						<div id="stmtArea" class="settingArea">
							<!-- 모달 요소 넣기 -->
							<div class=stmtModal-Area-Style align="center">
								<h3>명 &nbsp; 세 &nbsp; 서</h3>
								<table class="form-table">
									<tr>
										<td width="15px"></td>
										<td width="90px" class="stmt-title">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목
											:</td>
										<td colspan="3"><%=t.getBoard_title()%></td>
									</tr>
									<tr>
										<td></td>
										<td class="stmt-title">신 청 일 :</td>
										<td colspan="3"><%=t.getO_date()%></td>
									</tr>
									<tr>
										<td></td>
										<td class="stmt-title">구 매 자 :</td>
										<td width="230px"><%=m.getNick_name()%></td>
										<td width="80px" class="stmt-title">판 매 자 :</td>
										<td width="150px"><%=t.getWrtNick()%></td>
									</tr>
									<tr>
										<td></td>
										<td class="stmt-title">옵 션 명 :</td>
										<td colspan="3"><%=rlist.get(0).getRequirements_content()%></td>
									</tr>
									<tr>
										<td colspan="5" height="30px"></td>
									</tr>
									<tr>
										<td colspan="5" width="540px">
											<table border="1">
												<tr class="form-inner-table-title"
													style="font-weight: bold; text-align: center;"
													height="25px">
													<td width="35px">No</td>
													<td width="380px">요 구 사 항</td>
													<td width="87px">금 액</td>
												</tr>
												<%
													for (Requirements r : rlist) {
															int i = 1;
												%>
												<tr height="23px">
													<td align="center"><%=i%></td>
													<td style="font-size: 12px; padding-left: 10px;"><%=r.getRequirements_content()%></td>
													<td align="right"><%=r.getRequirement_price()%>원</td>
												</tr>
												<%
													i++;
														}
												%>
											</table> <br>
											<table align="right">
												<tr>
													<td>총 금 액 :</td>
													<td><strong style="font-size: 20px;"><%=totalPrice%>
															원</strong></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td colspan="5">
											<div class="btn-center stmtBtn">
												<button class="btn btn-primary btn-mg btn-plus-design"
													type="submit" style="width: 50%;">거 래 수 락</button>
												<br>
												<br />
												<%if(m.getWriter_right()==0){ %>
												<button class="btn btn-primary btn-mg btn-plus-design"
													style="margin-left: 0;" type="button" onclick = "change()">재 요청</button>
													<%}else{ %>
													<button class="btn btn-primary btn-mg btn-plus-design"
													style="margin-left: 0;" type="button" onclick = "req()">재 요청</button>
													<%} %>
												<button class="btn btn-danger btn-mg btn-plus-design">거래
													취소</button>
												<button class="btn btn-default btn-mg btn-plus-design"
													type="button"
													onclick="location.href='<%=request.getContextPath()%>/selectTransListlhm.ts'">목록으로</button>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</form>
					<%} %>
					<script>
						function change(){
							location.href="<%= request.getContextPath()%>/detailedList.pg?orderno=<%= t.getOrders_no()%>";
						}
						function req(){
							
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