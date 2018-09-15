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
                      <h2 class="tit1">공지사항 등록</h2>
                    </div>
                    <form action="<%=request.getContextPath()%>/noticeInsert.no" method="post">
                        <table class="tbl-type01">
                            <colgroup>
                                <col style="width: 200px;">
                                <col style="width: *">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>제목</th>
                                    <td>
                                      <input type="text" name="title" class="form-control" placeholder="제목을 입력하세요">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                         <!-- 에디터 영역 -->
                          <textarea id="editor" name="content"></textarea>
                          <script type="text/javascript">
						    //에티터 API
						    $(function() { 
						    	$('#editor').froalaEditor()
						    	});
						  </script>
                          <!-- // 에디터 영역 -->
                        <div class="btn-center">
                          <button type="reset" class="btn btn-default btn-lg" onclick="location.href='noticeList.jsp'">목록</button>
                          <button type="submit" class="btn btn-primary btn-lg">저장</button>
                        </div>
                    </form>

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