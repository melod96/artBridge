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
	.phone {
		width: 70px;
		display: inline-block;
	}
</style>
</head>
<body>
	<div id="all">

		<!-- Header -->
		<%@ include file="/views/common/header.jsp"%>
		<!-- // Header -->

		<!-- subArea -->
		<section class="tit-area bg-yellow"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
			<div class="container">
	        	<h2>회원가입</h2>       
	     	</div>
	    </section>
		<!-- //subArea -->

		<!-- 주석 영역 -->
		<div class="contents" align="center">
			<!-- contents 필수 사용 -->
			<div class="container">
				<!-- container 필수 사용 -->
				<div class="col-md-12">
	
					<br />
			
					<div class="heading">
                        <h2 class="tit1">애송이 구라칠 생각말라구?</h2>
                    </div>
                    
                    <br /><br />

					<form id="joinForm"	action="<%=request.getContextPath()%>/insertMember.me" method="post">
						<table align="center">
							<tr>
								<td whidth="500px"><h5 style="line-height:2;">* 아이디</h5></td>
								<td><input type="text" maxlength="13" name="userId"	id="userId" class="form-control input-short" placeholder="아이디"/></td>
								<td whidth="200px">&nbsp;&nbsp;<button type="button" id="idCheck" class="btn btn-primary btn-sm">중복확인</button></td>
							</tr>
							<tr>
								<td><h5 style="line-height:2;">* 비밀번호</h5></td>
								<td><input type="password" maxlength="13" name="userPwd" id="userPwd" class="form-control input-short" placeholder="비밀번호" /></td>
								<td></td>
							</tr>
							<tr>
								<td><h5 style="line-height:2;">* 비밀번호 확인</h5></td>
								<td><input type="password" maxlength="13" name="userPwd2" id="userPwd2" class="form-control input-short" placeholder="비밀번호 확인"/></td>
								<td><label id="pwdResult"></label></td>
							</tr>
							<tr>
								<td><h5 style="line-height:2;">* 닉네임</h5></td>
								<td><input type="text" maxlength="5" name="nickName" class="form-control input-short" placeholder="닉네임"/></td>
								<td>&nbsp;&nbsp;<button type="button" id="idCheck" class="btn btn-primary btn-sm">중복확인</button></td>
							</tr>
							<tr>
								<td><h5 style="line-height:2;">연락처</h5></td>
								<td>
									<input type="text" maxlength="3" name="tel1" size="2" class="form-control phone" placeholder="---"/>&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;
									<input type="text" maxlength="4" name="tel2" size="2" class="form-control phone" placeholder="----"/>&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;
									<input type="text" maxlength="4" name="tel3" size="2" class="form-control phone" placeholder="----"/>
								</td>
								<td></td>
							</tr>
							<tr>
								<td><h5 style="line-height:2;">이메일</h5></td>
								<td><input type="email" name="email" class="form-control input-short" placeholder="이메일"/></td>
								<td></td>
							</tr>
						</table>
							
						<table>
							<br />
								<div class="btns" align="center">
									<button type="button" id="goMain" class="btn btn-default btn-lg" onclick="goMain();">취소</button>
									<button type="button" id="joinBtn" class="btn btn-primary btn-lg" onclick="insertMember();">가입하기</button>
								</div>
							<script>
								function insertMember(){
									$("#joinForm").submit();
								}
								
								function goMain(){
									location.href="<%=request.getContextPath()%>/index.jsp";
								}
							</script>
						</table>
					</form>
					<br />
					<br />
					<br />
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