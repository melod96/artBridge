<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

					<form id="joinForm"	onsubmit="return formCheck(this)" action="<%=request.getContextPath()%>/insertMember.me" method="post">
						<table>
							<tr>
								<td width="150px"><h5 style="line-height:2;">* 아이디</h5></td>
								<td><input type="text" maxlength="30" name="joinUserId"	id="joinUserId" class="form-control input-short" placeholder="아이디"/></td>
								<td width="100px">&nbsp;&nbsp;<button type="button" id="idCheck" class="btn btn-primary btn-sm">중복확인</button></td>
							</tr>
							<tr>
								<td></td>
								<td id="checkIdResult"></td>
								<td></td>
							</tr>
							<tr>
								<td><h5 style="line-height:2;">* 비밀번호</h5></td>
								<td><input type="password" maxlength="30" name="joinUserPwd" id="joinUserPwd" class="form-control input-short" placeholder="비밀번호" onchange="checkPwd();"/></td>
								<td></td>
							</tr>
							<tr>
								<td><h5 style="line-height:2;">* 비밀번호 확인</h5></td>
								<td><input type="password" maxlength="30" name="joinUserPwd2" id="joinUserPwd2" class="form-control input-short" placeholder="비밀번호 확인" onchange="checkPwd();" /></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td id="checkPwdResult"></td>
								<td></td>
							</tr>
							<tr>
								<td><h5 style="line-height:2;">* 닉네임</h5></td>
								<td><input type="text" maxlength="30" name="nickName" id="nickName" class="form-control input-short" placeholder="닉네임"/></td>
								<td>&nbsp;&nbsp;<button type="button" id="nickNameCheck" class="btn btn-primary btn-sm">중복확인</button></td>
							</tr>
							<tr>
								<td></td>
								<td id="checkNickNameResult"></td>
								<td></td>
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
							
						<br />
							<div class="btns" align="center">
								<button type="button" id="goMain" class="btn btn-default btn-lg" onclick="goMain();">취소</button>
								<button type="submit" id="joinBtn" class="btn btn-primary btn-lg">가입하기</button>
							</div>
						<script>
							function formCheck(frm){
								//아이디 입력조건
								if(frm.joinUserId.value == ""){
									alert("아이디를 입력해주세요!");
									frm.joinUserId.focus();
									return false;
								}
								//비밀번호 입력조건
								if(frm.joinUserPwd.value == ""){
									alert("비밀번호를 입력해주세요!");
									frm.joinUserPwd.focus();
									return false;
								}
								//비밀번호 확인조건
								if(frm.joinUserPwd2.value == "" || (frm.joinUserPwd.value != frm.joinUserPwd2.value)){
									alert("비밀번호를 확인해주세요!");
									frm.joinUserPwd2.focus();
									return false;
								}
								//닉네임 입력조건
								if(frm.nickName.value == ""){
									alert("닉네임을 입력해주세요!");
									frm.nickName.focus();
									return false;
								}
								
								return true;
							}
							
							//비밀번호 확인
							function checkPwd(){
								var joinUserPwd = $('#joinUserPwd').val();
								var joinUserPwd2 = $('#joinUserPwd2').val();
								
								console.log(joinUserPwd);
								console.log(joinUserPwd2);
								
								if(joinUserPwd != "" && joinUserPwd2 != ""){
									if(joinUserPwd != joinUserPwd2){
										$("#checkPwdResult").html("<p style='color:orange; font-weight:bold'> 비밀번호가 일치하지 않습니다.</p>");
									}else{
										$("#checkPwdResult").empty();
									}
								}
								
							} 
							
							//아이디 중복체크
							$("#idCheck").click(function(){
								var joinUserId = $("#joinUserId").val();
								if(joinUserId != "" && joinUserId != null){
									$.ajax({
										url : "<%= request.getContextPath() %>/idCheck.me",
										type : "get",
										data : {joinUserId : joinUserId},
										success : function(data){
											if(data != 0){
												$("#checkIdResult").html("<p style='color:orange; font-weight:bold'>사용불가능한 아이디 입니다.</p>");
											}else{
												$("#checkIdResult").html("<p style='color:green; font-weight:bold'>사용가능한 아이디 입니다.</p>");
											}
										},
										error : function(){
											console.log("실패");
										}
									});
								}
							});
							
							//닉네임 중복체크
							$("#nickNameCheck").click(function(){
								var nickName = $("#nickName").val();
								if(nickName != "" && nickName != null){
									$.ajax({
										url : "<%= request.getContextPath() %>/nickNameCheck.me",
										type : "get",
										data : {nickName : nickName},
										success : function(data){
											if(data != 0){
												$("#checkNickNameResult").html("<p style='color:orange; font-weight:bold'>사용불가능한 닉네임 입니다.</p>");
											}else{
												$("#checkNickNameResult").html("<p style='color:green; font-weight:bold'>사용가능한 닉네임 입니다.</p>");
											}
										},
										error : function(){
											console.log("실패");
										}
									});
								}
							});
							
							function goMain(){
								location.href="<%=request.getContextPath()%>/index.jsp";
							}
						</script>
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