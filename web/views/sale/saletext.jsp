<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ArtBridge</title>
<%@ include file="/views/common/head.jsp" %>
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
	border: 1px solid black;
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
	background: lightgray;
	height: 50px;
	margin-bottom: 30px;
	font-size: 20px;
	color: black;
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
				<div class="col-md-12">
					<!-- 이 영역에서 작업하세요 -->


					<div class="clear" style="height: 50px;">&nbsp;</div>

					<div class="left_title">
						<h5>작품번호(0001)</h5>
						<h2>
							<a href="">토비</a> - SD / 귀염뽀작
						</h2>
					</div>
					<div class="left">
						<p>이미지 들어갈 곳</p>
					</div>
					<div class="right">
						<img src="../image/piece/writerimg.PNG" id="img">
						<p align="center">
							<a href="">토비작가</a>
						</p>
						<ol id="receive" align="center">접수중
						</ol>
						<ol align="center">
							평점
							<font class="lsp0">0.0</font>
						</ol>
						<div align="center" style="margin-bottom: 15px;">
							<button type="button" class="btn btn-primary">작가에게 쪽지보내기</button>
						</div>
						<div align="center" id="text">상세옵션</div>
						<div>
							<p>
								<span>제출 파일 유형</span> : <span>벡터파일 / jpg,png</span>
							</p>
							<p>
								<span>해상도</span> : <span>300dpi</span>
							</p>
							<p>
								<span>사이즈</span> : <span>A4</span>
							</p>
							<p>
								<span>수정 횟수</span> : <span>3회</span>
							</p>
							<p>
								<span>작업 기간</span> : <span>시작일로부터 15일</span>
							</p>
						</div>
						<div align="center" id="text">가격옵션</div>
						<form>
							<label>옵션</label> <select>
								<option>옵션을 선택하세요1</option>
								<option>옵션을 선택하세요2</option>
							</select><br> <label>요구사항 추가</label> <input type="text" id = "requirement">
							<button type="button" class="btn btn-primary btn-sm" onclick = "add()">추가</button>
							<script>
								function add(){
									var d = document.getElementById("requirement");
									d.innerHTML += "<input type = 'text'>";
								}
							</script>
							<div class="orderline"></div>
							<div id="payment">
								<ul align="right">
									<div class="totalTitle">
										결제 금액 : <span id="totals">0</span><font
											style="font-size: 24px">원</font>
									</div>
								</ul>
								<ul style="margin-top: 10px;" align="center">
									<button type="submit" class="btn btn-primary btn-mg">명세표
										보내기</button>
								</ul>
							</div>
							<div align="center" id="text">information</div>
							<div>
								<ul class="cf">

									<p>
										<span>작가등급</span> : <span>일반작가</span>
									</p>
									<p>
										<span>게시글 카테고리</span> : <span>#sd , #귀염뽀작</span>
									</p>
									<p>슬롯</p>
									<input type="radio">
									<input type="radio">
									<input type="radio">
								</ul>
							</div>
						</form>
					</div>
					<div id="text">
						<p align="center">크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는
							무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를
							철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가? 아니다 그들은 커다란 이상 곧
							만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을 행복스럽고 평화스러운 곳으로 인도하겠다는 커다란
							이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가 싶이 살았으며 그들의 그림자는 천고에 사라지지 않는
							것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지 못하다 할지라도 창공에 반짝이는 뭇 별과 같이 산야에

							하여도 가슴이 설레는 말이다 청춘! 너의 두손을 가슴에 대고 물방아 같은 심장의 고동을 들어 보라 청춘의 피는 끓는다
							끓는 피에 뛰노는 심장은 거선의 기관과 같이 힘있다 이것이다 인류의 역사를 꾸며 내려온 동력은 바로 이것이다 이성은
							투명하되 얼음과 같으며 지혜는 날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴?
							얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이
							트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 위하여
							광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서
							그리하였는가? 아니다 그들은 커다란 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을
							행복스럽고 평화스러운 곳으로 인도하겠다는 커다란 이상을 품었기 때문이다 그러므로 그들은 길지 아니한 목숨을 사는가
							싶이 살았으며 그들의 그림자는 천고에 사라지지 않는 것이다 이것은 현저하게 일월과 같은 예가 되려니와 그와 같지
							못하다 할지라도 창공에 반짝이는 뭇 별과 같이 산야에 피어나는 군영과 같이 이상은 실로 인간의 부패를 방지하는
							소금이라 할지니 인생에 가치를 주는 원질이 되는 것이다 그들은 앞이 긴지라 착목한는 곳이 원대하고 그들은 피가
							더운지라 실현에 대한 자신과 용기가 있다 그러므로 그들은 이상의 보배를 능히 품으며 그들의 이상은 아름답고 소담스러운
							열매를 맺어 우리 인생을 풍부하게 하는 것이다 보라 청춘을 ! 그들의 몸이 얼마나 튼튼하며 그들의 피부가</p>
					</div>
					<div style="height: 30px"></div>
					<p align="center">
						<a href="">환불 규정 및 구매자 유의사항</a>
					</p>

					<div style="height: 30px"></div>
					<p align="center">모든 이미지는 저작권이 있는 이미지 입니다. 무단 도용 및 복제를 금합니다.</p>

				</div>
				<div class="hugiheader">
					<div>
						<h4>이용후기</h4>
						<button type="button" class="btn btn-md">후기 작성</button>
					</div>
					<div class="hugi">
						<table>
							<th>번호</th>
							<th>평점</th>
							<th>내용</th>
							<th>작성자</th>
							<th>작성일</th>
						</table>
					</div>
					<!-- // 이 영역에서 작업하세요 -->
				</div>
			</div>
		</div>
		<!-- // contents area -->

		<%@ include file="/views/common/footer.jsp"%>

	</div>
</body>
</html>