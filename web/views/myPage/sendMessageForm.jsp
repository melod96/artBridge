<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.comvision.artBridge.message.model.vo.*, com.comvision.artBridge.member.model.vo.* "%>
	
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
		<%int mem_id = ((Member)(session.getAttribute("loginUser"))).getMember_no(); %>
		<!-- // Header -->
		
		<%@ include file="/views/common/adminHeader.jsp"%>

		<!-- 주석 영역 -->
		<div class="contents">
			<!-- contents 필수 사용 -->
			<div class="container">
				<!-- container 필수 사용 -->
				<div class="col-md-12">
					<div class="heading">
						<h2 id="qnaTitle">쪽지 보내기</h2>
					</div>

					<hr>
				

					<br> <br>
				<form  onsubmit="return formCheck(this)" action="/artBridge/insertSend.msg" method="post" id="goForm">
					<div>
						<table class="tbl-type02">
							<colgroup>
								<col style="width: 15%;">
								<col style="width: *;">
							</colgroup>
	

							<tbody>
								
								<tr>
									<td style="background: lightgray;">*받는 사람 넘버<input type="hidden" name="mem_id" value = <%=mem_id %>></td>
										<td><input id="receive_mem_no" name="receive_mem_no" type="text" style="width: 99%;" placeholder="받는 사람 넘버">
									</td>
								</tr>
								
								<tr>
									<td style="background: lightgray;">*제목</td>
										<td><input id="title" name="title"  type="text" style="width: 99%;" placeholder="제목 작성">
									</td>
								</tr>

								<tr>
									<td style="background: lightgray;">*내용</td>

									<td>
											<textarea id='editor' name="editor" style="height: 550px;"></textarea>
										<script>
											$(function() {
												$('#editor').froalaEditor()
											});
										</script>

									</td>

								</tr>

							</tbody>
						</table>
					</div>
					
					
				
					<br> <br>

					<button type="submit" id="searchBtn" name="searchBtn" class="btn btn-primary btn-lg" style="padding: 2px 30px; float: right;">전송</button>
					<button type="reset" id="backPageBtn" name="searchBtn" class="btn btn-primary btn-lg" style="padding: 2px 30px; background: gray; float: right; margin-right: 10px;"
						onclick = 'location.href="/artBridge/selectList.my?memberNo=<%= loginUser.getMember_no() %>"'>이전</button>
				
					<br> <br>
					</form>
				</div>
			</div>
		</div>
		<!-- // 주석 영역 -->
 					<script>
	                   	function formCheck(frm){
	                   		console.log("실행");
	                   		var title = $("#title");
	                   		var editor = $("#editor");
	                   		var re_no = $("#re_no");
							
							if(frm.title.value == "" || frm.editor.value == "" || frm.receive_mem_no.value == ""){
								console.log(<%=mem_id%>);
								alert("필수 입력 사항을 전부 입력해주세요.");
								frm.title.focus();
								return false;
							}
	                   	}
	                   	
	                </script>


		<!-- Footer -->
		<%@ include file="/views/common/footer.jsp"%>
		<!-- // Footer -->

	</div>
</body>
</html>