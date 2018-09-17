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
      .heading{margin-bottom:20px !important;}
      .btn-center{margin-bottom:50px;}
      .cont-area{min-height:200px;}
    </style>
</head>
<body>
    <div id="all">
       
        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
        <!-- // Header -->

        <!-- 주석 영역 -->
        <section class="tit-area bg-yellow"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
            <div class="container">
                <h2>서브페이지 타이틀</h2>
            </div>
        </section>

        <!-- contents area -->
        <div class="contents">
            <div class="container">
                <div class="col-md-12">
                    
                    <div class="heading">
                      <h2 class="tit1">공지사항</h2>
                    </div>
                    <table class="tbl-type01">
                        <colgroup>
                            <col style="width: 200px;">
                            <col style="width: *">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>제목</th>
                                <td>
                                	<div>제목영역테스트</div>
                                </td>
                            </tr>
                            <tr>
                            	<td colspan="2">
                            		<div class="cont-area">제목영역테스트제목영역테스트제목영역테스트</div>
                            	</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="btn-center">
                      <button type="reset" class="btn btn-primary btn-lg" onclick="location.href='<%=request.getContextPath()%>/selectNoticeList.no'">목록</button>
                    </div>

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