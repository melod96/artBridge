<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Art Bridge</title>
	<%@ include file="/views/common/head.jsp" %>
	<style>

ul.tab-menu li>a:hover{
background:darkgray;
} 

</style>
</head>
<body>
    <div id="all">
       
        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
         <section class="tit-area bg-yellow"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
            <div class="container">
                <h2>관리자 페이지</h2>
                <ul class="tab-menu">
                    <li><a href="mainAdmin.html">메인 관리</a></li>
                    <li><a href="commissionAdmin.html">커미션 관리</a></li>
                    <li><a href="customerAdmin.html">고객문의 관리</a></li>
                    <li><a href="#" style="background:orangered;">회원 관리</a></li>
                    <li><a href="transactionAdmin.html">거래내역 관리</a></li>
                    <li><a href="#">공지사항</a></li>
                </ul>
            </div>
        </section>
        <!-- // Header -->

        <!-- 주석 영역 -->
        <div class="contents"><!-- contents 필수 사용 -->
            <div class="container"><!-- container 필수 사용 -->
                <div class="col-md-12">
                    <div class="heading">
                        <h2>회원 관리</h2>
                    </div>
               
                    <hr>
		
					<br>
			
					<div>
					<selectl name = "form" multple="2">
                    <table class="tbl-type02">
                        <colgroup>
                            <col style="width: 20%;">
                            <col style="width: *;">
                        </colgroup> 
                     
                        <tbody>
 
                            <tr >
                                <td style="background:lightgray; width:200px;">검색옵션
                                </td>
                                <td>
                                <select class="form-control input-short">
                       				 <option>전체</option>
                       				 <option>이름</option>
                       				 <option>아이디</option>
                       				 <option>연락처</option>
                       				 <option>이메일</option>
                   				 </select>
								
                                </td>
                            </tr>

                            <tr>
                                <td style="background:lightgray">검색어 입력
                                </td>
                                <td>
                                <input type="text" style="width:500px; float:left;">
                                </td>
                            </tr>
                             <tr>
                                <td style="background:lightgray">사용자 구분
                                </td>
                                <td>
                                <select class="form-control input-short">
                       				 <option>전체</option>
                       				 <option>작가</option>
                       				 <option>일반사용자</option>
                   				 </select>
                                </td>
                            </tr>
                            <tr>
                                <td style="background:lightgray; ">작가 등급
                                </td>
                                 <td>
                                <select class="form-control input-short" style="float:left;">
                       				 <option>전체</option>
                       				 <option>신뢰작가</option>
                       				 <option>일반작가</option>
                       				 <option>신규작가</option>
                       				 <option>블랙작가</option>
                   				 </select>
                   				  <button type="submit" name="mainBtn" class="btn btn-primary btn-md" style="float:right;">검색</button>
                                </td>
                            </tr>

                          
                        </tbody>
                    </table>
                    </div>
                
                     <br>
                     <br>

					<button type="submit" class="btn btn-primary btn-md"
						style="padding: 5px 22px; float: right;" onclick="del4();">계정삭제</button>
					<button onclick=popupOpen(); type="submit" id="deleteBtn"
						name="deleteBtn" class="btn btn-primary btn-sm"
						style="padding: 5px 22px; float: right; margin-right: 5px;">정보수정</button>
					<br>
					<script>
      function popupOpen() {

         var popUrl = "userPop.jsp"; //팝업창에 출력될 페이지 URL

                     
         var popupX = (window.screen.width / 2)-(580/2);
         // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

         var popupY= (window.screen.height /2)-(300/2);
         // 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

         var popOption = "width=578, height=301, resizable=no, scrollbars=no, status=no, top="+popupY+", left=" + popupX 
                     //팝업창 옵션(optoin)
         window.open(popUrl,"", popOption);

      }
    //=================del4 함수 부분======================

	  function del4(){
							$("input[name=chBox4]").each(function() {
							if ($(this).prop("checked") == true) {
								$(this).parent().parent().remove();
								
								}
							});

							var n = 1;
						$(".num4").each(function() {
							$(this).text(n);
							n++;
							});

						}  
      
   </script>
					<br>


					<selectl name = "form" multple="2">
                    <table class="tbl-type02">
                        <colgroup>
                            <col style="width: 5%;">
                            <col style="width: 5%;">
                            <col style="width: 7%;">
                            <col style="width: 10%;">
                            <col style="width: 10%;">
                            <col style="width: 12%;">
                            <col style="width: 15%;">
                            <col style="width: *;">
                            <col style="width: 13%">
                        </colgroup>
                         <thead>
                            <tr>
                                <th scope="col" >선택</th>
                                <th scope="col">NO</th>
                                <th scope="col">구분</th>
                                <th scope="col">등급</th>
                                <th scope="col">이름</th>
                                <th scope="col">ID</th>
                                <th scope="col">연락처</th>
                                <th scope="col">메일</th>
                                <th scope="col">가입일</th>

                            </tr>
                        </thead> 
                        <tbody>
 
                            <tr>
                                <td><input type="checkbox" name="chBox4">
                                </td>
                                <td class="num4">                
                                	1
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td><input type="checkbox" name="chBox4">
                                </td>
                                <td class="num4">                
                                	2
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>

                           <tr>
                                <td><input type="checkbox" name="chBox4">
                                </td>
                                <td class="num4">                
                                	3
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td><input type="checkbox" name="chBox4">
                                </td>
                                <td class="num4">                
                                	4
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td><input type="checkbox" name="chBox4">
                                </td>
                                <td class="num4">                
                                	5
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        
                        </tbody>
                    </table>
                    
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
                    
                    
                    
                    <br>
                    <br>
        <!-- // 주석 영역 -->

        <!-- Footer -->
        <%@ include file="/views/common/footer.jsp" %>
       <!-- // Footer -->

    </div>
</body>
</html>