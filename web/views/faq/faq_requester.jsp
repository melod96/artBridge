<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Art Bridge</title>
	<%@ include file="/views/common/head.jsp" %>
<style type="text/css">
	.tableArea{border:1px solid gray;margin-left:auto;margin-right:auto;border-radius:10px;}
	td{border-bottom:1px solid #ddd;}
	th,tr,td{text-align:center;font-size:1.1em;}
	option{align=center;}
	.notice a{color:black;}
	.faq1 li{border-bottom:1px solid #ddd; solid #ddd;padding-top:10px;}
	.ftTitle{color:black;width:70%;height:20px;text-overflow: ellipsis;display:inline-block;overflow: hidden;white-space: nowrap}
	.ftTitle a{color:black;}
	.ntDate{color:gray;font-size:0.9em;float:right;}
	#tTitle1{}
	#select1 td{width:150px;}
	.tbl-type02 td{width:150px;}
	a{color:gray;}
	
	.accordionMenu{
		background:white;
		padding:10px;
		width:500px;
		margin:0;
	}
	.accordionMenu a{
		margin:5px 0;
		padding:0;
	}

	.accordionMenu a{
		font-size:15px;
		display:block;
		font-weight:normal;
		color:#424242;
		margin:0;
		padding:10px;
		background:white;
	}

	.accordionMenu a{
		font-size:15px;
		display:block;
		font-weight:normal;
		color:#424242;
		margin:0;
		padding:10px;
		-webkit-border-radius:5px;
		-moz-border-radius:5px;
		}

	.accordionMenu :target a,
	.accordionMenu a:focus,
	.accordionMenu a:hover,
	.accordionMenu td:active {
		color:black;
	}

	#acP1 {
		padding:0 10px;
		margin:0;
		height:0;
		overflow:hidden;
		-moz-transition:height 0.5s ease-in;
		-webkit-transition:height 0.5s ease-in;
		-o-transition:hegith 0.5s ease-in;
		transition:height 0.5s ease-in;
	}

	.accordionMenu :target #acP1{
		overflow: auto;
		height:100px;
	}
</style>
</head>
<body>
    <div id="all">
       
        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
        <!-- // Header -->

		<section class="tit-area" style="background:#D4A190"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
            <div class="container"><!--작가 faq : #D4A190-->
                <h2 class="tit1">자주하는 질문</h2>	
                <ul class="tab-menu">
                    <li ><a href="#"style="background:white;color:gray;">이용자FAQ</a></li>
                    <li><a href="faq_artist.jsp">작가FAQ</a></li>
                </ul>
            </div>
        </section>

        <!-- 주석 영역 -->
        <div class="contents">
            <div class="container">
                <div class="col-md-12">
                    <!-- 이 영역에서 작업하세요 -->
					
					<br><br>
					 <div class="col-md-12 col-sm-12">
					
					 	
					 	
					  <table class="tbl-type02">
                        <colgroup>
                            <col style="width: 8%;">
                            <col style="width: 10%;">
                            <col style="width: 15%;">
                            <col style="width: 13%;">
                            <col style="width: 15%;">
                            <col style="width: *;">
                        </colgroup>
                        <thead>
                        
                        	<!-- <tr id="select1">
					 			<td colspan="8" style="border-bottom:0px;padding-bottom:15px;">
					 			<a href="">전체</a>&nbsp;&nbsp;||&nbsp;&nbsp;<a href="">의뢰</a>&nbsp;&nbsp;||&nbsp;&nbsp;
					 			<a href="">결제</a>&nbsp;&nbsp;||&nbsp;&nbsp;<a href="">마이페이지</a>&nbsp;&nbsp;||&nbsp;&nbsp;
					 			<a href="">가입 및 탈퇴</a>&nbsp;&nbsp;||&nbsp;&nbsp;<a href="">기타</a>
					 		</tr>
					 	
					 		<tr>
					 		<td colspan="4" style="border-top:0px;padding-bottom:40px;"><form><input id="seBox" type="search" style="display: inline-block;"> <button for="seBox"type="submit" class="btn btn-primary btn-sm" style=" display: inline-block;">검색</button></form></td>
					 		</tr> -->
                        	
                        	
                        	
                            <tr id="tTitle1">
                                <th scope="col">글 번호</th>
                                <th scope="col" colspan="8">글 제목</th>
                            </tr>
                            
                        </thead>
                         <tbody>
                        
                            <tr class="accordionMenu">
                                <td >1</td>
									<td colspan="8"id="aco1"><a href="#aco1">의뢰</a>
									
										<p id="acP1">아  이렇게 날씨도 좋은데 오늘은 양심적으로 한강 가야되는거 아닙니까? .1</p>
									</td>
											
								</tr>
								
								 <tr class="accordionMenu">
                                <td >2</td>
									<td colspan="8"id="aco2"><a href="#aco2">결제</a>
									
										<p id="acP1">아 오늘은 이렇게 날씨도 좋은데 양심적으로 한강 가야되는거 아닙니까? .2</p>
									</td>
											
								</tr>
								
								 <tr class="accordionMenu">
                                <td >3</td>
									<td colspan="8"id="aco3"><a href="#aco3">마이페이지</a>
									
										<p id="acP1">아 오늘은 날씨도 이렇게 좋은데 양심적으로 한강 가야되는거 아닙니까? .3</p>
									</td>
											
								</tr>
								
								<tr class="accordionMenu">
								<td >4</td>
									<td colspan="8"id="aco4"><a href="#aco4">가입 및 탈퇴</a>
									
										<p id="acP1">아 오늘은 날씨도 이렇게 좋은데 양심적으로 한강 가야되는거 아닙니까? .3</p>
									</td>
											
								</tr>
								
								<tr class="accordionMenu">
								<td >5</td>
									<td colspan="8"id="aco5"><a href="#aco5">기타</a>
									
										<p id="acP1">아 오늘은 날씨도 이렇게 좋은데 양심적으로 한강 가야되는거 아닙니까? .3</p>
									</td>
											
								</tr>
								
                        </tbody>
                    </table>
                    <br><br><Br>
                  </div>
                    <br><br>
                   
                   <!-- // 이 영역에서 작업하세요 -->
                </div>
            </div>
        </div>
        <!-- // 주석 영역 -->

        <!-- Footer -->
        <%@ include file="/views/common/footer.jsp" %>
       <!-- // Footer -->

    </div>
</body>
</html>