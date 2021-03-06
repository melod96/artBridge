<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.comvision.artBridge.admin.model.vo.Rating, com.comvision.artBridge.board.model.vo.PageInfo"%>
<%
	ArrayList<Rating> list = null;
	if(request.getAttribute("list") != null){
		list = (ArrayList<Rating>)request.getAttribute("list");
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Art Bridge</title>
	<%@ include file="/views/common/head.jsp" %>
<style>
	.tbl-type02{
		width : 600px;
		margin: auto;
	}
	.update_row{
		background : yellow;
	}
</style>
<script>
	var i = 0;
	function add_row() {
		$(function(){
			$("<tr name='add_relate" + i + "''>"
				+ "<td>추가 " + (i + 1) + "</td>"
				+ "<td><input type='text' name='new_rating_name" + i + "' class='form-control' /></td>"
				+ "<td><input type='text' name='new_rating_slot" + i + "' class='form-control' /></td>"
				+ "<td><input type='text' name='new_rating_commission" + i + "' class='form-control' /></td>"
				+ "<td></td>"
				+ "</tr>"
			).appendTo($("#rating"));
			i++;
		});
	};
	
	$(function(){
		var theForm = document.frmSubmit;
		$("#addBtn").click(function(){
			theForm.method = "post";
			theForm.action = "<%= request.getContextPath() %>/insertRating.ad?insertNum=" + i;
			theForm.submit();
		});
	});
	
	$(function(){
		$(".update_row").hide(); 
	});
	
	function change_row(btn){
		var no = $(btn).val();
		$(btn).hide();	
		$("#update_row" + no).show();
		$(btn).parent().parent().children().children("input").removeAttr("readonly");
	}
	
	function update_rating(btn){
		var no = $(btn).val();
		var rating_name = $("input[name=rating_name" + no + "]").val();
		var rating_slot = $("input[name=slot" + no + "]").val();
		var rating_commission = $("input[name=commission" + no + "]").val();
		$.ajax({
			url : "updateRating.ad",
			type : "post",
			data : { no : no, rating_name : rating_name, rating_slot : rating_slot, rating_commission : rating_commission},
			success : function(data){
				console.log(data);
				if(data > 0){
					$("#update_row" + no).hide();
					$("#change_row" + no).show();
					$("#update_row" + no).parent().parent().children().children("input").prop("readonly", true);
					alert("수정되었습니다.");
				}
			},
		});
	}
	
</script>
</head>
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
                        <h2 class="tit1">등급 관리</h2>
                    </div>
					<br />
					<div style="width:600px; margin:auto;">
						<div align="right" style="margin-bottom:10px"><button class="btn btn-default btn-sm" onclick="add_row();">추가</button></div>
							<form name="frmSubmit">
							<table class="tbl-type02">
		                        <colgroup>
		                            <col style="width: 10%;">
		                            <col style="width: 15%;">
		                            <col style="width: 13%;">
		                            <col style="width: 15%;">
		                            <col style="width: 20%;">
		                        </colgroup>
		                        <thead>
		                            <tr>
		                                <th scope="col">NO</th>
		                                <th scope="col">등급명</th>
		                                <th scope="col">최대슬롯수</th>
		                                <th scope="col">수수료율</th>
		                                <th scope="col">수정</th>
		                            </tr>
		                        </thead>
		                        <tbody id="rating">
		                        	<% if(list != null){ for(int i = 0; i < list.size(); i++){ %>
		                            <tr>
		                                <td><%= list.get(i).getRating_no() %></td>
		                                <td><input type="text" class="form-control" name="rating_name<%= list.get(i).getRating_no() %>" value="<%= list.get(i).getRating_name() %>" style="width:120px" readonly /></td>
		                                <td><input type="text" class="form-control" name="slot<%= list.get(i).getRating_no() %>" value="<%= list.get(i).getSlot() %>" style="width:120px" readonly /></td>
		                                <td><input type="text" class="form-control" name="commission<%= list.get(i).getRating_no() %>" value="<%= list.get(i).getCommission() %>" style="width:120px" readonly /></td>
		                                <td>
		                                	<button type="button" class="btn btn-default btn-sm change_row" id="change_row<%= list.get(i).getRating_no() %>" value="<%= list.get(i).getRating_no() %>" onclick="change_row(this);">수정</button>
		                                	<button type="button" class="btn btn-default btn-sm update_row" id="update_row<%= list.get(i).getRating_no() %>" value="<%= list.get(i).getRating_no() %>" onclick="update_rating(this);">수정</button>
		                                </td>
		                            </tr>
		                            <% } } %>
		                        </tbody>
		                    </table>
		                    <br />
		                    <div align="center">
		                    	<button type="button" id="addBtn" name="mainBtn" class="btn btn-primary btn-md" style="padding: 10px 22px;">저장</button>
		                    </div>
		                    </form>
                    	</div>
                    
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