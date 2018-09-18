<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.comvision.artBridge.admin.model.vo.*"%>
<% 
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list"); 
	int num = (int)request.getAttribute("num");
	String search="";
	if(num == 0){
		search = (String)request.getAttribute("search");
	}
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); 
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
        <!-- // Header -->

        <!-- contents area -->
        <div class="contents">
        <section class="tit-area" style="background:#99B5C7"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
            <div class="container">
                <h2 class="tit1">공지사항</h2>
            </div>
        </section>
            <div class="container">
                <div class="col-md-12">
	             
	                
		             <form action="<%=request.getContextPath()%>/search.nb" method="get">
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
		                              <!--인풋으로 페이지 값을 1로 하여같이 전달-->
		                              <button type="submit" class="btn btn-primary">검색</button>
		                            </td>
		                        </tr>
		                    </tbody>
		                </table>
	                	<!-- // 검색 테이블 영역 -->
		                <!-- 공지사항 리스트  -->
		                <table class="tbl-type02 table-hover">
		                    <colgroup>
		                        <col style="width: 80px;">
		                        <col style="width: *px;">
		                        <col style="width: 80px">
		                        <col style="width: 150px;">
		                    </colgroup>
		                    <thead>
		                        <tr>
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
		                            <td><%= n.getRownum() %></td>
		                            <td id="noticeTit" class="tit" onclick="location.href='<%=request.getContextPath()%>/selectDetail.nb?num=<%= n.getnNo() %>'"><%= n.getnTitle() %></td>
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
	                
	                <!-- // 공지사항 리스트  -->
	              
	              <% if(num == 0){ %>
	              
	              <!--페이징 search -->
	              
					<div class="paginate">
						<a onclick="location.href='<%=request.getContextPath()%>/selectList.nb?currentPag=1'+'search=<%=search%>'" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a> 
						<% if(currentPage <=1){ %>
							<a disabled class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a> 
						<%}else{ %>
							<a onclick = "location.href='<%= request.getContextPath()%>/selectList.nb?currentPage=<%=currentPage -1%>'" class="btn-prev" title="이전">
							<em class="blind">목록에서 이전 페이지 이동</em></a>
						<%} %>
						<span class="paging-numbers">
							<% for(int p = startPage; p <=endPage;p++){
								if(p==currentPage){%>
									<a disabled class="on"><%=p %><span class="blind">페이지로 이동</span></a>
								<%}else{ %>
									<a onclick= "location.href='<%= request.getContextPath()%>/selectList.nb?currentPage=<%=p%>'"><%= p %><span class="blind">페이지로 이동</span></a>
								<%} %>
							<%} %>
						</span>
						<% if(currentPage >= maxPage){ %>
							<a disabled class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%}else{ %>
							<a onclick = "location.href = '<%= request.getContextPath()%>/selectList.nb?currentPage=<%=currentPage +1%>'" class="btn-next" title="다음">
							<span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%} %>
						
						<a onclick = "location.href = '<%= request.getContextPath()%>/selectList.nb?currentPage=<%=maxPage%>'" class="btn-last" title="끝">
						<span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
					</div>
					
	              <!--//페이징 search -->
	              
	              <%}else{ %>
	              
	              <!--페이징 normal -->
	              
					<div class="paginate">
						<a onclick="location.href='<%=request.getContextPath()%>/selectList.nb?currentPage=1'" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a> 
						<% if(currentPage <=1){ %>
							<a disabled class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a> 
						<%}else{ %>
							<a onclick = "location.href='<%= request.getContextPath()%>/selectList.nb?currentPage=<%=currentPage -1%>'" class="btn-prev" title="이전">
							<em class="blind">목록에서 이전 페이지 이동</em></a>
						<%} %>
						<span class="paging-numbers">
							<% for(int p = startPage; p <=endPage;p++){
								if(p==currentPage){%>
									<a disabled class="on"><%=p %><span class="blind">페이지로 이동</span></a>
								<%}else{ %>
									<a onclick= "location.href='<%= request.getContextPath()%>/selectList.nb?currentPage=<%=p%>'"><%= p %><span class="blind">페이지로 이동</span></a>
								<%} %>
							<%} %>
						</span>
						<% if(currentPage >= maxPage){ %>
							<a disabled class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%}else{ %>
							<a onclick = "location.href = '<%= request.getContextPath()%>/selectList.nb?currentPage=<%=currentPage +1%>'" class="btn-next" title="다음">
							<span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
						<%} %>
						
						<a onclick = "location.href = '<%= request.getContextPath()%>/selectList.nb?currentPage=<%=maxPage%>'" class="btn-last" title="끝">
						<span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
					</div>
					
	              <!--//페이징 normal -->
	              
				   <%} %>	              
	              
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