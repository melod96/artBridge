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

		<%@ include file="/views/common/adminHeader.jsp"%>

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
						
						<tbody class="tbody">
						
						
						<%-- 	<%if(list != null){for(Message m : list){%>
								<tr>
									<td><input type="checkbox" name="msgNo" value=<%=m.get %>></td>
									
									
								</tr>
							<% }} %> --%>

								<tr>
									<td><input type="checkbox" name="chBox3"></td>
									<td class="num3">1</td>
									<td>답변완료</td>
									<td>2018-09-11 11:00AM</td>
									<td>양소나</td>
									<td>작가</td>
									<td><div style="float: left;">
											&nbsp;&nbsp;<a href="customerQna.jsp"><u>문의 드립니다.</u></a>
										</div></td>
								</tr>
							
						</tbody>
					</table>

					
					<br> <br>
				</div>
			</div>
		</div>

		<!-- // 주석 영역 -->

		<!-- Footer -->
		<%@ include file="/views/common/footer.jsp"%>
		<!-- // Footer -->


	</div>
	
	<script>
	//All select 자동 출력 구문
	
	
	
	
	
	
	
	
	
	
	
	
	//All Select 자동 출력 구문 -ajax
	/*
	$(function(){
		$.ajax({
			url : "autoSelectMSG.ad",
			type : "get",
			success : function(data){
				for(var key in data){
					var $tbody = $(".tbody");
					var $tr = $("<tr>");
						var $td1 = $("<td><input type='checkbox' name='chBox3'>");
						var $td2 = $("<td class='msgNo' value='"+data[key].msg_no+"'>");
						
							var str ="";
							if(data[key].ckeck_date == null){
								str = "접수중";
							}else{
								str = "답변완료";
							}
						var $td3 = $("<td value='"+ str +"'>");
						
						var $td4 = $("<td value='"+ data[key].msg_date +"'>");
						var $td5 = $("<td value='"+ data[key].mem_name +"'>");
						
							var str2 = "";
							if(data[key].writer_right == 0){
								str2 = "작가";
							}else{
								str2 = "일반";
							}
						var $td6 = $("<td value='"+ str2 +"'>");
						
						var $td7 = $("<td>");
						var $td77 = $("<div style='float : left;'>&nbsp;&nbsp;");
							var $td777 = $("<a href='customerQna.jsp'>");
								var $td7777 = $("<u>"+data[key].msg_content);
								
						$tr.append($td1);
						$tr.append($td2);
						$tr.append($td3);
						$tr.append($td4);
						$tr.append($td5);
						$tr.append($td6);
							
									$td777.append($td7777);
								$td77.append($td777);
							$td7.append($td77);
						$tr.append($td7);
						
						$tbody.append($tr);
						
				}
			},
			error : fucntion(){
				console.log("아따 에러여");
			} 
			
		});
	});
	*/
	
	</script>
</body>
</html>