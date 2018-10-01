<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.comvision.artBridge.transaction.model.vo.Transaction,
				 com.comvision.artBridge.board.model.vo.*, com.comvision.artBridge.files.model.vo.*,
				 com.comvision.artBridge.sale.model.vo.*, com.comvision.artBridge.message.model.vo.Message" %>  
 
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
/*  .seller-list .buyer-list{ padding-top:5px; background-clip: content-box; !important; } */

/*  명세표 팝업 */
	.stmtModal-Area-Style{ position:absolute; width:600px; background:white; padding-bottom:50px; left:50%; margin-left:-300px; }
	.stmt-title{ text-align:right; font-weight:bold; }
	.stmtBtn button{ width:32%; height:30px; line-height:0; margin-bottom:10px; }
  	
/*  쪽지함 스타일 */
	.messenger{ font-weight: bold; line-height:2em; }
	
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

<% 
	ArrayList<Transaction> transList = null;
	/* if(session.getAttribute("transList") != null){
		transList = (ArrayList<Transaction>)request.getAttribute("transList");
	} */
	if(request.getAttribute("transList")!= null){
		transList = (ArrayList<Transaction>)request.getAttribute("transList");
	}
	/* Transaction t = null;
	if(request.getAttribute("t") != null){
		t = (Transaction)request.getAttribute("t");
	} */
	
	PageInfo pi = null;
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
				<li><a href="<%= request.getContextPath() %>/selectTransListlhm.ts" onclick="anotherHidden(this.id);" id="order-menu">주문관리</a></li>
				<li><a href="#" onclick="anotherHidden(this.id);" id="msg-menu">쪽지함</a></li>
				<li><a href="#" onclick="anotherHidden(this.id);" id="bookmark-menu">관심작가</a></li>
				<li><a href="#" onclick="anotherHidden(this.id);" id="memberinfo-menu">회원정보수정</a></li>
<%-- 				<% if(loginUser.getWriter_right() == 1){ %> --%>
				<li><a href="#" onclick="anotherHidden(this.id);" id="mywork-menu"">내작품관리</a></li>
<%-- 				<% } %> --%>
				<li><a href="#" onclick="anotherHidden(this.id);" id="qna-menu">이용문의</a></li>
			</ul>
		</div>
		</section>
<!-- 	//마이페이지 탭 메뉴 -->

		<!-- 주석 영역 -->
<!-- 	* 마이페이지 탭 영역 -->	
		<div class="contents"><!-- contents 필수 사용 -->

<!--      	* 1-1. 마이페이지 탭 바디 - 주문관리 탭 / 구매목록 - 명세표 모달 창 -->
<%-- <%if(t!=null){ %>
			<form action="" method="post">
				<div id="stmtModalArea" class="w3-modal" onclick="stmtDisplayNone();"></div>
				<div id="stmtArea" class="settingArea">
					<!-- 모달 요소 넣기 -->
					<div class=stmtModal-Area-Style align="center">
						<h3>명 &nbsp; 세 &nbsp; 서</h3>
						<table class="form-table">
							<tr>
								<td width="15px"></td>
								<td width="90px" class="stmt-title">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목  : </td>
								<td colspan="3"></td>
							</tr>
							<tr>
								<td></td>
								<td class="stmt-title">신 청 일  : </td>
								<td colspan="3"><%= t.getO_date() %></td>
							</tr>
							<tr>
								<td></td>
								<td class="stmt-title">구 매 자  : </td>
								<td width="230px"><%= t.getCusId() %></td>
								<td width="80px" class="stmt-title">판 매 자  : </td>
								<td width="150px"><%= t.getWrtNick() %></td>
							</tr>
							<tr>
								<td></td>
								<td class="stmt-title">옵 션 명  : </td>
								<td colspan="3">인물화</td>
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
									<tr height="23px">
										<td align="center">1</td>
										<td style="font-size:12px; padding-left:10px;">제가 보내드리는 사진을 배경으로 만들어주세요~</td>
										<td align="right">작가기입 원</td>
									</tr>
									<tr>
										<td align="center">2</td>
										<td style="font-size:12px; padding-left:10px;">제가 보내드리는 사진을 배경으로 만들어주세요~ 귀염뽀짝하게 해주시면 더 좋아요~!</td>
										<td align="right">45,454원</td>
									</tr>
								</table>
								<br>
								<table align="right">
									<tr >
										<td>총   금 액  :  </td>
										<td><label>123,456원</label></td>
									</tr>
								</table>
							</td>
							</tr>
							<tr>
								<td colspan="5">
									<div class="btn-center stmtBtn">
										  <button class="btn btn-primary btn-lg btn-plus-design" style="width:67%;">거 래 수 락</button><br>
					                      <button class="btn btn-primary btn-lg btn-plus-design" style="margin-left:0;">재 요청</button>
					                      <button class="btn btn-default btn-lg btn-plus-design">거래 취소</button>
					                </div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</form>
			<%}else{ %>
				<form action="" method="post">
				<div id="stmtModalArea" class="w3-modal" onclick="stmtDisplayNone();"></div>
				<div id="stmtArea" class="settingArea">
					<!-- 모달 요소 넣기 -->
					<div class=stmtModal-Area-Style align="center">
						<h3>명 &nbsp; 세 &nbsp; 서</h3>
						<table class="form-table">
							<tr>
								<td width="15px"></td>
								<td width="90px" class="stmt-title">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목  : </td>
								<td colspan="3"></td>
							</tr>
							<tr>
								<td></td>
								<td class="stmt-title">신 청 일  : </td>
								<td colspan="3"></td>
							</tr>
							<tr>
								<td></td>
								<td class="stmt-title">구 매 자  : </td>
								<td width="230px"></td>
								<td width="80px" class="stmt-title">판 매 자  : </td>
								<td width="150px"></td>
							</tr>
							<tr>
								<td></td>
								<td class="stmt-title">옵 션 명  : </td>
								<td colspan="3">인물화</td>
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
									<tr height="23px">
										<td align="center">1</td>
										<td style="font-size:12px; padding-left:10px;">제가 보내드리는 사진을 배경으로 만들어주세요~</td>
										<td align="right">작가기입 원</td>
									</tr>
									<tr>
										<td align="center">2</td>
										<td style="font-size:12px; padding-left:10px;">제가 보내드리는 사진을 배경으로 만들어주세요~ 귀염뽀짝하게 해주시면 더 좋아요~!</td>
										<td align="right">45,454원</td>
									</tr>
								</table>
								<br>
								<table align="right">
									<tr >
										<td>총   금 액  :  </td>
										<td><label>123,456원</label></td>
									</tr>
								</table>
							</td>
							</tr>
							<tr>
								<td colspan="5">
									<div class="btn-center stmtBtn">
										  <button class="btn btn-primary btn-lg btn-plus-design" style="width:67%;">거 래 수 락</button><br>
					                      <button class="btn btn-primary btn-lg btn-plus-design" style="margin-left:0;">재 요청</button>
					                      <button class="btn btn-default btn-lg btn-plus-design">거래 취소</button>
					                </div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</form>
			<%} %> --%>
<!--      	//1-1. 마이페이지 탭 바디 - 주문관리 탭 / 구매목록 - 명세표 모달 창 -->


<!-- 	* 마이페이지 탭 제목/바디 영역 -->
		<div class="container">		<!-- container 필수 사용 -->
		<div class="col-md-12">
				
				
<!-- 	   	* 마이페이지 탭 제목 -->
			<div class="heading">
				<h2 class="menuName tit1"></h2>
			</div>	<hr>
<!-- 	   	//마이페이지 탭 제목 -->
					
<!--        * 1. 마이페이지 탭 메뉴 - 주문관리 탭 -->
			<form action="" method="get"class="order-menu tab-menu-content-form">
				<div class="order-menu">	<!-- ***수정사항 : 구매자(buyer) 판매자(seller) 입장에 따른 필터링, 행 색 속성, DB처리 등  -->
					<select id="stmt-Filter" class="form-control input-xshort selectBox">
						<option>전체 보기</option>
						<option>구매 내역</option>
						<option>판매 내역</option>
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
								<th scope="col">거래번호<br>(주문번호)</th>	<!-- ***수정사항 : 명세표 보기 -->
								<th scope="col">거래자</th>
								<th scope="col">게시글 제목</th>				<!-- ***수정사항 : 게시글로 링크 걸기 -->
								<th scope="col">진행 현황</th>
								<th scope="col">문의<br>확인</th>
								<th scope="col">작업 시작일</th>
								<th scope="col">작업 완료(예정)일</th>
							</tr>
						</thead>
						
						<tbody>
							
							<% if(transList != null){for(Transaction ts : transList){ 
							  if(ts.getDivRole_no() == 0){ %>	 
								<tr id="" class="seller-list transInfo-list">
									<td>판매</td>
									<td><a onclick="stmtDisplayBlock(this.text);" id="orderNo" class="btn"><%= ts.getOrders_no() %></a></td>
									<td><%= ts.getCusId() %></td>
									<td class="txt-fl"><a onclick ="boardDetail(this)" name = "<%=ts.getBoard_no() %>"><input type="hidden" value = "<%=ts.getBoard_no() %>" /><%= ts.getBoard_title() %></a></td>
									<td><%= ts.getPay_status() %></td>
									<td><img src='/artBridge/image/common/mypage/msg.png'></td>
									<td><%= ts.getOd_startDate() %></td>
									<td><%= ts.getOd_endDate() %></td>
								</tr>
							  <% } else{ %>
								<tr id="" class="buyer-list transInfo-list">
									<td>구매</td>
									<td><a onclick="stmtDisplayBlock(this.text);" id="orderNo" class="btn"><%= ts.getOrders_no() %></a></td>
									<td><%= ts.getWrtNick() %></td>
									<td class="txt-fl"><a onclick ="boardDetail(this)" name = "<%=ts.getBoard_no() %>"><%= ts.getBoard_title() %></a></td>
									<td><%= ts.getPay_status() %></td>
									<td><img src='/artBridge/image/common/mypage/msg.png'></td>
									<td><%= ts.getOd_startDate() %></td>
									<td><%= ts.getOd_endDate() %></td>
								</tr>
							  <% } %>
							<% }} %>
							
						</tbody>
					</table>
	
	<!-- 			페이징 처리하기 -->
					<!-- <br>
					<hr>
					<br>
	
					<h3>페이징 스타일</h3>
					<div class="paginate">
						<a href="#" class="btn-first" title="처음"><em class="blind">목록에서
								처음 페이지 이동</em></a> <a href="#" class="btn-prev" title="이전"><em
							class="blind">목록에서 이전 페이지 이동</em></a> <span class="paging-numbers">
							<a href="#">1<span class="blind">페이지로 이동</span></a> <a href="#"
							class="on">2<span class="blind">페이지로 이동</span></a> <a href="#">3<span
								class="blind">페이지로 이동</span></a> <a href="#">4<span
								class="blind">페이지로 이동</span></a> <a href="#">5<span
								class="blind">페이지로 이동</span></a>
						</span> <a href="#" class="btn-next" title="다음"><span class="spr"><em
								class="blind">목록에서 다음 페이지 이동</em></span></a> <a href="#" class="btn-last"
							title="끝"><span class="spr"><em class="blind">목록에서
									끝 페이지 이동</em></span></a>
					</div>
					                    <!-- 페이징 영역 -->
                    <div class="paginate">
						<a onclick="location.href='<%= request.getContextPath() %>/selectTransList.ts?currentPage=1'" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a> 
						<% if(currentPage <=1){ %>
							<a disabled class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a> 
						<% }else{ %>
							<a onclick = "location.href='<%= request.getContextPath() %>/selectTransList.ts?currentPage=<%=currentPage -1%>'" class="btn-prev" title="이전">
							<em class="blind">목록에서 이전 페이지 이동</em></a>
						<% } %>
						<span class="paging-numbers">
							<% for(int p = startPage; p <= endPage; p++){
								if(p == currentPage){ %>
									<a disabled class="on"><%= p %><span class="blind">페이지로 이동</span></a>
								<% }else{ %>
									<a onclick= "location.href='<%= request.getContextPath() %>/selectTransList.ts?currentPage=<%= p %>'"><%= p %><span class="blind">페이지로 이동</span></a>
								<% } %>
							<% } %>
						</span>
						<% if(currentPage >= maxPage){ %>
							<a disabled class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<% }else{ %>
							<a onclick = "location.href = '<%= request.getContextPath() %>/selectTransList.ts?currentPage=<%= currentPage +1 %>'" class="btn-next" title="다음">
							<span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<% } %>
						
						<a onclick = "location.href = '<%= request.getContextPath() %>/selectTransList.ts?currentPage=<%= maxPage %>'" class="btn-last" title="끝">
						<span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
					</div>
                   <!-- // 페이징 영역 -->

				<br><br><br><br>
				</div>
			</form>
<!-- 		//1. 마이페이지 탭 메뉴 - 주문관리 탭 -->


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


<!-- ** 마이페이지 호출 & 선택 탭 영역 보이기 스크립트 -->
	<script>
	//	* 페이지 호출
		$(function(){
// 			select orders_no from orders where member_no = ? or writer_no = ?
			var pageName = '<%= (String)request.getParameter("pageName") %>';
<%-- 			location.href="<%= request.getContextPath() %>/selectTransList.ts"; --%>

			$('.order-menu, .bookmark-menu, .msg-menu, .memberinfo-menu, .mywork-menu, .qna-menu').css({"display":"none"});
			
			if(pageName != null){
				anotherHidden(pageName)
			} else{
				anotherHidden('order-menu');			
				/* $('.order-menu').css({"display":"block"});
				$('#order-menu').css({"color":"black", "background":"white"}); */
			}
		});
	            		  
	//	* 탭 선택 함수
		function anotherHidden(thisMenu){	
			//var thisMenu = event.srcElement.id;
			
			var servletUrl;
			switch(thisMenu){
			case 'order-menu' : servletUrl = "<%= request.getContextPath() %>/selectTransListlhm.ts"
			}
			$.ajax({
					url : servletUrl,
					type : "post",
					success : function(data){
						
					}
				}
			});
			
	 
			$('.order-menu, .msg-menu, .bookmark-menu, .memberinfo-menu, .mywork-menu, .qna-menu').css({"display":"none"});
			$('.' + thisMenu).css({"display":"block"});
	
			$(':not(#' + thisMenu + ')').css({"color":"", "background":""});
			$('#mywork-menu').css({"color":"white", "background":"#FF7373"});
			$('#qna-menu').css({"color":"white", "background":"rgb(52, 70, 209)"});
		
			$('#' + thisMenu).css({"color":"black", "background":"white"});
			
			if(thisMenu == "order-menu"){			//오더메뉴, 메시지 메뉴 둘 다 가능 할 듯 ( -list 선택자로  / filter선택자로)
				$('.heading .menuName').html("주문 관리");
				$('#stmt-Filter').val("전체 보기");
				$('.transInfo-list').css({"display":""});
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
		}
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
	   		
	   		<%-- //var orderNoo = $('#orderNo').val();
	   		var orderNoo = t
	   		console.log(orderNoo);
			if(orderNoo != null && orderNoo != ""){
				$.ajax({
					url : "<%= request.getContextPath() %>/selectTransOne.ts",
					type : "post",
					data : {orderNoo : orderNoo},
					success : function(data){
						
				   		$('#stmtModalArea').css({"display":"block"});
				   		$('#stmtArea').css({"display":"block"});
						
					},
					error:function(request,status,error){
			        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			        }
				});
			} --%>
			location.href = "<%= request.getContextPath() %>/selectTransOne.ts?orderNoo="+t;
	  	};							
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
	</script>
<!-- //1. 주문관리 탭 스크립트 -->

</body>
</html>