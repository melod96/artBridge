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
                    <li><a href="mainAdmin.jsp">메인 관리</a></li>
                    <li><a href="commissionAdmin.jsp">커미션 관리</a></li>
                    <li><a href="#" style="background:orangered; color:white;" >고객문의 관리</a></li>
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
						<h2>고객문의 관리</h2>
					</div>

					<hr>

					<br>

					<div>
						<table class="tbl-type02">

							<tbody>

								<tr>
									<td style="background: lightgray; width: 200px;">접수일</td>
									<td style="text-align: left;">&nbsp; <input type="radio"
										name="date" value="W" id="whole"> <label for="whole">전체</label>
										<input type="radio" name="date" value="P" id="period" checked>
										<label for="period">기간</label>&nbsp;&nbsp; <input type="date"
										name="date"> <label style="font-weight: bold">&nbsp;~&nbsp;</label>
										<input type="date" name="date">


									</td>
								</tr>

								<tr>
									<td style="background: lightgray">답변상태</td>
									<td><select class="form-control input-short">
											<option>전체</option>
											<option>접수</option>
											<option>답변완료</option>
									</select></td>
								</tr>
								<tr>
									<td style="background: lightgray">검색옵션</td>
									<td><select class="form-control input-short">
											<option>전체</option>
											<option>이름</option>
											<option>제목</option>
									</select></td>
								</tr>
								<tr>
									<td style="background: lightgray;">검색어 입력</td>
									<td><input id="" name="" class="form-control input-mid"
										type="text" placeholder="검색어를 입력하세요" style="float: left;">
										<button type="submit" name="mainBtn"
											class="btn btn-primary btn-md" style="float: right;">검색</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<br> <br>
					<div>
						<p style="font-weight: bold; float: left;">총 접수건수 :
						<p style="color: red; float: left; font-weight: bold">N</p>
						<p style="float: left;">건/</p>

						<p style="font-weight: bold; float: left;">미 답변건수 :
						<p style="color: red; float: left; font-weight: bold">N</p>
						<p style="float: left;">건/</p>

						<p style="font-weight: bold; float: left;">답변완료 :
						<p style="color: red; float: left; font-weight: bold">N</p>
						<p style="float: left;">건</p>

					</div>
					<button type="submit" id="deleteBtn" name="deleteBtn"
						class="btn btn-primary btn-sm"
						style="padding: 5px 22px; float: right;" onclick="del3();">문의
						삭제</button>
					<br> <br>
					<script>
						function del3() {
							$("input[name=chBox3]").each(function() {
								if ($(this).prop("checked") == true) {
									$(this).parent().parent().remove();

								}
							});

							var m = 1;
							$(".num3").each(function() {
								$(this).text(m);
								m++;
							});

						}
					</script>

					<table class="tbl-type02">
						<colgroup>
							<col style="width: 5%;">
							<col style="width: 5%;">
							<col style="width: 10%;">
							<col style="width: 18%;">
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="height: *;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">NO</th>
								<th scope="col">답변상태</th>
								<th scope="col">접수일</th>
								<th scope="col">이름</th>
								<th scope="col">구분</th>
								<th scope="col">제목</th>

							</tr>
						</thead>
						<tbody>

							<tr>
								<td><input type="checkbox" name="chBox3"></td>
								<td class="num3">1</td>
								<td>답변완료</td>
								<td>2018-09-11 11:00AM</td>
								<td>양소나</td>
								<td>작가</td>
								<td><div style="float: left;">
										&nbsp;&nbsp;<a href="customerQna.html"><u>문의 드립니다.</u></a>
									</div></td>
							</tr>

							<tr>
								<td><input type="checkbox" name="chBox3"></td>
								<td class="num3">2</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>

							<tr>
								<td><input type="checkbox" name="chBox3"></td>
								<td class="num3">3</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>

							<tr>
								<td><input type="checkbox" name="chBox3"></td>
								<td class="num3">4</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>

							<tr>
								<td><input type="checkbox" name="chBox3"></td>
								<td class="num3">5</td>
								<td></td>
								<td></td>
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
								class="blind">페이지로 이동</span></a> <a href="#">4<span
								class="blind">페이지로 이동</span></a> <a href="#">5<span
								class="blind">페이지로 이동</span></a>
						</span> <a href="#" class="btn-next" title="다음"><span class="spr"><em
								class="blind">목록에서 다음 페이지 이동</em></span></a> <a href="#" class="btn-last"
							title="끝"><span class="spr"><em class="blind">목록에서
									끝 페이지 이동</em></span></a>
					</div>
					<br> <br>
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