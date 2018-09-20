<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
							<button class="btn btn-template-main" id="btnLogin" onclick="submit">
								로그인
							</button>
						</p>
					</form>
					<hr />
					<div align="center">
						<button type="button" id="goMain" class="btn btn-primary btn-md" onclick="join();">회원가입</button>
						<br />
						<br />
						<a href="/artBridge/views/member/findIdForm.jsp">아이디 찾기</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="/artBridge/views/member/findPasswordForm.jsp">비밀번호 찾기</a>
					</div>
					<script>
					function join(){
						location.href="/artBridge/views/member/joinForm.jsp";
					}
					</script>
				</div>
			</div>
		</div>
	</div>