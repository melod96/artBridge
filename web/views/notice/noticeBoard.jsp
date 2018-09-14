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
</style>
</head>
<body>
    <div id="all">
       
        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
        <!-- // Header -->

		<section class="tit-area" style="background:#99B5C7"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
            <div class="container">
                <h2 class="tit1">공지사항</h2>
            </div>
        </section>

        <!-- 주석 영역 -->
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
							
							<tr>
								<td>1</td>
								<td><a href="noticeBoardDetail.jsp">공지글1</a></td>
								<td>관리자</td>
								<td>0</td>
								<td>--</td>
							</tr>

							<tr>
								<td>1</td>
								<td><a>공지글1</a></td>
								<td>관리자</td>
								<td>0</td>
								<td>--</td>
							</tr>
							

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
        <!-- // 주석 영역 -->

        <!-- Footer -->
        <%@ include file="/views/common/footer.jsp" %>
       <!-- // Footer -->

    </div>
</body>
</html>