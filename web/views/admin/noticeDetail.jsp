<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.comvision.artBridge.admin.model.vo.Notice"%>
<% Notice n = (Notice)request.getAttribute("n"); %>
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
      .cont-area{min-height:200px; padding:30px;}
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
                <h2>관리자 페이지</h2>
                <ul class="tab-menu">
                    <li><a href="/artBridge/views/admin/mainAdmin.jsp">메인 관리</a></li>
                    <li><a href="/artBridge/views/admin/commissionAdmin.jsp">커미션 관리</a></li>
                    <li><a href="/artBridge/views/admin/customerQna.jsp">고객문의 관리</a></li>
                    <li><a href="/artBridge/views/admin/memberAdmin.jsp">회원 관리</a></li>
                    <li><a href="/artBridge/views/admin/transactionAdmin.jsp">거래내역 관리</a></li>
                    <li><a href="<%=request.getContextPath()%>/selectNoticeList.no" style="background:orangered; color:white;">공지사항</a></li>
                </ul>
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
                            <col style="width: 500px;">
                            <col style="width: 200px;">
                            <col style="width: *">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>제목</th>
                                <td colspan="3">
                                	<div><%= n.getnTitle() %></div>
                                </td>
                            </tr>
                            <tr>
                            	<th>등록일</th>
                            	<td><%= n.getnDate() %></td>
                            	<th>조회수</th>
                            	<td><%= n.getnCount() %></td>
                            </tr>
                            <tr>
                            	<td colspan="4">
                            		<div class="cont-area"><%= n.getnContent() %></div>
                            	</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="btn-center">
                    	<button type="submit" class="btn btn-default btn-lg" onclick="location.href='<%=request.getContextPath()%>/updateViewNotice.no?num=<%= n.getnNo() %>'">수정</button>
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