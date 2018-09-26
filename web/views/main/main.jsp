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
	.row{padding-bottom:70px;}
	
	.noticeArea{width:500px;height:300px;padding-top:60px;display:inline-block;padding-left:20px;}
	.noticeArea h5{padding-left:25px;padding-top:14px;background:#3446d1;color:white;height:40px;
					border-radius:30px;}
	.noticeArea 
	
	.notice1 li{border-bottom:1px solid #ddd; solid #ddd;padding-top:10px;}
	.ntTitle{color:black;width:70%;height:20px;text-overflow: ellipsis;display:inline-block;overflow: hidden;white-space: nowrap}
	.ntTitle a{color:black;}
	.ntDate{color:gray;font-size:0.9em;float:right;}
	
	#faqDiv{ padding-right:70px;float:right;padding-top:78px;}
	.faq{width:450px; height:45px; border:2px solid white;cursor: pointer; margin:40px;margin-left:20px;text-align:center;padding-top:13px;
			border-radius:50px;}
	#testRadius{border-radius:50%;}
	.faqtt{padding-left:30px;}
	
	
	.container{}
	#carousel-example-generic{width:1110px;}
	.item{margin-right:auto;margin-left:auto;width:1110px;height:480px;}	
	body{background-image:url("/artBridge/image/mainContent/slide/7.png");background-size:contain;/* background-size:100% 100%;background-repeat: no-repeat */}
	.item img{margin-top:80px;}
	
	
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
			width:330px; height: 371px; 
			
			
		}
		.box img {
			width: 330px; display: block; 
			height:350px;
			position: absolute; 
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
</style>
	
</head>
<body>
    <div id="all">
       
        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
        <!-- // Header -->

<br><br><br><br>
             

        <!-- // Main Carousel -->

		<div class="container">
			
			<div id="carousel-example-generic" class="carousel slide">
				<!--
            id="carousel-example-generic" 없으면 다음 페이지로 안넘어간다.
            class="carousel":이미지 양쪽의 화살표 보이게 하는것
                (화살표 없어도 그 부근 클릭하면 넘어간다.이 줄 없으면 아래 동그란 인티케이터도 안나타난다.) 
                 slide 없으면 슬라이드 효과 없이 그냥 이미지가 나타난다. 
                -->

				<!-- Indicators(이미지 하단의 동그란것->class="carousel-indicators") -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					<li data-target="#carousel-example-generic" data-slide-to="3"></li>
					<li data-target="#carousel-example-generic" data-slide-to="4"></li>
					<li data-target="#carousel-example-generic" data-slide-to="5"></li>
				</ol>
				<!-- 
                위의 data-slide-to가 0 2 2이면 두번째 동그라미 클릭해도 3번째 이미지가 나온다. 
                0 2 5이면 세번째 동그라미 클릭해도 아무 반응이 없다. 
                Indicators는 이미지 갯수와 같게 만들어야 한다. 
            -->
				<!-- Carousel items -->
				<div class="carousel-inner">
				<!-- <div class="back" style="width:0px;height:0px;"><img src="/artBridge/image/mainContent/slide/back01.jpg"></div> -->
				
					<!-- class="carousel-inner" : 없으면 이미지 3장이 모두 세로로 배치된다. 
             -->
				<!--메인 best ajax-->
				<script>
				
					<%-- $(function() {

						$.ajax({
							url : "bestLoad",
							type : "get",
							success : function(data) {
								for(var key in data){
								
								var $carousel = $(".carousel-inner");
								
								var $div = $("<div class='item'>");
								var $img = $("<img src='/artBridge/image/mainContent/slide/" + data[key].change_title + " alt='Second slide'>");
								console.log(key);
								/* var $img2 = $("<img src='/artBridge/image/mainContent/slide/" + data[key].change_title + " alt='Second slide'>");
								var $img2 = $("<img src='/artBridge/image/mainContent/slide/" + data[key].change_title + " alt='Second slide'>");
								var $img2 = $("<img src='/artBridge/image/mainContent/slide/" + data[key].change_title + " alt='Second slide'>");
								var $img2 = $("<img src='/artBridge/image/mainContent/slide/" + data[key].change_title + " alt='Second slide'>"); */
								<img id='mainBest' src='/artBridge/image/mainContent/slide/<%=data[key].change_title%>'>
								
								$div.append($img);
								$carousel.append($div);
								
								}
								
							},
							error : function() {
								console.log("에러");
							}

						});
					}); --%>
				</script>
				
					<div class="item active">
						<%-- <img id="img-change" src="<%=request.getContextPath()%>/image/profile/<%=profileImg.getChange_title()%>"> --%>
						<img src="/artBridge/image/mainContent/slide/member01.png" alt="First slide">
						<!-- 캡션 넣고 싶을 때 아래 4줄 추가하면 된다. 캡션은 자동 중앙 정렬된다. -->
						<!--  <div class="carousel-caption">
                        <h3>슬라이드 효과 </h3>
                        <p>캡션 내부에는 HTML 태그 사용 가능합니다.</p>
                     </div>  -->
					</div>
					

				</div>
				


				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic"
					data-slide="prev"> <span class="icon-prev"></span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					data-slide="next"> <span class="icon-next"></span>
				</a>
			</div>
		</div>

		<script>
			/* 자동으로 5초의 지연시간이 설정되어 있는데 아래와 같이 바꿀수 있다. 
			아래 코드 쓰려면 위 코드 지워야 한다.  */
			/* 
			$('.carousel').carousel({
			    interval: 1000
			}); 
			 */
		</script>






<!--인기 작가 영역-->
<section name="bbox">


<div class="box-wrap">
		
	
		<div  class="box">
			
			<div class="img"><img src="/artBridge/image/mainContent/artist/5.png" alt=""></div>
			<div class="info">
				<h3>래기쓰</h3>
				<p>작가프로필로 이동</p>
			</div>
		</div>
		
		<div class="box">
			<div class="img"><img src="/artBridge/image/mainContent/artist/6.png" alt=""></div>
			<div class="info">
				<h3>뽀짝쓰</h3>
				<p >작가프로필로 이동</p>
			</div>
		</div>
		
		<div  class="box">
			<div class="img"><img src="https://tistory4.daumcdn.net/tistory/2141493/skin/images/simg06.png" alt=""></div>
			<div class="info">
				<h3>뽀시쓰</h3>
				<p>작가프로필로 이동</p>
			</div>
		</div>
	</div>	
</section>






<!--최신 글 영역-->
<section name="bbox">
<div class="box-wrap">
		<div class="box">
			<div class="img"><img src="/artBridge/image/mainContent/sale/2.png" alt=""></div>
			<div class="info">
				<h3>Title</h3>
				<p >작가 글로 이동</p>
			</div>
		</div>
		
		<div class="box">
			<div class="img"><img src="/artBridge/image/mainContent/sale/3.png" alt=""></div>
			<div class="info">
				<h3>Title</h3>
				<p >작가 글로 이동</p>
			</div>
		</div>
		
		<div class="box">
			<div class="img"><img src="/artBridge/image/mainContent/sale/4.png" alt=""></div>
			<div class="info">
				<h3>Title</h3>
				<p >작가 글로 이동</p>
			</div>
		</div>
	</div>	
</section>










	<section class="background-white no-mb">
             <div class="container">
               <div class="row">
                              
              <!--공지사항 : 주석처리 해제하면 됨.--> 
                  <div class="noticeArea">
                      <h5>아트브릿지 공지사항<a class="noticeMore" style="float:right;font-size:0.8em;margin-top:auto;margin-bottom:auto;margin-right:15px;color:#F2F2F2;">more</a></h5>
                      <ul class="notice1">
                      
                      
                     	 <li>
							<input type="hidden" value="공지글 번호">
							<span class="ntTitle">
									<a>공지글 제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</a></span><span class="ntDate">공지글 작성일
							</span>
						</li>
						
						 <li>
							<input type="hidden" value="공지글 번호">
							<span class="ntTitle">
									<a>공지글 제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</a></span><span class="ntDate">공지글 작성일
							</span>
						</li>
						
						 <li>
							<input type="hidden" value="공지글 번호">
							<span class="ntTitle">
									<a>공지글 제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</a></span><span class="ntDate">공지글 작성일
							</span>
						</li>
						
						 <li>
							<input type="hidden" value="공지글 번호">
							<span class="ntTitle">
									<a>공지글 제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</a></span><span class="ntDate">공지글 작성일
							</span>
						</li>
						
						 <li>
							<input type="hidden" value="공지글 번호">
							<span class="ntTitle">
									<a>공지글 제목ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ</a></span><span class="ntDate">공지글 작성일
							</span>
						</li>
						
						
						
						
					  <%-- <% for(int i = 0 ; i < 5 ; i++){%>
						<li>
							<input type="hidden" value="<%=list.get(i).getMb_no()%>">
							<span class="ntTitle">
									<a><%=list.get(i).getBd_title()%> </a></span><span class="ntDate"><%=list.get(i).getBd_date()%>
							</span>
						</li>
						
						
						<%} %> --%>
						 
						
						
					  </ul>
                  </div> <!--onclick="location.href=''" -->

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
	</script>
















</body>
</html>
