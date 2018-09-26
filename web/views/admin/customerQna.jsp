<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.comvision.artBridge.message.model.vo.*"%>
	
<%
	Message m = (Message)request.getAttribute("m");


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Art Bridge</title>
<%@ include file="/views/common/head.jsp"%>

<style>
ul.tab-menu li>a:hover {
	background: darkgray;
}


div#editor {
	width: 81%;
	margin: auto;
	text-align: left;
}

.ss {
	background-color: red;
}

.fr-wrapper {
	overflow-Y: scroll;
	height: 86%;
}



</style>
</head>
<body>
	<div id="all">

		<!-- Header -->
		<%@ include file="/views/common/header.jsp"%>
		<!-- // Header -->
		
		<%@ include file="/views/common/adminHeader.jsp"%>

		<!-- 주석 영역 -->
		<div class="contents">
			<!-- contents 필수 사용 -->
			<div class="container">
				<!-- container 필수 사용 -->
				<form onsubmit="return formCheck(this)" action="<%=request.getContextPath()%>/updateDetail.msg" method="post" id="goForm">
				<div class="col-md-12">
					<div class="heading">
						<h2 id="qnaTitle">고객문의 답변 작성</h2>
					</div>

					<hr>
				
					<div>
						<table class="tbl-type02">
							<colgroup>
								<col style="width: 15%;">
								<col style="width: *;">

							</colgroup>
							<%
							String str = "";
							if(m.getWriter_right()== 0){
								str = "일반";
							}else{
								str = "작가";
							}
							
							
							%>

							<tbody>
						
								<tr>
									<td style="background: lightgray;">고객구분</td>
									<td><div style="float: left; font-size: 1em;"><%=str %></div></td>
								</tr>

								<tr>
									<td style="background: lightgray">고객명</td>
									<td>
										<input type="hidden" name="msgNo" value=<%=m.getMsg_no() %>>
										<input type="hidden" name="mem_no" value=<%=m.getMem_no() %>>
										<div style="float: left; font-size: 1em; color: darkgray;"><%=m.getMem_name() %></div>
									</td>
								</tr>
								<tr>
									<td style="background: lightgray">답변상태</td>
									<td><select id="sel1" name="sel1" style="float: left; width: 200px;">
											<option value="sel1Op1" id="sel1Op1">미답변</option>
											<option value="sel1Op2" id="sel1Op2">답변완료</option>
									</select></td>
								</tr>


							</tbody>
						</table>
					</div>

					<br> <br>
				
					<div>
						<table class="tbl-type02">
							<colgroup>
								<col style="width: 15%;">
								<col style="width: *;">
							</colgroup>
	

							<tbody>

								<tr>
									<td style="background: lightgray;">제목</td>
									<td><input name="title" id="title" type="text" style="width: 99%;" placeholder="제목 작성">
									</td>
								</tr>

								<tr>
									<td style="background: lightgray; height: 300px;">내용</td>
									<td>
										<div
											style="width: 100%; height: 295px; overflow-Y: scroll; color: darkgray;">
											<%=m.getMsg_content() %></div>
									</td>
								</tr>
								<tr>
									<td style="background: lightgray;">답변</td>

									<td>
											<textarea id='edit' name="content" style="height: 550px;"></textarea>
										<script>
											$(function() {
												$('#edit').froalaEditor()
											});
										</script>

									</td>

								</tr>


							</tbody>
						</table>
					</div>
					
					 <script>
	                   	function formCheck(frm){
	                   		var title = $("#title");
	                   		var editor = $("#editor");
							
							if(frm.title.value == "" || frm.editor.value == ""){
								alert("제목 또는 내용을 입력하세요");
								frm.title.focus();
								return false;
							}
	                   	}
	                </script>
				
					<br> <br>

					<button type="submit" id="searchBtn" name="searchBtn"
						class="btn btn-primary btn-lg"
						style="padding: 2px 30px; float: right;">저장</button>
						
					<button type="submit" id="searchBtn" name="searchBtn"
						class="btn btn-primary btn-lg"
						style="padding: 2px 30px; background: gray; float: right; margin-right: 10px;"
						onclick = "location.href='/artBridge/views/admin/customerAdmin.jsp'">목록</button>
				
					<br> <br>
				</div>
				</form>
			</div>
		</div>
		<!-- // 주석 영역 -->

		<!-- Footer -->
		<%@ include file="/views/common/footer.jsp"%>
		<!-- // Footer -->

	</div>
</body>
</html>