<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.comvision.artBridge.transaction.model.vo.Transaction,
				 com.comvision.artBridge.board.model.vo.*, com.comvision.artBridge.files.model.vo.*,
				 com.comvision.artBridge.sale.model.vo.*, com.comvision.artBridge.message.model.vo.*,
				 com.comvision.artBridge.comments.model.vo.*,com.comvision.artBridge.fav.model.vo.*" %>  
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Art Bridge</title>

	<%@ include file="/views/common/head.jsp" %>

<!-- My Page 추가 -->
<link rel="stylesheet" href="/artBridge/css/w3.css">

<style>
	.heading .tit1{margin-bottom:20px;}
/*	통합 요소 스타일 */
	.tab-menu-content-form { padding-top:15px; }
   	.selectBox { float:right; margin-bottom:20px; }

   	.btn-outer-style { float:right; padding-bottom:60px; } 
   	.btn-plus-design{ padding:2px 20px; font-size: 15px; margin-left: 0px; }
   	.btn-cancel{ background:#DBDBDB; }
  	.btn-cancel:hover{ background: #808080; color:white; }
    .btn{ cursor:pointer; }

/*  팝업 통합 스타일 */
   	.settingArea { z-index:300; position: absolute; top:0px; padding-top:9%; display:none; width:100%;
      				/* padding-left:auto; padding-right:auto; text-align:center; */ }
	.settingArea h3{ margin-top:55px; margin-bottom:50px; font-weight:bold; }
	.form-table td{ padding:5px; }
  	.form-inner-table-title{ background-color:lightgray; }

/*  구입목록 */
    .seller-list{ background-color:rgba(255, 117, 223, 0.2); }
    .buyer-list{ background:rgba(117, 230, 255 , 0.2); }
    .disabledBtn { background:#9a9a9a !important; font-size:10px; padding:2px 10px; border-color:#4c4c4c !important; }
    .confirmBtn { font-size:10px; padding:2px 10px; }
/*  .seller-list .buyer-list{ padding-top:5px; background-clip: content-box; !important; } */

/*  명세표 팝업 */
	.stmtModal-Area-Style{ position:absolute; width:600px; background:white; padding-bottom:50px; left:50%; margin-left:-300px; }
	.stmt-title{ text-align:right; font-weight:bold; }
	.stmtBtn button{ width:32%; height:30px; line-height:0; margin-bottom:10px; }
  	
/*  쪽지함 스타일 */
	.messenger{ font-weight: bold; line-height:2em; }
	ul.tab-menu li>a:hover { background: darkgray; }
	div#editor { width: 81%; margin: auto; text-align: left; }
	.ss { background-color: red; }
	.fr-wrapper { overflow-Y: scroll; height: 86%; }
	
/* 	관심작가 리스트 스타일 */
	.bookmark-list-wrap { width:100%; padding:0px 39px; }
   	.bookmark-detailView-btn { cursor:pointer; font-size:30px; font-weight:bold; padding-bottom:15px; }
   	.bookmark-list { margin:0px 20px 50px; display:inline-block; }
   	.bookmark-del-btn { position:absolute; left:255px; color:#fcce18; font-weight:bold; font-size: 1.8em; cursor:pointer; }
   	.bookmark-del-btn:hover { color:darkgray; }

/*  회원정보 수정 탭 */
	.textBox{ height:35px; }
	#memberInfo td , #pwdCheckArea td{ text-align:left; height:45px; padding-left:20px; font-weight: bold; }
	#memberInfo{ margin-left:50px; }
	
/* 	회원 탈퇴 안내 화면 */
	.info-box{border:1px solid #ddd; padding:70px 85px 75px; font-size:16px; line-height:1.5; font-weight:bold; width:80%; margin-right:auto; margin-left:auto;}
	.tit{text-align:center; color:#3446d1; font-weight:bold; font-size:30px; margin-bottom:50px;}
	.agree-ck{margin-top:20px; vertical-align:middle; padding-left:60px; width:80%; margin-right:auto; margin-left:auto;}
    .agree-ck input{width:20px; height:20px; vertical-align:text-bottom;}
    .agree-ck label{font-size:18px; font-weight:bold; margin-left:5px;}
    
/*  작가회원신청 팝업 */
	.reqWriterForm-title{ text-align:left; font-weight:bold; }
	.reqWriterForm-Area-Style{ position:absolute; width:740px; background:white; padding-bottom:50px; left:50%; margin-left:-370px; }
/*	작가회원신청 팝업 이미지 파일 삽입 영역 */
	.insert-img-area{overflow:hidden; margin-bottom:10px; margin-top:5px;}
    .insert-img-area input{display:none;}
    .insert-img-area label{width:210px; margin-bottom:10px;}
    .insert-img-area li{/* float:left;  */display:inline-block; width:210px; margin-right:20px; }
    .insert-img-area li p{overflow:hidden; height:140px;}
    .insert-img-area img{width:100%;}
	strong{color:#e03939; font-weight:bold;}
</style>

<style>		/*  관심작가 탭 스타일 */
	.frofile-box{overflow:hidden; position:relative; border:1px solid #9e9e9e; padding:30px; font-size:16px; width:1110px;}
    .img-in{overflow:hidden; width:150px; height:150px; /*background:url("/artBridge/image/common/img_profile.png") 0 0 no-repeat; background-size:100%;*/ border:1px solid #ddd; border-radius:50%;}
    .img-in img{width:100%;}
    .img-area{float:left; text-align:center;}
    .img-area input[type=file]{margin-top:20px; width:150px;}
		
    .input-area{margin-left:40px; float:left; width:585px;}
    .input-area label{vertical-align:top;}
    .input-area input[type="text"], .input-area textarea{display:inline-block; width:515px; resize:none; margin-bottom:10px;}
    .input-area textarea{margin-bottom:0;}
    .input-area .info{margin-top: 5px;}
    .input-area .info li{font-size:14px; margin-bottom:3px; color:#428bca;}
    .input-area label[for=state1]{color:green; font-weight:bold;}
    .input-area label[for=state2]{color:red; font-weight:bold;}

    .state-area{margin-left:20px; float:left; width:250px;}
    .state-area li{position:relative; border-bottom:1px solid #bdbdbd; margin-bottom:10px;}
    .state-area li span{float:right;}

    .absol-btn{position:absolute; bottom:30px; right:30px;}

    .bord-wrap{overflow:hidden; width:1110px; font-size:16px;}
    .bord-wrap .piece-list{float:left; border:1px solid #9e9e9e; padding:20px; width:545px; margin-left:20px; margin-bottom:20px; font-weight:bold;}
    .bord-wrap .piece-list.default{width:100%; text-align:center; padding:50px 0;}
    .bord-wrap .piece-list:nth-child(2n+1){margin-left:0;}
    .bord-wrap .seting-area{overflow:hidden; float:right;}
    .bord-wrap .seting-area li{float:left; margin-left:10px;}
    .bord-wrap .seting-area li input{display:inline-block; width:25px; height:25px; background-size:100% !important; border: none;}
    .bord-wrap .seting-area .btn-lock{background:url("/artBridge/image/common/ico_lock.png") 0 0 no-repeat;}
    .bord-wrap .seting-area .btn-lock.on{background:url("/artBridge/image/common/ico_unlock.png") 0 0 no-repeat;}
    .bord-wrap .seting-area .btn-edit{background:url("/artBridge/image/common/ico_repaint.png") 0 0 no-repeat;}
    .bord-wrap .seting-area .btn-del{background:url("/artBridge/image/common/ico_delete.png") 0 0 no-repeat;}

    .bord-wrap .img-area{float:none; overflow:hidden; width:100%;}
    .bord-wrap .img-area .tmb{overflow:hidden; float:left; width:32%;}
    .bord-wrap .img-area .tmb~.tmb{margin-left:1.9%;}
    .bord-wrap .img-area .tmb img{width:100%;}

    .bord-wrap .info-area1{overflow:hidden; margin-top:20px;}
    .bord-wrap .info-area1 span{float:left; width:30%;}
    .bord-wrap .info-area1 span:first-child{width:40%;}
    .bord-wrap .info-area2{overflow:hidden; margin-top:10px;}
    .bord-wrap .info-area2 span{float:left;}
    .bord-wrap .info-area2 .price{float:right; font-size:20px; font-weight:bold;}

    .heading{margin: 30px 0 10px 0 !important;}
    div.btn-right.add-some button{bottom:0; top:auto;}
    .paginate{margin-bottom:50px;}
    .btn-default{background-color:#e4e4e4; color:#4e4e4e;}

    .star_rating {display:inline-block; font-size:0; letter-spacing:-4px; text-align:right;}
    .star_rating a {font-size:25px; letter-spacing:0; display:inline-block; color:#d6d6d6; text-decoration:none; line-height:0.9; margin-top:-2px;}
    .star_rating a:first-child {margin-left:0;}
    .star_rating a.on {color:#fcce18;} 
</style>

</head>
<body>
    <div id="all">
       
        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
        <!-- // Header -->

<%  /* 구매목록 메뉴 / 명세표 */
	ArrayList<Transaction> transList = null;
	if(request.getAttribute("transList")!= null){
		transList = (ArrayList<Transaction>)request.getAttribute("transList");
	}
	
 	System.out.println("상단부" + transList);
	
	
/* 	PageInfo pi = null;
	int listCount = 0;
	int currentPage = 0;
	int maxPage = 0;
	int startPage = 0;
	int endPage = 0;
	if(request.getAttribute("pi") != null){
		pi = (PageInfo)request.getAttribute("pi");
		listCount = pi.getListCount();
		currentPage = pi.getCurrentPage();
		maxPage = pi.getMaxPage();
		startPage = pi.getStartPage();
		endPage = pi.getEndPage();
	} */
%>

<% /* 2. 쪽지함 변수 코드 */
	ArrayList<Message> msgList = null;
	if(request.getAttribute("transList")!= null){
		msgList = (ArrayList<Message>)request.getAttribute("msgList");
	}
%>

<% /* 4. 회원정보 수정 변수 코드 */
 	String phone = ((Member)(session.getAttribute("loginUser"))).getPhone();
//	String phone = ((Member)(request.getSession().getAttribute("loginUser"))).getPhone();
						
	String tel1 = "";
	String tel2 = "";
	String tel3 = "";
	
	if(phone != null){
		if(phone.length() > 10){
			tel1 = phone.substring(0, 3);
			tel2 = phone.substring(3, 7);
			tel3 = phone.substring(7, 11);
		}else{
			tel1 = phone.substring(0, 3);
			tel2 = phone.substring(3, 6);
			tel3 = phone.substring(6, 10);
		}
	}
%>


        <!-- 주석 영역 -->
        
<!-- 	* 마이페이지 탭 메뉴 -->
		<section class="tit-area bg-yellow">	<!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
		<div class="container">
			<h2>마이 페이지</h2>
			<ul class="tab-menu">
<%-- 				<li><a href="<%= request.getContextPath() %>/selectTransList.ts" onclick="anotherHidden(this.id);" id="order-menu">주문관리</a></li> --%>
				<li><a href="#" onclick="anotherHidden(this.id);" id="order-menu">주문관리</a></li>
				<li><a href="#" onclick="anotherHidden(this.id);" id="msg-menu">쪽지함</a></li>
				<li><a href="#" onclick="anotherHidden(this.id);" id="bookmark-menu">관심작가</a></li>
				<li><a href="#" onclick="anotherHidden(this.id);" id="memberinfo-menu">회원정보수정</a></li>
<%-- 				<% if(loginUser.getWriter_right() == 1){ "%>" --%>
				<li><a href="#" onclick="anotherHidden(this.id);" id="mywork-menu"">내작품관리</a></li>
<%-- 				<% } %> --%>
				<li><a href="#" onclick="anotherHidden(this.id);" id="qna-menu">이용문의</a></li>
			</ul>
		</div>
		</section>
<!-- 	//마이페이지 탭 메뉴 -->

		<!-- 주석 영역 -->
<!-- 	* 마이페이지 탭 영역 -->	
		<div id="contentsArea" class="contents"><!-- contents 필수 사용 -->
<%-- 
<!--      	* 1-1. 마이페이지 탭 바디 - 주문관리 탭 / 구매목록 - 명세표 모달 창 -->
			<% if(t != null) { %>
			<form action="<%=request.getContextPath()%>/paymentpage.pg" method="post">
				<input type="hidden" name = "orders_no" value = "<%=t.getOrders_no() %>" />
				<input type="hidden" name = "customer_no" value = "<%= m.getMember_no() %>" />
				<input type="hidden" name= "writer_no" value = "<%= t.getWrtNo()%>" />
				<input type="hidden" name = "total" value = "<%=totalPrice %>" />
				
				<div id="stmtModalArea" class="w3-modal"></div>
				<div id="stmtArea" class="settingArea">
					<!-- 모달 요소 넣기 -->
					<div class=stmtModal-Area-Style align="center">
						<h3>명 &nbsp; 세 &nbsp; 서</h3>
						<table class="form-table">
							<tr>
								<td width="15px"></td>
								<td width="90px" class="stmt-title">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목  : </td>
								<td colspan="3"><%=t.getBoard_title()%></td>
							</tr>
							<tr>
								<td></td>
								<td class="stmt-title">신 청 일  : </td>
								<td colspan="3"><%= t.getO_date() %></td>
							</tr>
							<tr>
								<td></td>
								<td class="stmt-title">구 매 자  : </td>
***							<td width="230px"><%=loginUser.getNick_name()%></td>
								<td width="230px"><%=t.getCusName()%></td>
								<td width="80px" class="stmt-title">판 매 자  : </td>
								<td width="150px"><%= t.getWrtNick()%></td>
							</tr>
							<tr>
								<td></td>
								<td class="stmt-title">옵 션 명  : </td>
								<td colspan="3"><%=rlist.get(0).getRequirements_content()%></td>
							</tr>
							<tr>
								<td colspan="5" height="30px"></td>
							</tr>
							<tr>
							<td colspan="5" width="540px">
								<table border="1" >
									<tr class="form-inner-table-title" style="font-weight:bold; text-align:center;" height="25px">
										<td width="35px">No</td>
										<td width="380px">요 구 사 항</td>
										<td width="87px">금 액</td>
									</tr>
								  <% for (Requirements r : rlist) {		int j = 1; %>
									<tr height="23px">
										<td align="center"><%= j %></td>
										<td style="font-size: 12px; padding-left: 10px;"><%=r.getRequirements_content() %></td>
										<td align="right"><%=r.getRequirement_price() %>원</td>
									</tr>
								  <% 	j++;	} %>
								</table>
								<br>
								<% if(clist != null) { %>
								<h5>작가 코멘트</h5>
								<table border="1">
									<tr class="form-inner-table-title" style="font-weight:bold; text-align:center;" height="25px">
										<td width="35px">No</td>
										<td width="467px">작가 코멘트</td>
									</tr>
								  <% int i = 1;for(Comments c : clist){ %>
									<tr height="23px">
										<td align="center"><%= i %></td>
										<td style="font-size: 12px; padding-left: 10px;"><%=c.getComments_content() %></td>
									</tr>
								  <% 	i++;	} %>
								</table>
											
								<%}else{} %>
								<br />
								
								<table align="right">
									<tr>
										<td>총 금 액 :</td>
										<td><strong style="font-size:20px; /* margin-right:65px; */"><%= totalPrice %>원</strong></td>
									</tr>
								</table>
							</td>
							</tr>
							<tr>
								<!-- <td colspan="5">
									<div class="btn-center stmtBtn">
										  <button class="btn btn-primary btn-lg btn-plus-design" style="width:67%;">거 래 수 락</button><br>
					                      <button class="btn btn-primary btn-lg btn-plus-design" style="margin-left:0;">재 요청</button>
					                      <button class="btn btn-default btn-lg btn-plus-design">거래 취소</button>
					                </div>
								</td> -->
							</tr>
							<tr>
								<td colspan="5">
									<div class="btn-center stmtBtn">
									<% if(clist != null){if(m.getMember_no() == t.getCusNo()){ %>
										<button type="submit" class="btn btn-primary btn-mg btn-plus-design" style="width:50%;">거 래 수 락</button> <br><br />
									<% } } %>
<!-- ***				  					  <% if(loginUser.getWriter_right() == 0) { %> -->
										<% if(t.getWrtNo() == m.getMember_no()){ %>
										<button type="button" onclick = "change()" class="btn btn-primary btn-mg btn-plus-design" style="margin-left:0;">재 요청</button>
									  <% }else{ %>
										<button type="button" onclick = "req()" class="btn btn-primary btn-mg btn-plus-design" style="margin-left:0;">재 요청</button>
									  <% } %>
										<button type="button" onclick="cancel()" class="btn btn-danger btn-mg btn-plus-design">거래 취소</button>
<!--***		 							<button class="btn btn-default btn-mg btn-plus-design" type="button" onclick="stmtDisplayNone();">목록으로</button> -->
										<button type="button" onclick="location.href='<%=request.getContextPath()%>/selectTransList.ts'"class="btn btn-default btn-mg btn-plus-design">목록으로</button>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</form>
			<% } %>
<!--      	//1-1. 마이페이지 탭 바디 - 주문관리 탭 / 구매목록 - 명세표 모달 창 -->
 --%>

<!--      	* 4-1. 마이페이지 탭 바디 - 회원정보수정 탭 / 작가신청 버튼 클릭 - 제출 양식 모달 창 -->
			<form action="<%= request.getContextPath() %>/reqWriterRight.me" method="post" id="callReqWriterRightServlet" onsubmit="return reqWriterRight();" encType="multipart/form-data">
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
								<td><input type="text" id="userBank" name="userBank" style="width:50px;"/> 은행</td>
								<td colspan="3">
									<span class="reqWriterForm-title">* 계좌번호 &nbsp;: &nbsp;</span>
									<input type="text" id="userAccount" name="userAccount" style="width:250px; padding-left:5px;" placeholder="'-'없이 숫자만 입력"/>
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
	                                      <input type="file" id="file-btn1" name="confirmImg_writerRight1" multiple="multiple" onchange="readURL(this);" accept="image/gif, image/jpeg, image/png">
	                                      <label for="file-btn1" class="btn btn-primary">이미지 파일 불러오기</label>
	                                      <p><img class="img1" src="/artBridge/image/common/no_thumb.jpg" /></p>
	                                  </li>
	                                  <li>
	                                      <input type="file" id="file-btn2" name="confirmImg_writerRight2" multiple="multiple" onchange="readURL(this);" accept="image/gif, image/jpeg, image/png">
	                                      <label for="file-btn2" class="btn btn-primary">이미지 파일 불러오기</label>
	                                      <p><img class="img2" src="/artBridge/image/common/no_thumb.jpg"></p>
	                                  </li>
	                                  <li style="margin-right:0px;">
	                                      <input type="file" id="file-btn3" name="confirmImg_writerRight3" multiple="multiple" onchange="readURL(this);" accept="image/gif, image/jpeg, image/png">
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
<!--      	//4-1. 마이페이지 탭 바디 - 회원정보수정 탭 / 작가신청 버튼 클릭 - 제출 양식 모달 창 -->


<!-- 	* 마이페이지 탭 제목/바디 영역 -->
		<div class="container">		<!-- container 필수 사용 -->
		<div class="col-md-12">
				
				
<!-- 	   	* 마이페이지 탭 제목 -->
			<div class="heading">
				<h2 class="menuName tit1"></h2>
				<!-- <h2 class="order-menu tit1"> 관리</h2>
				<h2 class="msg-menu tit1">쪽지함</h2>
				<h2 class="bookmark-menu tit1">관심 작가</h2>
				<h2 class="memberinfo-menu tit1">회원정보 수정</h2>
				<h2 class="mywork-menu tit1" style="text-color:#FF7373;">내 작품 관리</h2>	***수정사항 : 작가 페이지
				<h2 class="qna-menu tit1">이용 문의</h2> -->
			</div>	<hr>
<!-- 	   	//마이페이지 탭 제목 -->
					
<!--        * 1. 마이페이지 탭 메뉴 - 관리 탭 -->
			<form action="" method="post"class="order-menu tab-menu-content-form">
				<div class="order-menu">	<!-- ***수정사항 : 구매자(buyer) 판매자(seller) 입장에 따른 필터링, 행 색 속성, DB처리 등  -->
					<select id="stmt-Filter" class="form-control input-xshort selectBox">
						<option>전체 보기</option>
						<option>구매 내역</option>
						<option>판매 내역</option>
						<!-- <option>진행중인 거래내역</option>
						<option>거래 완료 내역</option> -->
					</select>

					<table class="tbl-type02">
						<colgroup>
							<col style="width: 4.5%;">
							<col style="width: 8.5%;">
							<col style="width: 10%;">
							<col style="width: 35%;">
							<col style="width: 8%;">
							<col style="width: 5%;">
							<col style="width: 12%;">
							<col style="width: 12%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">구분</th>
								<th scope="col">거래번호<br>(번호)</th>	<!-- ***수정사항 : 명세표 보기 -->
								<th scope="col">거래자</th>
								<th scope="col">게시글 제목</th>				<!-- ***수정사항 : 게시글로 링크 걸기 -->
								<th scope="col">진행 현황</th>
								<th scope="col">문의<br>확인</th>
								<th scope="col">작업 시작일</th>
								<th scope="col">작업 완료일</th>
							</tr>
						</thead>
						
						<tbody>		
							<% if(transList != null){
								for(Transaction tr : transList){ %>
								  <% if(tr.getDivRole_no() == 0){ %>
									<tr id="" class="seller-list transInfo-list">
										<td>판매	</td>
										<td><a onclick="stmtDisplayBlock(this.text);" class="btn"><%= tr.getOrders_no() %></a></td>
										<td><%= tr.getCusId() %><input type="hidden" name="cusId" value="<%= tr.getCusId() %>" /></td>
										<td class="txt-fl"><a href="<%= request.getContextPath() %>/selectOneSalepage.bo?num=<%= tr.getBoard_no() %>"><%= tr.getBoard_title() %></a></td> 
<%-- <!-- *** -->							<td class="txt-fl"><a onclick ="boardDetail(this)" name = "<%=tr.getBoard_no() %>" class="btn"><input type="hidden" value = "<%=tr.getBoard_no() %>" /><%= tr.getBoard_title() %></a></td> --%>

									  	<td>
										  <% if(tr.getOrders_activity() == 1){ %>										
											<button disabled class="btn btn-primary btn-lg btn-del btn-plus-design disabledBtn">조율중</button>
										  <% }else if(tr.getOrders_activity() == 2){
												if(tr.getOd_endDate() == null){ %>
										    <button onclick="confirmReq('<%= tr.getOrders_no() %>', '<%= tr.getOrders_activity() %>');" class="btn btn-primary btn-lg btn-del btn-plus-design confirmBtn">1단계 컨펌</button>
											<% }else{ %>
											<button disabled class="btn btn-primary btn-lg btn-del btn-plus-design disabledBtn">확인중</button>									  
											<% } %>
										  <% }else if(tr.getOrders_activity() == 3){
												if(tr.getOd_endDate() == null){ %>
										    <button onclick="confirmReq('<%= tr.getOrders_no() %>', '<%= tr.getOrders_activity() %>');" class="btn btn-primary btn-lg btn-del btn-plus-design confirmBtn">2단계 컨펌</button>
											<% }else{ %>
											<button disabled class="btn btn-primary btn-lg btn-del btn-plus-design disabledBtn">확인중</button>								  
											<% } %>
										  <% }else if(tr.getOrders_activity() == 4){
												if(tr.getOd_endDate() == null){ %>
										    <button onclick="confirmReq('<%= tr.getOrders_no() %>', '<%= tr.getOrders_activity() %>');" id="confirmBtn" class="btn btn-primary btn-lg btn-del btn-plus-design confirmBtn">3단계 컨펌</button>
											<% }else{ %>
											<button disabled class="btn btn-primary btn-lg btn-del btn-plus-design disabledBtn">확인중</button>								  
											<% } %>
										  <% }else if(tr.getOrders_activity() == 5){
												if(tr.getOd_endDate() == null){ %>
										    <button onclick="confirmReq('<%= tr.getOrders_no() %>', '<%= tr.getOrders_activity() %>');" class="btn btn-primary btn-lg btn-del btn-plus-design confirmBtn">최종 전송</button>
											<% }else{ %>
											<button disabled class="btn btn-primary btn-lg btn-del btn-plus-design disabledBtn">미수령</button>									  
											<% } %>
											
										  <% }else if(tr.getOrders_activity() == 6){  
												if(tr.getOd_endDate() == null){ %>
											<button disabled class="btn btn-primary btn-lg btn-del btn-plus-design disabledBtn">지급 대기</button>
											<% }else{ %>
											<button disabled class="btn btn-primary btn-lg btn-del btn-plus-design disabledBtn" style="color:black;">거래 완료</button>									  
										  <% } } %>	
										</td>
									  										
										<td><img onclick="selectThisMsg()'<%= tr.getOrders_no() %>');" class="btn" src='/artBridge/image/common/mypage/msg.png'></td>
										<td><%= tr.getO_date() %></td>
									  <% if(tr.getO_final_date() == null){ %>
									    <td>-</td>
									  <% }else{ %>
										<td><%= tr.getO_final_date() %></td>
									  <% } %>
									</tr>

								  <% } else if(tr.getDivRole_no() == 1){ %>
									<tr id="" class="buyer-list transInfo-list">								
										<td>구매</td>
										<td><a onclick="stmtDisplayBlock(this.text);" class="btn"><%= tr.getOrders_no() %></a></td>
										<td><%= tr.getWrtNick() %><input type="hidden" name="wrtId" value="<%= tr.getWrtId() %>" /></td>
 										<td class="txt-fl"><a href="<%= request.getContextPath() %>/selectOneSalepage.bo?num=<%= tr.getBoard_no() %>"><%= tr.getBoard_title() %></a></td>
<%-- <!-- *** -->							<td class="txt-fl"><a onclick ="boardDetail(this)" name = "<%=tr.getBoard_no() %>" class="btn"><input type="hidden" value = "<%=tr.getBoard_no() %>" /><%= tr.getBoard_title() %></a></td> --%>
									  	<td>									  	  
										  <% if(tr.getOrders_activity() == 1){ %>										
											<button disabled class="btn btn-primary btn-lg btn-del btn-plus-design disabledBtn">조율중</button>
										  <% }else if(tr.getOrders_activity() == 2){
												if(tr.getOd_endDate() == null){ %>
											<button disabled class="btn btn-primary btn-lg btn-del btn-plus-design disabledBtn">작업중</button>									  
											<% }else{ %>
										    <button onclick="confirmCheck('<%= tr.getOrders_no() %>', '<%= tr.getOrders_activity() %>');" class="btn btn-primary btn-lg btn-del btn-plus-design confirmBtn">컨펌 1단계</button>
											<% } %>
										  <% }else if(tr.getOrders_activity() == 3){
												if(tr.getOd_endDate() == null){ %>
											<button disabled class="btn btn-primary btn-lg btn-del btn-plus-design disabledBtn">작업중</button>									  
											<% }else{ %>
										    <button onclick="confirmCheck('<%= tr.getOrders_no() %>', '<%= tr.getOrders_activity() %>');" class="btn btn-primary btn-lg btn-del btn-plus-design confirmBtn">컨펌 2단계</button>
											<% } %>
										  <% }else if(tr.getOrders_activity() == 4){
												if(tr.getOd_endDate() == null){ %>
											<button disabled class="btn btn-primary btn-lg btn-del btn-plus-design disabledBtn">작업중</button>									  
											<% }else{ %>
										    <button onclick="confirmCheck('<%= tr.getOrders_no() %>', '<%= tr.getOrders_activity() %>');" class="btn btn-primary btn-lg btn-del btn-plus-design confirmBtn">컨펌 3단계</button>
											<% } %>
										  <% }else if(tr.getOrders_activity() == 5){
												if(tr.getOd_endDate() == null){ %>
											<button disabled class="btn btn-primary btn-lg btn-del btn-plus-design disabledBtn">작업중</button>								  
											<% }else{ %>    <!-- 작품 확인 되면 order_detail 활동번호(6으로) 기존번호 + 1 한 새로운 행 삽입 &   여기 메시지에서 작품 다운 받을 수 있도록 만들기-->
										    <button onclick="confirmCheck('<%= tr.getOrders_no() %>', '<%= tr.getOrders_activity() %>');" class="btn btn-primary btn-lg btn-del btn-plus-design confirmBtn">작품 확인</button>
											<% } %>
											
										  <% }else if(tr.getOrders_activity() == 6){
										  		if(tr.getOd_endDate() == null){ %>
											<button onclick="confirmCheck('<%= tr.getOrders_no() %>', '<%= tr.getOrders_activity() %>');" class="btn btn-primary btn-lg btn-del btn-plus-design">수령 확인</button>
											<% }else{ %>
											<button disabled class="btn btn-primary btn-lg btn-del btn-plus-design disabledBtn" style="color:black;">거래 완료</button>											
										  <% } } %>
									  	</td>								  									
										
										<td><img onclick="selectThisMsg()'<%= tr.getOrders_no() %>');" class="btn" src='/artBridge/image/common/mypage/msg.png'></td>
										<td><%= tr.getO_date() %></td>
									  <% if(tr.getO_final_date() == null){ %>
									    <td>-</td>
									  <% }else{ %>
										<td><%= tr.getO_final_date() %></td>
									  <% } %>
									</tr>
										
							<% } } } %>	
						</tbody>
					</table>
	
				<br><br><br><br>
				</div>
			</form>
<!-- 		//1. 마이페이지 탭 메뉴 - 관리 탭 -->

<!-- 		* 2. 마이페이지 탭 메뉴 - 쪽지함 탭 -->
			<form action="" method="get"class="msg-menu tab-menu-content-form">
				<div class="msg-menu msg-menu-list">
					<select id="msg-select" class="form-control input-xshort selectBox msg-Filter">
						<option>전체 보기</option>
						<option>보낸 쪽지</option>
						<option>받은 쪽지</option>
					</select>			
					
					<table class="tbl-type02 msg-table">
						<colgroup>
<!-- 						<col style="width: 4%;"> -->
							<col style="width: 4%;">
							<col style="width: 5%;">
							<col style="width: 40%;">
							<col style="width: 15%;">
							<col style="width: 15%;">
						</colgroup>
						<thead>
							<tr>
<!-- 							<th scope="col"><input type="checkbox" name="checkAll" id="checkAllMsg"></th> -->
								<th scope="col">No</th>
								<th scope="col">수신<br>확인</th>
								<th scope="col">제목</th>
								<th scope="col" style="line-height:1.5em">보낸 사람<br>   / 날짜</th>
								<th scope="col" style="line-height:1.5em">받는 사람<br>   / 날짜</th>
							</tr>
						</thead>
						
						<tbody>
						  <% if(msgList != null){
							  for(int i = 0; i < msgList.size(); i++){
								if(msgList.get(i).getSendWho() == 1){ %>	
								<tr id="" class="send-list msg-list">
							  <% }else{ %>
								<tr id="" class="rec-list msg-list">
							  <% } %>
							  <!--** <td><input type="checkbox" name="checkMsg"></td> **-->
								  <td><%= msgList.get(i).getMsg_no() %></td>
								  <td>
								  	<% if(msgList.get(i).getCheck_date() != null) {%>
								  	<img src='/artBridge/image/common/mypage/openMsg.png'>
								  	<% }else{ %>
								  	<img src='/artBridge/image/common/mypage/msg.png'>
								  	<% } %>
								  </td>
								  <td class="txt-fl"><a href="#"><%= msgList.get(i).getMsg_content() %></a></td>
								  <td><span class="messenger"><%= msgList.get(i).getDispatch_member_name() %></span><br>/  <%= msgList.get(i).getMsg_date() %></td>
								  <td><span class="messenger"><%= msgList.get(i).getReceive_member_name() %></span><br>/  <%= msgList.get(i).getCheck_date() %></td>
								</tr>
						  <% } } %>
						</tbody>
					</table>
					
					<div class="btn-center btn-outer-style">
<!-- 	                      <button class="btn btn-default btn-lg btn-cancel btn-plus-design">취소</button> -->
	                      <button onclick="showSendMsgForm();" class="btn btn-primary btn-lg btn-del btn-plus-design">쪽지 쓰기</button>
	                </div>
	                    
				<br><br><br><br>	
				</div>
			</form>
<!-- 		//2. 마이페이지 탭 메뉴 - 쪽지함 탭 -->

<!--      		* 2-1. 마이페이지 탭 바디 - 쪽지함 탭 / 쪽지별 세부 화면 --> 				<!-- id를 msg-detail-view 로 만든 버튼에 연결 -->  
				<!-- <form onsubmit="return formCheck(this)" action="/artBridge/insertSend.msg" method="post" id="goForm" class="msg-detail-view tab-menu-content-form" style="display:none;">
					<div class="msg-detail-view">					
						<table class="tbl-type02">
							<colgroup>
								<col style="width: 15%;">
								<col style="width: *;">
							</colgroup>
							<tbody>
								<tr>
									<td style="background: lightgray;">*받는 사람 넘버<input type="hidden" name="mem_id" value =""></td>
									<td><input id="receive_mem_no" name="receive_mem_no" type="text" style="width: 99%;" placeholder="받는 사람 넘버"></td>
								</tr>
								<tr>
									<td style="background: lightgray;">*제목</td>
									<td><input id="title" name="title"  type="text" style="width: 99%;" placeholder="제목 작성"></td>
								</tr>
								<tr>
									<td style="background: lightgray;">*내용</td>
									<td>
										<textarea id='editor' name="editor" style="height: 550px;"></textarea>
										<script>
											$(function() {
												$('#editor').froalaEditor()
											});
										</script>
									</td>
								</tr>
							</tbody>
						</table>	
					
					<br><br><br><br>
					</div>
				</form> -->
				
<!-- 			<form onsubmit="return formCheck(this)" action="/artBridge/insertSend.msg" method="post" id="goForm" class="msg-detail-view tab-menu-content-form" style="display:none;">					 -->
				<form onsubmit="return formCheck(this)" method="post" id="goForm" class="msg-send-Form msg-detail-view tab-menu-content-form" style="display:none;">					
					<div class="send-msg-view">
						<table class="tbl-type02">
							<colgroup>
								<col style="width: 15%;">
								<col style="width: *;">
							</colgroup>
							<tbody>
								<tr>
									<td style="background: lightgray;">*받는 사람 넘버<input type="hidden" name="mem_id" value =""></td>
									<td><input id="receive_mem_no" name="receive_mem_no" type="text" style="width: 99%;" placeholder="받는 사람 넘버"></td>
								</tr>
								<tr>
									<td style="background: lightgray;">*제목</td>
									<td><input id="title" name="title"  type="text" style="width: 99%;" placeholder="제목 작성"></td>
								</tr>
								<tr>
									<td style="background: lightgray;">*내용</td>
									<td>
										<textarea id='editor' name="editor" style="height: 550px;"></textarea>
										<script>
											$(function() {
												$('#editor').froalaEditor()
											});
										</script>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="btn-center btn-outer-style">
	                      <button type="reset" class="btn btn-default btn-lg btn-cancel btn-plus-design" onclick="sendMsgCancel();">작성 취소</button>
	                      <button type="submit" class="btn btn-primary btn-lg btn-plus-design">쪽지 보내기</button>
						</div>
					<br><br><br><br>
					</div>
				</form>
				
				<script>
                   	function formCheck(frm){
                   		console.log("실행");
                   		var title = $("#title");
                   		var editor = $("#editor");
                   		var re_no = $("#re_no");
						
						if(frm.title.value == "" || frm.editor.value == "" || frm.receive_mem_no.value == ""){
							console.log();
							alert("필수 입력 사항을 전부 입력해주세요.");
							frm.title.focus();
							return false;
						}
						
						location.href="<%= request.getContextPath() %>/insertSend.msg"

                   	}
                   	function sendMsgCancel(){
<%-- 						location.href="/artBridge/selectList.my?memberNo=<%= loginUser.getMember_no() %>	 --%>
                   	}
                </script>
<!--      		//2-1. 마이페이지 탭 바디 - 쪽지함 탭 / 쪽지별 세부 화면 -->
	<%
	ArrayList<HashMap<String, Object>> hlist = null;
	if ((ArrayList<HashMap<String, Object>>) request.getAttribute("hlist") != null) {
		hlist = (ArrayList<HashMap<String, Object>>) request.getAttribute("hlist");
	}
	ArrayList<Fav> flist = null;
	if ((ArrayList<Fav>) request.getAttribute("flist") != null) {
		flist = (ArrayList<Fav>) request.getAttribute("flist");
	}
	%>
<!-- 		* 3. 마이페이지 탭 메뉴 - 관심작가 탭 -->    <!-- id를 bookmark-detail-view 로 만든 버튼에 연결       onclick="selfHidden();"  ,   "bookmarkDel()"  구현하기 -->
			<form action="" method="get" class="bookmark-menu tab-menu-content-form">
						<div class="bookmark-menu">
							<div id="bookmark-list-wrap" class="bookmark-menu bookmark-list-wrap">
							<%if(hlist!=null){
								for (int k = 0; k < flist.size(); k++) {
									HashMap<String, Object> hmap = hlist.get(k); %>
								<div class="frofile-box bookmark-list" style="width: 300px; padding: 5px 15px 15px 15px;">
									<a onclick="fav(this.id);" class="on bookmark-del-btn" id="<%=flist.get(k).getWriter_no()%>">★</a>
									<table style="margin-right: auto; margin-left: auto;">
										<tr>
											<td colspan="2" align="center" height="170px" style="padding-top: 15px; padding-bottom: 10px">
												<div class="img-in">
													<img src="<%=request.getContextPath() %><%=hmap.get("profile")%><%=hmap.get("change") %>" alt="default frofile image">
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2" style="text-align: center;">
											<a href="<%=request.getContextPath() %>/selectPieceList.wr?memberNo=<%=flist.get(k).getWriter_no()%>"class="bookmark-detailView-btn"><%=hmap.get("nick")%> 작가</a></td>
										</tr>
										<script>
											function fav(i){
												$.ajax({
													url:"favUpdate.sp",
													data:{writer_noo:i},
													type:"post",
													success:function(data){
														alert("관심작가 업데이트 성공!");
													},
													error:function(status, msg){
														alert("관심작가 업데이트 실패!");
													}
												});
											}
										</script>
										<tr>
											<td>
												<div class="state-area"
													style="margin-left: 0px; padding-left: 15px; padding-right: 15px;">
													<ul>
														<li>작품리스트 <span><%=hmap.get("bcount")%>개</span></li>
														<li>평점 <span>
																<p class="star_rating">
																	<!-- 별 갯수 평균으로 반영하기 -->
																	<a href="#" class="on">★</a> <a href="#" class="on">★</a>
																	<a href="#" class="on">★</a> <a href="#">★</a> 
																	<a href="#">★</a>
																</p> <%=hmap.get("grade")%>점
														</span>
														</li>
														<li>진행중인 의뢰 <span><%=hmap.get("orcount")%>건</span></li>
														<li>슬롯 갯수 <span><%=hmap.get("slot")%>개</span></li>
													</ul>
												</div>
											</td>
										</tr>
									</table>
								</div>
								<%} }else{%>
									<h1>관심 작가가 없습니다</h1>
								<%} %>
							</div>
							<br><br><br><br>
						</div>
					</form>
<!-- 		//3. 마이페이지 탭 메뉴 - 관심작가 탭 -->

<!-- 		* 4. 마이페이지 탭 메뉴 - 회원정보수정 탭 -->
			<!-- <form id="memberInfoForm" method="post" class="memberinfo-menu tab-menu-content-form"> -->
			<div id="memberInfo" class="memberinfo-menu tab-menu-content-form"> <br>
			
<!--      		* 4-1. 마이페이지 탭 바디 - 회원정보수정 탭 / 회원 인증 비밀번호 확인 창 -->			
				<table id="pwdCheckArea" style="margin-left:30px;">
					<tr>
						<td>비밀번호</td>
						<td><input type="password" maxlength="13" id="checkUserPwd" class="checkUserPwd form-control input-short textBox"/></td>
						<td>
							<div style="margin-left:40px;">
			                    <button onclick="pwdCheck();" class="btn btn-primary btn-lg btn-del btn-plus-design">확인</button>
	               			</div>
						</td>
						<td width="255px"><div id="pwdStatus">비밀번호를 잘못 입력하였습니다.</div></td>
					</tr>
				</table>
<!--      		//4-1. 마이페이지 탭 바디 - 회원정보수정 탭 / 회원 인증 비밀번호 확인 창 -->

<!--      		* 4-2. 마이페이지 탭 바디 - 회원정보수정 탭 / 회원정보 수정 본 화면 -->					
				<form id="memberInfoForm" onsubmit="return updateMember()" action="<%= request.getContextPath() %>/updateInfo.me" method="post" class="memberInfoArea" style="display:none;">
					<div class="memberInfoArea">
						<table>
							<tr>
								<td width="150px">* 아이디 </td>
								<td><input type="text" value="<%= loginUser.getId() %>" maxlength="13" name="myPageUserId" id="updateUserId" class="form-control input-short textBox" readonly/></td>
							</tr>
							<tr>
								<td>* 비밀번호</td>
								<td><input type="password" maxlength="13" id="updateUserPwd1" name="myPageUserPwd" onchange="comparePwd();" class="form-control input-short textBox"/></td>
								<td></td>
							</tr>
							<tr>
								<td>* 비밀번호 확인</td>
								<td><input type="password" maxlength="13" id="updateUserPwd2" name="myPageUserPwd2" onchange="comparePwd();" class="form-control input-short textBox"/></td>
								<td colspan="2"><label id="pwdResult">패스워드가 일치하지 않습니다.</label></td>
							</tr>
							<tr>
								<td>* 이름</td>
								<td><input type="text" value="<%= loginUser.getName() %>" maxlength="5" name="myPageUserName" class="form-control input-short textBox" readonly></td>
							</tr>
							<tr>
								<td>* 닉네임</td>
								<td><input type="text" value="<%= loginUser.getNick_name() %>" id="updateNickName" onchange="nickNameChangeCheck();" maxlength="30" name="myPageNickName" class="form-control input-short textBox"></td>
								<td width="130px"><label class="btn btn-default btn-lg btn-cancel btn-plus-design" id="nickNameCheckBtn" onclick="nickNameUniqueCheck();">중복확인</label></td>
								<td width="300px"><label id="nnResult"></label></td>
							</tr>
							<tr>
							  <% if(loginUser.getWriter_right() < 1){ %>
								<td> &nbsp;&nbsp;&nbsp;연락처</td>
							  <% }else{ %>
								<td>* 연락처</td>
							  <% } %>
								<td width="200px" style="text-align:center;">
									<input type="text" maxlength="3" value="<%= tel1 %>" id="tel1" name="tel1" style="width:28%; display: inline-block;" class="form-control textBox"/> -
									<input type="text" maxlength="4" value="<%= tel2 %>" id="tel2" name="tel2" style="width:29.5%; display: inline-block;" class="form-control textBox"/> -
									<input type="text" maxlength="4" value="<%= tel3 %>" id="tel3" name="tel3" style="width:29.5%; display: inline-block;" class="form-control textBox"/>
								</td>
								<td></td>
							</tr>
							<tr>
							  <% if(loginUser.getWriter_right() < 1){ %>
								<td> &nbsp;&nbsp;&nbsp;이메일</td>
							  <% }else{ %>
								<td>* 이메일</td>
							  <% } %>
								<td><input type="email" value="<%= loginUser.getEmail() %>" id="email" name="email" class="form-control input-short textBox"/></td>
								<td></td>
							</tr>
						</table>					
						<br /><br /><br />
						
						<div class="btn-center btn-outer-style" style="width:50%;">
		                    <button type="reset" class="btn btn-default btn-lg btn-cancel btn-plus-design">취소</button>
		                    <button type="submit" class="btn btn-primary btn-lg btn-del btn-plus-design">수정</button>
		                    <button onclick="deleteMemberRequest();" class="btn btn-lg btn-default btn-plus-design" style="float:right;">회원 탈퇴</button>
		                </div>
						<div class="btn-center btn-outer-style" style="width:50%;">
						  <% if(loginUser.getWriter_right() < 1){
							  if(loginUser.getBank() == "" || loginUser.getBank() == null){ %>
								<button onclick="reqWriterDisplayBlock();" id="reqWriterBtn" class="btn btn-primary btn-lg btn-plus-design" style="float:left; margin-left:10px;">작가 신청</button>
						  	<% }else if(loginUser.getBank() != null){ %>
								<button onclick="reqWriterDisplayBlock();" id="reqWriterBtn" class="btn btn-primary btn-lg btn-plus-design" disabled style="float:left; margin-left:10px;">승인 대기</button>						  	
						  	<% }
							} %>
		                </div>
	                </div>
                </form>
<!--      		//4-2. 마이페이지 탭 바디 - 회원정보수정 탭 / 회원정보 수정 본 화면 -->

<!--      		* 4-3. 마이페이지 탭 바디 - 회원정보수정 탭 / 회원 탈퇴 안내 화면 -->					
				<form action="">
					<div class="deleteMemberNotice" style="display:none; width:100%;">
						<div class="info-box">
							<p class="tit">※ 회원 탈퇴 신청 전 확인하세요.</p>
							* 진행중인 프로젝트가 있을 경우, 프로젝트가 완료 된 후에 탈퇴가 가능합니다. <br /><br />
							* 하신 이력이 있는 경우,  정보는 정책에 따라 일정기간 보존됩니다. <br /><br />
							* 회원 정보는 탈퇴 신청 후 30일 간 보관됩니다. <br /><br />
							* 동일한 아이디로는 재가입 하실 수 없습니다.
						</div>
						<div class="agree-ck">
							<input type="checkbox" id="agree"/>
							<label for="agree">위의 내용을 모두 확인하였고, 동의합니다.</label>
						</div>
						<div class="btn-center">
		                      <input type="button" value="회원 탈퇴" class="delMemChk btn btn-lg btn-default btn-cancel" style="padding:10px 35px; margin-right:15px;">
		                      <input type="button" value="취소" id="trst" class="delMemChk btn btn-lg btn-primary">
		                </div>
	                </div>
				</form>
<!--      		//4-3. 마이페이지 탭 바디 - 회원정보수정 탭 / 회원 탈퇴 안내 화면 -->


			<br><br><br><br>	
			</div>
			<!-- </form> -->
<!-- 		//4. 마이페이지 탭 메뉴 - 회원정보수정 탭 -->

<!-- 		* 5. 마이페이지 탭 메뉴 - 내작품관리 탭 -->
			<form action="<%-- <%=request.getContextPath()%>/selectPieceList.wr --%>" method="get"class="mywork-menu tab-menu-content-form">
				<div class="mywork-menu">	<!-- 소나 파일 include or 링크 연결하기 -->
<%-- 					<%@ include file="/views/myPage/insertTest_writerPieceManagement.jsp" %> --%>
<!-- 						해당 서블릿 리턴 주소 바꾸기 page = "/views/myPage/insertTest_writerPieceManagement.jsp"; -->
				<br><br><br><br>	
				</div>
			</form>
<!-- 		//5. 마이페이지 탭 메뉴 - 내작품관리 탭 -->

<!-- 		* 6. 마이페이지 탭 메뉴 - 이용문의 탭 -->
			<form action="" method="get"class="qna-menu tab-menu-content-form">
				<div class="qna-menu">						
					<select id="qna-select" class="form-control input-xshort selectBox msg-Filter">
						<option>전체 보기</option>
						<option>보낸 쪽지</option>
						<option>받은 쪽지</option>
					</select>
					
					<table class="tbl-type02">
						<colgroup>
							<col style="width: 4%;">
							<col style="width: 4%;">
							<col style="width: 5%;">
							<col style="width: 40%;">
							<col style="width: 15%;">
							<col style="width: 15%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><input type="checkbox" name="checkAll" id="checkAllQnA"></th>
								<th scope="col">No</th>
								<th scope="col">수신<br>확인</th>
								<th scope="col">제목</th>
								<th scope="col" style="line-height:1.5em">보낸 날짜</th>
								<th scope="col" style="line-height:1.5em">답변 날짜</th>
							</tr>
						</thead>
						
						<tbody>
							<%-- <% if(보낸회원번호가 나와 같다면){ %>
							<tr id="" class="send-list msg-list">
							<% }else{ %>
							<tr id="" class="rec-list  msg-list">
							<% } %> --%>
							<tr class="send-list msg-list">	<!-- ***수정사항 : 발신회원번호/수신회원번호 서블릿에서 받기 -->
								<td><input type="checkbox" name="checkMsg"></td>
								<td>1</td>
								<td><img src='/artBridge/image/common/mypage/msg.png'></td>
								<%-- <% if(메시지를 열어서 확인했다면 ){ %>
								<td><img src='/artBridge/web/image/common/mypage/openMsg.png'></td>
								<% }else{ %>  확인전이라면
								<td><img src='/artBridge/web/image/common/mypage/msg.png'></td>
								<% } %> --%>
								<td class="txt-fl"><a href="#">계좌를 작품 거래 후에 등록해도 될까요?</a></td>
								<td>2018-00-00</td>
								<td>2018-00-00</td>
							</tr>
							<tr class="rec-list  msg-list">
								<td><input type="checkbox" name="checkMsg"></td>
								<td>2</td>
								<td><img src='/artBridge/image/common/mypage/openMsg.png'></td>
								<%-- <% if(메시지를 열어서 확인했다면 ){ %>
								<td><img src='/artBridge/web/image/common/mypage/openMsg.png'></td>
								<% }else{ %>  확인전이라면
								<td><img src='/artBridge/web/image/common/mypage/msg.png'></td>
								<% } %> --%>
								<td class="txt-fl"><a href="#">문의하신 작가는 현재 활동하지 않는 작가입니다^^</a></td>
								<td>2018-00-00</td>
								<td>2018-00-00</td>
							</tr>
							<tr class="rec-list  msg-list">
								<td><input type="checkbox" name="checkMsg"></td>
								<td>3</td>
								<td><img src='/artBridge/image/common/mypage/msg.png'></td>
								<%-- <% if(메시지를 열어서 확인했다면 ){ %>
								<td><img src='/artBridge/web/image/common/mypage/openMsg.png'></td>
								<% }else{ %>  확인전이라면
								<td><img src='/artBridge/web/image/common/mypage/msg.png'></td>
								<% } %> --%>
								<td class="txt-fl"><a href="#">은행명과 계좌를 입력하셔야 작가 활동이 가능합니다^^</a></td>
								<td>2018-00-00</td>
								<td>2018-00-00</td>
							</tr>
						</tbody>
					</table>
					
					<div class="btn-center btn-outer-style">
	                      <!-- <button type="reset" class="btn btn-default btn-lg btn-cancel btn-plus-design">취소</button> -->
	                      <button type="submit" class="btn btn-primary btn-lg btn-del btn-plus-design">삭제</button>
	                </div>
	                    
				<br><br><br><br>	
				</div>
			</form>
<!-- 		//6. 마이페이지 탭 메뉴 - 이용문의 탭 -->


		</div>	
		</div>
<!-- 	//마이페이지 탭 제목/바디 영역 -->			
		</div>
<!-- 	//마이페이지 탭 영역 -->
        
        <!-- // 주석 영역 -->

        <!-- Footer -->
        <%@ include file="/views/common/footer.jsp" %>
        <!-- // Footer -->

    </div>



	<script>
// 		function change(){
<%-- 			location.href="<%= request.getContextPath()%>/detailedList.pg?orderno=<%= t.getOrders_no()%>"; --%>
// 		}
// 		function req(){
<%-- 			location.href="<%= request.getContextPath()%>/selectList.my?memberNo=<%=m.getMember_no()%>"; --%>
// 		}
// 		function cancel(){
<%-- 			location.href="<%= request.getContextPath()%>/dealcancel.pg?orderno=<%= t.getOrders_no()%>"; --%>
// 		}
	</script>

<!-- ** 마이페이지 호출 & 선택 탭 영역 보이기 스크립트 -->
	<script>
	//	* 페이지 호출
		$(function(){
// 			select orders_no from orders where member_no = ? or writer_no = ?
			var pageName = "<%= (String)request.getParameter("pageName") %>";
			
			$('.order-menu, .bookmark-menu, .msg-menu, .memberinfo-menu, .mywork-menu, .qna-menu').css({"display":"none"});
			
			if(pageName != null){
				anotherHidden(pageName);
			} else{
				pageName = $('#order-menu').id();
				anotherHidden(pageName);
			}
		});
	            		  
	//	* 탭 선택 함수
		function anotherHidden(thisMenu){	
			//var thisMenu = event.srcElement.id;
			 
// 			alert(thisMenu);
			var pageName = thisMenu;
			
			
			$('.order-menu, .msg-menu, .bookmark-menu, .memberinfo-menu, .mywork-menu, .qna-menu').css({"display":"none"});
	 
			$('.' + thisMenu).css({"display":"block"});
	
			$(':not(#' + thisMenu + ')').css({"color":"", "background":""});
			$('#mywork-menu').css({"color":"white", "background":"#FF7373"});
			$('#qna-menu').css({"color":"white", "background":"rgb(52, 70, 209)"});
		
			$('#' + thisMenu).css({"color":"black", "background":"white"});
			
			
<%--  			switch(pageName){
			case 'order-menu' : alert("에이작스로 들어왔어?");		
			
								$.ajax({									
									url : "<%= request.getContextPath() %>/selectTransList.ts",
									type : "post",
									success : function(data){
										console.log(data);

										if(data > 0){
											location.href="/artBridge/views/myPage/myPageForm.jsp?pageName=order-menu";
// 											location.href="/artBridge/views/myPage/myPageForm.jsp";
// 											transList = (ArrayList<Transaction>)request.getAttribute("transList");
										}
 											
										
										console.log(transList);
										alert(transList);
									}
								}); /* break; */
			}  --%>
					
			if(thisMenu == "order-menu"){			//오더메뉴, 메시지 메뉴 둘 다 가능 할 듯 ( -list 선택자로  / filter선택자로)
				$('.heading .menuName').html(" 관리");
				$('#stmt-Filter').val("전체 보기");
				$('.transInfo-list').css({"display":""});
				$("select option").prop("selected", false);
				
				
			}
			if(thisMenu == "msg-menu" || thisMenu == "qna-menu"){
				$('.msg-Filter').val("전체 보기");
				$('.msg-list').css({"display":""});
				
				if(thisMenu == "msg-menu"){
					$('.heading .menuName').html("쪽지함");
				}else if(thisMenu == "qna-menu"){
					$('.heading .menuName').html("이용 문의");
				}
			}			
			if(thisMenu == "bookmark-menu"){
				$('.heading .menuName').html("관심 작가");
			}
			if(thisMenu == "memberinfo-menu"){
				$('.heading .menuName').html("회원정보 수정");
				
				$('#checkUserPwd').val("");
				$("#checkUserPwd").focus();
				$('#pwdStatus').css({"display":"none"});
				
				$('#pwdResult').css({"display":"none"});
				$('#updateUserPwd1').val("");
				$('#updateUserPwd2').val("");
				checkPwd = false;

				$('#updateNickName').val('<%= loginUser.getNick_name() %>');
				$("#nickNameCheckBtn").text("사용가능");
				$('#nickNameCheckBtn').css({"background":"mediumseagreen", "color":"white"});
				$('#nnResult').css({"display":"none"});
				checkNick = true;
				
				$('#tel1').val('<%= tel1 %>');
				$('#tel2').val('<%= tel2 %>');
				$('#tel3').val('<%= tel3 %>');
				
				$('#email').val('<%= loginUser.getEmail() %>');

				//alert($('.memberInfoArea' + ' *').val());    해당 클래스의 하위 요소 초기화 시키기
			}
			if(thisMenu == "mywork-menu"){
				$('.heading .menuName').html("내 작품 관리");
			}
		};
	</script>
<!-- //페이지 호출 & 선택 탭 영역 보이기 스크립트 -->

<!-- * 1. 주문관리 탭 스크립트 -->
	<script>
	// 	* 구매 목록 필터링 - 전체 보기 / 구매 내역 / 판매 내역					***수정사항 : select요소 change 함수 통합 하기
	    $('#stmt-Filter').change(function(){    	
	    	var value = this.value;
	    	
	    	if(value == "판매 내역"){
	    		$('.buyer-list').css({"display":"none"});
	    		$('.seller-list').css({"display":""});
	    		
	    	}else if(value == "구매 내역"){
	    		$('.seller-list').css({"display":"none"});
	    		$('.buyer-list').css({"display":""});
	    		
	    	}else{
	    		$('.transInfo-list').css({"display":""});
	    	}
	    });
	    
	// 	* 명세표 모달 띄우기
	   	function stmtDisplayBlock(t){
			location.href = "<%= request.getContextPath() %>/selectTransOne.ts?orderNoo="+t;
		}
			
	// 	* 명세표 모달 닫기
		function stmtDisplayNone(){
			$('#stmtArea').css({"display":"none"});
	   		$('#stmtModalArea').css({"display":"none"});
			/* document.getElementById('stmtArea').style.display='none';
			document.getElementById('stmtModalArea').style.display='none'; */
		};
		function boardDetail(t){
			var name = t.getAttribute("name");
			console.log(name);
			
		}
		
	// 	* 컨펌 요청하기(작가입장)
		function confirmReq(oNo, actNo){
// 			이미지 전송하는거 메시지 서블릿에 연결하기 후에 컨펌 리퀘스트.ts 불러서 업데이트 되도록 만들기

			$.ajax({
				url : "<%= request.getContextPath() %>/confirmReq.ts",
				type : "post",
				data : { wrtActNo:actNo, wrtONo:oNo },
				success : function(data){
					
				}
			});
		};
		
	// 	* 컨펌 체크하기(구매자 입장)
		function confirmCheck(oNo, actNo){
// 			이미지 전송하는거 메시지 서블릿에 연결하기 후에 컨펌 리퀘스트.ts 불러서 업데이트 되도록 만들기

			$.ajax({
				url : "<%= request.getContextPath() %>/confirmCheck.ts",
				type : "post",
				data : { cusONo:oNo, cusActNo:actNo },
				success : function(data){
					if(data != null){
						var cusOdEndDate = data;
						
						alert(cusOdEndDate);
						
						
					}
					
				}
			});
		};
		
	// 	* 주문번호로 쪽지 리스트 호출
		function selectThisMsg(oNo){

			alert("여기 와? : " + oNo);
			alert("여기 와? : " + actNo);

			$.ajax({
				url : "<%= request.getContextPath() %>/selectThisMsg.ts",
				type : "post",
				data : { oNo:oNo },
				success : function(data){
					
					
				}
			});
		};
	</script>
<!-- //1. 주문관리 탭 스크립트 -->

<!-- * 2. 쪽지함 / 이용문의 탭 스크립트 -->	
	<script>
	// 	* 쪽지 목록 필터링 - 전체 보기 / 보낸 쪽지 / 받은 쪽지
	    $('.msg-Filter').change(function(){    	
	    	var value = this.value;
	    	
	    	if(value == "보낸 쪽지"){
	    		$('.rec-list').css({"display":"none"});
	    		$('.send-list').css({"display":""});
	    		
	    	}else if(value == "받은 쪽지"){
	    		$('.send-list').css({"display":"none"});
	    		$('.rec-list').css({"display":""});
	    		
	    	}else{
	    		$('.msg-list').css({"display":""});
	    	}
	    	
	    }); 
	    
	    function showSendMsgForm(){
	    	$('.msg-menu-list').css({"display":"none"});
	    	$('.msg-send-Form').css({"display":"block"});
	    };
	</script>
<!-- //2. 쪽지함 탭 스크립트 -->

<!-- * 4. 회원정보 수정 탭 스크립트 -->
	<script>
	//	* 회원정보 수정 정보 저장 가능(정보 입력/변경)여부 판단 함수
	 	var checkPwd = false;
		var checkNick = false;
		var checkPhone = true;
		var checkEmail = true;

		function updateMember(){
			var updateUserPwd1 = $('#updateUserPwd1').val();
			var updateUserPwd2 = $('#updateUserPwd2').val();
 			if(updateUserPwd1 == "" || updateUserPwd2 == ""){
				$('#pwdResult').css({"color":"orangered"});
				$('#pwdResult').css({"display":""});
 				$("#pwdResult").text("패스워드를 입력하세요.");
 				if(updateUserPwd2 == ""){
 					$("#updateUserPwd2").focus();
 				}
 				if(updateUserPwd1 == ""){
 					$("#updateUserPwd1").focus();
 				}
				return false;
			}

 			var updateNickName = $('#updateNickName').val();
 			if(updateNickName == ""){
				$('#nnResult').text("닉네임을 입력하세요.");
				$('#nnResult').css({"color":"orangered"});
				$('#nnResult').css({"display":""});
				$("#updateNickName").focus();
				return false;
 			}
 			var nickNameCheckBtn = $('#nickNameCheckBtn').text();
			var nickNameResult = $('#nnResult').text();
 			if(nickNameCheckBtn == "중복확인" && nickNameResult == ""){
				$('#nnResult').text("닉네임 중복확인 버튼을 체크하세요.");
				$('#nnResult').css({"color":"orangered"});
				$('#nnResult').css({"display":""});
				return false;
			}
 			
 			if(<%= loginUser.getWriter_right() %> >= 1){ 				
	 			var tel1 = $('#tel1').val();
	 			var tel2 = $('#tel2').val();
	 			var tel3 = $('#tel3').val();
	 			var email = $('#email').val();
	 			if(tel1 == "" || tel2 == "" || tel3 == "" || tel1 == "null" || tel2 == "null" || tel3 == "null"){
	 				checkPhone = false;
	 				alert("회원 정보를 모두 입력해주세요.");
	 				$("#tel1").focus();
	 			} else{
	 				checkPhone = true;
	 			}
	 			if(email == "" || email == "null"){
	 				checkEmail = false;
	 				alert("회원 정보를 모두 입력해주세요.");
	 				$("#email").focus();
	 			} else{
	 				checkEmail = true;
	 			}
 			}
			
			if(checkPwd == false){
				return false;
			}
			if(checkNick == false){
				return false;
			}
			if(checkPhone == false){
				return false;
			}
			if(checkEmail == false){
				return false;
			}
			
			return true;
		};
		
	// 	* 회원 인증 패스워드 확인창
		function pwdCheck(){
			var userPwd = $('#checkUserPwd').val();
			if(userPwd != null && userPwd != ""){
				$.ajax({
					url : "<%= request.getContextPath() %>/pwdCheck.me",
					type : "post",
					data : {userPwd : userPwd},
					success : function(data){
						if(data > 0){
							$('#pwdCheckArea').css({"display":"none"});
							$('.memberInfoArea').css({"display":"block"});
							$("#updateUserPwd1").focus();
						}else{
							$('#pwdStatus').css({"display":""});
							$('#pwdStatus').css({"color":"orangered"});
							$("#checkUserPwd").focus();
						}
					}
				});
			}
		};
		
	// 	* 패스워드 pwd1, pwd2 일치 여부 확인
		function comparePwd(){
			var updateUserPwd1 = $('#updateUserPwd1').val();
			var updateUserPwd2 = $('#updateUserPwd2').val();
			if(updateUserPwd1 != "" && updateUserPwd2 != ""){
				if(updateUserPwd1 != updateUserPwd2){
					$('#pwdResult').css({"color":"orangered"});
					$('#pwdResult').css({"display":""});
	 				$("#pwdResult").text("패스워드가 일치하지 않습니다.");
	 				$("#updateUserPwd1").focus();
					
					checkPwd = false;			
				}else{
					$('#pwdResult').css({"display":"none"});
					
					checkPwd = true;
				}
			}else if(updateUserPwd1 == "" || updateUserPwd2 == ""){
 				checkPwd = false;
			}
		};
		
	// 	* 닉네임 변경 여부 / 중복 체크	
		function nickNameChangeCheck(){
		// 	* 기존 닉네임과 같은지 비교	
			if($('#updateNickName').val() != "<%= loginUser.getNick_name() %>"){
				$("#nickNameCheckBtn").text("중복확인");
				$('#nickNameCheckBtn').css({"background":"", "color":""});
				$('#nnResult').text("");
				
				checkNick = false;
			}else{
				$("#nickNameCheckBtn").text("사용가능");
				$('#nickNameCheckBtn').css({"background":"mediumseagreen", "color":"white"});
				$('#nnResult').text("현재 사용중인 닉네임입니다.");
				$('#nnResult').css({"color":"green"});
				$('#nnResult').css({"display":""});
				
				checkNick = true;
			}
		};
		function nickNameUniqueCheck(){
		// 	* 닉네임 중복 체크		
			var nickName = $('#updateNickName').val();
			if(nickName != null && nickName != "" && $("#nickNameCheckBtn").text() == "중복확인"){
				$.ajax({
					url : "<%= request.getContextPath() %>/nickNameCheck.me",
					type : "post",
					data : {nickName : nickName},
					success : function(data){
						if(data > 0){
							$("#nickNameCheckBtn").text("중복확인");
							$('#nickNameCheckBtn').css({"background":"", "color":""});
							$('#nnResult').text("이미 사용중인 닉네임입니다.");
							$('#nnResult').css({"color":"orangered"});
							$('#nnResult').css({"display":""});
							$("#updateNickName").focus();
							
							checkNick = false;
						}else{
							$("#nickNameCheckBtn").text("사용가능");
							$('#nickNameCheckBtn').css({"background":"mediumseagreen", "color":"white"});
							$('#nnResult').text("사용 가능한 닉네임입니다.");
							$('#nnResult').css({"color":"green"});
							$('#nnResult').css({"display":""});
							
							checkNick = true;
						}
					}
				});
			} 
		};
		
	// 	* 회원 탈퇴 신청(행 삭제 x -> 탈퇴상태를 0->1로 변경)
		function deleteMemberRequest(){
			var pwdCheck = prompt("패스워드 확인", "");
			
			var userPwd = pwdCheck;
			if(userPwd != null && userPwd != ""){
				$.ajax({
					url : "<%= request.getContextPath() %>/pwdCheck.me",
					type : "post",
					data : {userPwd : userPwd},
					success : function(data){
						if(data > 0){
							$('.heading .memberinfo-menu').html("회원 탈퇴 신청");
							$('.memberInfoArea').css({"display":"none"});
							$(".deleteMemberNotice").css({"display":"block"});
							
							$("#memberinfo-menu").click(function(){								
								location.href="/artBridge/views/myPage/myPageForm.jsp?pageName=memberinfo-menu";
							});
						}else{
							alert("패스워드가 일치하지 않습니다.");
						}
					}
				});
			
				$(".delMemChk").click(function(){
				// 	* 탈퇴 안내문에서 탈퇴/취소 버튼 선택에 따라 처리
            		var result = $(this).val();
            		
            		if(result == "회원 탈퇴"){
            			var agreeCheck = $("#agree").prop("checked");
            			if(agreeCheck == true){	
            				var checkAgain = confirm("탈퇴처리를 진행합니다.");
            				if(checkAgain == false){
								location.href="/artBridge/views/myPage/myPageForm.jsp?pageName=memberinfo-menu";            					
            				}
							$.ajax({
								/* 미완료 거래 이력 있는지 체크 후 있으면 탈퇴 불가/없으면 탈퇴 상태로 변경 후 로그아웃 */
								url : "'<%= request.getContextPath() %>'/memberDelCheck.me",
								type : "post",
								success : function(data){
									if(data > 0){
										alert("아직 작업이 완료되지 않은 거래 이력이 존재합니다.\n프로젝트가 완료 된 후에 탈퇴가 가능합니다.");
										location.href="/artBridge/views/myPage/myPageForm.jsp?pageName=memberinfo-menu";
									}else{
										location.href="/artBridge/views/main/main.jsp";
									}
								}
							});
                		}else{
                			alert('약관동의에 체크 해주세요.');
                			return false;
                		}
					}else{
						/* 회원탈퇴 안내문에서 취소 눌렀을 때 */
						location.href="/artBridge/views/myPage/myPageForm.jsp?pageName=memberinfo-menu";
					}
				});
			}
		};
		
		// 	* 작가신청 양식 모달 띄우기
	   	function reqWriterDisplayBlock(){
	   		$('#reqWriterModal').css({"display":"block"});
	   		$('#reqWriterFormArea').css({"display":"block"});
	  	};							
	// 	* 작가신청 양식 모달 닫기
		function reqWriterDisplayNone(){
			insertImgCnt1 = 0;	//사진 올린 갯수 카운트 리셋
			insertImgCnt2 = 0;
			insertImgCnt3 = 0;
			insertImgTotalCnt = 0;
			$('.form-table img').attr('src', '/artBridge/image/common/no_thumb.jpg');
			$('#reqWriterFormArea').css({"display":"none"});
	   		$('#reqWriterModal').css({"display":"none"});
		};
		
	// 	* 작가신청 양식 모달 - 사진 삽입 테이블	
		var insertImgCnt1 = 0;
		var insertImgCnt2 = 0;
		var insertImgCnt3 = 0;
		var insertImgTotalCnt = 0;

		function readURL(input){
			var type = $(input).attr('id');
			
	        if (input.files && input.files[0]) {
	        	alert(input.files);
	        	alert(input.files[0]);
	          var reader = new FileReader();
	          reader.onload = function(e) {
	            if(type == 'file-btn1'){
	                $('.img1').attr('src', e.target.result);
	                insertImgCnt1 = 1;
	            }else if(type == 'file-btn2'){
	                $('.img2').attr('src', e.target.result);
	                insertImgCnt2 = 1;
	            }else if(type == 'file-btn3'){
	                $('.img3').attr('src', e.target.result);
	                insertImgCnt3 = 1;
	            }
		        insertImgTotalCnt = insertImgCnt1 + insertImgCnt2 + insertImgCnt3;
	          }
	          reader.readAsDataURL(input.files[0]);
	          alert(reader.readAsDataURL(input.files[0]));
	        }
		};
		
	//	* 작가신청 양식 전송 버튼 함수 (정보 입력/변경)여부 판단
	 	var checkBank = false;
		var checkAccount = false;
		/* var checkImgType1 = false;
		var checkImgType2 = false;
		var checkImgType3 = false; */
		var checkImgTotalCnt = false;
		
		function reqWriterRight(){			
			var userBank = $('#userBank').val();
			var userAccount = $('#userAccount').val();
			if(userBank == ""){
				checkBank = false;
			}else{
				checkBank = true;
			}
			if(userAccount == ""){
				checkAccount = false;
			}else{
				checkAccount = true;
			}
			if(userBank == "" || userAccount == ""){
				alert("입금 받을 은행 정보를 입력하세요.");
				return false;
			}
			
			if(checkBank == false){
				return false;
			}
			if(checkAccount == false){
				return false;
			}
			/* if(checkImgType1 == false){
				return false;
			}
			if(checkImgType2 == false){
				return false;
			}
			if(checkImgType3 == false){
				return false;
			} */
			if(insertImgTotalCnt < 3){
				alert(insertImgTotalCnt);
				alert("이미지 파일 세 개 모두 첨부 해주세요.");
				checkImgTotalCnt = false;
				return false;
			}else{
				alert(insertImgTotalCnt);
				checkImgTotalCnt = true;
			}
			
			var submit = confirm("신청 양식을 제출 하시겠습니까?");
			 if(submit == true){
		<%--	alert("submit 트루니?");
				$("#callReqWriterRightServlet").attr("action", "<%= request.getContextPath() %>/reqWriterRight.me");
				$.ajax({
					url : "<%= request.getContextPath() %>/reqWriterRight.me",
					type : "post",
					success : function(data){
						alert("데이터? : " + data);
						if(data >= 4){
							alert("넘어온 데이터 : " + data);
							alert("작가 신청 양식이 정상적으로 전송 되었습니다.");
							reqWriterDisplayNone();
							$('#reqWriterBtn').attr('disabled', false);
							
							/* location.href="/artBridge/views/myPage/myPageForm.jsp?pageName=memberinfo-menu"; */
						}else{
							alert(data);
							alert("작가 신청 양식 전송이 실패 하였습니다.");
							location.href="/artBridge/views/myPage/myPageForm.jsp?pageName=memberinfo-menu";
						}
					},
					error:function(request,status,error){
			        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			        }
				});
				alert("에이작스 뒤에 링크 가야되는딩"); --%>
				
				return true;
			}else{
				return false;
			}
// 			return true;
//  			location.href="/artBridge/views/myPage/myPageForm.jsp?pageName=memberinfo-menu";
		};
	</script>
<!-- //4. 회원정보 수정 탭 스크립트 -->


</body>
</html>
