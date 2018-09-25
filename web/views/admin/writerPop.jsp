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
        <form action="<%= request.getContextPath() %>/reqWriterRight.me" method="post" onsubmit="return reqWriterRight();">
				<div id="reqWriterModal" class="w3-modal"></div>
				<div id="reqWriterFormArea" class="settingArea">
					<!-- 모달 요소 넣기 -->
					<div class=reqWriterForm-Area-Style align="center">
						<h3>작 가 &nbsp; 회 원 &nbsp; 전 환 &nbsp; 신 청</h3>
						<table class="form-table">
							<tr>
								<td width="40px" height="52px"></td>
								<td width="85px" class="reqWriterForm-title">* I&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D</td>
								<td width="2px" class="reqWriterForm-title">:</td>
								<td width="180px"><%= loginUser.getId() %></td>
								<td width="140px" class="reqWriterForm-title">* 닉네임 (활동명)</td>
								<td width="2px" class="reqWriterForm-title">:</td>
								<td><%= loginUser.getNick_name() %></td>
							<tr>
								<td height="52px"></td>
								<td class="reqWriterForm-title">* 은 행 명</td>
								<td class="reqWriterForm-title">:</td>
								<td><input type="text" id="userBank" style="width:50px;"/> 은행</td>
								<td colspan="3">
									<span class="reqWriterForm-title">* 계좌번호 &nbsp;: &nbsp;</span>
									<input type="text" id="userAccount" style="width:250px; padding-left:5px;" placeholder="'-'없이 숫자만 입력"/>
								</td>
							</tr>
							<tr><td colspan="7" height="20px"></td></tr>
							<tr>
								<td height="25px" colspan="7" class="reqWriterForm-title" style="font-size:16px; padding-left:25px;"> * 작가 등록을 위한 관리자 승인용 이미지 파일을 첨부하세요.
									<strong style="font-size:14px;"> (신청 후에는 변경 불가)</strong>
								</td>
							</tr>
							<tr>
								<td colspan="7" width="715px" style="padding-bottom:10px;">
	                                <ul class="insert-img-area" style="text-align:center;">
	                                  <li>
	                                      <input type="file"  id="file-btn1" onchange="readURL(this);" accept="image/gif, image/jpeg, image/png">
	                                      <label for="file-btn1" class="btn btn-primary">이미지 파일 불러오기</label>
	                                      <p><img class="img1" src="/artBridge/image/common/no_thumb.jpg" /></p>
	                                  </li>
	                                  <li>
	                                      <input type="file"  id="file-btn2" onchange="readURL(this);" accept="image/gif, image/jpeg, image/png">
	                                      <label for="file-btn2" class="btn btn-primary">이미지 파일 불러오기</label>
	                                      <p><img class="img2" src="/artBridge/image/common/no_thumb.jpg"></p>
	                                  </li>
	                                  <li style="margin-right:0px;">
	                                      <input type="file"  id="file-btn3" onchange="readURL(this);" accept="image/gif, image/jpeg, image/png">
	                                      <label for="file-btn3" class="btn btn-primary">이미지 파일 불러오기</label>
	                                      <p><img class="img3" src="/artBridge/image/common/no_thumb.jpg"></p>
	                                  </li>
	                                </ul>
	                                <ul>
	                                    <li style="padding-left:25px;">- 이미지 최대 용량 : 1개당 <strong>50MB</strong> / 권장 사이즈 : <strong>가로 732px이상</strong></li>
	                                    <li style="padding-left:25px;">- 파일 선택 후 저장 버튼을 누르셔야 이미지가 저장됩니다.</li>
	                                </ul>
								</td>
							</tr>
							<tr>
								<td colspan="7">
									<div class="btn-center reqWriterBtn">
					                      <button type="submit" class="btn btn-primary btn-lg btn-plus-design" >신청</button>
					                      <button type="reset" class="btn btn-default btn-lg btn-plus-design" onclick="reqWriterDisplayNone();">취소</button>
					                </div>
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