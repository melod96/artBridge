<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%
	ArrayList<String> list = null; 
	if((ArrayList<String>)request.getAttribute("idList") != null){
		list = (ArrayList<String>)request.getAttribute("idList");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Art Bridge</title>
	<%@ include file="/views/common/head.jsp" %>
<style>
.tbl-type03 {width:500px; border-bottom:1px solid #aaa;}
.tbl-type03 thead th, .tbl-type03 tbody th, .tbl-type03 tbody td {text-align:center; padding:12px 5px; color:#3e3d3c; border-top:1px solid #aaa; border-right:1px solid #aaa;}
.tbl-type03 thead th:first-child,.tbl-type03 tbody th:first-child,.tbl-type03 tbody td:first-child {border-left:1px solid #aaa;}
.tbl-type03 th {font-weight:bold; background:#f7f7f7;}
.tbl-type03 .txt-fl{text-align:left; padding-left:10px;}
.tbl-type03 a{text-decoration:underline;}
</style>
</head>
<body>
    <div id="all">
       
        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
        <!-- // Header -->

        <!-- subHeader -->
		<section class="tit-area bg-yellow"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
			<div class="container">
	        	<h2>아이디 찾기</h2>       
	     	</div>
	    </section>
        <!-- //subHeader -->

        <!-- 주석 영역 -->
        <div class="contents" align="center">
			<!-- contents 필수 사용 -->
			<div class="container">
				<!-- container 필수 사용 -->
				<div class="col-md-12">
	
					<br />
					<% if(list.size() > 0){ %>
					<div class="heading">
                        <h2 class="tit1">잃어버린 아이디를 찾아왔어요!</h2>
                    </div>
                    <br /><br />
                    <table class="tbl-type03">
                    	<tr>
                    		<th>번호</th>
                    		<th>아이디</th>
                    	</tr>
                    	<% for(int i = 0; i < list.size(); i++){ %>
                    		<tr>
                    			<td><%= i + 1 %></td>
                    			<td><%= list.get(i) %></td>
                    		</tr>
                    	<% } %>
                    </table>
                    <% }else{ %>
                    <div class="heading">
                        <h2 class="tit1">조회된 결과가 없어요 ㅠ</h2>
                    </div>
                    <% } %>
                    
                    <br />
					<br />
					<br />
                    
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