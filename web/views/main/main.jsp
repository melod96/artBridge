<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.comvision.artBridge.board.model.vo.*"%>
    
<% ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list"); %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Art Bridge</title>
	<%@ include file="/views/common/head.jsp" %>
	
	<style>
	.notice1 li{border-bottom:1px solid #ddd; solid #ddd;padding-top:10px;}
	.ntTitle{color:black;width:70%;height:20px;text-overflow: ellipsis;display:inline-block;overflow: hidden;white-space: nowrap}
	.ntTitle a{color:black;}
	.ntDate{color:gray;font-size:0.9em;float:right;}
	#faqDiv{padding-top:20px; padding-left:30px;}
	.faq{width:500px; height:45px; border:2px solid #ddd;cursor: pointer; margin:40px;margin-left:20px;text-align:center;padding-top:13px;
			border-radius:50px;}
	#testRadius{border-radius:50%;}
	.faqtt{padding-left:30px;}
</style>
	
	
</head>
<body>
    <div id="all">
       
        <!-- Header -->
        <header>
            <div class="navbar-affixed-top" data-spy="affix" data-offset-top="200">
                <div class="navbar navbar-default yamm" role="navigation" id="navbar">

                    <div class="container">
                        <div class="navbar-header">
                            <!-- 로고 -->
                            <a class="navbar-brand home" href="index.html">
                                <img src="/artBridge/image/logo.png" alt="Art Bridge logo">
                            </a>
                            <!-- // 로고 -->
                            <!-- 토글버튼 -->
                            <div class="navbar-buttons">
                                <button type="button" class="navbar-toggle btn-template-main" data-toggle="collapse" data-target="#navigation">
                                    <span class="sr-only">Toggle navigation</span>
                                    <i class="fa fa-align-justify"></i>
                                </button>
                            </div>
                             <!-- // 토글버튼 -->
                        </div>
                        <!-- 메뉴영역 -->
                        <div class="navbar-collapse collapse" id="navigation">
                            <ul class="nav navbar-nav navbar-right">
                                <li class="">
                                    <a href="#" class="">일러스트 </a>
                                </li>
                                <li class="dropdown">
                                    <a href="view/infoUseRequester.jsp" class="dropdown-toggle">이용안내</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="view/infoUseRequester.jsp"> 의뢰자 이용안내</a>
                                        </li>
                                        <li><a href="view/infoUseArtist.jsp">작가 이용안내</a>
                                        </li>
                                        <li><a href="infoUseOther.jsp">환불규정 및 유의사항</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle">고객센터</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">자주하는 질문</a>
                                        </li>
                                        <li><a href="#">고객문의</a>
                                        </li>
                                        <li><a href="#">광고상품 안내</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="">
                                    <a href="#" class="login">&nbsp;로그인&nbsp;</a>
                                </li>
                                <li class="">
                                    <a href="#" class="join">회원가입</a>
                                </li>
                                <!-- <li class="dropdown">
                                    <a href="#" class="login" data-toggle="dropdown">마이페이지</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">마이페이지</a>
                                        </li>
                                        <li><a href="#">쪽지함</a>
                                        </li>
                                        <li><a href="#">주문 관리</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="join" data-toggle="dropdown">님</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">로그아웃</a>
                                        </li>
                                        <li><a href="#">회원 정보 수정</a>
                                        </li>
                                    </ul>
                                </li> -->
                                <li class="">
                                    <a href="#" class="msg">
                                        <span class="glyphicon glyphicon-envelope"></span>
                                        <span class="msg-num on">1</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                         <!-- // 메뉴영역 -->
                        <!-- 검색 왜있지? -->
                        <div class="collapse clearfix" id="search">
                            <form class="navbar-form" role="search">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search">
                                    <span class="input-group-btn">
                                       <button type="submit" class="btn btn-template-main"><i class="fa fa-search"></i></button>
                                    </span>
                                </div>
                            </form>
                        </div>
                        <!-- // 검색 왜있지? -->
                    </div>

                </div>
            </div>
        </header>
        <!-- // Header -->
<!-- object-fit: cover; 사진 중심에서
    border-radius: 50%; 모양을 둥글게-->		
        <!-- Main Carousel -->
        <section>
            <div id="testRadius"class="home-carousel">
                <div class="container">
                    <div class="homepage owl-carousel">
                        <div class="item">
                            <div class="row">
                                <div class="col-sm-12">
                                    <img class="img-responsive" src="http://artmug.kr/skin/default/img/main/new_main1.jpg?ver=1" alt="">
                                </div>
                            </div>
                        </div>
                         <div class="item">
                            <div class="row">
                                <div class="col-sm-12">
                                    <img class="img-responsive" src="http://artmug.kr/skin/default/img/main/new_main1.jpg?ver=1" alt="">
                                </div>
                            </div>
                        </div>
                         <div class="item">
                            <div class="row">
                                <div class="col-sm-12">
                                    <img class="img-responsive" src="http://artmug.kr/skin/default/img/main/new_main1.jpg?ver=1" alt="">
                                </div>
                            </div>
                        </div>
                    <!-- /.project owl-slider -->
                </div>
            </div>
        </section>

        <!-- // Main Carousel -->
        
        <!-- 선호 작가 -->
        <section class="background-white no-mb">
            <div class="container">
                <div class="col-md-12">
                    <div class="heading">
                        <h2 class="tit1">선호 작가</h2>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="box-image-text blog">
                                <div class="top">
                                    <div class="image">
                                        <img src="http://artmug.kr/image/cate_banner/ED9988ED8E98EC9DB4ECA780EBA994EC9DB8EC84B8EBA19CEC8898ECA095_9.png" alt="" class="img-responsive">
                                    </div>
                                    <div class="bg"></div>
                                    <div class="text">
                                        <p class="buttons">
                                            <a href="#" class="btn btn-template-transparent-primary"><i class="fa fa-link"></i> 커미션 의뢰하기</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6">
                            <div class="box-image-text blog">
                                <div class="top">
                                    <div class="image">
                                        <img src="http://artmug.kr/image/cate_banner/ED9988ED8E98EC9DB4ECA780EBA994EC9DB8EC84B8EBA19CEC8898ECA095_7.png" alt="" class="img-responsive">
                                    </div>
                                    <div class="bg"></div>
                                    <div class="text">
                                        <p class="buttons">
                                            <a href="#" class="btn btn-template-transparent-primary"><i class="fa fa-link"></i> 커미션 의뢰하기</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6">
                            <div class="box-image-text blog">
                                <div class="top">
                                    <div class="image">
                                        <img src="http://artmug.kr/image/cate_banner/ED9988ED8E98EC9DB4ECA780EBA994EC9DB8EC84B8EBA19CEC8898ECA095_10_2.png" alt="" class="img-responsive">
                                    </div>
                                    <div class="bg"></div>
                                    <div class="text">
                                        <p class="buttons">
                                            <a href="#" class="btn btn-template-transparent-primary"><i class="fa fa-link"></i> 커미션 의뢰하기</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6">
                            <div class="box-image-text blog">
                                <div class="top">
                                    <div class="image">
                                        <img src="http://artmug.kr/image/cate_banner/ED9988ED8E98EC9DB4ECA780EBA994EC9DB8EC84B8EBA19CEC8898ECA095_12.png" alt="" class="img-responsive">
                                    </div>
                                    <div class="bg"></div>
                                    <div class="text">
                                        <p class="buttons">
                                            <a href="#" class="btn btn-template-transparent-primary"><i class="fa fa-link"></i> 커미션 의뢰하기</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- // 선호 작가 -->

         <!-- 최신글 -->
         <section class="background-white no-mb">
            <div class="container">
                <div class="col-md-12">
                    <div class="heading">
                        <h2 class="tit1">최신글</h2>
                    </div>
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="box-image-text blog">
                                <div class="top">
                                    <div class="image">
                                        <img src="http://artmug.kr/image/cate_banner/ED9988ED8E98EC9DB4ECA780EBA994EC9DB8EC84B8EBA19CEC8898ECA095_9.png" alt="" class="img-responsive">
                                    </div>
                                    <div class="bg"></div>
                                    <div class="text">
                                        <p class="buttons">
                                            <a href="#" class="btn btn-template-transparent-primary"><i class="fa fa-link"></i> 커미션 의뢰하기</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6">
                            <div class="box-image-text blog">
                                <div class="top">
                                    <div class="image">
                                        <img src="http://artmug.kr/image/cate_banner/ED9988ED8E98EC9DB4ECA780EBA994EC9DB8EC84B8EBA19CEC8898ECA095_7.png" alt="" class="img-responsive">
                                    </div>
                                    <div class="bg"></div>
                                    <div class="text">
                                        <p class="buttons">
                                            <a href="#" class="btn btn-template-transparent-primary"><i class="fa fa-link"></i> 커미션 의뢰하기</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6">
                            <div class="box-image-text blog">
                                <div class="top">
                                    <div class="image">
                                        <img src="http://artmug.kr/image/cate_banner/ED9988ED8E98EC9DB4ECA780EBA994EC9DB8EC84B8EBA19CEC8898ECA095_10_2.png" alt="" class="img-responsive">
                                    </div>
                                    <div class="bg"></div>
                                    <div class="text">
                                        <p class="buttons">
                                            <a href="#" class="btn btn-template-transparent-primary"><i class="fa fa-link"></i> 커미션 의뢰하기</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-sm-6">
                            <div class="box-image-text blog">
                                <div class="top">
                                    <div class="image">
                                        <img src="http://artmug.kr/image/cate_banner/ED9988ED8E98EC9DB4ECA780EBA994EC9DB8EC84B8EBA19CEC8898ECA095_12.png" alt="" class="img-responsive">
                                    </div>
                                    <div class="bg"></div>
                                    <div class="text">
                                        <p class="buttons">
                                            <a href="#" class="btn btn-template-transparent-primary"><i class="fa fa-link"></i> 커미션 의뢰하기</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- // 최신글 -->

        <section class="background-white no-mb">
             <div class="container">
               <div class="row">
                  <div class="col-md-6 col-sm-12">
                      <h3>공지사항<a class="noticeMore" style="float:right;font-size:0.6em;margin-top:15px;color:#C2C2C2">more</a></h3>
                      <ul class="notice1">
					  <% for(int i = 0 ; i < 5 ; i++){%>
						<li>
							<input type="hidden" value="<%=list.get(i).getMb_no()%>">
							<span class="ntTitle">
									<a><%=list.get(i).getBd_title()%> </a></span><span class="ntDate"><%=list.get(i).getBd_date()%>
							</span>
						</li>
						
						
						<%} %>
						 
						
					  </ul>
                  </div> <!--onclick="location.href=''" -->



                  <div id="faqDiv"class="col-md-6 col-sm-12">
                      <h3 class="faqtt" style="display:inline;">고객센터</h3>
					  <div class="faq" onclick="location.href='view/faq_requester.jsp'">의뢰자 FAQ 바로 가기</div>
					  <div class="faq" onclick="location.href='view/faq_artist.jsp'">구매자 FAQ 바로 가기</div>
                  </div>
               </div>
             </div>
        </section>

        <!-- Footer -->
        <footer id="footer">
            <div class="container">
                <div class="col-md-12 col-sm-12">
                    <ul class="footer-link">
                        <li><a href="#">광고상품 안내</a></li>
                        <li><a href="#">자주하는질문</a></li>
                        <li><a href="#">문의게시판</a></li>
                        <li><a href="#">회사소개</a></li>
                        <li><a href="#">이용약관</a></li>
                        <li><a href="#">개인정보취급방침</a></li>
                    </ul>
                    <p><span>주소 : 서울시 강남구 테헤란로 14길</span><span>대표전화 : 02-123-4567</span><span>E-mail : artbridge@artbridge.kr</span></p>
                    <p><span>회사명 : kh정보교육원</span><span>개발자 : 박소진, 최수정, 양소나, 김현도, 이형우, 이혜미</span><span>사업자등록번호 : 123-45-6789</span></p>
                    <p class="copyright">Copyright © 2018 COMVISION Team. All Right Reserved.</p>
                </div>
            </div>
        </footer>
       <!-- // Footer -->

    </div>
    
    
    <script>
		$(function(){
			$(".notice1 li").mouseenter(function(){
				$(this).css({"background":"gray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).css({"background":"white"});
			}).click(function(){
				var num = $(this).children("input").val();
				
				location.href = "<%=request.getContextPath()%>/selectOne.no?num=" + num;
			
			});
		});
		
		 $(function(){
			
			$(".noticeMore").mouseenter(function(){
				$(this).css({ "cursor":"pointer"});
			}).click(function(){
				
				location.href = "<%=request.getContextPath()%>/viewPage.no";
				
			});
		});
	</script>	
	
</body>

</html>