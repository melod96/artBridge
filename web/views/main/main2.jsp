<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.comvision.artBridge.files.model.vo.*, com.comvision.artBridge.admin.model.vo.*"%>
    
    
<%
	ArrayList<Files> slidelist = null;
	ArrayList<Files> bestWriterList = null;
	ArrayList<Files> newList = null;
	ArrayList<Notice> noticeList = null;
	
	if((ArrayList<Files>)request.getAttribute("slidelist") != null){
		slidelist = (ArrayList<Files>)request.getAttribute("slidelist");
	}
	
	if((ArrayList<Files>)request.getAttribute("bestWriterList") != null){
		bestWriterList= (ArrayList<Files>)request.getAttribute("bestWriterList");
	}
		
	if((ArrayList<Files>)request.getAttribute("newList") != null){
		newList= (ArrayList<Files>)request.getAttribute("newList");
	}

	if((ArrayList<Notice>)request.getAttribute("noticeList") != null){
		noticeList= (ArrayList<Notice>)request.getAttribute("noticeList");
	}



%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Art Bridge</title>
	<%@ include file="/views/common/head.jsp" %>
	
	<!-- 180929 sona 추가 -->
	<!-- 아래 파일들도 올렸으니까 경로 잘 맞춰서 올려줘! 저거 없으면 안돌아감~~ -->
	<link rel="stylesheet" type="text/css" href="/artBridge/css/slick.css"/>
	<link rel="stylesheet" type="text/css" href="/artBridge/css/slick-theme.css"/>
	<script type="text/javascript" src="/artBridge/js/slick.min.js"></script>
	<!-- // 180929 sona 추가 -->
	
	<style>
	.row{padding-bottom:70px;}
	
	.noticeArea{width:500px;height:300px;padding-top:60px;display:inline-block;padding-left:20px;}
	.noticeArea h5{padding-left:25px;padding-top:14px;background:#3446d1;color:white;height:40px;
					border-radius:30px;}
	
	.notice1 li{border-bottom:1px solid #ddd; solid #ddd;padding-top:10px;}
	.ntTitle{color:black;width:70%;height:20px;text-overflow: ellipsis;display:inline-block;overflow: hidden;white-space: nowrap}
	.ntTitle a{color:black;}
	.ntDate{color:gray;font-size:0.9em;float:right;}
	
	#faqDiv{ padding-right:70px;float:right;padding-top:78px;}
	.faq{width:450px; height:45px; border:2px solid white;cursor: pointer; margin:40px;margin-left:20px;text-align:center;padding-top:13px;
			border-radius:50px;}
	#testRadius{border-radius:50%;}
	.faqtt{padding-left:30px;}
	
	
	.container{width:1100px;}
	#carousel-example-generic{width:1110px;}
	.item{margin-right:auto;margin-left:auto;width:1110px;height:480px;}	
	body{background-image:url("/artBridge/image/mainContent/slide/back02.png");/* background-size:contain; */background-size:100% 100%;background-repeat: no-repeat}
	.item img{margin-top:0px;margin-bottom:40px;margin-right:auto;margin-left:auto;
	width: auto; height: auto;
    max-width: 1110px;
    max-height: 480px;}
    .bestH{margin-top:0px;margin-bottom:0px;}
	
	
	.carousel-inner{margin-top:0px;}
	
	
	.box-wrap {
			width:1140px;
			height: 300px;
			display: flex;
			align-items: center;
			justify-content: center;
			margin-left:auto; margin-right:auto; margin-top:110px;
			padding-right:23px;
		}
		.box {
			position: relative;  
			margin:30px; 
			box-shadow: 1px 1px 3px rgba(0,0,0,0.3); 
			cursor: pointer; 
			overflow: hidden; 
			width:250px; height: 301px; 
			padding:0px;
			border:3px solid #ddd;
			
			
		}
		.img {width: 250px; height: 301px;margin-right:auto;margin-left:auto;}
		.box img {
			margin-right:auto;margin-left:auto;	
			display: block; 
			width: 250px; 
			height: 301px;
			/* max-width:300px;
			max-height:330px; */
			/* position: absolute;  */
			z-index: 10;
			transform: translatey(0px)
			z-index: 30;
			transition: all 0.35s ease-in-out;
			
		}
		.box .info {
			opacity:0; visibility:visible; z-index: 50;
			position: absolute; left: 50%; top:50%; 
			transform: translate(-50%, -50%);
			
			
			text-align: center;
			transition: all 0.35s ease-in-out; 
		}
		.box .info p{color:white;background:gray;opacity:0.8;border-radius:7px;width:150px;height:25px;padding-top:3px;}
		.box .info h3 {
			font-size:28px; padding-bottom: 3px; opacity:0.8; color:lightblack;background:lightgray;
			border-bottom-right-radius:7px; border-top-left-radius:7px; 
		}
		.box:before{
			content: '';
			width: 500px; height: 500px; 
			background:rgba(0,0,0,0.7);
			position: absolute; z-index:40;
			top: 0; right: 0; left: 0;/*원래 여기 left가 auto, 밑에꺼가 0;이였음*/
			transform-origin: 100% 0;
			transform: rotate(52.5deg) translatex(-280px);
			transition: all 0.35s ease-in-out;
		}
		.box:after {
			content: '';
			width: 500px; height: 500px; 
			background:rgba(0,0,0,0.7);
			position: absolute; z-index:40;
			bottom: 0; right: 0; left: auto;
			transform-origin: 0 100%;
			transform: rotate(52.5deg) translatex(280px);
			transition: all 0.35s ease-in-out;
		}
		.box:hover .info {
			opacity:1; visibility: visible; 
		}
		.box:hover:before {
			transform: rotate(53.1deg) translatex(0px);
		}
		.box:hover:after {
			transform: rotate(53.1deg) translatex(0px);
		}
		.back img{width:1110px; height:1000px;opacity:0.8;}
	
		.popArea{align:center; width:1075px;margin-left:50px;width:210px;height:50px;border:1px solid black ;margin-top:160px;
				margin-bottom:-50px;}
		#popA{margin-top:10px;}
		
		.bestArtist{ width:1200px; height: 500px; margin-left:auto;margin-right:auto;margin-top:100px;}
		.newContent{ width:1200px; height: 500px; margin-left:auto;margin-right:auto;margin-top:-50px;}
		
		/* 180929 sona 추가 */
		.slider-area1{width:1070px; margin:0 auto;} 
		/* 슬릭슬라이더 스타일 */
		.slider-area{width:1070px; margin:0 auto;}
		.slider-area .inner li{text-align:center;padding-top: 25px;}
		.slider-area .name{margin-top:10px; font-size:15px; font-weight:bold;}
		.slick-slide img{width:65%; margin:0 auto; margin-top:60px;}
		.slick-slide.slick-current img{width:100%; margin-top:0;}
		.slick-slide.slick-current .name{font-size:20px;}
		/* // 180929 sona 추가 */
		
		.draggable{height:550px;}
		.ntNFaq{margin-top:-100px;}
	/* 	.slick-dots{position:relative; top:50px;} */
		 .slider-area1{height:580px;}
		
		/* .particule {
			  position: absolute;
			  top: 50%;
			  left: 50%;
			  width: 1rem;
			  height: 1rem;
			  margin: -.5rem 0 0 -.5rem;
			  border: 1px solid currentColor;
			  transform: scale(0);
			} */
			
		.slick-dots li button:before{background-image:url("/artBridge/image/mainContent/slide/back02.png");font-size:0px; border-radius : 75%; width:12px; height:12px;}
		.slick-prev:before{font-size:50px; content:"◀";position:relative; left:-30px;}
		.slick-next:before{font-size:50px; content:"▶";}
		
</style>
	
</head>
<body>


<!--  -->

    <div id="all">
       
        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
        <!-- // Header -->

<br><br><br><br>
<!--
	180929 sona 추가
-->


	<script>
    $(document).ready(function(){
    	$('.slider-area .inner').slick({
    			autoplay: true,
    			arrows: true,
    			dots: true,
    			centerMode: true,
    		  centerPadding: '50px',
    		  slidesToShow: 3,
    		  responsive: [
    		    {
    		      breakpoint: 768,
    		      settings: {
    		        arrows: false,
    		        centerMode: true,
    		        centerPadding: '40px',
    		        slidesToShow: 3
    		      }
    		    },
    		    {
    		      breakpoint: 480,
    		      settings: {
    		        arrows: false,
    		        centerMode: true,
    		        centerPadding: '40px',
    		        slidesToShow: 1
    		      }
    		    }
    		  ]
    		});
	    });
	  </script>
	  
	  
	  <!-- // 180929 sona 추가 -->

		<div class="slider-area1">
			<h2 class="bestH" style="margin-left: 75px; margin-bottom: 25px;">Best 작품 추천</h2>


			<div class="slider-area">

				<ul class="inner">
						
					<%
						if ((ArrayList<Files>) request.getAttribute("slidelist") != null) {
							for (Files f : slidelist) {
					%>
					<li class="bestH" onclick="selectOneSale(this);">
						<input type="hidden" value=<%=f.getBoard_no()%>>
						<img src="/artBridge/image/mainContent/slide/<%=f.getChange_title()%>">
						<p class="name"><%=f.getMem_name()%></p>
						<p class="txt"><%=f.getBoard_title()%></p>
					</li>
					<%
							}
						}
					%>
					
						
				</ul>
			</div>
		</div>



		<!--인기 작가 영역-->
<section name="bbox">
<div class="bestArtist">
		<h3 style="margin-left:155px; margin-bottom:-75px;">인기작가추천</h3>

<div class="box-wrap">
	<% if((ArrayList<Files>)request.getAttribute("bestWriterList") != null){
		for(Files bf : bestWriterList){
		
	%>
			<div class="box" onclick="bestArtist(this);">
				<input type = "hidden" value = <%= bf.getMem_no()%>>
				<div class="img"><img src="/artBridge/image/profile/<%=bf.getChange_title()%>" alt=""></div>
				<div class="info">
					<h3><%=bf.getMem_name() %></h3>
					<p class="goProfile">작가프로필로 이동<input type="hidden" value=<%=bf.getMem_no()%>></p>
					<!-- 스크립트로 goProfile click 시 location.href로 작가 프로필로 연결 해당 사진의 member_no까지 전달-->
				</div>
			</div>
	
	<%}} %>
		
		
	</div>	
	</div>
</section>






<!--최신 글 영역-->
<section name="bbox">
<div class="newContent">
	<h3 style="margin-left:155px; margin-bottom:-75px;">최신글</h3>
<div class="box-wrap">
			<%if((ArrayList<Files>)request.getAttribute("newList") != null){
				for (Files nl : newList) {
			%>
			<div class="box" onclick="newContent(this);">
				<input type = "hidden" value = <%= nl.getBoard_no()%>>
				<div class="img"><img src="/artBridge/image/thumbnail_upload/<%=nl.getChange_title()%>"	alt="">	</div>
				<div class="info">
						<h3><%=nl.getBoard_title()%></h3>
						<p class="goBoard">
							작가 글로 이동<input type="hidden" value=<%=nl.getBoard_no()%>>
						</p>
					<!-- 스크립트로 goProfile click 시 location.href로 작가 프로필로 연결 해당 사진의 member_no까지 전달-->
				</div>
			</div>

			<%}} %>

	</div>	
	</div>
</section>




<script>
	function selectOneSale(is){
		location.href = "/artBridge/selectOneSalepage.bo?num=" + $(is).children().eq(0).val();
		
	};
	
	function bestArtist(is){
		location.href = "/artBridge/selectPieceList.wr?memberNo=" + $(is).children().eq(0).val();
	};
	
	function newContent(is){
		location.href = "/artBridge/selectPieceList.wr?memberNo=" + $(is).children().eq(0).val();
	};

	$(function (){
		$(".bestH").mouseenter(function(){
			$(this).css({"cursor" : "pointer"});
		});
	});
	
</script>






	<section class="background-white no-mb">
	<div class= "ntNFaq">
             <div class="container">
            
               <div class="row">
                              
              <!--공지사항 : 주석처리 해제하면 됨.--> 
                  <div class="noticeArea">
                      <h5>아트브릿지 공지사항<a class="noticeMore" style="float:right;font-size:0.8em;margin-top:auto;margin-bottom:auto;margin-right:15px;color:#F2F2F2;">more</a></h5>
                      <ul class="notice1">
						

						<%if((ArrayList<Notice>)request.getAttribute("noticeList") != null){
                      		for (Notice ntl : noticeList) {
                     	 %>
						
						<li>
							<input type="hidden" value=<%=ntl.getnNo() %>>
							<span class="ntTitle">
									<a class="ntTitleTag"><%=ntl.getnTitle() %><input type="hidden" value="<%=ntl.getnNo()%>"></a></span><span class="ntDate"><%=ntl.getnDate()%>
							</span>
						</li>
						
						<%
							}}
						%>

						
						
					  </ul>
                  </div>

			<!--/공지사항-->
			
			<!--고객센터-->
                  <div id="faqDiv">
                      <div class="faqtt"><h3 style="display:inline;">고객센터</h3></div>
					  <div class="faq" onclick="location.href='/artBridge/views/faq/faq_requester.jsp'">의뢰자 FAQ 바로 가기</div>
					  <div class="faq" onclick="location.href='/artBridge/views/faq/faq_artist.jsp'">구매자 FAQ 바로 가기</div>
                  </div>
           <!--/고객센터-->
			
			
                  
                  
               </div>
               
               
             </div>
             </div>
        </section>

        <!-- Footer -->
        <%@ include file="/views/common/footer.jsp" %>
       <!-- // Footer -->

    </div>







	<script>
	   		 $(function(){
			
				$(".noticeMore").mouseenter(function(){
					$(this).css({ "cursor":"pointer"});
				}).click(function(){
				
					location.href = "/artBridge/selectList.nb";
	
					});
				});
	   		 
	   		 $(function(){
	 			
					$(".ntTitleTag").mouseenter(function(){
						$(this).css({ "cursor":"pointer"});
					}).click(function(){
						var num = $(this).children().val();
					
						location.href = "/artBridge/selectDetail.nb?num="+num;
		
						});
					});
	   		 
	   		 
	</script>
















</body>
</html>
