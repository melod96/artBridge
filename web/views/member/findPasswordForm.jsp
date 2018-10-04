<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	        	<h2>아이디 찾기</h2>       
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
                        <h2 class="tit1">비밀번호를 잃어버리셧다구요?</h2>
                    </div>
                    
                    <br /><br />

					<form action="<%=request.getContextPath()%>/findPassword.me" method="post">
						<table>
							<tr>
								<td width="150px"><h5 style="line-height:2;">* 아이디</h5></td>
								<td><input type="text" maxlength="30" name="findUserId" class="form-control" placeholder="아이디" /></td>
							</tr>
							<tr>
								<td><h5 style="line-height:2;">* 이름</h5></td>
								<td><input type="text" maxlength="30" name="findUserName" class="form-control" placeholder="이름" /></td>
							</tr>
							<tr>
								<td><h5 style="line-height:2;">* 이메일</h5></td>
								<td><input type="email" name="findEmail" class="form-control input-short" placeholder="이메일"/></td>
							</tr>
						</table>
							
						<br />
							<div class="btns" align="center">
								<button type="button" id="goMain" class="btn btn-default btn-lg" onclick="goMain();">메인</button>
								<button type="submit" id="joinBtn" class="btn btn-primary btn-lg">조회하기</button>
							</div>
					</form>
					<br />
					<br />
					<br />
				</div>
			</div>
		</div>
        <!-- // 주석 영역 -->
        <script>
        function goMain(){
        	location.href = '/artBridge/ContentLoad.main';
        	} 
        </script>

        <!-- Footer -->
        <%@ include file="/views/common/footer.jsp" %>
       <!-- // Footer -->

    </div>
</body>
</html>