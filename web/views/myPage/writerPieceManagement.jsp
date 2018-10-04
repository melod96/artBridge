<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.*,
    		com.comvision.artBridge.member.model.vo.Member, 
    		com.comvision.artBridge.board.model.vo.*,
    		com.comvision.artBridge.files.model.vo.*,
    		com.comvision.artBridge.grade.model.vo.*"
%>
<% 
	ArrayList<HashMap<String, Object>> list = null;
	if(request.getAttribute("list") != null){
		list = (ArrayList<HashMap<String, Object>>)request.getAttribute("list");
	}
	
	//페이징
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
	
	Member m = null;
	if(session.getAttribute("loginUser") != null){
		m = (Member)session.getAttribute("loginUser");
	}
	
	//썸네일 이미지
	Board b = new Board();
	
	//프로필 이미지
	ArrayList<Files> profileFile = null;
	Files profileImg = null;
	if(request.getAttribute("profileFile") != null){
		profileFile = (ArrayList<Files>)request.getAttribute("profileFile");
		if(profileFile.size() > 0){
			profileImg = profileFile.get(0);
		}
	};
	
	//작가 슬롯갯수
	int slot = 0;
	if(m.getWriter_slot() > 0){
		slot = m.getWriter_slot();
	}

	//작가 평점
	int writerAvg = 0;
	if(request.getAttribute("writerAvg") != null){
		writerAvg = (int)request.getAttribute("writerAvg");
	}
	
	//진행중인 의뢰 갯수
	int orderIngCount = 0;
	if(request.getAttribute("orderIngCount") != null){
		orderIngCount = (int)request.getAttribute("orderIngCount");
	}
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Art Bridge</title>
<%@ include file="/views/common/head.jsp" %>
<style type="text/css">
   .frofile-box{overflow:hidden; position:relative; border:1px solid #9e9e9e; padding:30px; font-size:16px; width:1110px;}
   .img-in{overflow:hidden; width:150px; height:150px; border:1px solid #ddd; border-radius:50%; /* background:url("/artBridge/image/common/img_profile.png") 50% no-repeat; background-size:100%; */}
   .img-in img{width:100%;}
   .img-area{float:left; text-align:center;}
   .img-area .file-btn{margin-top:15px;}
   .img-area .file-btn input[type=file]{display:none;}
   .img-area .file-btn label{width:150px;}

   .input-area{margin-left:40px; float:left; width:585px;}
   .input-area label{vertical-align:top; font-weight:bold;}
   .input-area input[type="text"], .input-area textarea{display:inline-block; width:500px; resize:none; margin-bottom:10px; margin-left:15px;}
   .input-area input[type="number"]{display:inline-block; margin-bottom:20px; margin-left:30px;}
   .input-area .info{margin-top:5px; position:absolute; left:530px;}
   .input-area .info li{font-size:14px; margin-bottom:3px; color:#428bca;}
   .input-area .info li:before{content:''; display:inline-block; width:14px; height:16px; margin-right:6px; opacity:0.8; background:url('/artBridge/image/common/ico_info.png')  50% 2px no-repeat; background-size:100%;}
   .input-area .info.info-txt1{bottom:55px;}
   .input-area .info.info-txt2{bottom:24px;}
   .input-area label[for=state1]{color:green; font-weight:bold;}
   .input-area label[for=state2]{color:red; font-weight:bold;}
   .pro-save{width:200px; height:40px; font-size:15px;}
   .input-area .state{display:inline-block; margin-left:15px; line-height:30px; color:#afafaf; font-weight:bold;}
   .input-area .nick-name{width:500px; display:inline-block; margin-left:20px; margin-bottom:15px; font-weight:bold;}

   .state-area{margin-left:20px; float:left; width:250px;}
   .state-area li{position:relative; border-bottom:1px solid #bdbdbd; margin-bottom:10px; font-weight:bold;}
   .state-area li span{float:right; font-weight:normal;}

   .bord-wrap{overflow:hidden; width:1110px; font-size:16px;}
   .bord-wrap .piece-list{float:left; border:1px solid #9e9e9e; padding:20px; width:550px; margin-left:10px; margin-bottom:30px; font-weight:bold;}
   .bord-wrap .piece-list.default{width:100%; text-align:center; padding:50px 0;}
   .bord-wrap .piece-list:nth-child(2n+1){margin-left:0;}
   .bord-wrap .seting-area{overflow:hidden; float:right; margin-bottom:0;}
   .bord-wrap .seting-area li{float:left; margin-left:10px; height:25px;}
   .bord-wrap .seting-area li input{display:inline-block; width:25px; height:25px; background-size:100% !important; border: none;}
   .bord-wrap .seting-area .btn-edit{background:url("/artBridge/image/common/ico_repaint.png") 0 0 no-repeat;}
   .bord-wrap .seting-area .btn-del{background:url("/artBridge/image/common/ico_delete.png") 0 0 no-repeat;}

   .bord-wrap .img-area{display:inline-block;}
   .bord-wrap .img-area .tmb{overflow:hidden; float:left; width:32%; height:122px;}
   .bord-wrap .img-area .tmb~.tmb{margin-left:1.9%;}
   .bord-wrap .img-area .tmb img{width:100%;}

   .bord-wrap .info-area1{margin-bottom:20px; padding-bottom:12px; font-size:15px; color:#242424; border-bottom:1px solid #ddd;}
   .bord-wrap .info-area1 span{display:inline-block; width:430px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;}
   .bord-wrap .tit_txt a{color:#333;}

   .heading{margin: 30px 0 20px 0 !important;}
   div.btn-right.add-some button{bottom:0; top:auto;}
   .paginate{margin-bottom:50px;}
   .btn-default{background-color:#e4e4e4; color:#4e4e4e;}

	.switch {position: relative; display: inline-block; width: 55px; height: 27px; margin-bottom:0;}
	.switch input {display:none;}
	.slider {position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0; background-color: #ccc; -webkit-transition: .4s; transition: .4s;}
	.slider:before {position: absolute; content: ""; height: 20px; width: 20px; left: 4px; bottom: 4px; background-color: white; -webkit-transition: .4s; transition: .4s;}
	input:checked + .slider {background-color: #2196F3;}
	input:focus + .slider {box-shadow: 0 0 1px #2196F3;}
	input:checked + .slider:before {-webkit-transform: translateX(26px); -ms-transform: translateX(26px); transform: translateX(26px);}
	.slider.round {border-radius: 34px;}
	.slider.round:before {border-radius: 50%}
	.txt-off{margin-right:5px;}
    .txt-on{margin-left:5px;}
   </style>
   <script>
     $(function(){
       //프로필 사진 변경
       function readURL(input) {
         if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function(e) {
             $('#img-change').attr('src', e.target.result);
           }
           reader.readAsDataURL(input.files[0]);
         }
       }
       $("#sel-img").change(function() {
         readURL(this);
       });

     });
     
     //커미션 접수상태 스위치
     $(function(){
		 var swichVal = <%= m.getReception_status() %>;
		 //console.log(swichVal);
		 if(swichVal == 1){
			$(".switch input").prop('checked', true);
			$('.txt-on').css('color','#ff5722');
		 }else{
			 $(".switch input").prop('checked', false);
			 $('.txt-off').css('color','#ff5722');
		 }
	 });
	  function swichTg(ck){
		  var swichCk = $(ck).prop('checked');
	  		if(swichCk == true){
	  			$(".switch input").attr('value','1')
	  			$('.txt-on').css('color','#ff5722');
	  			$('.txt-off').css('color','none');
	  		}else{
	  			$(".switch input").attr('value','0')
	  			$('.txt-on').css('color','none');
	  			$('.txt-off').css('color','#ff5722');
	  		}
	  }
   </script>
</head>
<body>
    <div id="all">
       
        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
        <!-- // Header -->

        <!-- 주석 영역 -->
         <section class="tit-area bg-yellow"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
	         <div class="container">
				<h2>마이 페이지</h2>
				<ul class="tab-menu">
					<li><a href="/artBridge/views/myPage/myPageForm.jsp?pageName=order-menu">주문관리</a></li>
					<li><a href="/artBridge/views/myPage/myPageForm.jsp?pageName=msg-menu">쪽지함</a></li>
					<li><a href="/artBridge/views/myPage/myPageForm.jsp?pageName=bookmark-menu">관심작가</a></li>
					<li><a href="/artBridge/views/myPage/myPageForm.jsp?pageName=memberinfo-menu">회원정보수정</a></li>
					<li><a href="<%=request.getContextPath()%>/selectPieceList.wr?memberNo=<%=m.getMember_no()%>" style="background:#fff; color:#000;">내작품관리</a></li>
					<li><a href="/artBridge/views/myPage/myPageForm.jsp?pageName=qna-menu">이용문의</a></li>
				</ul>
			</div>
        </section>

        <!-- contents area -->
        <div class="contents">
            <div class="container">
                <div class="col-md-12">

                    <!-- 프로필 작성 영역 -->
                    <form action="<%=request.getContextPath()%>/updateProfile.wr" method="post" encType="multipart/form-data">
                      <div class="frofile-box">
                          <div class="img-area">
                              <div class="img-in">
                              	<%if(request.getAttribute("profileFile") != null){ %>
                                	<img id="img-change" src="/artBridge/image/profile/<%=profileImg.getChange_title()%>">
                                <% }else{ %>
                                	<img id="img-change" src="/artBridge/image/common/img_profile.png" alt="프로필 이미지">
                                <% } %>
                              </div>
                              <div class="file-btn">
                                <input type="file" id="sel-img" name="profileImg" value="이미지 선택">
                                <label for="sel-img" class="btn btn-warning">이미지 선택</label>
                              </div>
                          </div>
                     
                          <div class="input-area">
                          	  <input type="hidden" name="memberNo" value="<%=m.getMember_no()%>">
                              <label for="nick">닉네임</label>
                              <%-- <input id="nick" name="nick" class="form-control" type="text" value="<%= m.getNick_name() %>" > --%>
                              <span class="nick-name">[ <%= m.getNick_name() %> ]</span>
                              
                              <label for="introtxt">소개글</label>
                              <textarea id="introtxt" name="introtxt" class="form-control" rows="3"><%= m.getIntroduction() %></textarea> 
                              
                              <label for="slot">슬롯 갯수 변경</label>
                              <input id="slot" name="slot" class="form-control input-xshort" type="number" min="1" value="<%= slot %>"><br>
                              <ul class="info info-txt1">
                                  <li>신입작가 : 작가전환 후 30일 동안 슬롯 갯수 10개 제한<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일반/인기작가 : 슬롯 갯수 무제한</li>
                              </ul>
                              
                              <label>커미션 접수 상태</label>
                              <div class="state">
	                              <span class="txt-off" title="접수불가">OFF</span>
	                              <label class="switch">
								  	 <input type="checkbox" name="reception_status" onclick="swichTg(this)" >
								 	 <span class="slider round"></span>
								  </label>
	                              <span class="txt-on" title="접수중">ON</span>
                              </div>
                              <ul class="info info-txt2">
                              	  <li>[ON] 커미션 접수가능 / [OFF] 커미션 접수 불가능</li>
                              </ul>
                          </div>
                          
                          <div class="state-area">
                              <ul>
                                <li>작품리스트 <span><%= listCount %> 개</span></li>
                                <li>평점 <span><div class="rateit" data-rateit-value="<%= writerAvg %>" data-rateit-ispreset="true" data-rateit-readonly="true"></div>&nbsp; <%= writerAvg %> 점 </span></li>
                                <li>진행중인 의뢰 <span><%= orderIngCount %> 건</span></li>
                                <li>슬롯 갯수 <span><%= slot %> 개</span></li>
                              </ul>
                          </div>
                      </div>
                      <div class="btn-center" style="margin-top:30px;">
                        <button type="submit" class="btn btn-primary pro-save">프로필 저장</button>
                      </div>
					</form>
	                <!-- //프로필 작성 영역 -->
	                
                   	<!-- 내 작품 관리 영역 -->	
                   	<form name="pieceListForm">
	                    <div class="btn-right add-some">
	                        <div class="heading">
	                          <h2 class="tit1">내 작품 관리</h2>
	                        </div>
	                       <button type="button" class="btn btn-primary" onclick="location.href='/artBridge/views/myPage/writerPieceInsertAgree.jsp?boardNo=<%=b.getBoard_no()%>'">커미션 작품등록</button>
	                   </div>
	                    <div class="bord-wrap">
	                    	<% if(list != null) {if(list.size() > 0){
	                  			int no = listCount - (currentPage - 1) * 10;
	                    		for(int i = 0; i < list.size(); i++){
	                    		b = (Board)(list.get(i).get("board"));%>
	                        <div class="piece-list">
	                       		<div class="info-area1">
	                              <span><%= m.getNick_name() %>작가 &nbsp; / &nbsp; <%= b.getBoard_title() %></span>
	                              <ul class="seting-area">
		                              <li><input type="button" class="btn-edit" title="작품 수정" onclick="location.href='updatePieceView.wr?pieceNo=<%=b.getBoard_no()%>&memberNo=<%= loginUser.getMember_no() %>'"><label class="hide">수정</label></li>
		                              <%-- <li><input type="button" class="btn-edit" title="작품 수정" onclick="location.href='<%=request.getContextPath()%>/updatePieceView.wr?pieceNo=<%=b.getBoard_no()%>'"><label class="hide">수정</label></li> --%>
		                              <!-- <li><input type="button" class="btn-del" title="작품 삭제" onclick="pieceDel()"><label class="hide">삭제</label></li> -->
		                              <li><input type="button" class="btn-del" title="작품 삭제" onclick="location.href='<%=request.getContextPath()%>/deletePiece.wr?pieceNo=<%=b.getBoard_no()%>&memberNo=<%= loginUser.getMember_no() %>'"><label class="hide">삭제</label></li>
		                          </ul>
		                          <script>
		                        	//서블릿으로 보내서 삭제하기 --> 보드 넘버가 마지막 게시글만 출력됨...
		                          	<%-- function pieceDel(){
		                        		var msg = confirm("작품을 삭제하시겠습니까?ㅜㅜ");
		                          		if(msg == true){
		                          			location.href="<%=request.getContextPath()%>/deletePiece.wr?pieceNo=<%=b.getBoard_no()%>&memberNo=<%= loginUser.getMember_no() %>";
		                          			var theForm = document.pieceListForm;
	                         				theForm.method = "post";
	                         				theForm.action = "<%=request.getContextPath()%>/deletePiece.wr?pieceNo=<%=b.getBoard_no()%>&memberNo=<%= loginUser.getMember_no() %>";
	                         				theForm.submit();
		                         			
		                          		}else{
		                          			return false;	
		                          		}
		                          	} --%>
		                          </script>
	                          </div>
	                          <div class="img-area">
		                          <a href="<%=request.getContextPath()%>/selectOneSalepage.bo?num=<%=b.getBoard_no()%>">
		                          	  <% for(int j = 0; j < ((ArrayList<Files>)list.get(i).get("selectThumbImg")).size(); j++){ 
		                          	  		Files f = ((ArrayList<Files>)list.get(i).get("selectThumbImg")).get(j);%>
			                              <% if(f.getChange_title() != null){ %>
			                              	<span class="tmb"><img src="/artBridge/image/thumbnail_upload/<%= f.getChange_title() %>"></span>
			                              <% }else{ %>
			                             	 <span class="tmb"><img src="/artBridge/image/common/no_thumb.jpg"></span>
		                              <% 	}
		                             	 } %>
		                          </a>
	                          </div>
	                        </div>
	                        <% 	no--;
		                        }
		                    } else { %>
	                        <div class="piece-list default">첫 작품을 등록해주세요.</div>
	                        <% }} %>
	                    </div>
	                </form>
                    <!-- // 내 작품 관리 영역 -->
					
                    <!-- 페이징 영역 -->
                    <div class="paginate">
						<a onclick="location.href='<%=request.getContextPath()%>/selectPieceList.wr?currentPage=1&memberNo=<%=m.getMember_no()%>'" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a> 
						<% if(currentPage <=1){ %>
							<a disabled class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a> 
						<%}else{ %>
							<a onclick = "location.href='<%= request.getContextPath()%>/selectPieceList.wr?currentPage=<%=currentPage -1%>&memberNo=<%=m.getMember_no()%>'" class="btn-prev" title="이전">
							<em class="blind">목록에서 이전 페이지 이동</em></a>
						<%} %>
						<span class="paging-numbers">
							<% for(int p = startPage; p <=endPage;p++){
								if(p==currentPage){%>
									<a disabled class="on"><%=p %><span class="blind">페이지로 이동</span></a>
								<%}else{ %>
									<a onclick= "location.href='<%= request.getContextPath()%>/selectPieceList.wr?currentPage=<%=p%>&memberNo=<%=m.getMember_no()%>'"><%= p %><span class="blind">페이지로 이동</span></a>
								<%} %>
							<%} %>
						</span>
						<% if(currentPage >= maxPage){ %>
							<a disabled class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%}else{ %>
							<a onclick = "location.href = '<%= request.getContextPath()%>/selectPieceList.wr?currentPage=<%=currentPage +1%>&memberNo=<%=m.getMember_no()%>'" class="btn-next" title="다음">
							<span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%} %>
						
						<a onclick = "location.href = '<%= request.getContextPath()%>/selectPieceList.wr?currentPage=<%=maxPage%>&memberNo=<%=m.getMember_no()%>'" class="btn-last" title="끝">
						<span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
					</div>
                   <!-- // 페이징 영역 -->

                </div>
            </div>
        </div>
        <!-- // contents area -->
        <!-- // 주석 영역 -->

        <!-- Footer -->
        <%@ include file="/views/common/footer.jsp" %>
       <!-- // Footer -->

    </div>
</body>
</html>