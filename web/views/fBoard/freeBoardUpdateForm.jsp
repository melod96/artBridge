<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.comvision.artBridge.fBoard.model.vo.*"%>
<% FreeBoard f = (FreeBoard)request.getAttribute("f"); 
int num = (int)(request.getAttribute("num"));
String board_title = request.getParameter("board_title");
String board_content = request.getParameter("board_content");
%>
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

        <div class="contents">
            <div class="container">
                <div class="col-md-12">
                    
                    <div class="heading">
                      <h2 class="tit1">게시글 수정</h2>
                    </div>
                    <form action="<%=request.getContextPath()%>/saveFreeBoard.fb?num=<%=num %>" method="post">
                        <table class="tbl-type01">
                            <colgroup>
                                <col style="width: 200px;">
                                <col style="width: *">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>제목</th>
                                    <td>
                                      <input type="text" name="board_title" class="form-control" value="<%=board_title%>">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <input type="hidden" name="board_num" value="<%= num%>">
                        <br>
                         <!-- 에디터 영역 -->
                          <textarea id="editor" name="board_content"><%= board_content %></textarea>
                          <script type="text/javascript">
						    //에티터 API
						    $(function() { 
						    	$('#editor').froalaEditor()
						    });
						  </script>
                          <!-- // 에디터 영역 -->
                        <div class="btn-center">
                          <button type="reset" class="btn btn-default btn-lg" onclick="location.href='<%=request.getContextPath()%>/FreeBoardDetail.fb?num=<%= num%>'">취소</button>
                          <button type="submit" class="btn btn-primary btn-lg">저장</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <!-- Footer -->
        <%@ include file="/views/common/footer.jsp" %>
       <!-- // Footer -->

    </div>
</body>
</html>