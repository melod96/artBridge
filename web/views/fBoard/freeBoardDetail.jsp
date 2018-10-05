<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.comvision.artBridge.fBoard.model.vo.FreeBoard"%>
<%
Member m = null;
if (session.getAttribute("loginUser") != null) {
   m = (Member) session.getAttribute("loginUser");
}
FreeBoard f = (FreeBoard)request.getAttribute("f"); %>
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

         <section class="tit-area" style="background:#bb85cf">
            <div class="container">
                <h2 class="tit1">자유게시판</h2>
            </div>
        </section>

   <form action="<%=request.getContextPath()%>/updateFree.fb?num=<%= f.getBoard_no() %>" method="post">
   
   		 <%-- <input type = "hidden" value= "<%= f.getBoard_title() %>" name="board_title">
   		<input type = "hidden" value= "<%= f.getBoard_content() %>" name="board_content"> --%>

        <div class="contents">
            <div class="container">
                <div class="col-md-12">
                    
                    <div class="heading">
                      <h2 class="tit1">자유게시판</h2>
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
                                <td>
                                   <div><%= f.getBoard_title() %></div>
                                </td>
                                <th>작성자</th>
                                <td>
                                   <div><%= f.getNick_name() %></div>
                                </td>
                            </tr>
                            <tr>
                               <th>등록일</th>
                               <td><%= f.getBoard_date() %></td>
                               <th>조회수</th>
                               <td><%= f.getBoard_count() %></td>
                            </tr>
                            <tr>
                               <td colspan="4">
                                  <div class="cont-area"><%= f.getBoard_content() %></div>
                               </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="btn-center">
                    <%if(m!=null && m.getMember_no()==f.getMember_no()){ %>
                       <button type="submit" class="btn btn-primary btn-lg" style="float:left; padding-left:25px; padding-right:25px; padding-top:5px; padding-bottom:5px; font-size:15px;">수정</button>
                       <button type="button" class="btn btn-danger btn-lg" onclick="location.href='<%=request.getContextPath()%>/deleteFree.fb?num=<%=f.getBoard_no() %>'" style="float:left;padding-left:25px; padding-right:25px; padding-top:5px; padding-bottom:5px; font-size:15px;">삭제</button>
                       <%} %>
                         <button type="reset" class="btn btn-default btn-lg" onclick="location.href='<%=request.getContextPath()%>/selectFreeBoardList.fb'" style="float:right;padding-left:25px; padding-right:25px; padding-top:5px; padding-bottom:5px; font-size:15px;">목록</button>
                    </div>

                </div>
            </div>
        </div>
       
        </form>

        <br>
        <br>

        <!-- Footer -->
        <%@ include file="/views/common/footer.jsp" %>
       <!-- // Footer -->

    </div>
</body>
</html>