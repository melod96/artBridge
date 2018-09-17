<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>  
 
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
/*	통합 요소 스타일 */
	.tab-menu-content-form { padding-top:15px; }
   	.selectBox { float:right; margin-bottom:20px; }
   	
   	.btn-outer-style { float:right; padding-bottom:60px; } 
   	.btn-plus-design{ padding:2px 20px; font-size: 15px; margin-left: 0px; }
   	.btn-cancel{ background:#DBDBDB; }
  	.btn-cancel:hover{ background: #808080; color:white; }
    	
/*  구입목록 */
    .stmtShowBtn{ cursor:pointer; } 	
    .seller-list{ background-color:rgba(255, 117, 223, 0.2); }
    .buyer-list{ background:rgba(117, 230, 255 , 0.2); }
/*  .seller-list .buyer-list{ padding-top:5px; background-clip: content-box; !important; } */
    	
/*  명세표 팝업 */
   	.settingArea { z-index:300; position: absolute; top:0px; display:none; width:100%;
      				/* padding-left:auto; padding-right:auto; text-align:center; */ 	}
	.stmt-List{ position:absolute; width:600px; background:white; top:100px; padding-bottom:40px;
				left:50%; margin-left:-300px; }
	.stmt-title{ text-align:right; font-weight:bold; }
	.stmtBtn button{ width:32%; height:30px; line-height:0; margin-bottom:10px; }
	.stmt-table td{ padding:5px; }
  		
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
	#memberInfo td { text-align:left; height:45px; padding-left:20px; font-weight: bold; }
	#memberInfo{ margin-left:50px; }
				
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

<% /* 4. 회원정보 수정 변수 코드 */
	String phone = ((Member)(session.getAttribute("loginUser"))).getPhone();
	String tel1 = "";
	String tel2 = "";
	String tel3 = "";
	
	if(phone.length() > 10){
		tel1 = phone.substring(0, 3);
		tel2 = phone.substring(3, 7);
		tel3 = phone.substring(7, 11);
	}else{
		tel1 = phone.substring(0, 3);
		tel2 = phone.substring(3, 6);
		tel3 = phone.substring(6, 10);
	}
	
	String pwd = ((Member)(session.getAttribute("loginUser"))).getPassword();
	
%>

        <!-- 주석 영역 -->
        
<!-- 	* 마이페이지 탭 메뉴 -->
		<section class="tit-area bg-yellow">	<!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->	
		<div class="container">
			<h2>마이 페이지</h2>
			<ul class="tab-menu">
				<li><a href="#" onclick="anotherHidden('order-menu')" id="order-menu">주문관리</a></li>
				<li><a href="#" onclick="anotherHidden('msg-menu')" id="msg-menu">쪽지함</a></li>
				<li><a href="#" onclick="anotherHidden('bookmark-menu')" id="bookmark-menu">관심작가</a></li>
				<li><a href="#" onclick="anotherHidden('memberinfo-menu')" id="memberinfo-menu">회원정보수정</a></li>
				<li><a href="#" onclick="anotherHidden('mywork-menu')" id="mywork-menu" style="background:#FF7373;">내작품관리</a></li>
				<li><a href="#" onclick="anotherHidden('qna-menu')" id="qna-menu">이용문의</a></li>
			</ul>
		</div>
		</section>
<!-- 	//마이페이지 탭 메뉴 -->

		<!-- 주석 영역 -->
<!-- 	* 마이페이지 탭 영역 -->	
		<div class="contents"><!-- contents 필수 사용 -->

<!--      	* 1-1. 마이페이지 탭 바디 - 주문관리 탭 / 구매목록 - 명세표 모달 창 -->
			<form action="">
				<div id="settingBoardArea" class="w3-modal" onclick="displayNone();"></div>
				<div id="settingArea" class="settingArea">
					<!-- 모달 요소 넣기 -->
					<div class=stmt-List align="center">
						<h3 style="margin-top:40px; font-weight:bold;">명 &nbsp; 세 &nbsp; 서</h3> <br />
						<table class="stmt-table">
							<tr>
								<td width="15px"></td>
								<td width="90px" class="stmt-title">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목  : </td>
								<td colspan="3">귀여운 캐릭터 그려드려요</td>
							</tr>
							<tr>
								<td></td>
								<td class="stmt-title">신 청 일  : </td>
								<td colspan="3">2018-09-00</td>
							</tr>
							<tr>
								<td></td>
								<td class="stmt-title">구 매 자  : </td>
								<td width="230px">소나나</td>
								<td width="80px" class="stmt-title">판 매 자  : </td>
								<td width="150px">crala</td>
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
									<tr style="background:lightgray; !important; font-weight:bold;" height="25px">
										<td align="center" width="35px">No</td>
										<td align="center" width="380px">요 구 사 항</td>
										<td align="center" width="87px">금 액</td>
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
										  <button type="button" class="btn btn-primary btn-lg btn-plus-design" style="width:67%;">거 래 수 락</button><br>
					                      <button type="button" class="btn btn-primary btn-lg btn-plus-design" style="margin-left:0;">재 요청</button>
					                      <button type="button" class="btn btn-default btn-lg btn-plus-design">거래 취소</button>
					                </div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</form>
<!--      	//1-1. 마이페이지 탭 바디 - 주문관리 탭 / 구매목록 - 명세표 모달 창 -->


<!-- 	* 마이페이지 탭 제목/바디 영역 -->
		<div class="container">		<!-- container 필수 사용 -->
		<div class="col-md-12">
				
				
<!-- 	   	* 마이페이지 탭 제목 -->
			<div class="heading">
				<h2 class="order-menu tit1">주문 관리</h2>
				<h2 class="msg-menu tit1">쪽지함</h2>
				<h2 class="bookmark-menu tit1">관심 작가</h2>
				<h2 class="memberinfo-menu tit1">회원정보 수정</h2>
				<h2 class="mywork-menu tit1" style="text-color:#FF7373;">내 작품 관리</h2>	<!-- ***수정사항 : 작가 페이지 -->
				<h2 class="qna-menu tit1">이용문의</h2>
			</div>	<hr>
<!-- 	   	//마이페이지 탭 제목 -->
					
<!--        * 1. 마이페이지 탭 바디 - 주문관리 탭 -->
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
<%-- 						<% for(transInfo n : list){  --%>		<!-- ***수정사항 : 조건에 따라 항목 구분하기 -->
<%-- 								if(role.equals("seller"){ %> --%>
<!-- 						<tr id="" class="seller-list transInfo-list"> -->
<!-- 							<td>판매</td> -->
<%-- 								<% }else{ %> --%>
<!-- 						<tr id="buyer" class="buyer-list transInfo-list"> -->
<!-- 							<td>구매</td> -->
<%-- 								<% } %> --%>
<!-- 							<td><a onclick="displayBlock()" class="stmtShowBtn">18083001</a></td> -->
<!-- 							<td>소나나</td> -->
<!-- 							<td class="txt-fl"><a href="#">커미션은 소나나에게 맡겨주세요~!<br>귀여운 일러스트/캐릭터/방송화면/커미션</a></td> -->
<!-- 							<td>컨펌 1단계</td> -->
<!-- 							<td><img src='/artBridge/web/image/common/mypage/msg.png'></td> -->
<!-- 							<td>2018-00-00</td> -->
<!-- 							<td>2018-00-00</td> -->
<!-- 						</tr> -->
<%-- 						 <% } %>  --%>
							 	 
							<tr id="" class="seller-list transInfo-list">
								<td>판매</td>
								<td><a onclick="displayBlock()" class="stmtShowBtn">18083001</a></td>
								<td>소나나</td>
								<td class="txt-fl"><a href="#">커미션은 소나나에게 맡겨주세요~!<br>귀여운 일러스트/캐릭터/방송화면/커미션</a></td>
								<td>컨펌 1단계</td>
								<td><img src='/artBridge/image/common/mypage/msg.png'></td>
								<td>2018-00-00</td>
								<td>2018-00-00</td>
							</tr>
							<tr id="" class="buyer-list transInfo-list">
								<td>구매</td>
								<td><a onclick="displayBlock()" class="stmtShowBtn">18083001</a></td>
								<td>소나나</td>
								<td class="txt-fl"><a href="#">커미션은 소나나에게 맡겨주세요~!<br>귀여운 일러스트/캐릭터/방송화면/커미션</a></td>
								<td>컨펌 1단계</td>
								<td><img src='/artBridge/image/common/mypage/msg.png'></td>
								<td>2018-00-00</td>
								<td>2018-00-00</td>
							</tr>
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
	
					<br>
					<hr>
					<br> -->
				<br><br><br><br>
				</div>
			</form>
<!-- 		//1. 마이페이지 탭 메뉴 - 주문관리 탭 -->

<!-- 		* 2. 마이페이지 탭 메뉴 - 쪽지함 탭 -->
			<form action="" method="get"class="msg-menu tab-menu-content-form">
				<div class="msg-menu">
					<select id="msg-select" class="form-control input-xshort selectBox msg-Filter">
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
								<th scope="col"><input type="checkbox" name="checkAll" id="checkAllMsg"></th>
								<th scope="col">No</th>
								<th scope="col">수신<br>확인</th>
								<th scope="col">제목</th>
								<th scope="col" style="line-height:1.5em">보낸 사람<br>   / 날짜</th>
								<th scope="col" style="line-height:1.5em">받는 사람<br>   / 날짜</th>
							</tr>
						</thead>
						
						<tbody>
							<%-- <% if(보낸회원번호가 나와 같다면){ %>
							<tr id="" class="send-list msg-list">
							<% }else{ %>
							<tr id="" class="rec-list  msg-list">
							<% } %> --%>
							<tr id="" class="send-list msg-list">	<!-- ***수정사항 : 발신회원번호/수신회원번호 서블릿에서 받기 -->
								<td><input type="checkbox" name="checkMsg"></td>
								<td>1</td>
								<td><img src='/artBridge/image/common/mypage/msg.png'></td>
								<%-- <% if(메시지를 열어서 확인했다면 ){ %>
								<td><img src='/artBridge/image/common/mypage/openMsg.png'></td>
								<% }else{ %>  확인전이라면
								<td><img src='/artBridge/image/common/mypage/msg.png'></td>
								<% } %> --%>
								<td class="txt-fl"><a href="#">안녕하세요 문의하신 작품 예상 견적 가격입니다^^</a></td>
								<td><span class="messenger">나요</span><br>/  2018-00-00</td>
								<td><span class="messenger">뽀시</span><br>/  2018-00-00</td>
							</tr>
							<tr id="" class="rec-list  msg-list">
								<td><input type="checkbox" name="checkMsg"></td>
								<td>2</td>
								<td><img src='/artBridge/image/common/mypage/openMsg.png'></td>
								<%-- <% if(메시지를 열어서 확인했다면 ){ %>
								<td><img src='/artBridge/web/image/common/mypage/openMsg.png'></td>
								<% }else{ %>  확인전이라면
								<td><img src='/artBridge/web/image/common/mypage/msg.png'></td>
								<% } %> --%>
								<td class="txt-fl"><a href="#">안녕하세요 캐리커쳐 가능하신가요?</a></td>
								<td><span class="messenger">라기</span><br>/  2018-00-00</td>
								<td><span class="messenger">나요</span><br>/  2018-00-00</td>
							</tr>
							<tr id="" class="rec-list  msg-list">
								<td><input type="checkbox" name="checkMsg"></td>
								<td>3</td>
								<td><img src='/artBridge/image/common/mypage/openMsg.png'></td>
								<%-- <% if(메시지를 열어서 확인했다면 ){ %>
								<td><img src='/artBridge/web/image/common/mypage/openMsg.png'></td>
								<% }else{ %>  확인전이라면
								<td><img src='/artBridge/web/image/common/mypage/msg.png'></td>
								<% } %> --%>
								<td class="txt-fl"><a href="#">죄송하지만 인물작화는 하지 않습니다~</a></td>
								<td><span class="messenger">뽀시</span><br>/  2018-00-00</td>
								<td><span class="messenger">나요</span><br>/  2018-00-00</td>
							</tr>
							<tr id="" class="rec-list  msg-list">
								<td><input type="checkbox" name="checkMsg"></td>
								<td>4</td>
								<td><img src='/artBridge/image/common/mypage/msg.png'></td>
								<%-- <% if(메시지를 열어서 확인했다면 ){ %>
								<td><img src='/artBridge/web/image/common/mypage/openMsg.png'></td>
								<% }else{ %>  확인전이라면
								<td><img src='/artBridge/web/image/common/mypage/msg.png'></td>
								<% } %> --%>
								<td class="txt-fl"><a href="#">커미션 진행 하시나요~?</a></td>
								<td><span class="messenger">소나나</span><br>/  2018-00-00</td>
								<td><span class="messenger">나요</span><br>/  2018-00-00</td>
							</tr>
						</tbody>
					</table>
					
					<div class="btn-center btn-outer-style">
	                      <button type="button" class="btn btn-default btn-lg btn-cancel btn-plus-design">취소</button>
	                      <button type="submit" class="btn btn-primary btn-lg btn-del btn-plus-design">삭제</button>
	                </div>
	                    
				<br><br><br><br>	
				</div>
			</form>
<!-- 		//2. 마이페이지 탭 메뉴 - 쪽지함 탭 -->

<!--      		* 2-1. 마이페이지 탭 바디 - 쪽지함 탭 / 쪽지별 세부 화면 --> 				<!-- id를 msg-detail-view 로 만든 버튼에 연결 -->  
				<form action="" method="get"class="msg-detail-view tab-menu-content-form" style="display:none;">
					<div class="msg-detail-view">
						
					
					<br><br><br><br>
					</div>
				</form>			
<!--      		//2-1. 마이페이지 탭 바디 - 쪽지함 탭 / 쪽지별 세부 화면 -->

<!-- 		* 3. 마이페이지 탭 메뉴 - 관심작가 탭 -->    <!-- id를 bookmark-detail-view 로 만든 버튼에 연결       onclick="selfHidden()"  ,   "bookmarkDel()"  구현하기 -->
			<form action="" method="get"class="bookmark-menu tab-menu-content-form">
				<div class="bookmark-menu">
					<div id="bookmark-list-wrap" class="bookmark-menu bookmark-list-wrap">
						<div class="frofile-box bookmark-list" style="width:300px; padding:5px 15px 15px 15px;">
							<a onclick="bookmarkDel()" class="on bookmark-del-btn">★</a>
							<table style="margin-right:auto; margin-left:auto;">
								<tr>
									<td colspan="2" align="center" height="170px" style="padding-top:15px; padding-bottom:10px">
										<div class="img-in">
				                          <img src="/artBridge/image/common/img_profile.png" alt="default frofile image">
				                        </div>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:center;"><a onclick="selfHidden()" class="bookmark-detailView-btn">소나나</a></td>
								</tr>
								<tr>
									<td>
										<div class="state-area" style="margin-left:0px; padding-left:15px; padding-right:15px;">
					                        <ul>
					                          <li>작품리스트 <span>1개</span></li>
					                          <li>평점 
					                            <span>
					                              <p class="star_rating">		<!-- 별 갯수 평균으로 반영하기 -->
					                                <a href="#" class="on">★</a>
					                                <a href="#" class="on">★</a>
					                                <a href="#" class="on">★</a>
					                                <a href="#">★</a>
					                                <a href="#">★</a>
					                              </p> 0.0점</span>
					                          </li>
					                          <li>진행중인 의뢰 <span>0건</span></li>
					                          <li>슬롯 갯수 <span>0개</span></li>
					                        </ul>
					                    </div>
					                </td>
				                </tr>
				            </table>     
		                </div>
						<div class="frofile-box bookmark-list" style="width:300px; padding:5px 15px 15px 15px;">
							<a onclick="bookmarkDel()" class="on bookmark-del-btn">★</a>
							<table style="margin-right:auto; margin-left:auto;">
								<tr>
									<td colspan="2" align="center" height="170px" style="padding-top:15px; padding-bottom:10px">
										<div class="img-in">
				                          <img src="/artBridge/image/common/img_profile.png" alt="default frofile image">
				                        </div>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:center;"><a onclick="selfHidden()" class="bookmark-detailView-btn">소나나</a></td>
								</tr>
								<tr>
									<td>
										<div class="state-area" style="margin-left:0px; padding-left:15px; padding-right:15px;">
					                        <ul>
					                          <li>작품리스트 <span>1개</span></li>
					                          <li>평점 
					                            <span>
					                              <p class="star_rating">		<!-- 별 갯수 평균으로 반영하기 -->
					                                <a href="#" class="on">★</a>
					                                <a href="#" class="on">★</a>
					                                <a href="#" class="on">★</a>
					                                <a href="#">★</a>
					                                <a href="#">★</a>
					                              </p> 0.0점</span>
					                          </li>
					                          <li>진행중인 의뢰 <span>0건</span></li>
					                          <li>슬롯 갯수 <span>0개</span></li>
					                        </ul>
					                    </div>
					                </td>
				                </tr>
				            </table>     
		                </div>
						<div class="frofile-box bookmark-list" style="width:300px; padding:5px 15px 15px 15px;">
							<a onclick="bookmarkDel()" class="on bookmark-del-btn">★</a>
							<table style="margin-right:auto; margin-left:auto;">
								<tr>
									<td colspan="2" align="center" height="170px" style="padding-top:15px; padding-bottom:10px">
										<div class="img-in">
				                          <img src="/artBridge/image/common/img_profile.png" alt="default frofile image">
				                        </div>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:center;"><a onclick="selfHidden()" class="bookmark-detailView-btn">소나나</a></td>
								</tr>
								<tr>
									<td>
										<div class="state-area" style="margin-left:0px; padding-left:15px; padding-right:15px;">
					                        <ul>
					                          <li>작품리스트 <span>1개</span></li>
					                          <li>평점 
					                            <span>
					                              <p class="star_rating">		<!-- 별 갯수 평균으로 반영하기 -->
					                                <a href="#" class="on">★</a>
					                                <a href="#" class="on">★</a>
					                                <a href="#" class="on">★</a>
					                                <a href="#">★</a>
					                                <a href="#">★</a>
					                              </p> 0.0점</span>
					                          </li>
					                          <li>진행중인 의뢰 <span>0건</span></li>
					                          <li>슬롯 갯수 <span>0개</span></li>
					                        </ul>
					                    </div>
					                </td>
				                </tr>
				            </table>     
		                </div>
						<div class="frofile-box bookmark-list" style="width:300px; padding:5px 15px 15px 15px;">
							<a onclick="bookmarkDel()" class="on bookmark-del-btn">★</a>
							<table style="margin-right:auto; margin-left:auto;">
								<tr>
									<td colspan="2" align="center" height="170px" style="padding-top:15px; padding-bottom:10px">
										<div class="img-in">
				                          <img src="/artBridge/image/common/img_profile.png" alt="default frofile image">
				                        </div>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:center;"><a onclick="selfHidden()" class="bookmark-detailView-btn">소나나</a></td>
								</tr>
								<tr>
									<td>
										<div class="state-area" style="margin-left:0px; padding-left:15px; padding-right:15px;">
					                        <ul>
					                          <li>작품리스트 <span>1개</span></li>
					                          <li>평점 
					                            <span>
					                              <p class="star_rating">		<!-- 별 갯수 평균으로 반영하기 -->
					                                <a href="#" class="on">★</a>
					                                <a href="#" class="on">★</a>
					                                <a href="#" class="on">★</a>
					                                <a href="#">★</a>
					                                <a href="#">★</a>
					                              </p> 0.0점</span>
					                          </li>
					                          <li>진행중인 의뢰 <span>0건</span></li>
					                          <li>슬롯 갯수 <span>0개</span></li>
					                        </ul>
					                    </div>
					                </td>
				                </tr>
				            </table>     
		                </div>
						<div class="frofile-box bookmark-list" style="width:300px; padding:5px 15px 15px 15px;">
							<a onclick="bookmarkDel()" class="on bookmark-del-btn">★</a>
							<table style="margin-right:auto; margin-left:auto;">
								<tr>
									<td colspan="2" align="center" height="170px" style="padding-top:15px; padding-bottom:10px">
										<div class="img-in">
				                          <img src="/artBridge/image/common/img_profile.png" alt="default frofile image">
				                        </div>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align:center;"><a onclick="selfHidden()" class="bookmark-detailView-btn">소나나</a></td>
								</tr>
								<tr>
									<td>
										<div class="state-area" style="margin-left:0px; padding-left:15px; padding-right:15px;">
					                        <ul>
					                          <li>작품리스트 <span>1개</span></li>
					                          <li>평점 
					                            <span>
					                              <p class="star_rating">		<!-- 별 갯수 평균으로 반영하기 -->
					                                <a href="#" class="on">★</a>
					                                <a href="#" class="on">★</a>
					                                <a href="#" class="on">★</a>
					                                <a href="#">★</a>
					                                <a href="#">★</a>
					                              </p> 0.0점</span>
					                          </li>
					                          <li>진행중인 의뢰 <span>0건</span></li>
					                          <li>슬롯 갯수 <span>0개</span></li>
					                        </ul>
					                    </div>
					                </td>
				                </tr>
				            </table>     
		                </div>

		            </div>
							
<!--      			* 3-1. 마이페이지 탭 바디 - 관심작가 탭 / 작가별 세부 화면 --> 			<!-- id를 bookmark-detail-view 로 만든 버튼에 연결 -->
					<form action="" method="get"class="bookmark-detail-view tab-menu-content-form">		
						<div id="bookmark-detail-view" class="bookmark-detail-view">
							<!-- 프로필 영역 -->
			                <div class="frofile-box">
			                    <div class="img-area">
			                        <div class="img-in">
			                          <img src="/artBridge/image/common/img_profile.png" alt="default frofile image">
			                        </div>
			                    </div>
			                    <div class="input-area">
			                        <label for="nick">닉네임</label>
			                        <input id="authorNickName" name="" class="form-control" type="text" readonly><br>
			                        <label for="introtxt">소개글</label>
			                        <textarea id="intro" name="" class="form-control" rows="3" readonly></textarea><br><br>  
			                        <label>커미션 접수 상태 : </label>&nbsp;
			                        <label for="state1">접수중</label>
			                        <!-- <label for="state2">접수예정</label> -->
			                    </div>
			                    <div class="state-area">
			                        <ul>
			                          <li>작품리스트 <span>1개</span></li>
			                          <li>평점 
			                            <span>
			                              <p class="star_rating">		<!-- 별 갯수 평균으로 반영하기 -->
			                                <a href="#" class="on">★</a>
			                                <a href="#" class="on">★</a>
			                                <a href="#" class="on">★</a>
			                                <a href="#">★</a>
			                                <a href="#">★</a>
			                              </p> 0.0점</span>
			                          </li>
			                          <li>진행중인 의뢰 <span>0건</span></li>
			                          <li>슬롯 갯수 <span>0개</span></li>
			                        </ul>
			                    </div>
			                </div>
			                <!-- //프로필 영역 -->
			
			                <!-- 작가 작품 영역 -->
			                <div class="heading">
			                  <h2 class="tit1">작가의 커미션 작품</h2>
			                </div>
			                <div class="bord-wrap">
			                    <div class="piece-list">
			                      <div class="img-area">
			                          <span class="tmb"><img src="/artBridge/image/common/no_thumb.jpg"></span>
			                          <span class="tmb"><img src="/artBridge/image/common/no_thumb.jpg"></span>
			                          <span class="tmb"><img src="/artBridge/image/common/no_thumb.jpg"></span>
			                      </div>
			                      <div class="info-area1">
			                          <span>작가명</span>
			                          <span>신뢰도 : 100%</span>
			                          <span>
			                            <p class="star_rating">
			                              <a href="#" class="on">★</a>
			                              <a href="#" class="on">★</a>
			                              <a href="#" class="on">★</a>
			                              <a href="#">★</a>
			                              <a href="#">★</a>
			                          </p>
			                        </span>
			                      </div>
			                      <div class="info-area2">
			                          <span>커미션 제목</span>
			                          <span class="price">7,000 ~</span>
			                      </div>
			                    </div>
			                    <div class="piece-list">
			                      <div class="img-area">
			                          <span class="tmb"><img src="/artBridge/image/common/no_thumb.jpg"></span>
			                          <span class="tmb"><img src="/artBridge/image/common/no_thumb.jpg"></span>
			                          <span class="tmb"><img src="/artBridge/image/common/no_thumb.jpg"></span>
			                      </div>
			                      <div class="info-area1">
			                          <span>작가명</span>
			                          <span>신뢰도 : 100%</span>
			                          <span>
			                            <p class="star_rating">
			                              <a href="#" class="on">★</a>
			                              <a href="#" class="on">★</a>
			                              <a href="#" class="on">★</a>
			                              <a href="#">★</a>
			                              <a href="#">★</a>
			                          </p>
			                        </span>
			                      </div>
			                      <div class="info-area2">
			                          <span>커미션 제목</span>
			                          <span class="price">7,000 ~</span>
			                      </div>
			                    </div>
			                </div>
			                <!-- // 작가 작품 영역 -->
			
			                <!-- 페이징 영역 -->
			                <div class="paginate">
								<a href="#" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a>
								<a href="#" class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a>
								<span class="paging-numbers">
								    <a href="#">1<span class="blind">페이지로 이동</span></a>
								    <a href="#" class="on">2<span class="blind">페이지로 이동</span></a>
								    <a href="#">3<span class="blind">페이지로 이동</span></a>
								    <a href="#">4<span class="blind">페이지로 이동</span></a>
								    <a href="#">5<span class="blind">페이지로 이동</span></a>
								</span>
								<a href="#" class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
								<a href="#" class="btn-last" title="끝"><span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
			            	</div>
			            	<!-- // 페이징 영역 -->					
						
						<br><br><br><br>
						</div>
					</form>			
<!--      			//3-1. 마이페이지 탭 바디 - 관심작가 탭 / 작가별 세부 화면 -->
				<br><br><br><br>	
				</div>
			</form>
<!-- 		//3. 마이페이지 탭 메뉴 - 관심작가 탭 -->

<!-- 		* 4. 마이페이지 탭 메뉴 - 회원정보수정 탭 -->
			<form id="memberInfoForm" action="<%=request.getContextPath() %>/updateInfo.me" method="post" class="memberinfo-menu tab-menu-content-form">
				<div class="memberinfo-menu"> <br>
					<table id="memberInfo">
						<tr>
							<td width="150px">아이디 </td>
							<td><input type="text" value="<%= loginUser.getId() %>" maxlength="13" name="userId" id="updateUserId" class="form-control input-short textBox" readonly/></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" maxlength="13" name="updateUserPwd" class="form-control input-short textBox"/></td>
							<td></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" maxlength="13" name="userPwd2" class="form-control input-short textBox"/></td>
							<td><label id="pwdResult"></label></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" value="<%= loginUser.getName() %>" maxlength="5" name="userName" class="form-control input-short textBox" readonly></td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td><input type="text" value="<%= loginUser.getId() %>" maxlength="30" name="nickName" class="form-control input-short textBox"></td>
							<td><button id="idCheck" type="button" class="btn btn-primary btn-lg btn-plus-design" style="height:30px; line-height:0;">중복확인</button></td>
							<td><label id="nnResult">사용 가능한 닉네임입니다.</label></td>
						</tr>
						<tr>
							<td>연락처</td>
							<td width="200px">
								<input type="number" maxlength="3" value="<%= tel1 %>" name="tel1" style="width:28%; display: inline-block;" class="form-control textBox"/> -
								<input type="number" maxlength="4" value="<%= tel2 %>" name="tel2" style="width:30%; display: inline-block;" class="form-control textBox"/> -
								<input type="number" maxlength="4" value="<%= tel3 %>" name="tel3" style="width:30%; display: inline-block;" class="form-control textBox"/>
							</td>
							<td></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" value="<%= loginUser.getEmail() %>"name="email" class="form-control input-short textBox"/></td>
							<td></td>
						</tr>
					</table>					
					<br /><br /><br />
					
					<div class="btn-center btn-outer-style" style="padding-right:80px;">
						  <button type="button" class="btn btn-primary btn-lg btn-plus-design">작가 신청</button>
						  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      <button type="reset" class="btn btn-default btn-lg btn-cancel btn-plus-design">취소</button>
	                      <button type="button" onclick="pwdCheck();" class="btn btn-primary btn-lg btn-del btn-plus-design">수정</button>
	                </div>

				<br><br><br><br>	
				</div>
			</form>
<!-- 		//4. 마이페이지 탭 메뉴 - 회원정보수정 탭 -->

<!-- 		* 5. 마이페이지 탭 메뉴 - 내작품관리 탭 -->
			<form action="" method="get"class="mywork-menu tab-menu-content-form">
				<div class="mywork-menu">	<!-- 소나 파일 include or 링크 연결하기 -->
				
				
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
							<tr id="" class="send-list msg-list">	<!-- ***수정사항 : 발신회원번호/수신회원번호 서블릿에서 받기 -->
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
							<tr id="" class="rec-list  msg-list">
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
							<tr id="" class="rec-list  msg-list">
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

//	* 페이지 호출

	$(function(){
		var pageName = '<%= (String)request.getParameter("pageName") %>';
		//alert(pageName);	

		$('.order-menu, .bookmark-menu, .msg-menu, .memberinfo-menu, .mywork-menu, .qna-menu').css({"display":"none"});
		//alert(pageName);
		if(pageName != null){
			anotherHidden(pageName)
		}/*  else{
			//anotherHidden('order-menu');			
			$('.order-menu').css({"display":"block"});
			$('#order-menu').css({"color":"black", "background":"white"});
		} */
		
		
	});
            		  
//	* 탭 선택 함수
	function anotherHidden(thisMenu){		
		//var thisMenu = event.srcElement.id;
		
<%-- 		<%
		private static String getSha512(String pwd){
			String encPwd = null;
			
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-512");
				byte[] bytes = pwd.getBytes(Charset.forName("utf-8"));
				md.update(bytes);
				
				encPwd = Base64.getEncoder().encodeToString(md.digest());
				
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			
			return encPwd;
		}
		
		%> --%>
		if(thisMenu == "memberinfo-menu"){			
			var checkPwd = prompt('비밀번호를 입력하세요.', '');
			var currPwd = '<%= pwd %>';
					
		}
 
		$('.order-menu, .msg-menu, .bookmark-menu, .memberinfo-menu, .mywork-menu, .qna-menu').css({"display":"none"});
		
		$('.' + thisMenu).css({"display":"block"});

		$(':not(#' + thisMenu + ')').css({"color":"", "background":""});
		$('#mywork-menu').css({"color":"white", "background":"#FF7373"});
	
		$('#' + thisMenu).css({"color":"black", "background":"white"});
		
		
		if(thisMenu == "order-menu"){			//오더메뉴, 메시지 메뉴 둘 다 가능 할 듯 ( -list 선택자로  / filter선택자로)
			$('#stmt-Filter').val("전체 보기");
			$('.transInfo-list').css({"display":""});
		}
		if(thisMenu == "msg-menu" || thisMenu == "qna-menu"){
			$('.msg-Filter').val("전체 보기");
			$('.msg-list').css({"display":""});	
		}

	};
	                   	
// 	* 구매 목록 필터링 - 전체 보기 / 구매 내역 / 판매 내역					***수정사항 : select요소 change 함수 통합 하기
    $('#stmt-Filter').change(function(){    	
    	var value = this.value;
    	
    	if(value == "판매 내역"){
    		$('.buyer-list').css({"display":"none"});
    		$('.seller-list').css({"display":"visible"});
    		
    	}else if(value == "구매 내역"){
    		$('.seller-list').css({"display":"none"});
    		$('.buyer-list').css({"display":"visible"});
    		
    	}else{
    		$('.transInfo-list').css({"display":"visible"});
    	};
    	
    });
    
// 	* 쪽지 목록 필터링 - 전체 보기 / 보낸 쪽지 / 받은 쪽지
    $('.msg-Filter').change(function(){    	
    	var value = this.value;
    	
    	if(value == "보낸 쪽지"){
    		$('.rec-list').css({"display":"none"});
    		$('.send-list').css({"display":"visible"});
    		
    	}else if(value == "받은 쪽지"){
    		$('.send-list').css({"display":"none"});
    		$('.rec-list').css({"display":"visible"});
    		
    	}else{
    		$('.msg-list').css({"display":"visible"});
    	};
    	
    }); 
    
// 	* 쪽지 목록 전체 선택 체크박스    
	function allCheckFunc( obj ) {
			$("[name=checkMsg]").prop("checked", $(obj).prop("checked") );
	}

	function oneCheckFunc( obj ){
		var allObj = $("[name=checkAll]");
		var objName = $(obj).attr("name");
	
		if( $(obj).prop("checked")){
			checkBoxLength = $("[name="+ objName +"]").length;
			checkedLength = $("[name="+ objName +"]:checked").length;
	
			if(checkBoxLength == checkedLength){
				allObj.prop("checked", true);
			}else{
				allObj.prop("checked", false);
			}
		}else{
			allObj.prop("checked", false);
		}
	}
	
	$(function(){
		$("[name=checkAll]").click(function(){
			allCheckFunc( this );
		});
		$("[name=checkMsg]").each(function(){
			$(this).click(function(){
				oneCheckFunc( $(this) );
			});
		});
	});
	             			
// 	* 명세표 모달 띄우기
   	function displayBlock(){
		document.getElementById('settingBoardArea').style.display='block';
		document.getElementById('settingArea').style.display='block';
  	};							
// 	* 명세표 모달 닫기
	function displayNone(){
		document.getElementById('settingArea').style.display='none';
		document.getElementById('settingBoardArea').style.display='none';
	};
	
	
	//별점 매기기
	$( ".star_rating a" ).click(function() {
	     $(this).parent().children("a").removeClass("on");
	     $(this).addClass("on").prevAll("a").addClass("on");
	     return false;
	});

	
	
// 	* 비밀번호 체크하기

	
</script>


</body>
</html>