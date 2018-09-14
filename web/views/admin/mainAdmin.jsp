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
                    <li><a href="#" style="background:orangered;">메인 관리</a></li>
                    <li><a href="commissionAdmin.html">커미션 관리</a></li>
                    <li><a href="customerAdmin.html">고객문의 관리</a></li>
                    <li><a href="memberAdmin.html">회원 관리</a></li>
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
                        <h2>메인 배너 관리</h2>
                    </div>
               
                    <hr>

					
                    <table class="tbl-type02" style="width:600px; margin:auto;>
                        <colgroup>
                            <col style="width: 15%;">
                            <col style="width: *;">
                        </colgroup>
                      
                        <div class="btn-center">
                    <button type="submit" name="mainBtn" class="btn btn-primary btn-sm" onclick="add();">추가하기</button>
					<button type="button" name="mainBtn" class="btn btn-default btn-sm" onclick="del();" id="del">삭제하기</button>
					<br><br>
					</div>
					<div class="addTable">
                        <tbody class="trtr">


                            <tr><!-- style="height:250px;" -->
                                <td><input type="checkbox" name="">
                                </td>
                                <td colspan="5">   
                                	<label>작품 번호&nbsp;&nbsp;</label>
                                	<input type = "text"><br>
                                	
                                	<label>썸네일 &nbsp; &nbsp;</label>
                                	<input type = "file" style="display:inline-block;width:190px;"><br>
                                </td>
                            </tr>
                            
                            <!--  <tr>
                            <td colspan="5" style="border-right:0px;border-left:0px;">
                        <button type="submit" name="mainBtn" class="btn btn-primary btn-sm"  >저장</button>
                        </td>
                            </tr> -->


                        </tbody>
                    </table>
                    
                    </div>
                    <br><Br>
      
                    <div class="btn-center">
                      
                      <button type="submit" class="btn btn-primary btn-md" style="margin-top:10px;">저장</button>
                    </div>



					<br>
					<script>
					var i = 1;
                    function add() {
                    	if(i == 5){alert('5개 이상 생성할 수 없습니다.')}else{
							$(function() {
								$(
										"<tr><td><input type="+"checkbox"+">"
												+ "</td>"
												+ "<td colspan="+"5"+">"
												+ "<label>작품 번호&nbsp;&nbsp;</label>"
												+ "<input type = "+"text"+"><br>"
												+ "<label>썸네일 &nbsp; &nbsp;</label>"
												+ "<input type = "+"file"+" style="+"display:inline-block;width:190px;"+"><br>"
												+ "</td></tr>").appendTo(
										$(".trtr"));
							});
                    	i++;}

						};
						
						function del(){
		                     $("input:checkbox").each(function() {
		                     if ($(this).prop("checked") == true) {
		                        $(this).parent().parent().remove();
		                        i--;
		                        }
		                        
		                     });

		               }

					</script>

					<br><br> <br><br>
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