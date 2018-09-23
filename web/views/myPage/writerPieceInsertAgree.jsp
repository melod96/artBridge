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
        .info-box{border:1px solid #ddd; padding:40px 70px 20px; font-size:14px; line-height:1.5;}
        .tit{text-align:center; color:#000; font-weight:bold; font-size:25px; margin-bottom:30px;}
        .txt01 li{padding-left:15px; background:url(/artBridge/image/common/btn_next.png) 0 4px no-repeat; background-size:5px; color:#3446d1; font-weight:bold; margin-bottom:5px; font-size:14px;}
        .txt02{color:#000; margin:30px 0; display:block; font-size:14px;}
        .txt03{color:#404040; margin-bottom:20px; font-size:14px;}
        .txt04{margin-bottom:30px;}
        .txt04 li{color:#404040; font-size:14px; margin-bottom:5px;}
        div.btn-center{margin-bottom:50px;}
        .agree-ck{margin-top:10px; vertical-align:middle; padding-left:60px;}
        .agree-ck input{width:20px; height:20px; vertical-align:text-bottom;}
        .agree-ck label{font-size:18px; font-weight:bold; margin-left:5px;}
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
                    
                    <div class="info-box">
                        <p class="tit">※ 작품 등록 전에 확인하세요.</p>
                        <ul class="txt01">
                            <li>아트브릿지는 회원 간의 직거래를 금지하고 있으며, 개인 연락처를 결제 이전에 전달할 수 없고, 결제는 아트브릿지의 주문시스템 및 결제계좌를 이용하셔야 합니다.</li>
                            <li>개인 연락처 전달 후 아트브릿지에서 결제가 없는 경우에도 직거래가 매우 의심되는 정황으로써 직거래 행위로 간주되며, 작가회원은 1차 위반 시 경고, 2차 위반 시에는 회원 자격이 정지됩니다.</li>
                            <li>의뢰자와 작가의 연락처는 주문, 결제 후에 자동 오픈되며, 결제 전까지는 아트브릿지의[문의 및 답변]을 이용하여 소통해 주시기 바랍니다.</li>
                        </ul>
                        <strong class="txt02">다음 사항에 주의해서 등록해주세요. 규정에 어긋날 경우에는 등록 승인이 되지 않습니다.</strong>
                        <p  class="txt03">아트브릿지는 만 14세 이상의 회원들이 이용하는 사이트로서 하반신, 전신 노출 및 성기 노출, 노골적인 성행위 표현, 신체 훼손 이미지, 잔인한 살해 이미지, 기괴한 공포물, 심한 욕설 포함, 마약 사용 조장, 비윤리적, 비도덕적, 지나치게 선정적, 다수에게 불쾌감을 주는 이미지는 등록하실 수 없습니다.</p>
                        <ol class="txt04">
                            <li>1. 제작범위를 상업용, 비상업용 두 개 모두 체크할 경우, 가격도 두가지로 나누어 입력해주세요.</li>
                            <li>2. 상세옵션 입력란에 정확한 값을 기입하세요(나쁜예:협의함x,문의주세요x)</li>
                            <li>3. 상세 내용에 가격을 기입할 경우, 가격 입력란에 기입한 가격과 틀리지 않게 주의해 주세요.</li>
                        </ol>
                        <p  class="txt03">이미 승인된 게시물이라도, 고객의 항의가 있을 경우엔 재검토 후 미승인으로 전환될 수 있습니다.</p>
                    </div>
                    <div class="agree-ck">
                        <input type="checkbox" id="agree">
                        <label for="agree">위의 내용에 동의합니다.</label>
                    </div>
                    <div class="btn-center">
                        <button type="submit" class="btn btn-primary btn-lg" onclick="agreeCk()">확인</button>
                    </div>
                    <script>
                    	function agreeCk(){
                    		var agreeCk = $("#agree").prop("checked");
                    		if(agreeCk == true){
                    			location.href="<%= request.getContextPath() %>/InsertPieceForm.wr"
                    		}else{
                    			alert('약관동의에 체크 해주세요.');
                    			return false;
                    		}
                    	}
                    </script>

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