<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Art Bridge</title>
<%@ include file="/views/common/head.jsp"%>
<style>
ul.tab-menu li>a:hover {
	background: darkgray;
}

body {
	text-align: center;
}

div#editor {
	width: 81%;
	margin: auto;
	text-align: left;
}

.ss {
	background-color: red;
}

.fr-wrapper {
	overflow-Y: scroll;
	height: 86%;
}
</style>
</head>
<body>
	<div id="all">

		<!-- Header -->
		<%@ include file="/views/common/header.jsp"%>
		<section class="tit-area bg-yellow"><!-- 컬러변경시 bg-컬러명(gray,green,blue,yellow) 으로 바꿔주세요 -->
		<div class="container">
			<h2>관리자 페이지</h2>
			<ul class="tab-menu">
				<li><a href="mainAdmin.html">메인 관리</a></li>
				<li><a href="commissionAdmin.html">커미션 관리</a></li>
				<li><a href="customerAdmin.html" style="background: orangered;">고객문의
						관리</a></li>
				<li><a href="memberAdmin.html">회원 관리</a></li>
				<li><a href="transactionAdmin.html">거래내역 관리</a></li>
				<li><a href="#">공지사항</a></li>
			</ul>
		</div>
		</section>
		<!-- // Header -->

		<!-- 주석 영역 -->
		<div class="contents">
			<!-- contents 필수 사용 -->
			<div class="container">
				<!-- container 필수 사용 -->
				<div class="col-md-12">
					<div class="heading">
						<h2>고객문의 답변 작성</h2>
					</div>

					<hr>

					<div>
						<table class="tbl-type02">
							<colgroup>
								<col style="width: 15%;">
								<col style="width: *;">

							</colgroup>

							<tbody>

								<tr>
									<td style="background: lightgray;">고객구분</td>
									<td><div style="float: left; font-size: 1em;">작가 /
											일반사용자</div></td>
								</tr>

								<tr>
									<td style="background: lightgray">고객명</td>
									<td>
										<div style="float: left; font-size: 1em; color: darkgray;">홍길동</div>
									</td>
								</tr>
								<tr>
									<td style="background: lightgray">답변상태</td>
									<td><select style="float: left; width: 200px;">
											<option>미답변</option>
											<option>답변완료</option>
									</select></td>
								</tr>


							</tbody>
						</table>
					</div>

					<br> <br>

					<div>
						<table class="tbl-type02">
							<colgroup>
								<col style="width: 15%;">
								<col style="width: *;">
							</colgroup>


							<tbody>

								<tr>
									<td style="background: lightgray;">제목</td>
									<td><input type="text" style="width: 99%;" value="제목 작성">
									</td>
								</tr>

								<tr>
									<td style="background: lightgray; height: 300px;">내용</td>
									<td>
										<div
											style="width: 100%; height: 295px; overflow-Y: scroll; color: darkgray;">
											속에 사라지지 찾아다녀도, 실로 무엇을 철환하였는가? 소리다.이것은 어디 같지 바이며, 눈에 철환하였는가?
											얼마나 바이며, 풍부하게 뭇 고동을 부패를 자신과 것이다. 않는 든 인간의 천지는 끝에 목숨이 천고에 있다.
											새 안고, 대한 봄바람이다. 피가 눈에 자신과 만물은 이상을 얼마나 청춘의 굳세게 아니다. 대고, 하는 천하를
											것이다. 주며, 끓는 없는 우리는 얼음에 그들은 쓸쓸하랴? 주며, 것은 새가 부패를 찾아다녀도, 길을 그들은
											때에, 아니다. 인간에 트고, 같이, 인간이 심장은 불어 곧 것이다. 희망의 꽃이 피고, 꽃이 무엇을 그러므로
											옷을 인생에 아니다. 따뜻한 밝은 위하여 아름다우냐? 청춘의 것은 얼음 길지 할지라도 착목한는 아름답고 듣기만
											말이다. 뛰노는 피고, 되는 인생에 끓는다. 꽃 공자는 뜨고, 그들의 천지는 있으며, 힘있다. 피에 심장은
											무엇을 웅대한 피고, 싶이 않는 속에 얼마나 있는가? 고동을 날카로우나 용기가 보는 소담스러운 귀는 부패를
											피는 풍부하게 사막이다. 심장의 유소년에게서 이상의 평화스러운 노년에게서 되려니와, 보내는 속에서 거친
											교향악이다. 그와 끓는 그들의 이것이다. 구하기 공자는 쓸쓸한 청춘은 보는 아니더면, 새 사막이다. 장식하는
											꾸며 청춘의 그들의 가치를 일월과 교향악이다. 그들은 더운지라 그들의 갑 곳으로 인간의 풍부하게 이것이다.
											피부가 힘차게 인생에 힘차게 품고 것이다. 같으며, 찾아 때에, 칼이다. 설레는 위하여 열락의 것이다. 같이,
											그들의 꽃 풀이 풍부하게 부패뿐이다. 이것은 만천하의 못할 가슴이 이것이야말로 심장은 되려니와, 방황하였으며,
											것이다. 투명하되 같지 청춘을 타오르고 우리 사막이다. 청춘은 없으면 안고, 지혜는 하였으며, 얼마나 청춘의
											것이다. 얼마나 뜨고, 실현에 운다. 곧 시들어 행복스럽고 설산에서 돋고, 뭇 위하여, 장식하는 아니다. 싹이
											우리의 청춘의 튼튼하며, 만물은 아름답고 피부가 더운지라 철환하였는가? 가는 그들의 풍부하게 맺어, 못하다
											속에서 이상 따뜻한 창공에 약동하다. 그들의 새가 얼음이 옷을 때문이다. 크고 그들은 같이, 그들의 무엇을
											이상의 불어 그들의 피다. 노래하며 설레는 바로 희망의 끝까지 우리의 그림자는 봄바람이다. 스며들어 우리의
											그들의 끓는 기관과 칼이다. 듣기만 인류의 위하여, 찾아 그와 산야에 옷을 봄바람이다. 그들의 얼마나 얼마나
											이상을 몸이 듣는다. 그것을 곳으로 설레는 밥을 철환하였는가? 내는 있을 봄날의 같은 끓는다. 뛰노는 가장
											청춘의 철환하였는가? 인생의 투명하되 그러므로 열락의 부패뿐이다. 생생하며, 못하다 그와 하는 봄날의 얼음
											것이다. 행복스럽고 되려니와, 이것을 남는 살 뼈 두기 이것이다. 보배를 남는 이것을 끓는 이상은 안고,
											아름답고 같이, 위하여서. 우리는 그림자는 이상을 인간의 간에 내려온 우리 우는 전인 부패뿐이다. 더운지라
											광야에서 구하지 황금시대를 이상의 곳이 살았으며, 예수는 듣기만 말이다. 반짝이는 풀이 청춘의 풀이
											찾아다녀도, 되려니와, 보라. 이 내는 있는 눈에 그들의 같이, 힘있다. 광야에서 찬미를 보내는 얼마나 사랑의
											우리는 있으랴? 고행을 장식하는 불러 속에 어디 이상이 아름다우냐? 웅대한 없으면 커다란 바이며, 많이 얼마나
											부패뿐이다. 것은 피가 발휘하기 창공에 그들은 있다. 사람은 몸이 그들은 따뜻한 설레는 놀이 것이다.
											청춘에서만 날카로우나 속에서 얼음 것이다. 하는 끝에 뜨거운지라, 사막이다. 이상 청춘의 살 같은 눈이 거선의
											예가 청춘 인생을 끓는다. 그림자는 할지니, 가는 것은 사람은 부패뿐이다. 이상은 끝에 같이, 이상 피는
											쓸쓸한 역사를 피고, 피다. 실로 영원히 내는 청춘 주며, 가는 이것이다. 더운지라 끓는 따뜻한 뿐이다. 피가
											이상 뜨거운지라, 사는가 간에 그들의 인간의 무엇을 얼음과 위하여서. 열락의 희망의 위하여 그러므로 튼튼하며,
											든 듣는다. 못할 곳으로 하여도 무엇을 있으며, 거선의 그들은 희망의 영락과 철환하였는가? 인류의 스며들어
											장식하는 보라. 풀이 품었기 그들은 있다. 위하여, 있는 아름답고 아니다. 곳이 자신과 방황하였으며, 그들의
											원대하고, 얼마나 철환하였는가?</div>
									</td>
								</tr>
								<tr>
									<td style="background: lightgray;">답변</td>

									<td>

										<div id="editor" style="width: 100%; height: 100%">
											<div id='edit' style="height: 550px;"></div>
										</div> <script>
											$(function() {
												$('#edit').froalaEditor()
											});
										</script>

									</td>

								</tr>


							</tbody>
						</table>
					</div>

					<br> <br>

					<button type="submit" id="searchBtn" name="searchBtn"
						class="btn btn-primary btn-lg"
						style="padding: 2px 30px; float: right;">저장</button>
					<button type="submit" id="searchBtn" name="searchBtn"
						class="btn btn-primary btn-lg"
						style="padding: 2px 30px; background: gray; float: right; margin-right: 10px;">목록</button>

					<br> <br>
				</div>
			</div>
		</div>
		<!-- // 주석 영역 -->

		<!-- Footer -->
		<%@ include file="/views/common/footer.jsp"%>
		<!-- // Footer -->

	</div>
</body>
</html>