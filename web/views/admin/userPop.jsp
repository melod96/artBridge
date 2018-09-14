<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Art Bridge</title>
	<%@ include file="/views/common/head.jsp" %>
	<style>
	html{width:578;height:301px;}
	table{border-collapse:collapse; border:1px solid black;align=center;}
	tr,th,td{border-collapse:collapse; border:1px solid black;align=center;}
	th{width:120px;text-align:center;}
	td{width:170px;}
	tr{height:50px;}
</style>
</head>
<body>
    <div id="all">


        <!-- 주석 영역 -->
        <form>
	<div class="popForm">
		<div class="popForm2">
			<table class="pop">
				<tr>
					<th>사용자 번호</th>
					<td>0001</td>

					<th>가입일</th>
					<td>2018-09-10</td>
				</tr>

				<tr>
					<th>이름</th>
					<td>뽀짝</td>

					<th>아이디</th>
					<td>Bbojjak</td>
				</tr>
				
				<tr>
					<th>사용자 구분</th>
					<td colspan="3">작가</td>
				</tr>
				
				<tr class="level">
					<th>등급</th>
					<td colspan="3">
					<select class="form-control input-xshort"style=display:inline>
                        <option>0. 전체</option>
                        <option>1. 신뢰작가</option>
                        <option>2. 일반작가</option>
                        <option>3. 신규작가</option>
                        <option>4. 블랙작가</option>
                    </select>
                    <p style=display:inline>일반 사용자의 경우 '-'만 표시(if문 사용)</p>
                    </td>
				</tr>
				
				<tr>
					<th>연락처</th>
					<td colspan="3"><input type="text" style="width:300px;"></td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td colspan="3"><input type="text" style="width:300px;">
					<button type="submit" class="btn btn-primary btn-sm"
						style="padding: 5px 22px; float: right; margin-right:5px;">수정완료</button>
					
					</td>
					
				</tr>


			</table>
		
			
		</div>
	</div>
	</form>
        <!-- // 주석 영역 -->

     

    </div>
</body>
</html>