<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, com.comvision.artBridge.transaction.model.vo.Transaction,
				 com.comvision.artBridge.board.model.vo.*, com.comvision.artBridge.files.model.vo.*,
				 com.comvision.artBridge.sale.model.vo.*, com.comvision.artBridge.message.model.vo.Message" %>  
    <%Transaction t = null;
	if(request.getAttribute("t") != null){
		t = (Transaction)request.getAttribute("t");
	} %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(t!=null){ %>
<form action="" method="post">
				<div id="stmtModalArea" class="w3-modal" onclick="stmtDisplayNone();"></div>
				<div id="stmtArea" class="settingArea">
					<!-- 모달 요소 넣기 -->
					<div class=stmtModal-Area-Style align="center">
						<h3>명 &nbsp; 세 &nbsp; 서</h3>
						<table class="form-table">
							<tr>
								<td width="15px"></td>
								<td width="90px" class="stmt-title">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목  : </td>
								<td colspan="3"></td>
							</tr>
							<tr>
								<td></td>
								<td class="stmt-title">신 청 일  : </td>
								<td colspan="3"><%= t.getO_date() %></td>
							</tr>
							<tr>
								<td></td>
								<td class="stmt-title">구 매 자  : </td>
								<td width="230px"><%= t.getCusId() %></td>
								<td width="80px" class="stmt-title">판 매 자  : </td>
								<td width="150px"><%= t.getWrtNick() %></td>
							</tr>
							<tr>
								<td></td>
								<td class="stmt-title">옵 션 명  : </td>
								<td colspan="3">인물화</td>
							</tr>
							<tr>
								<td colspan="5" height="30px"></td>
							</tr>
							<tr>
							<td colspan="5" width="540px">
								<table border="1" >
									<tr class="form-inner-table-title" style="font-weight:bold; text-align:center;" height="25px">
										<td width="35px">No</td>
										<td width="380px">요 구 사 항</td>
										<td width="87px">금 액</td>
									</tr>
									<tr height="23px">
										<td align="center">1</td>
										<td style="font-size:12px; padding-left:10px;">제가 보내드리는 사진을 배경으로 만들어주세요~</td>
										<td align="right">작가기입 원</td>
									</tr>
									<tr>
										<td align="center">2</td>
										<td style="font-size:12px; padding-left:10px;">제가 보내드리는 사진을 배경으로 만들어주세요~ 귀염뽀짝하게 해주시면 더 좋아요~!</td>
										<td align="right">45,454원</td>
									</tr>
								</table>
								<br>
								<table align="right">
									<tr >
										<td>총   금 액  :  </td>
										<td><label>123,456원</label></td>
									</tr>
								</table>
							</td>
							</tr>
							<tr>
								<td colspan="5">
									<div class="btn-center stmtBtn">
										  <button class="btn btn-primary btn-lg btn-plus-design" style="width:67%;">거 래 수 락</button><br>
					                      <button class="btn btn-primary btn-lg btn-plus-design" style="margin-left:0;">재 요청</button>
					                      <button class="btn btn-default btn-lg btn-plus-design">거래 취소</button>
					                </div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</form>
			<%} %>
</body>
</html>