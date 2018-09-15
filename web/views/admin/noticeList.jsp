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
      .paginate{margin-bottom:50px;}
      .tbl-type01 input{display:inline-block;}
      .tbl-type01 button{width:80px;}
      .btn-right{text-align:right; margin:30px 0 10px;}
      .btn-right button{position:relative; top:0;}
      .tbl-type02 .tit{text-align:left; padding:12px;}
    </style>
</head>
<body>
    <div id="all">
       
        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
        <section class="tit-area bg-yellow"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
            <div class="container">
                <h2>서브페이지 타이틀</h2>
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
	                              <input id="" name="" class="form-control input-mid" type="text" placeholder="검색할 제목을 입력하세요">
	                              <button type="button" class="btn btn-primary">검색</button>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table>
	                <!-- // 검색 테이블 영역 -->
	                <div class="btn-right">
	                   <button type="button" class="btn btn-danger" style="float:left;">삭제</button>
	                   <button type="button" class="btn btn-primary" onclick="location.href='noticeInsertForm.jsp'">공지사항 등록</button>
	                </div>
	                <!-- 공지사항 리스트  -->
	                <table class="tbl-type02 table-hover">
	                    <colgroup>
	                        <col style="width: 80px;">
	                        <col style="width: 100px;">
	                        <col style="width: *">
	                        <col style="width: 180px;">
	                    </colgroup>
	                    <thead>
	                        <tr>
	                            <th scope="col">선택</th>
	                            <th scope="col">NO</th>
	                            <th scope="col">제목</th>
	                            <th scope="col">등록일</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                            <td><input type="checkbox" name=""></td>
	                            <td>10</td>
	                            <td class="tit">제목이 보여집니다 테스트 입니다.</td>
	                            <td>2018-08-25</td>
	                        </tr>
	                       <tr>
	                            <td><input type="checkbox" name=""></td>
	                            <td>10</td>
	                            <td class="tit">제목이 보여집니다 테스트 입니다.</td>
	                            <td>2018-08-25</td>
	                        </tr>
	                        <tr>
	                            <td><input type="checkbox" name=""></td>
	                            <td>10</td>
	                            <td class="tit">제목이 보여집니다 테스트 입니다.</td>
	                            <td>2018-08-25</td>
	                        </tr>
	                        <tr>
	                            <td><input type="checkbox" name=""></td>
	                            <td>10</td>
	                            <td class="tit">제목이 보여집니다 테스트 입니다.</td>
	                            <td>2018-08-25</td>
	                        </tr>
	                    </tbody>
	                </table>
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