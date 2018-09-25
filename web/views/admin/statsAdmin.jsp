<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Calendar"%>
<%
	Calendar cal = Calendar.getInstance();
	int month = cal.get(cal.MONTH) + 1;
	
	int[] memberCounts = new int[3];
	if(request.getAttribute("memberCounts") != null){
		memberCounts = (int[])request.getAttribute("memberCounts");
	}
	
	int[] orderCounts = new int[4];
	if(request.getAttribute("orderCounts") != null){
		orderCounts = (int[])request.getAttribute("orderCounts");
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Art Bridge</title>
	<%@ include file="/views/common/head.jsp" %>
</head>
	<!-- donutchart -->
	<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Member', 'Status'],
          ['일반', <%= memberCounts[2] %>],
          ['휴면', <%= memberCounts[0] %>],
          ['탈퇴', <%= memberCounts[1] %>]
        ]);

        var options = {
          title: '회원 통계',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>
    <!-- curve_chart -->
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Month', '주문수'],
          ['<%= month - 3 %>월', <%= orderCounts[3] %>],
          ['<%= month - 2 %>월', <%= orderCounts[2] %>],
          ['<%= month - 1 %>월', <%= orderCounts[1] %>],
          ['<%= month %>월', <%= orderCounts[0] %>]
        ]);

        var options = {
          title: '월별 주문수',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
<body>
    <div id="all">
       
        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
        <!-- // Header -->

        <!-- adminHeader -->
		<%@ include file="/views/common/adminHeader.jsp"%>
		<!-- //adminHeader -->

        <!-- 주석 영역 -->
        <div class="contents"><!-- contents 필수 사용 -->
            <div class="container"><!-- container 필수 사용 -->
                <div class="col-md-12">

                    <div class="heading">
                        <h2 class="tit1">회원 통계</h2>
                    </div>
					<div id="donutchart" style="width: 900px; height: 500px;"></div>
                    
                    <div class="heading">
                        <h2 class="tit1">주문 통계</h2>
                    </div>
                    <div id="curve_chart" style="width: 900px; height: 500px"></div>
                    
                   	<br /><br />
                    
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