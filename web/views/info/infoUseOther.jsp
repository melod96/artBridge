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
                        <h3 class="tit1">환불 규정 및 문의 사항</h3>
                        <br>
                      	<br>
                        <pre style="font-size:1.5em; font-family: webisfree;">
비상업 / 상업적 창작물의 거래

모든 게시물에 등록되는 창작물 예시 이미지에 대한 저작권은 해당 작가에게 있으며,
 작가의 허락 없이 사용할 수 없습니다.

1. 비상업적 창작물의 저작권은 작가에게 있습니다.
 비상업적 창작물을 의뢰 후 의뢰자는 창작물을 가공하거나 상업적으로 이용할 수 없습니다.
 
2. 상업적 창작물의 저작권 또한 작가에게 있으며,
 작가와 의뢰자 간의 저작권 양도가 이루어진 경우에만 의뢰자에게 양도됩니다.
 
3. 창작물의 제작금액은 이용용도와 요구사항에 따라 변동될 수 있기 때문에 반드시 주문,
 결제 이전에 작가에게 견적의뢰를 하셔야 합니다.
 
4. 아트브릿지는 저작권 침해와 관련된 그 어떤 요구나 청구에 대하여 중재자 또는 조정자로 참여하지 않습니다.


환불 규정

1. 의뢰자가 환불 요청을 하였을 경우, 작가는 아래와 같이 환불합니다.
전액 환불 - 작업을 전혀 진행하지 않은 경우.
70% 환불 - 작업이 0 ~ 30% 진행된 경우.
50% 환불 - 작업이 31 ~ 50% 진행된 경우.
환불 불가 - 작업이 50% 를 충분히 초과하여 진행된 경우.
일부 환불 - 일부 작업을 제외하는 경우. (환불 금액은 협의)

70% 환불, 50% 환불, 환불 불가의 경우는 작가가 현재까지 진행된 작업물을
아트브릿지 고객센터로 보내주셔야 합니다. (작업물이 실물인 경우는 촬영한 사진 첨부)

※ 수공예는 작품페이지 하단에 작가가 별도로 표기한 내용을 따릅니다.

2. 환불 절차
1) 의뢰자 - 작가와 환불 협의 후 주문내역에서 환불 요청.
2) 작가 - 주문내역에서 환불 진행 선택. ( 전액환불, 70%, 50% ... )
3) 작가 - 진행된 작업물을 고객센터로 발송. ( 필요한 경우만 )
4) 아트브릿지 - 환불 요청 확인 후 당일 환불 처리.

※ 2번 항목은 준비중이므로 고객센터 (고객문의)를 이용해 주세요.

3. 작가가 완료 예정일을 지키지 못하고, 작업 진행에 대한 증빙 자료가 없으며,
 작업을 성실하게 이행하지 않았다고 판단되는 경우, 아트브릿지가 사실 여부를 확인하고
 의뢰자에게 결제금 전액을 환불합니다.

4. 완료 예정일을 사전 협의 없이 7일 이상 초과할 경우에는 자동으로 주문이 취소되며,
 결재한 금액이 의뢰자에게 전액 환불됩니다.
 
5. 지체보상금 부과
작가가 의뢰자와 사전 협의 없이 일방적으로 완료 예정일을 초과하였을 경우,
약속된 기한을 초과한 일자만큼 의뢰비의 일부를 의뢰자에게 돌려주는 제도입니다.
1일마다 총 제작 금액의 100분의 1이 차감됩니다

단, 의뢰자가 지체보상금 부과를 요청하였을 경우에만 적용되며,
의뢰자의 책임으로 인정되는 경우 부과되지 않습니다.

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