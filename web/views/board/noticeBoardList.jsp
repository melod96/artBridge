<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.comvision.artBridge.board.model.vo.*"%>
    
 	<% ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list"); %> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Art Bridge</title>
 
<%@ include file="/views/common/head.jsp" %>
	
	<style>
	.tableArea{border:1px solid gray;margin-left:auto;margin-right:auto;border-radius:10px;}
	td{border-bottom:1px solid #ddd;}
	th,tr,td{text-align:center;font-size:1.1em;}
	option{align=center;}
	.notice a{color:black;}
    </style>
 
 
</head>
<body>
    <div id="all">
       
        <!-- Header -->
       <%@ include file="/views/common/header.jsp"%>
        <!-- // Header -->

        <section class="tit-area" style="background:#99B5C7"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
            <div class="container">
                <h2 class="tit1">공지사항</h2>
            </div>
            
        </section>

        <!-- contents area -->
        <div class="contents">
            <div class="container">
                <div class="col-md-12">
                    <!-- 이 영역에서 작업하세요 -->
					
					<br><br>
					<select class="form-control input-xshort">
                        <option>글번호순 내림차 정렬</option>
                        <option>작성일순 내림차 정렬</option>
                        <option>조회수순 내림차 정렬</option>
                    </select>
                    <br>
                    
                    
					<div class="tableArea" align="center">
					<br>
						<table align="center" id="listArea" class="notice">
							<tr style="background:#D5DADE;">
								<th width="100px">글번호</th>
								<th width="300px">글제목</th>
								<th width="100px">작성자</th>
								<th width="100px">조회수</th>
								<th width="100px">작성일</th>
							</tr>
							
					 	 <% for(Board b : list){ %>
						
							<tr>
								<td><%= b.getBoard_no()%></td>
								<td><%= b.getBoard_title()%></td>
								<td>관리자</td>
								<td><%= b.getBoard_count()%> </td>
								<td><%=b.getBoard_date()%></td>
							</tr>
						<% } %>

							

						</table>
						<br>
					</div>

					<div class="heading">
                        
                        <br>
                      	<br>
                    </div>
                   <!--페이징-->
                   
                   <div class="paginate">
                        <a href="#" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a>
                        <a href="#" class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a>
                        <span class="paging-numbers">
                        <!--class="on"하면 파란색으로 됨.-->
                            <a href="#">1<span class="blind">페이지로 이동</span></a>
                            <a href="#">2<span class="blind">페이지로 이동</span></a>
                            <a href="#">3<span class="blind">페이지로 이동</span></a>
                            <a href="#">4<span class="blind">페이지로 이동</span></a>
                            <a href="#">5<span class="blind">페이지로 이동</span></a>
                        </span>
                        <a href="#" class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
                        <a href="#" class="btn-last" title="끝"><span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
                    </div>
                    <br><br>
                   
                   <!-- // 이 영역에서 작업하세요 -->
                </div>
            </div>
        </div>
        <!-- // contents area -->

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
		$("#listArea td").mouseenter(function(){
			$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background":"white"});
		}).click(function(){
			console.log($(this).parent().children().eq(0).text());
			var num = $(this).parent().children().eq(0).text();
			
			location.href = "<%=request.getContextPath()%>/selectOne.no	?num=" + num;
		
		});
	});

    
    
	/* 	$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"gray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				var num = $(this).parent().children("input").val();
				
			});
		}); */
	</script>
    
</body>
</html>