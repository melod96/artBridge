<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.comvision.artBridge.member.model.vo.*, com.comvision.artBridge.files.model.vo.*"%>
<%
	Member list = null;
	if (request.getAttribute("list") != null) {
		list = (Member) request.getAttribute("list");
	}

	ArrayList<Files> flist = null;
	if (request.getAttribute("flist") != null) {
		flist = (ArrayList<Files>) request.getAttribute("flist");
	}
%>

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

hr {
	border-color: darkgray;
}
</style>
</head>
<body>
	<div id="all">

		<!-- Header -->
		<%@ include file="/views/common/header.jsp"%>
		<!-- //Header -->

		<%@ include file="/views/common/adminHeader.jsp"%>

		<!-- 주석 영역 -->
		<div class="contents">
			<!-- contents 필수 사용 -->
			<div class="container">
				<!-- container 필수 사용 -->
				<div class="col-md-12">
					<div class="heading">
						<h2>작가 전환</h2>
					</div>

					<br> <br> <br>

					<form method="post" action="<%=request.getContextPath()%>/updatePostulat.ad?member_no=<%= list.getMember_no() %>">
						<div
							style="height: 1000px; width: 1000px; border: 1px solid gray; margin: auto; padding-top: 80px; padding-left: 50px; padding-right: 50px;">

							<h3 style="text-align: center;">작 가 &nbsp; 회 원 &nbsp; 전 환
								&nbsp; 신 청</h3>
							<br> <br> <br>
							<div style="padding-right: 50px; padding-left: 50px;">
								<%
									if (list != null) {
								%>
								<label style="font-size: 20px; float: left;">*&nbsp;ID&nbsp;:&nbsp;<a><%=list.getId()%></a></label>
								<label style="font-size: 20px; float: right;">*&nbsp;닉네임&nbsp;:&nbsp;<a><%=list.getNick_name()%></a></label>
								<br> <br> <label style="font-size: 20px; float: left;">*&nbsp;은행명&nbsp;:&nbsp;<a><%=list.getBank()%></a></label>
								<label style="font-size: 20px; float: right;">*&nbsp;계좌번호&nbsp;:&nbsp;<a><%=list.getAccount()%></a></label>
								<%
									}
								%>
							</div>
							<br> <br> <br>
							<hr>
							<br>
							<%
								if (flist != null) {
									for (Files f : flist) {
							%>
							<div
								style="height: 288px; width: 288px; border: 1px solid gray; float: left; margin-left: 10px;">
								<img style="height: 288px; width: 288px;"
									src="<%=f.getFiles_root()%>">
							</div>
							<%
								}
							%>
							<br>
							<p style="color: gray;">* 작가 등록을 위한 관리자 승인용 이미지 파일
							<p>

								<%
									}
								%>


								<br> <br> 사유 :
							</h4>
							<input id="" name="" class="form-control input-lg" type="text"
								placeholder="텍스트를 입력하세요"> <br> <br> <br>
							<br>				
							<br>

							<div>
								<input type="checkBox" name="pos" style="float:left;" value="1"><p style="float:left;">위 회원을 작가로써 인정합니다.</p>
								<button type="button" name="mainBtn"
									class="btn btn-danger btn-lg" onclick="del();" id="del"
									style="float: right; padding-top: 10px; padding-bottom: 10px; padding-right: 25px; padding-left: 25px;"><a
										onclick="location.href='<%=request.getContextPath()%>/selectMemberList.ad?pageName=memberAdmin'"
										style="color: white;">취소</a></button>
								<button type="submit" name="mainBtn"
									class="btn btn-primary btn-lg" onclick="add();" id="add"
									style="float: right; margin-right: 10px; padding-top: 10px; padding-bottom: 10px; padding-right: 25px; padding-left: 25px;">확인</button>

									

								</button>
							</div>
						</div>
					</form>

					<br> <br>
				</div>
			</div>
		</div>

		<!-- // 주석 영역 -->

		<!-- Footer -->
		<%@ include file="/views/common/footer.jsp"%>
		<!-- // Footer -->


	</div>

	</div>
	</div>
	</div>
</body>
</html>