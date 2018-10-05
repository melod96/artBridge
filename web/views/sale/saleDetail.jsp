<%@page
	import="com.comvision.artBridge.board.model.vo.Board, java.util.*, com.comvision.artBridge.files.model.vo.*, com.comvision.artBridge.relate.model.vo.*,com.comvision.artBridge.member.model.vo.*,com.comvision.artBridge.grade.model.vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Member m = null;
	if(session.getAttribute("loginUser") != null){
		m = (Member)session.getAttribute("loginUser");
	}

	Board b = (Board) request.getAttribute("b");
	ArrayList<Files> flist = (ArrayList<Files>) request.getAttribute("flist");
	ArrayList<HashMap<String, Object>> oplist = (ArrayList<HashMap<String, Object>>) request.getAttribute("oplist");
	ArrayList<Relate> rlist = (ArrayList<Relate>) request.getAttribute("rlist");
	Rating ra = (Rating) request.getAttribute("r");
	ArrayList<Grade> glist = null;
	if ((ArrayList<Grade>)request.getAttribute("glist") != null) {
		glist = (ArrayList<Grade>)request.getAttribute("glist");
	}
	Grade avgGrade = (Grade)request.getAttribute("avgGrade");
	Files prof = (Files)request.getAttribute("f");
	int slot = (int)request.getAttribute("slot");
	int orderCount = (int)request.getAttribute("orderCount");
	int orderpos = slot-orderCount;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ArtBridge</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<%@ include file="/views/common/head.jsp"%>
<style type="text/css">
.hugi {
	border: solid 1px gray;
}

.hugi th {
	margin: 15px;
	text-align: center;
	width: 500px;
	font-size: 15px;
}

.left {
	float: left;
}

.hugiheader {
	display: inline-block;
}

.right {
	border: 1px solid black;
	float: right;
	width: 330px;
}

.right img {
	margin-left: 115px;
	margin-top: 30px;
	margin-bottom: 20px;
	width: 90px;
	height: 90px;
}

.right #text {
	background: #8cbae8;
	height: 50px;
	font-size: 18px;
	color: black;
	line-height: 50px;
	vertical-align: middle;
}

.right #text span {
	
}

#receive {
	background: rgb(169, 221, 241);
	border-radius: 15px;
	width: 30%;
	margin-left: auto;
	margin-right: auto;
}
.fab:hover{
	cursor:pointer;
}
</style>
</head>
<body>
	<div id="all">

		<%@ include file="/views/common/header.jsp"%>
		<!-- // Header -->

		<section class="tit-area bg-blue">
			<!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
			<div class="container">
				<h2>일러스트</h2>
			</div>
		</section>

		<!-- contents area -->
		<div class="contents">
			<div class="container">
				<div class="col-md-12" style = "margin-bottom:90px;">
					<!-- 이 영역에서 작업하세요 -->



					<div class="left_title">
						<h5>
							작품 번호 :
							<%=b.getBoard_no()%></h5>
						<h2>
							<a href="<%=request.getContextPath() %>/selectWriterView.wr?memberNo=<%=b.getMember_no() %>"><%=b.getNick_name()%></a> -
							<%=b.getBoard_title()%>
						</h2>
						<br /><br />
					</div>
					<div>
						<div class="left" style="width: 740px;">
							<%
								for (Files f : flist) {
							%>
							<img src="<%=request.getContextPath() %><%=f.getFiles_root()%><%=f.getChange_title() %>" alt="" style="width: 732px;" />
							<%
								}
							%>
						</div>
						<div class="right">
						<ul style = "float:right; margin:10px;">
						<!-- <i class="far fa-heart fa-3x"></i> -->
						<i class="fab fa-gratipay fa-3x" onclick = "fav()"></i>
						</ul>
						<script>
							function fav(){
								var writer_noo = $("#writer_no").val();
								var num= <%=b.getBoard_no()%>;
								$.ajax({
									url:"favUpdate.sp",
									data:{writer_noo:writer_noo,num:num},
									type:"post",
									success:function(data){
										alert("관심작가 업데이트 성공!");
									},
									error:function(status, msg){
										alert("관심작가 업데이트 실패!");
									}
								});
							}
						</script>
							<img src="<%=request.getContextPath() %><%=prof.getFiles_root() %><%=prof.getChange_title() %>" id="img">
							<p align="center">
								<a href="<%=request.getContextPath() %>/selectWriterView.wr?memberNo=<%=b.getMember_no() %>"><%=b.getNick_name()%></a>
							</p>
							<ol id="receive" align="center">접수중
							</ol>

							<ol align="center">
								<div class="rateit"
									data-rateit-value="<%=avgGrade.getGrade() %>"
									data-rateit-ispreset="true" data-rateit-readonly="true"></div>

								평점
								<font class="lsp0"><%=avgGrade.getGrade() %></font>
							</ol>
							<div align="center" style="margin-bottom: 15px;">
								<button type="button" class="btn btn-primary" onclick = "location.href='<%=request.getContextPath()%>/selectMsgAll.my?memberNo=<%=loginUser.getMember_no()%>'">작가에게 쪽지보내기</button>
							</div>
							<div align="center" id="text">상세옵션</div>
							<div style = "margin:20px;">
								<p>
									<span>제출 파일 유형</span><span style="float: right;"><%=b.getSubmit_file_type()%></span>
								</p>
								<p>
									<span>해상도</span><span style="float: right;"><%=b.getResolution()%>dpi</span>
								</p>
								<p>
									<span>사이즈</span><span style="float: right;"><%=b.getSubmit_size()%></span>
								</p>
								<p>
									<span>수정 횟수</span><span style="float: right;">3회</span>
								</p>
								<p>
									<span>작업 기간</span><span style="float: right;">시작일로부터 <%=b.getWorking_period()%>일
									</span>
								</p>
							</div>
							<div align="center" id="text">가격옵션</div>
							<div style = "margin:20px;">
							<label style = "margin-top:5px;">옵션</label> <select style="width: 170px; float: right; height:30px;"
								onchange="changeSelect()" name="sel">
								<option value="0">옵션을 선택해주세요</option>
								<%
										for (int i = 0; i < oplist.size(); i++) {
											HashMap<String, Object> hmap = oplist.get(i);
									%>
								<option  id = "selop<%=hmap.get("options_price")%>" value="<%=hmap.get("options_price")%>">
								<%=hmap.get("options_name")%> - <%=hmap.get("options_price")%></option>
								<%
										}
									%>
							</select><br><br /> <label style = "margin-top:5px;">요구사항 추가</label>
							<button type="button" class="btn btn-primary btn-sm"
								onclick="add()" style="float: right;">추가</button>
								<br /><br />
							<div id="requirement">
								<input type="text" style="width: 290px; margin-bottom:10px;"
									class="requirmentcontent" id="rid0" name="rname0">
							</div>
							<script>
                           function add() {
                              var count = document.getElementsByClassName("requirmentcontent").length
                              $("#requirement input:last-child").clone().appendTo("#requirement").val("");
                              $("#requirement input:last-child").attr("id","rid"+count);
                              $("#requirement input:last-child").attr("name","rname"+count);
                           
                           }
                        </script>
							<div class="orderline"></div>
							<div id="payment">
								<ul align="right">
									<div class="totalTitle">
										최소 결제 금액 : <span id="totals" style="font-size: 24px"></span><font
											style="font-size: 24px">원</font>
									</div>
								</ul>
								<%if(m!=null){ %>
								<ul style="margin-top: 10px;" align="center">
									<button onclick="senddetailedlist()"
										class="btn btn-primary btn-mg">명세표 보내기</button>
								</ul>
								<%}else{ %>
								<ul style="margin-top: 10px;" align="center">
									<button data-toggle="modal" data-target="#login-modal" class="btn btn-primary btn-mg">명세표 보내기</button>
								</ul>
								<%} %>
							</div>
							</div>
							<script>
									function changeSelect() {
										var sel_val = document.all.sel.value;

										document.getElementById("totals").innerHTML = sel_val;
									}
									function senddetailedlist(){
										var req = [];
										var count = document.getElementsByClassName("requirmentcontent").length; 
										for(var i = 0; i<count; i++){
											req += $("#rid"+i).val() + "@";
										}
										var price = document.all.sel.value;
										var option = $("#selop"+price).text();
										var member_no = $("#member_no").val();
										var board_no = $("#board_no").val();
										var writer_no = $("#writer_no").val();
									
										$.ajax({
											url:"senddetailedlist.sp",
											data:{req:req, member_no:member_no,writer_no:writer_no,board_no:board_no,price:price, option:option},
											type:"post",
											success:function(data){
												alert("명세표를 성공적으로 전송하였습니다!");
											},
											error:function(status, msg){
												console.log("서버 전송 실패");
											}
										});
									}
								</script>
							<div align="center" id="text">information</div>
							<div style = "margin:20px;">
								<ul class="cf">

									<p>
										<span>작가등급</span><span style="float: right;"><%=ra.getRating_name()%></span>
									</p>
									<p>
										<span>연관 검색어</span>
										<%for (Relate r : rlist) {%>
										<span style="float: right;">#<%=r.getRelate_name()%>
										</span>
										<%}%>
									</p>
									<p>슬롯</p>
									<%for(int i = 0; i<orderCount;i++){ %>
										<input type="radio" readonly checked = "checked" />
									<%} %>
									<%for(int i =0;i<orderpos;i++){ %>
										<input type="radio" disabled="false"/>
									<%} %>
								</ul>
							</div>
						</div>
					</div>

				</div>
				<div id="textinfo" style = "margin-top:100px;">
				
					<p align="center"><%=b.getBoard_content()%></p>
				<div style="height: 30px"></div>
				<p align="center">
					<a href="/artBridge/views/info/infoUseOther.jsp">환불 규정 및 구매자
						유의사항</a>
				</p>

				<div style="height: 30px"></div>
				<p align="center">모든 이미지는 저작권이 있는 이미지 입니다. 무단 도용 및 복제를 금합니다.</p>
				</div>
				<div class="hugiheader">
					<div>
						<h4 style= "display:inline-block;">이용후기</h4>
						<%if(m != null){ %>
						<button type="button" class="btn btn-md" data-toggle="modal"
							data-target="#hugiModal" style="float:right">후기 작성</button>
						<%} %>
					</div>
					<div class="hugi">
						<table>
							<tr>
								<th>번호</th>
								<th>평점</th>
								<th>내용</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
							<%if (m != null || glist != null) {
											int i = 1;
										for (Grade g : glist) {%>
							<tr>
								<th><%=i%></th>
								<th><%=g.getGrade()%></th>
								<th data-toggle="collapse" data-target=<%="#demo"+i %> style= "cursor:pointer"><%=g.getGrade_content()%></th>
								<th><%=g.getNick_name()%></th>
								<th><%=g.getGrade_date()%></th>
							</tr>
							<tr>
								<th>
									<div id=<%="demo"+i %> class="collapse">
										<%=g.getGrade_content()%>
									</div>
								</th>
							</tr>
							
							<%
								i++;
										}
									}else{
										
									}
							%>
						</table>
					</div>
					
					<div style = "height:50px;"></div>
					<!-- // 이 영역에서 작업하세요 -->
				</div>
		</div>
		<!-- // contents area -->

		<%@ include file="/views/common/footer.jsp"%>
		<!-- modal -->
		<div class="modal" id="hugiModal">
			<div class="modal-dialog" style="width: 830px; height: 600px;">
				<form action="<%=request.getContextPath()%>/hugi.sp" method="post">
					<%if(m != null){ %>
					<input type="hidden" value="<%=m.getMember_no()%>" id="member_no"
						name="member_no" />
					<%} %>
					<input type="hidden" value="<%=b.getBoard_no()%>" id="board_no"
						name="board_no" />
						<input type="hidden" value="<%=b.getMember_no()%>" id="writer_no"
						name="writer_no" />
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">이용후기</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<p align="center">※ 본 작품과 관련 없는 글, 통신 예절에 어긋난 글은 임의로 삭제될 수
							있습니다.</p>
						<p>
							판매글 번호 : <span><%=b.getBoard_no()%></span>
						</p>
						<p>
							작가명 : <span><%=b.getNick_name()%></span>
						</p>
						<span>평점 : </span>
						<span><input type="number" name = "grade" min="1" max="5" step="1" /></span>
						<span id="score"></span>
						<textarea id="editor" name="content"></textarea>
						<script type="text/javascript">
							//에티터 API
							$(function() {
								$('#editor').froalaEditor()
							});
						</script>

					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="reset" class="btn btn-danger" data-dismiss="modal">취소</button>
						<button onclick="submit" class="btn">저장</button>
					</div>

				</form>
			</div>
		</div>
	</div>
</body>
</html>