<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.*, com.comvision.artBridge.transaction.model.vo.Transaction,
				 com.comvision.artBridge.board.model.vo.*, com.comvision.artBridge.files.model.vo.*,
				 com.comvision.artBridge.sale.model.vo.*, com.comvision.artBridge.message.model.vo.*,
				 com.comvision.artBridge.comments.model.vo.*, com.comvision.artBridge.member.model.vo.*" %>  
 
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

</head>
<body>
    <div id="all">

<%  /* 구매목록 메뉴 / 명세표 */
	
	Transaction t = null;
	if(request.getAttribute("t") != null){
		t = (Transaction)request.getAttribute("t");
	}
	
	ArrayList<Requirements> rlist = null;
	if (request.getAttribute("rlist") != null) {
		rlist = (ArrayList<Requirements>) request.getAttribute("rlist");
	}
	
	Member m = null;
	if (session.getAttribute("loginUser") != null) {
		m = (Member) session.getAttribute("loginUser");
	}
	
	int totalPrice = 0;
	if (request.getAttribute("totalprice") != null) {
		totalPrice = (int) (request.getAttribute("totalprice"));
	}
	ArrayList<Comments> clist= null;
	if(request.getAttribute("clist")!= null){
		clist= (ArrayList<Comments>)request.getAttribute("clist");
	}
	

%>



<!-- 	* 마이페이지 탭 영역 -->	
		<div class="contents"><!-- contents 필수 사용 -->

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
<%--***							<td width="230px"><%=loginUser.getNick_name()%></td> --%>
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
<%-- <!-- ***				  					  <% if(loginUser.getWriter_right() == 0) { %> --> --%>
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

<!-- 	* 마이페이지 탭 제목/바디 영역 -->
		<div class="container">		<!-- container 필수 사용 -->
		<div class="col-md-12">
				



		</div>	
		</div>
<!-- 	//마이페이지 탭 제목/바디 영역 -->			
		</div>
<!-- 	//마이페이지 탭 영역 -->
        
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
				$('.heading .menuName').html("주문 관리");
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

				$('#updateNickName').val('<%= m.getNick_name() %>');
				$("#nickNameCheckBtn").text("사용가능");
				$('#nickNameCheckBtn').css({"background":"mediumseagreen", "color":"white"});
				$('#nnResult').css({"display":"none"});
				checkNick = true;
				
				$('#email').val('<%= m.getEmail() %>');

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
	   		$('#stmtModalArea').css({"display":"block"});
	   		$('#stmtArea').css({"display":"block"});
	   		
	   		//var orderNoo = $('#orderNo').val();
	   		
	   		//var orderNoo = $('#orderNo').val();
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
			}
			
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
