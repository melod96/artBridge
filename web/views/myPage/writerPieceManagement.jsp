<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.comvision.artBridge.member.model.vo.Member"%>
<% 
	/* ArrayList<> list = null;
	if(request.getAttribute("list") != null){
		list = (ArrayList<Notice>)request.getAttribute("list");
	}
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
	} */
	
	Member m = null;
	if(session.getAttribute("loginUser") != null){
		m = (Member)session.getAttribute("loginUser");
	}
	
	int slot = 0;
	if(m.getWriter_slot() > 0){
		slot = m.getWriter_slot();
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
   .img-in{overflow:hidden; width:150px; height:150px; /*border:1px solid #ddd;*/ border-radius:50%;}
   .img-in img{width:100%;}
   .img-area{float:left; text-align:center;}
   .img-area .file-btn{margin-top:15px;}
   .img-area .file-btn input[type=file]{display:none;}
   .img-area .file-btn label{width:150px;}

   .input-area{margin-left:40px; float:left; width:585px;}
   .input-area label{vertical-align:top; font-weight:bold;}
   .input-area input[type="text"], .input-area textarea{display:inline-block; width:500px; resize:none; margin-bottom:10px; margin-left:15px;}
   .input-area input[type="number"]{display:inline-block; margin-bottom:20px; margin-left:30px;}
   .input-area .info{margin-top:5px; position:absolute; bottom:15px; left:570px;}
   .input-area .info li{font-size:14px; margin-bottom:3px; color:#428bca;}
   .input-area label[for=state1]{color:green; font-weight:bold;}
   .input-area label[for=state2]{color:red; font-weight:bold;}
   .pro-save{width:200px; height:40px; font-size:15px;}
   .input-area .state{display:inline-block; margin-left:20px;}

   .state-area{margin-left:20px; float:left; width:250px;}
   .state-area li{position:relative; border-bottom:1px solid #bdbdbd; margin-bottom:10px; font-weight:bold;}
   .state-area li span{float:right; font-weight:normal;}

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
   
	.switch {position: relative; display: inline-block; width: 60px; height: 34px;}
	.switch input {display:none;}
	.slider {position: absolute; cursor: pointer; top: 0; left: 0; right: 0; bottom: 0; background-color: #ccc; -webkit-transition: .4s; transition: .4s;}
	.slider:before {position: absolute; content: ""; height: 26px; width: 26px; left: 4px; bottom: 4px; background-color: white; -webkit-transition: .4s; transition: .4s;}
	input:checked + .slider {background-color: #2196F3;}
	input:focus + .slider {box-shadow: 0 0 1px #2196F3;}
	input:checked + .slider:before {-webkit-transform: translateX(26px); -ms-transform: translateX(26px); transform: translateX(26px);}
	.slider.round {border-radius: 34px;}
	.slider.round:before {border-radius: 50%}

   </style>
   <script>
     $(function(){
         //작품 보이기 숨기기
         $(".btn-lock").click(function(){
             var act = $(this).hasClass('on');
             if(act == false){ //on이 없으면 숨김해지
               $(this).addClass('on');
               $(this).attr('title','작품 숨기기');
               console.log('test');
               alert("작품 숨김 해지 완료"); 
             }else{ //on이 있으면 숨김처리
               $(this).removeClass('on');
               $(this).attr('title','작품 보이기');
               alert("작품 숨기기 완료");
             }
         });

       //별점 매기기
       $( ".star_rating a" ).click(function() {
            $(this).parent().children("a").removeClass("on");
            $(this).addClass("on").prevAll("a").addClass("on");
            return false;
       });

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
					<li><a href="#" style="background:#fff; color:#000;">내작품관리</a></li>
					<li><a href="/artBridge/views/myPage/myPageForm.jsp?pageName=qna-menu">이용문의</a></li>
				</ul>
			</div>
        </section>

        <!-- contents area -->
        <div class="contents">
            <div class="container">
                <div class="col-md-12">

                    <!-- 프로필 작성 영역 -->
                    <form action="<%=request.getContextPath()%>/insertProfile.wr" method="post">
                      <div class="frofile-box">
                          <div class="img-area">
                              <div class="img-in">
                                <img id="img-change" src="/artBridge/image/common/img_profile.png" alt="default frofile image">
                              </div>
                              <div class="file-btn">
                                <input type="file" id="sel-img" value="이미지 선택">
                                <label for="sel-img" class="btn btn-warning">이미지 선택</label>
                              </div>
                          </div>
                     
                          <div class="input-area">
                              <label for="nick">닉네임</label>
                              <input id="" name="" class="form-control" type="text" value="<%= m.getNick_name() %>">
                              
                              <label for="introtxt">소개글</label>
                              <textarea id="" name="" class="form-control" rows="3"><%= m.getIntroduction() %></textarea> 
                              
                              <label for="slot">슬롯 갯수 변경</label>
                              <input id="" name="" class="form-control input-xshort" type="number" min="1" value="<%= slot %>"><br>
                              
                              <label>커미션 접수 상태</label>
                              <div class="state">
	                              <span>OFF</span>
	                              <label class="switch">
								  	 <input type="checkbox" checked>
								 	 <span class="slider round"></span>
								  </label>
	                              <span>ON</span>
                              </div>
							  
                              <!-- <input type="radio" id="state1" name="state" value="접수중">
                              <label for="state1">접수중</label>&nbsp;&nbsp;&nbsp;
                              <input type="radio" id="state2" name="state" value="접수예정">
                              <label for="state2">접수예정</label> -->
                              <ul class="info">
                                  <li>- 의뢰 접수가 불가능한 기간에는 <strong>[접수예정]</strong>상태로 변경하세요.</li>
                                  <li>- <strong>[접수중]</strong>으로 변경은 수동으로 하셔야 합니다. </li>
                              </ul>
                              
                          </div>
                          <div class="state-area">
                              <ul>
                                <li>작품리스트 <span>1개</span></li>
                                <li>평점 
                                  <span>
                                    <p class="star_rating">
                                      <a href="#" class="on">★</a>
                                      <a href="#" class="on">★</a>
                                      <a href="#" class="on">★</a>
                                      <a href="#">★</a>
                                      <a href="#">★</a>
                                    </p> 0.0점</span>
                                </li>
                                <li>진행중인 의뢰 <span>0건</span></li>
                                <li>슬롯 갯수 <span>0개</span></li>
                                <li>입금 예정 금액 <span>0원</span></li>
                              </ul>
                          </div>
                          <!-- <div class="absol-btn">
                              <button type="button" class="btn btn-sm btn-default">슬롯갯수 변경</button>
                          </div> -->
                      </div>
                      <div class="btn-center" style="margin-top:30px;">
                        <button type="submit" class="btn btn-primary pro-save">프로필 저장</button>
                      </div>
                    </form>
                    <!-- //프로필 작성 영역 -->

                    <!-- 내 작품 관리 영역 -->
                    <div class="btn-right add-some">
                        <div class="heading">
                          <h2 class="tit1">내 작품 관리</h2>
                        </div>
                       <button type="button" class="btn btn-primary">커미션 작품등록</button>
                   </div>
                    <div class="bord-wrap">
                    	  
                        <div class="piece-list">
                          <ul class="seting-area">
                              <!-- <li><input type="button" class="btn-lock" title="작품 보이기"><label class="hide">숨기기</label></li> -->
                              <li><input type="button" class="btn-edit" title="작품 수정"><label class="hide">수정</label></li>
                              <li><input type="button" class="btn-del" title="작품 삭제"><label class="hide">삭제</label></li>
                          </ul>
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
                       
                        <div class="piece-list default">첫 작품을 등록해주세요.</div>
                    </div>
                    <!-- // 내 작품 관리 영역 -->

                    <!-- 페이징 영역 -->
                    <%-- <div class="paginate">
				<a onclick="location.href='<%=request.getContextPath()%>/selectNoticeList.no?currentPage=1'" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a> 
				<% if(currentPage <=1){ %>
					<a disabled class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a> 
				<%}else{ %>
					<a onclick = "location.href='<%= request.getContextPath()%>/selectNoticeList.no?currentPage=<%=currentPage -1%>'" class="btn-prev" title="이전">
					<em class="blind">목록에서 이전 페이지 이동</em></a>
				<%} %>
				<span class="paging-numbers">
					<% for(int p = startPage; p <=endPage;p++){
						if(p==currentPage){%>
							<a disabled class="on"><%=p %><span class="blind">페이지로 이동</span></a>
						<%}else{ %>
							<a onclick= "location.href='<%= request.getContextPath()%>/selectNoticeList.no?currentPage=<%=p%>'"><%= p %><span class="blind">페이지로 이동</span></a>
						<%} %>
					<%} %>
				</span>
				<% if(currentPage >= maxPage){ %>
					<a disabled class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
				<%}else{ %>
					<a onclick = "location.href = '<%= request.getContextPath()%>/selectNoticeList.no?currentPage=<%=currentPage +1%>'" class="btn-next" title="다음">
					<span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
				<%} %>
				
				<a onclick = "location.href = '<%= request.getContextPath()%>/selectNoticeList.no?currentPage=<%=maxPage%>'" class="btn-last" title="끝">
				<span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
			</div> --%>
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