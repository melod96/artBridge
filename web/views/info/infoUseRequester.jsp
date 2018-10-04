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
	.tit-area.bg-yellow{background:#F797AF;}
	
	</style>
	
</head>
<body>
    <div id="all">
       
        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
        <!-- // Header -->

		<section class="tit-area bg-yellow"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
            <div class="container">
                <h2>이용안내</h2>
            </div>
        </section>

        <!-- 주석 영역 -->
        <div class="contents">
            <div class="container">
                <div class="col-md-12">
                    <!-- 이 영역에서 작업하세요 -->

                    <div class="heading">
                        <h3 class="tit1">의뢰자 이용안내</h3>
                        <br>
                      	<br>
                        <pre style="font-size:1.5em; font-family:webisfree;">
창작자와 클라이언트의 안전한 거래를 위한 플랫폼으로,
기업의 상업적 외주뿐만 아니라 개인의 비상업적 의뢰도 안전하게 거래할 수 있습니다.
 
외주를 찾는 창작자들과 개인고객 또는 기업고객을 쉽게 연결해드립니다.
이젠 작가의 일방적인 잠수를 걱정하지 마세요.

1. 원하는 작가를 다양한 검색 기능으로 찾기
분위기, 키워드, 작가명, 작품명을 검색하거나 해시태그를 클릭합니다.

2. 제작 용도 및 상세옵션을 확인
상업적 . 비상업적 이용, 작업 기간, 사이즈 등 의뢰하고자 하는 용도에 맞는 옵션인지
꼼꼼히 확인합니다. 상세 옵션 뿐만 아니라 작가가 작성한 주의 상세내용이 없는지도
체크합니다.

3. 견적문의를 해야 할 경우
해당 게시물 하단에 있는 질문과 답변에 문의를합니다. [ 문의 및 답변시 알림 문자 발송 ]
의뢰자와 작가 모두에게 알림 문자가 발송되며, 내용에 이미지를 첨부할 수 있습니다.
작가 프로필에 기입되어 있는 연락처는 주문 후 열람 가능합니다.

4. 구매하고자 하는 가격 옵션 결제하기
작가와 견적을 협의하신 후 가격 옵션을 선택합니다. 추가 금액이 있다면 추가 금액을
입력하여 추가한 후 결제합니다.

5. 환불규정 확인하기
주문 전에 환불 규정을 확인하세요.
이용안내 > 환불규정 및 유의사항에서 확인할 수 있습니다.
6. 주문 완료 후 아트브릿지에 입금하기
주문을 완료했다면 아트브릿지에 입금합니다. 입금 후 입금 확인 문자가 발송됩니다.
입금 확인 시간 : 오전 9시 ~ 오후 12시

7. 결제 후 작가와 소통하기
작업이 시작된 작가와 문의 및 답변으로 소통하거나 작가 프로필의 연락처를
통해 소통 가능합니다.
8. 추가 금액을 결제해야 한다면
작가에게 더 요청하고 싶은 사항이 생겨 추가 금액이 발생한다면 작가와 가격 협의 후
주문 관리에서 해당 거래 내역 - 자세히 - 추가 결제 버튼을 눌러 결제합니다.

To Be Continue...
</pre>
                    </div>
                   
                   <!-- // 이 영역에서 작업하세요 -->
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