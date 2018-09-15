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
#searchWord {
	margin-left: 30%;
}

#addBtn {
	margin-left: 50%;
}

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

		<!-- subHeader -->
		<section class="tit-area bg-yellow"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
		<div class="container">
			<h2>관리자 페이지</h2>
			<ul class="tab-menu">
				<li><a href="mainAdmin.html">메인 관리</a></li>
				<li><a href="#" style="background: orangered; color: white;"
					id="commissionBtn">커미션 관리</a></li>
				<li><a href="customerAdmin.html">고객문의 관리</a></li>
				<li><a href="memberAdmin.html">회원 관리</a></li>
				<li><a href="transactionAdmin.html">거래내역 관리</a></li>
				<li><a href="#">공지사항</a></li>
			</ul>
		</div>
		</section>
		<!-- //subHeader -->


		<!-- 주석 영역 -->
		<div class="contents">
			<!-- contents 필수 사용 -->
			<div class="container">
				<!-- container 필수 사용 -->
				<div class="col-md-12">
					<div class="heading">
						<h2>연관검색어 관리</h2>
					</div>
					<hr>
					<br>
					<div id="searchWord">
						<input type="text" name="scArea" style="width: 50%;" id="txtBtn">
						<button name="mainBtn" class="btn btn-primary btn-sm"
							onclick="add();">검색어 추가</button>
						<button name="mainBtn" class="btn btn-primary btn-sm"
							onclick="del();">검색어 삭제</button>

						<br> <br>
					</div>

					<div style="overflow-Y: scroll;">
						<table class="tbl-type02">
							<colgroup>
								<col style="width: 10%;">
								<col style="width: 10%;">
								<col style="width: *;">

							</colgroup>
							<thead>
								<tr>
									<th scope="col">선택</th>
									<th scope="col">번호</th>
									<th scope="col" colspan="3">검색어</th>

								</tr>
							</thead>
							<tbody class="addsh2">
							</tbody>
						</table>
					</div>

					<br> <br>
					<!--연관검색어 스크립트-->
					<script>
						var i = 1;
						function add() {

							$(function() {
								var addsc = $("input[name=scArea]").val();

								$(
										"<tr><td><input type="+"checkbox "+"name="+"chBox"+"></td>"
												+ "<td class="+"num"+">" + i
												+ "</td><td class="+"addsh"+">"
												+ addsc + "</td></tr>")
										.appendTo($(".addsh2"));
								$("input[name=scArea]").val("");

								i++;

							});
						};

						function del() {
							$("input[name=chBox]").each(function() {
								if ($(this).prop("checked") == true) {
									$(this).parent().parent().remove();
									i--;
								}
							});

							var j = 1;
							$(".num").each(function() {
								$(this).text(j);
								j++;
							});

						}
					</script>

					<button type="submit" id="addBtn" name="mainBtn"
						class="btn btn-primary btn-md" style="padding: 10px 22px;">저장</button>

				</div>
				<div class="heading">
					<h2>게시글 관리</h2>
				</div>
				<hr>
				<br>
				<div>
					<table class="tbl-type02">
						<colgroup>
							<col style="width: 20%;">
							<col style="width: *%;">

						</colgroup>

						<tbody>

							<tr>
								<td style="background: lightgray;">검색옵션</td>
								<td><select name="national2"
									style="float: left; width: 200px;">
										<option value="ko">전체</option>
										<option value="ch">작가명</option>
										<option value="jp">제목</option>
								</select></td>
							</tr>

							<tr>
								<td style="background: lightgray">검색어 입력</td>
								<td><input type="text" style="float: left; width: 400px;">
									<button type="submit" id="searchBtn" name="searchBtn"
										class="btn btn-primary btn-sm"
										style="padding: 5px 22px; float: right;">검색</button></td>
							</tr>


						</tbody>
					</table>
				</div>

				<br> <br>

				<button type="submit" id="deleteBtn" name="deleteBtn"
					class="btn btn-primary btn-sm"
					style="padding: 5px 22px; float: right;" onclick="del2();">게시글
					삭제</button>
				<br> <br>
				<script>
					function del2() {
						$("input[name=chBox2]").each(function() {
							if ($(this).prop("checked") == true) {
								$(this).parent().parent().remove();

							}
						});

						var k = 1;
						$(".num2").each(function() {
							$(this).text(k);
							k++;
						});

					}
				</script>

				<table class="tbl-type02">
					<colgroup>
						<col style="width: 5%;">
						<col style="width: 8%;">
						<col style="width: 12%;">
						<col style="width: 20%;">
						<col style="width: *;">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">선택</th>
							<th scope="col">NO</th>
							<th scope="col">작가명</th>
							<th scope="col">작성일</th>
							<th scope="col">게시글 제목</th>

						</tr>
					</thead>
					<tbody>

						<tr>
							<td><input type="checkbox" name="chBox2"></td>
							<td class="num2">1</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td><input type="checkbox" name="chBox2"></td>
							<td class="num2">2</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td><input type="checkbox" name="chBox2"></td>
							<td class="num2">3</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td><input type="checkbox" name="chBox2"></td>
							<td class="num2">4</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

						<tr>
							<td><input type="checkbox" name="chBox2"></td>
							<td class="num2">5</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>

				<div class="paginate">
					<a href="#" class="btn-first" title="처음"><em class="blind">목록에서
							처음 페이지 이동</em></a> <a href="#" class="btn-prev" title="이전"><em
						class="blind">목록에서 이전 페이지 이동</em></a> <span class="paging-numbers">
						<a href="#">1<span class="blind">페이지로 이동</span></a> <a href="#"
						class="on">2<span class="blind">페이지로 이동</span></a> <a href="#">3<span
							class="blind">페이지로 이동</span></a> <a href="#">4<span class="blind">페이지로
								이동</span></a> <a href="#">5<span class="blind">페이지로 이동</span></a>
					</span> <a href="#" class="btn-next" title="다음"><span class="spr"><em
							class="blind">목록에서 다음 페이지 이동</em></span></a> <a href="#" class="btn-last"
						title="끝"><span class="spr"><em class="blind">목록에서
								끝 페이지 이동</em></span></a>
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