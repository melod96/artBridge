<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<script>
    $(document).ready(function() {
      $('#btnLogin').click(function() {
    	var action = $('#frmLogin').attr("action");
        var form_data = {
                          userId:$('#userId').val(),
                          userPwd:$('#userPwd').val()
        				};
        $.ajax({
                  type: "POST",
                  url: action,
                  data: form_data,
                  success: function(response) {
                    
                	//if(response.trim() == "success") {
                    //  sessionStorage.setItem("user_id", form_data.user_id);
                    //  $('#msg').html("<p style='color:green; font-weight:bold'>로그인 성공!</p>");
                    //} else {
                    //  $('#msg').html("<p style='color:red'>아이디 또는 비밀번호가 잘못되었습니다.</p>");
                    //}
                  },
                  error: function() {
                    //$('#msg').html("<h2>Error</h2>");
                  }
        });
      });
    });
</script>
</head>
<body>

	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
		aria-labelledby="Login" aria-hidden="true">
		<div class="modal-dialog modal-sm" style="z-index: 999999;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="Login">로그인</h4>
				</div>
				<div class="modal-body">
					<form action="<%= request.getContextPath() %>/login.me" method="post" id="frmLogin" name="frmLogin">
						<div class="form-group">
							<input type="text" class="form-control" id="userId" name="userId"
								placeholder="아이디">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="userPwd" name="userPwd"
								placeholder="비밀번호">
						</div>
						<p class="text-center">
							<button class="btn btn-template-main" id="btnLogin">
								로그인
							</button>
						</p>
					</form>
					<hr />
					<div align="center">
						<button type="button" id="goMain" class="btn btn-primary btn-lg" onclick="join();">회원가입</button>
					</div>
					<script>
					function join(){
						location.href="../member/joinForm.jsp";
					}
					</script>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>