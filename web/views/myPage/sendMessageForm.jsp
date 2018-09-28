<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.comvision.artBridge.message.model.vo.*"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Art Bridge</title>
<%@ include file="/views/common/head.jsp"%>
<%int mem_id = ((Member)(session.getAttribute("loginUser"))).getMember_no(); %>
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
				<form  action="/artBridge/insertSend.msg?mem_id=<%=mem_id %>" method="post" id="goForm">
				<div class="col-md-12">
					<div class="heading">
						<h2 id="qnaTitle">고객문의 답변 작성</h2>
					</div>

					<hr>
				

					<br> <br>
				
					<div>
						<table class="tbl-type02">
							<colgroup>
								<col style="width: 15%;">
								<col style="width: *;">
							</colgroup>
	

							<tbody>
							
								<tr>
									<td style="background: lightgray;">받는 사람 넘버</td>
										<td><input name="title" type="text" style="width: 99%;" placeholder="받는 사람 넘버">
									</td>
								</tr>
								
								<tr>
									<td style="background: lightgray;">제목</td>
										<td><input name="title"  type="text" style="width: 99%;" placeholder="제목 작성">
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
					
					<!--  <script>
	                   	function formCheck(frm){
	                   		var title = $("#title");
	                   		var editor = $("#editor");
							
							if(frm.title.value == "" || frm.editor.value == ""){
								alert("제목 또는 내용을 입력하세요");
								frm.title.focus();
								return false;
							}
	                   	}
	                </script> -->
				
					<br> <br>

					<button type="" id="searchBtn" name="searchBtn"
						class="btn btn-primary btn-lg"
						style="padding: 2px 30px; float: right;">전송</button>
						
					<button type="" id="searchBtn" name="searchBtn"
						class="btn btn-primary btn-lg"
						style="padding: 2px 30px; background: gray; float: right; margin-right: 10px;"
						onclick = 'location.href "/artBridge/selectList.my?memberNo=<%= loginUser.getMember_no() %>"'>이전</button>
				
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