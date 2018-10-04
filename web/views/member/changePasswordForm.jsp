<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int member_no = (int)request.getAttribute("member_no");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Art Bridge</title>
	<%@ include file="/views/common/head.jsp" %>
</head>
<body>
    <div id="all">
       
        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
        <!-- // Header -->

        <!-- subHeader -->
		<section class="tit-area bg-yellow"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
			<div class="container">
	        	<h2>비밀번호 재설정</h2>       
	     	</div>
	    </section>
        <!-- //subHeader -->

        <!-- 주석 영역 -->
        <div class="contents" align="center">
			<!-- contents 필수 사용 -->
			<div class="container">
				<!-- container 필수 사용 -->
				<div class="col-md-12">
	
					<br />
			
					<div class="heading">
                        <h2 class="tit1">새 비밀번호를 입력해 주세요!</h2>
                    </div>
                    
                    <br /><br />

					<form onsubmit="return formCheck(this)" action="<%=request.getContextPath()%>/changePassword.me" method="post">
						<input type="hidden" name="member_no" value="<%= member_no %>"/>
						<table>
							<tr>
								<td width="150px"><h5 style="line-height:2;">* 새 비밀번호</h5></td>
								<td><input type="password" maxlength="30" name="changeUserPassword" id="changeUserPassword" class="form-control" placeholder="비밀번호" /></td>
							</tr>
							<tr>
								<td><h5 style="line-height:2;">* 새 비밀번호 확인</h5></td>
								<td><input type="password" maxlength="30" name="changeUserPasswordCheck" id="changeUserPasswordCheck" class="form-control" placeholder="비밀번호 확인" /></td>
							</tr>
						</table>	
						<br />
							<div class="btns" align="center">
								<button type="button" id="goMain" class="btn btn-default btn-lg" onclick="goMain();">메인</button>
								<button type="submit" id="joinBtn" class="btn btn-primary btn-lg">변경하기</button>
							</div>
					</form>
					<br />
					<br />
					<br />
                    <script>
                    function formCheck(frm){
						//비밀번호 입력조건
						if(frm.changeUserPassword.value == ""){
							alert("비밀번호를 입력해주세요!");
							frm.joinUserPwd.focus();
							return false;
						}
						//비밀번호 확인조건
						if(frm.changeUserPasswordCheck.value == "" || (frm.changeUserPassword.value != frm.changeUserPasswordCheck.value)){
							alert("비밀번호를 확인해주세요!");
							frm.joinUserPwd2.focus();
							return false;
						}
						
						return true;
					}
                    
                    function goMain(){ location.href = '/artBridge/ContentLoad.main';  }
                    </script>
				</div>
			</div>
		</div>
        <!-- // 주석 영역 -->

        <!-- Footer -->
        <%@ include file="/views/common/footer.jsp" %>
       <!-- // Footer -->

    </div>
</body>
</html>