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
	.notice1 li{border-bottom:1px solid #ddd; solid #ddd;padding-top:10px;}
	.ntTitle{color:black;width:70%;height:20px;text-overflow: ellipsis;display:inline-block;overflow: hidden;white-space: nowrap}
	.ntTitle a{color:black;}
	.ntDate{color:gray;font-size:0.9em;float:right;}
	
	#faqDiv{ padding-left:30px;float:right;padding-top:78px;}
	.faq{width:500px; height:45px; border:2px solid #ddd;cursor: pointer; margin:40px;margin-left:20px;text-align:center;padding-top:13px;
			border-radius:50px;}
	#testRadius{border-radius:50%;}
	.faqtt{padding-left:30px;}
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
					<!-- class="carousel-inner" : 없으면 이미지 3장이 모두 세로로 배치된다. 
             -->


					<div class="item active">
						<img src="/artBridge/image/member01.png" alt="First slide">
						<!-- 캡션 넣고 싶을 때 아래 4줄 추가하면 된다. 캡션은 자동 중앙 정렬된다. -->
						<!--  <div class="carousel-caption">
                        <h3>슬라이드 효과 </h3>
                        <p>캡션 내부에는 HTML 태그 사용 가능합니다.</p>
                     </div>  -->
					</div>



					<div class="item">
						<img src="/artBridge/image/member02.png" alt="Second slide">
					</div>



					<div class="item">
						<img src="/artBridge/image/member03.png" alt="Third slide">
					</div>


					<div class="item">
						<img src="/artBridge/image/member04.png" alt="fourth slide">
					</div>



					<div class="item">
						<img src="/artBridge/image/member05.png" alt="fifth slide">
					</div>



					<div class="item">
						<img src="/artBridge/image/member06.png" alt="sixth slide">
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









	<section class="background-white no-mb">
             <div class="container">
               <div class="row">
                              
              <!--공지사항 : 주석처리 해제하면 됨.--> 
                  <div class="noticeArea">
                      <h3>공지사항<a class="noticeMore" style="float:right;font-size:0.6em;margin-top:15px;color:#C2C2C2">more</a></h3>
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
                      <h3 class="faqtt" style="display:inline;">고객센터</h3>
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
				
					location.href = "/artBridge/views/notice/noticeBoard.jsp";
	
					});
				});
	</script>
















</body>
</html>