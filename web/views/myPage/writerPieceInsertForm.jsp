<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.comvision.artBridge.relate.model.vo.Relate, com.comvision.artBridge.member.model.vo.Member"%>
<% //Relate r = (Relate)request.getAttribute("r"); 
	
	ArrayList<Relate> relate = (ArrayList<Relate>)request.getAttribute("relate");
	
	Member m = null;
	if(session.getAttribute("loginUser") != null){
		m = (Member)session.getAttribute("loginUser");
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Art Bridge</title>
	<%@ include file="/views/common/head.jsp" %>
	 <style type="text/css">
    .heading .tit1{margin-bottom:20px;}
    .btn-center{margin-bottom:50px;}
    li strong{color:#e03939; font-weight:bold;}

    .row-inp{margin-bottom:10px;}
    .row-inp label{width:150px;}
    .row-inp input, .row-inp select{display:inline-block;}
    .row-inp select{margin-left:-5px}
    /* .row-inp:first-child input+ label{width:90px;} */
    .row-inp:first-child input[type='checkbox']{vertical-align:text-bottom;}
    .row-inp input + label{margin-left:50px;}

    .img-area{overflow:hidden; margin-bottom:20px;}
    .img-area input{display:none;}
    .img-area label{width:210px; margin-bottom:10px;}
    .img-area li{float:left; width:210px; margin-right:20px; text-align:center;}
    .img-area li p{overflow:hidden; height:140px;}
    .img-area img{width:100%;}

    .option-tbl{height:320px; overflow-y:scroll; }
    .option-tbl table{/*width:680px;*/ margin-top:15px;}
    .option-tbl table td{padding:12px;}

    /* .relate-word input[disabled]{background:#f5f5f5; color:#000;} */
    .relate-word p{margin:10px 0 20px; color:#353535; font-weight:bold;}
    .relate-word li{display:inline-block; margin:0 5px 10px 0;}
    /* .relate-word label{margin-left:-15px;} */
    .relate-word .btn-default{background:#f5f5f5;}
    
    /* .fr-box.fr-basic .fr-element{height:600px !important;} */
    </style>
    <script>
    //프로필 사진 변경
    $(function(){
      function readURL(input, type) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {
            if(type == 'file-btn1'){
                $('.img1').attr('src', e.target.result);
            }else if(type == 'file-btn2'){
                $('.img2').attr('src', e.target.result);
            }else if(type == 'file-btn3'){
                $('.img3').attr('src', e.target.result);
            }
          }
          reader.readAsDataURL(input.files[0]);
        }
      }
      $(".img-area input").change(function() {
        var type = $(this).attr('id');
        readURL(this, type);
      });
    });
    
    
    //옵션 추가 삭제
    /* $(function(){
       $("#opt-add").click(function(){
           $(".option-tbl tbody tr:last-child").clone(true).appendTo('.option-tbl tbody').find('input').val("");
       });
		
       $(".option-tbl input").click(function(){
         var act = $(this).prop('checked');
         if(act){
           $(this).attr('checked', true);
         }else{
           $(this).attr('checked', false);
         };
       });

       $("#opt-del").click(function(){
         var test = $(".option-tbl tbody tr");
         
         for(var i = 0; i < test.length; i++){
           console.log(i);

           if(i > 0){
             $(".option-tbl input[checked]").parent().parent().remove();
           }else{
         	 
           }
         }
       });
   }); */
    

    //연관검색어
    /* $(function(){
        $(".relate-word input[type=checkbox]").click(function(){
          $(".relate-word #in-test").attr('value','');
          $(".relate-word input[type=checkbox]").each(function(){
             if($(this).prop("checked")==true){
                $(".relate-word #in-test").attr('value',$(".relate-word #in-test").val() + $(this).val());
                $(this).next('label').removeClass('btn-default').addClass('btn-info');
            }
             if($(this).prop("checked")==false){
                $(this).next('label').removeClass('btn-info').addClass('btn-default');
             };
        });
     });
    }); */
    
  	//연관검색어
    $(function(){
        $(".relate-word span.btn").click(function(){
        	$(this).each(function(){
        		if($(this).hasClass("on") == false){
        			$(this).addClass("on btn-info").removeClass('btn-default');
        		}else{
        			$(this).addClass('btn-default').removeClass("on btn-info");
        		}
        	});
     	});
    });
    
    //에티터 API
    $(function() { $('#editor').froalaEditor() });
  </script>
</head>
<body>
    <div id="all">
       
        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
        <!-- // Header -->

        <!-- 주석 영역 -->
        <section class="tit-area bg-yellow"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
            <div class="container">
				<h2>마이 페이지</h2>
				<ul class="tab-menu">
					<li><a href="/artBridge/views/myPage/myPageForm.jsp?pageName=order-menu">주문관리</a></li>
					<li><a href="/artBridge/views/myPage/myPageForm.jsp?pageName=msg-menu">쪽지함</a></li>
					<li><a href="/artBridge/views/myPage/myPageForm.jsp?pageName=bookmark-menu">관심작가</a></li>
					<li><a href="/artBridge/views/myPage/myPageForm.jsp?pageName=memberinfo-menu">회원정보수정</a></li>
					<li><a href="<%=request.getContextPath()%>/selectPieceList.wr" style="background:#fff; color:#000;">내작품관리</a></li>
					<li><a href="/artBridge/views/myPage/myPageForm.jsp?pageName=qna-menu">이용문의</a></li>
				</ul>
			</div>
        </section>

        <!-- contents area -->
        <div class="contents">
            <div class="container">
                <div class="col-md-12">
                    
                    <form action="<%=request.getContextPath()%>/insertPiece.wr" method="post" encType="multipart/form-data">
                   	 	<input type="hidden" name="member_no" value="<%= m.getMember_no() %>">
                        <div class="heading">
                            <h2 class="tit1">내 작품 등록</h2>
                          </div>
                        <table class="tbl-type01">
                          <colgroup>
                              <col style="width: 15%;">
                              <col style="width: *%;">
                          </colgroup>
                          <tbody>
                              <tr>
                                  <th>제목 *</th>
                                  <td>
                                      <input type="text" name="title" class="form-control" placeholder="작품의 제목을 입력하세요">
                                  </td>
                              </tr>
                              <tr>
                                  <th>대표이미지 *</th>
                                  <td>
                                    <ul class="img-area">
                                      <li>
                                          <input type="file" name="thumb01"  id="file-btn1">
                                          <label for="file-btn1" class="btn btn-primary">썸네일 이미지 선택1</label>
                                          <p><img class="img1" src="/artBridge/image/common/no_thumb.jpg" /></p>
                                      </li>
                                      <li>
                                          <input type="file" name="thumb02" id="file-btn2">
                                           <label for="file-btn2" class="btn btn-primary">썸네일 이미지 선택2</label>
                                          <p><img class="img2" src="/artBridge/image/common/no_thumb.jpg"></p>
                                      </li>
                                      <li>
                                          <input type="file" name="thumb03" id="file-btn3">
                                           <label for="file-btn3" class="btn btn-primary">썸네일 이미지 선택3</label>
                                          <p><img class="img3" src="/artBridge/image/common/no_thumb.jpg"></p>
                                      </li>
                                    </ul>
                                    <ul>
                                        <li>- 이미지 최대 용량 : 1개당 <strong>50MB</strong> / 권장 사이즈 : <strong>가로 732px이상</strong></li>
                                        <li>- 파일 선택 후 저장 버튼을 누르셔야 이미지가 저장됩니다.</li>
                                    </ul>
                                  </td>
                              </tr>
                              <tr>
                                  <th>상세옵션</th>
                                  <td>
                                      <div class="row-inp">
                                           <label>제출파일유형</label><input type="text" name="file_type" class="form-control input-short" placeholder="ex) png, jpg, ai...">
                                           <!-- <label>백터 파일</label><input type="checkbox" value=""> -->
                                           <label>작업 해상도(dpi)</label><input type="text" name="resolution" class="form-control input-xshort">
                                      </div>
                                      <div class="row-inp">
                                          <label>사이즈(단위 필수)</label><input type="text" name="file_size" class="form-control input-short" placeholder="ex) 가로 3000px, A4...">
                                          <label>작업 소요 일 수</label>
                                          <select class="form-control input-xshort" name="working_period">
                                            <option value="0">선택</option>
                                            <option value="1">1일</option>
                                            <option value="2">2일</option>
                                            <option value="3">3일</option>
                                          </select>
                                      </div>
                                  </td>
                              </tr>
                              <tr>
                                  <th>옵션 및 금액 *</th>
                                  <td>
                                      <input type="button" id="opt-add" class="btn btn-primary" value="╉ 옵션 추가">
                                      <input type="button" id="opt-del" class="btn btn-danger" value="─ 옵션 삭제">
                                      <!-- 옵션및금액 테이블 -->
                                      <div class="option-tbl">
                                        <table class="tbl-type02 table-hover">
                                          <colgroup>
                                              <col style="width: 10%;">
                                              <col style="width: *;">
                                              <col style="width: 30%;">
                                          </colgroup>
                                          <thead>
                                              <tr>
                                                  <th scope="col">선택</th>
                                                  <th scope="col">옵션명</th>
                                                  <th scope="col">금액</th>
                                              </tr>
                                          </thead>
                                          <tbody>
                                              <tr>
                                                  <td><input type="checkbox"></td>
                                                  <td><input type="text" class="form-control" placeholder="옵션명 입력"></td>
                                                  <td><input type="number" min="0" step="100" class="form-control" placeholder="금액(원)"></td>
                                              </tr>
                                              <tr>
                                                  <td><input type="checkbox"></td>
                                                  <td><input type="text" class="form-control" placeholder="옵션명 입력"></td>
                                                  <td><input type="number" min="0" step="100" class="form-control" placeholder="금액(원)"></td>
                                              </tr>
                                              <tr>
                                                  <td><input type="checkbox"></td>
                                                  <td><input type="text" class="form-control" placeholder="옵션명 입력"></td>
                                                  <td><input type="number" min="0" step="100" class="form-control" placeholder="금액(원)"></td>
                                              </tr>
                                          </tbody>
                                      </table>
                                      <script>
	                                      	$(function(){
	                                      		optionCk();
	                                      		optionAdd();
	                                      		optionDel();
	                                      		optionName();
	                                      	});

	                                      	//옵션체크시
                                      		function optionCk(){
                                   			 $(".option-tbl input").click(function(){
                                   		         var act = $(this).prop('checked');
                                   		         if(act){
                                   		           $(this).attr('checked', true);
                                   		         }else{
                                   		           $(this).attr('checked', false);
                                   		         };
                                   		       });
                                      	 	}  
                                      		
                                      		//옵션추가버튼
                                   			function optionAdd(){
                                   				$("#opt-add").click(function(){
                                         			$('<tr><td><input type="checkbox"></td><td><input type="text" class="form-control" placeholder="옵션명 입력"></td><td><input type="number" min="0" step="100" class="form-control" placeholder="금액(원)"></td></tr>').appendTo('.option-tbl tbody');
                                         			optionName();
                                         			optionCk();
                                         		});
                                   			}
                                   			
                                   			//옵션삭제버튼
                                   			function optionDel(){
                                   				$("#opt-del").click(function(){
	                                          		$('input[checked=checked]').parent().parent().remove();
                                          			optionName();
                                          		});
                                   			}
                                   			
                                   			
                                      		//옵션테이블 name추가
                                     		function optionName(){
	                                      		var input1 = $(".option-tbl input[type=text]");
	                                      		var input2 = $(".option-tbl input[type=number]");
	                                      		
	                                      		for(var i = 0; i < input1.length; i++){
	                                      			input1.eq(i).each(function(){
	                                      				$(this).attr('name', 'potion');
	                                      			});
	                                      			
	                                      			input2.eq(i).each(function(){
	                                      				$(this).attr('name', 'price');
	                                      			});
	                                      		}
                                      		}
                                      </script>
                                    </div>
                                    <!-- // 옵션및금액 테이블 -->
                                  </td>
                              </tr>
                              <tr>
                                  <th>연관검색어</th>
                                  <td>
                                    <div class="relate-word">
                                      <p>작품과 연관된 단어를 선택해주세요!</p>
                                      <ul>
	                                   	<% if(relate != null){
				                    		for(Relate r : relate){ %>
				                        <li><span class="btn btn-default" name="relate" vlaue="<%= r.getRelate_no() %>"><%= r.getRelate_name() %></span></li>
				                        <% 	}
				                    	} %>
                                      </ul>
                                    </div>
                                  </td>
                              </tr>
                          </tbody>
                      </table>
                      <br>
                      <!-- 에디터 영역 -->
                      <textarea id="editor" name="contents"></textarea>
                      <!-- // 에디터 영역 -->
                      <div class="btn-center">
                          <button type="reset" class="btn btn-default btn-lg" onclick="location.href='/artBridge/selectPieceList.wr'">취소</button>
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