<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.comvision.artBridge.admin.model.vo.*"%>
<% 
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list"); 
	/* Notice n = (Notice)request.getAttribute("n"); */
	/* PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); */
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
      .paginate{margin-bottom:50px;}
      .tbl-type01 input{display:inline-block;}
      .tbl-type01 button{width:80px;}
      .btn-right{text-align:right; margin:30px 0 10px;}
      .btn-right button{position:relative; top:0;}
      .tbl-type02 .tit{text-align:left; padding:12px; cursor:pointer;}
    </style>
    <script>
    	
		
    </script>
</head>
<body>
    <div id="all">
       
        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
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
        <!-- // Header -->

        <!-- contents area -->
        <div class="contents">
            <div class="container">
                <div class="col-md-12">
	             
	                <div class="heading">
	                  <h2 class="tit1">공지사항</h2>
	                </div>
		             <form action="<%=request.getContextPath()%>/searchNotice.no" method="get">
		                <!-- 검색 테이블 영역 -->
		                <table class="tbl-type01">
		                    <colgroup>
		                        <col style="width: 200px;">
		                        <col style="width: *">
		                    </colgroup>
		                    <tbody>
		                        <tr>
		                            <th>제목검색</th>
		                            <td>
		                              <input name="search" class="form-control input-mid" type="text" placeholder="검색할 제목을 입력하세요">
		                              <button type="submit" class="btn btn-primary">검색</button>
		                            </td>
		                        </tr>
		                    </tbody>
		                </table>
	                	<!-- // 검색 테이블 영역 -->
		                <div class="btn-right">
		                   <button type="button" class="btn btn-danger" onclick="delContent()" style="float:left;">삭제</button>
		                   <button type="button" class="btn btn-primary" onclick="location.href='/artBridge/views/admin/noticeInsertForm.jsp'">공지사항 등록</button>
		                </div>
		                <!-- 공지사항 리스트  -->
		                <table class="tbl-type02 table-hover">
		                    <colgroup>
		                        <col style="width: 80px;">
		                        <col style="width: 100px;">
		                        <col style="width: *">
		                        <col style="width: 120px;">
		                        <col style="width: 180px;">
		                    </colgroup>
		                    <thead>
		                        <tr>
		                            <th scope="col">선택</th>
		                            <th scope="col">NO</th>
		                            <th scope="col">제목</th>
		                            <th scope="col">조회수</th>
		                            <th scope="col">등록일</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    	<% if(list != null){
		                    		for(Notice n : list){ %>
		                        <tr>
		                            <td><input type="checkbox" name="contCheck"><div style="display:none"><%= n.getnNo() %></div></td>
		                            <td><%= n.getRownum() %></td>
		                            <td id="noticeTit" class="tit" onclick="location.href='<%=request.getContextPath()%>/noticeDetail.no?num=<%= n.getnNo() %>'"><%= n.getnTitle() %></td>
		                            <td><%= n.getnCount() %></td>
		                            <td><%= n.getnDate() %></td>
		                        </tr>
		                        <% 	}
		                    	}else{ %>
		                    	<tr>
		                    		<td colspan="5">등록된 게시물이 없습니다.</td>
		                    	</tr>		
		                    	<% } %>
		                    </tbody>
		                </table>
	                </form>
	                
	                <script>
	                	$(function(){
	                		
	                		
	                		var wow = $('input[name=contCheck]');
	                		$(wow).click(function(){
	                			$(this).each(function(){
	                				if($(this).prop("checked") == true){
	                					var onlyNum = $(this).next().text(); 
	                					console.log(onlyNum);
	                					
	                				}
	                			});
	                		});
	                		
	                		function delContent(){
	                			//삭제버튼을 눌럿을때 서블릿으로 이동(체크가 선택된, 게시글의 넘버를, 배열로 가져간다.)
	                			
	                			<%-- location.href='<%=request.getContextPath()%>/deleteNotice.no?num'+num --%>
	                			location.href='<%=request.getContextPath()%>/deleteNotice.no?num'+onlyNum
	                		}
	                	});
	                </script>
	                <!-- // 공지사항 리스트  -->
	                <!-- 페이징 영역 -->
	                <div class="paginate">
	                  <a href="#" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a>
	                  <a href="#" class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a>
	                  <span class="paging-numbers">
	                      <a href="#">1<span class="blind">페이지로 이동</span></a>
	                      <a href="#" class="on">2<span class="blind">페이지로 이동</span></a>
	                      <a href="#">3<span class="blind">페이지로 이동</span></a>
	                      <a href="#">4<span class="blind">페이지로 이동</span></a>
	                      <a href="#">5<span class="blind">페이지로 이동</span></a>
	                  </span>
	                  <a href="#" class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
	                  <a href="#" class="btn-last" title="끝"><span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
	               </div>
	                <!-- // 페이징 영역 -->
	                
	                
	                <!-- 페이징 영역2222222222222 -->
	                <%-- <div class="paginArea" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=1'"><<</button>
			<% if(currentPage <= 1){ %>
				<button disabled><</button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=currentPage -1 %>'"><</button>
			<% } %>
			
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
					<button disabled><%= p %></button>
			<%      }else{ %>
						<button onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=p%>'"><%= p %></button>
			<% 		}  %>
			<% }  %>
			
			
			<% if(currentPage >= maxPage){ %>
				<button disabled>></button>
			<% }else{ %>
				<button onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=currentPage + 1%>'">></button>
			<% } %>
			
			<button onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=maxPage%>'">>></button>
		</div> --%>
		<!-- // 페이징 영역2222222222222 -->
		
		

                </div>
            </div>
        </div>
        <!-- // contents area -->

        <!-- Footer -->
        <%@ include file="/views/common/footer.jsp" %>
       <!-- // Footer -->

    </div>
</body>
</html>