<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
	<div id="all">
		<!-- Header -->
		<%@ include file="/views/common/header.jsp"%>
		<!-- // Header -->
		
		<section class="tit-area bg-yellow"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
            <div class="container">
                <h2>관리자 페이지</h2>
                <ul class="tab-menu">
                    <li><a href="#" style="background:orangered; color:white;">메인 관리</a></li>
                    <li><a href="commissionAdmin.jsp">커미션 관리</a></li>
                    <li><a href="customerQna.jsp" >고객문의 관리</a></li>
                    <li><a href="memberAdmin.jsp">회원 관리</a></li>
                    <li><a href="transactionAdmin.jsp">거래내역 관리</a></li>
                    <li><a href="noticeInsertForm.jsp">공지사항</a></li>
                </ul>
            </div>
        </section>

		<!-- 주석 영역 -->
		<div class="contents">
			<!-- contents 필수 사용 -->
			<div class="container">
				<!-- container 필수 사용 -->
				<div class="col-md-12">
					<div class="heading">
						<h2>메인 배너 관리</h2>
					</div>

					<hr>
					<div class="btn-center">
						
					</div>
					<h3 style="margin-left:25%;">판매글 목록</h3>
					<div class="selTable">
						<table class="tbl-type02" style="width: 600px; margin: auto;">
							<colgroup>
								<col style="width: 10%;">
								<col style="width: 12%;">
								<col style="width: 15%;">
								<col style="width : *;">
							</colgroup>
							<thead>
								<tr>
									<th>
									</th>
									<th>
									작품번호
									</th>
									<th>
									작가명
									</th>
									<th>
									작품이름
									</th>
								</tr>
							</thead>
							<tbody style="overflow-Y: scroll;">
								<tr>
									<td><input type="checkbox" name=""></td>
									<td><label>1</label></td>
									<td><label>소나나</label></td>
									<td colspan="5"><label>미소년/소녀 커미션</label> 
								</tr>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td><label>1</label></td>
									<td><label>소나나</label></td>
									<td colspan="5"><label>미소년/소녀 커미션</label> 
								</tr>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td><label>1</label></td>
									<td><label>소나나</label></td>
									<td colspan="5"><label>미소년/소녀 커미션</label> 
								</tr>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td><label>1</label></td>
									<td><label>소나나</label></td>
									<td colspan="5"><label>미소년/소녀 커미션</label> 
								</tr>
								<tr>
									<td><input type="checkbox" name=""></td>
									<td><label>1</label></td>
									<td><label>소나나</label></td>
									<td colspan="5"><label>미소년/소녀 커미션</label> 
								</tr>
							</tbody>
						</table>
					</div>
	
					<div class="btn-center">
						<button type="submit" name="mainBtn"
							class="btn btn-primary btn-sm" onclick="add();">추가하기</button>
					</div>
			
					<br>
					<br>
					<br>
					
					<h3 style="margin-left:25%;">메인 배너</h3>
					<div class="addTable">
						<table class="tbl-type02" style="width: 600px; margin: auto;">
							<colgroup>
								<col style="width: 15%;">
								<col style="width: *;">
							</colgroup>
							<thead>
								<tr>
									<th></th>
									<th>작품번호</th>
								</tr>
							</thead>
							<tbody class="trtr">
								<tr>
									<td><input type="checkbox" name=""></td>
									<td colspan="5">
									<input type="text" value="빈 텍스트" readonly>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn-center">
						<!-- <button type="submit" class="btn btn-primary btn-md"
							style="margin-top: 10px;">저장</button> -->
									<button type="button" name="mainBtn"
							class="btn btn-default btn-sm" onclick="del();" id="del">삭제하기</button>
					</div>

					<br>
				
					<script>
						var i = 1;
						function add() {
							if (i == 5) {
								alert('5개 이상 생성할 수 없습니다.')
							} else {
								$(function() {
									$(
											"<tr><td><input type="+"checkbox"+">"
											+ "</td>"
											+"<td colspan="+"5"+">"
													+ "<input type = "+"text"+"value="+"빈 텍스트"+"readonly>"
													+ "</td></tr>").appendTo(
											$(".trtr"));
								});
								i++;
							}

						};

						function del() {
							$("input:checkbox").each(function() {
								if ($(this).prop("checked") == true) {
									$(this).parent().parent().remove();
									i--;
								}

							});

						}
					</script>

					<br> <br> <br> <br>
				</div>
			</div>
		</div>
		<!-- // 주석 영역 -->

		<!-- Footer -->
		<%@ include file="/views/common/footer.jsp"%>
		<!-- // Footer -->

	</div>
</body>
</html>