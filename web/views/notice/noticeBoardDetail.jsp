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
	#nContent{height:500px;}
	#nContent th{text-align:center;}
	#nHead th{text-align:center;}
	#nHead td{vertical-align:top;}
	#nContent pre{border:0px; background:white;}	
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
					
					<div class="btn-right add-some">
                        
                        
                     </div>
                    <table class="tbl-type01">
                        <colgroup>
                            <col style="width: 20%;">
                            <col style="width: 30%;">
                            <col style="width: 20%;">
                            <col style="width: 30%;">
                        </colgroup>
                        <tbody id="nHead">
                            <tr>
                                <th>글 제목</th>
                                <td colspan="3">
                                   	글의 제목이 들어가는 자리입니다.
                                </td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td>
                                  	뽀짝쓰
                                </td>
                                <th>작성일자</th>
                                <td>
                                   	작성일자가 들어가는 자리입니다.
                                </td>
                            </tr>
                            
                            <tr id="nContent">
                            	 <th>글 내용</th>
                                <td colspan="4">
                                   <pre>
글의 내용이 들어가는 자리입니다.
                                   	
                                   </pre>
                                </td>
                            
                            </tr>
                            
                        </tbody>
                    </table>
					
					
					
					
                   
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