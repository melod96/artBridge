<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.comvision.artBridge.board.model.vo.*"%>
<%
	ArrayList<Board> list = null;
	if((ArrayList<Board>)request.getAttribute("list") != null ){
		list = (ArrayList<Board>)request.getAttribute("list"); 
	}
	PageInfo pi = null;
	if((PageInfo)request.getAttribute("pi") != null){
		pi = (PageInfo)request.getAttribute("pi");
		int listCount = pi.getListCount();
		int currentPage = pi.getCurrentPage();
		int maxPage = pi.getMaxPage();
		int startPage = pi.getStartPage();
		int endPage = pi.getEndPage();
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ArtBridge</title>
<%@ include file="/views/common/head.jsp"%>
<style type="text/css">
#cate_banner ul {
	display: inline-block;
	margin-top: 20px;
	margin-right: 10px;
}

.list_top {
	display: inline-block;
	float: left;
}

.left {
	display: inline-block;
}

#tagList {
	border: solid 1px black;
}

#tagList .tag_box {
	max-height: 126px;
	overflow: hidden;
	line-height: 230%;
}

#tagList .tag_box ol {
	margin: 0 20px 18px 0px;
	float: left;
}

.right {
	float: right;
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

					<div id="listFocus" class="clear" style="height: 6px;">&nbsp;</div>
					<div id="list_top" class="cf">

						<div class="ui action input">
							<form style="display: inline-block;">
								<input id="" name="" class="input-short form-inline" type="text"
									placeholder="텍스트를 입력하세요">
								<!--			<input id="" name="" class="form-control input-short" type="text" placeholder="텍스트를 입력하세요">-->

								<button type="button" class="btn btn-default btn-sg form-inline">검색</button>
							</form>
							<li class="left" style="margin-left: 8px"><select
								class="form-control input-xshort">
									<option>최저가</option>
									<option>최고가</option>
									<option>거래완료율</option>
									<option>별점</option>
							</select></li>
							<ul class="right">
								<div class="sBtn1" style="height: 42px; line-height: 42px;"
									onclick="writer_chk('3')">작품 등록 / 수정</div>
							</ul>

						</div>


					</div>
					<br>

					<div id="tagList">
						<ul style="margin-bottom: 10px" id="hashtitle">
							<i class="fa fa-tag" style="margin-top: -3px; font-size: 18px"></i>
							<span class="fsize13">연관검색어</span>
						</ul>
						<ul class="tag_box">

							<ol>
								<a
									href="index.php?channel=list&cate=100000000000&commers=&field=tag&search=19#listFocus"
									class="tag21">#귀염뽀작</a>
							</ol>
							<ol>
								<a
									href="index.php?channel=list&cate=100000000000&commers=&field=tag&search=19#listFocus"
									class="tag21">#귀염뽀작</a>
							</ol>
							<ol>
								<a
									href="index.php?channel=list&cate=100000000000&commers=&field=tag&search=19#listFocus"
									class="tag21">#귀염뽀작</a>
							</ol>
							<ol>
								<a
									href="index.php?channel=list&cate=100000000000&commers=&field=tag&search=19#listFocus"
									class="tag21">#귀염뽀작</a>
							</ol>
							<ol>
								<a
									href="index.php?channel=list&cate=100000000000&commers=&field=tag&search=19#listFocus"
									class="tag21">#귀염뽀작</a>
							</ol>
							<ol>
								<a
									href="index.php?channel=list&cate=100000000000&commers=&field=tag&search=19#listFocus"
									class="tag21">#귀염뽀작</a>
							</ol>
							<ol>
								<a
									href="index.php?channel=list&cate=100000000000&commers=&field=tag&search=19#listFocus"
									class="tag21">#귀염뽀작</a>
							</ol>
							<ol>
								<a
									href="index.php?channel=list&cate=100000000000&commers=&field=tag&search=19#listFocus"
									class="tag21">#귀염뽀작</a>
							</ol>
							<ol>
								<a
									href="index.php?channel=list&cate=100000000000&commers=&field=tag&search=19#listFocus"
									class="tag21">#귀염뽀작</a>
							</ol>
							<ol>
								<a
									href="index.php?channel=list&cate=100000000000&commers=&field=tag&search=19#listFocus"
									class="tag21">#귀염뽀작</a>
							</ol>
							<ol>
								<a
									href="index.php?channel=list&cate=100000000000&commers=&field=tag&search=19#listFocus"
									class="tag21">#귀염뽀작</a>
							</ol>
							<ol>
								<a
									href="index.php?channel=list&cate=100000000000&commers=&field=tag&search=19#listFocus"
									class="tag21">#귀염뽀작</a>
							</ol>

						</ul>

					</div>
					<div class="clear" style="height: 30px;">&nbsp;</div>


					<form name="listForm" method="post" action="">
						<div id="list_list" style="display: none;">
							<table cellspacing="0" cellpadding="0" border="0" width="100%">
								<tbody id="list_table"></tbody>
								<!-- id:listTable 에 리스트가 나옵니다. -->
							</table>
						</div>

						<%for(Board b :list){ %>
						
							<div id="list_img" style="display: block;">
							<div class="list_img_box both left">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url() no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url() no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url() no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href=""
												title="이작가의 다른 작품보기">aaa 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;반실사/풀채색
											일러스트/배경 일러스트/팬아트
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 101%; overflow: hidden">
												<img src="">
											</div>
										</dl>
										<dl class="price">200,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>

						<%} %>

						<!-- <div id="list_img" style="display: block;">
							<div class="list_img_box both left">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=466&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/466.jpg?ver=1532843667) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/466B.jpg?ver=1532843667) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/466C.jpg?ver=1532843667) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=soakrane12"
												title="이작가의 다른 작품보기">WorkHight 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;반실사/풀채색
											일러스트/배경 일러스트/팬아트
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 101%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">상업용 / 비상업용
										</dl>
										<dl class="price">200,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box right">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=999&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/999.jpg?ver=1536198584) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/999B.jpg?ver=1536198584) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/999C.jpg?ver=1536198584) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=zqas1745"
												title="이작가의 다른 작품보기">ANN 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;반짝이는
											캐주얼 일러스트
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 101%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">상업용 / 비상업용
										</dl>
										<dl class="price">20,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box both left">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=869&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/869.jpg?ver=1530639175) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/869B.jpg?ver=1530639175) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/869C.jpg?ver=1530639175) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=metasis12"
												title="이작가의 다른 작품보기">Nei 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;동화풍,
											화려한 미소녀 일러스트, 캐릭터원화
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">상업용 / 비상업용
										</dl>
										<dl class="price">60,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box right">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=915&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/915.jpg?ver=1536802913) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/915B.jpg?ver=1536802913) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/915C.jpg?ver=1536802913) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=zolzols"
												title="이작가의 다른 작품보기">Zuly 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;미소녀/미소년/
											자캐/ 소설표지/
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 101%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">비상업용
										</dl>
										<dl class="price">28,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box both left">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=679&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/679.png?ver=1536724411) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/679B.png?ver=1536724411) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/679C.png?ver=1536724411) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=zin_rit"
												title="이작가의 다른 작품보기">릿진 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;TCG일러스트,
											캐릭터 일러 커미션
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 101%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">비상업용
										</dl>
										<dl class="price">50,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box right">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=367&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/367.png?ver=1536138352) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/367B.png?ver=1536138352) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/367C.png?ver=1536138352) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=leelyong22"
												title="이작가의 다른 작품보기">이 룡 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;스탠딩,
											러프, 남자캐릭터, SD, LD
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">비상업용
										</dl>
										<dl class="price">4,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box both left">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=1585&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/1585.jpg?ver=1536887013) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1585B.jpg?ver=1536887013) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1585C.jpg?ver=1536887013) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=bee7411"
												title="이작가의 다른 작품보기">Lazbee 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;(50%할인중)
											LD / SD 캐릭터 커미션
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">비상업용
										</dl>
										<dl class="price">22,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box right">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=1435&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/1435.jpg?ver=1536882629) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1435B.jpg?ver=1536882629) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1435C.jpg?ver=1536882629) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=whrkdfbtk"
												title="이작가의 다른 작품보기">가든 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;웹소설
											표지 일러스트, 커미션 의뢰 받습니다.
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">상업용 / 비상업용
										</dl>
										<dl class="price">20,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box both left">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=1359&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/1359.png?ver=1536852911) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1359B.png?ver=1536852911) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1359C.png?ver=1536852911) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=stercrew"
												title="이작가의 다른 작품보기">묘야 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;귀여운
											캐릭터/유튜브/방송화면/커미션
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 101%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">상업용 / 비상업용
										</dl>
										<dl class="price">25,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box right">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=1341&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/1341.png?ver=1536850433) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1341B.png?ver=1536850433) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1341C.png?ver=1536850433) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=rmaapekf100"
												title="이작가의 다른 작품보기">흥제 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;이모티콘
											커미션
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">상업용 / 비상업용
										</dl>
										<dl class="price">6,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box both left">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=1312&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/1312.jpg?ver=1536847870) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1312B.jpg?ver=1536847870) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1312C.jpg?ver=1536847870) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=missnak2"
												title="이작가의 다른 작품보기">용용 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;[생일선물]용용
											커플 캐릭터 일러스트 그립니다
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">비상업용
										</dl>
										<dl class="price">25,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box right">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=748&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/748.png?ver=1536847094) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/748B.png?ver=1536847094) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/748C.png?ver=1536847094) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=scr0229"
												title="이작가의 다른 작품보기">귀현화 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;COMMISSION❖
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">비상업용
										</dl>
										<dl class="price">15,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box both left">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=900&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/900.jpg?ver=1536846613) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/900B.jpg?ver=1536846613) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/900C.jpg?ver=1536846613) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=jlahan"
												title="이작가의 다른 작품보기">JLaHan 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;커미션/외주/자캐/팬아트/표지/일러스트
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">상업용 / 비상업용
										</dl>
										<dl class="price">30,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box right">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=1523&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/1523.png?ver=1536844627) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1523B.png?ver=1536844627) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1523C.png?ver=1536844627) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=americanomix"
												title="이작가의 다른 작품보기">아믹 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;일러스트/
											캐릭터 디자인/ 커미션 받습니다
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 101%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">상업용 / 비상업용
										</dl>
										<dl class="price">25,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box both left">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=288&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/288.png?ver=1536841749) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/288B.png?ver=1536841749) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/288C.png?ver=1536841749) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=illang_love"
												title="이작가의 다른 작품보기">illang 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;보글보글
											LD~♪
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">비상업용
										</dl>
										<dl class="price">20,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box right">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=433&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/433.jpg?ver=1536836130) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/433B.jpg?ver=1536836130) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/433C.jpg?ver=1536836130) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=lunapolla0619"
												title="이작가의 다른 작품보기">Lunacle 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;미소녀캐릭터
											커미션 받습니다.
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">상업용 / 비상업용
										</dl>
										<dl class="price">60,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box both left">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=1375&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/1375.png?ver=1536836002) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1375B.png?ver=1536836002) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1375C.png?ver=1536836002) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=g8g82g"
												title="이작가의 다른 작품보기">세리넬 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;여캐
											위주/일러스트
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">비상업용
										</dl>
										<dl class="price">20,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box right">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=550&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/550.png?ver=1536833180) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/550B.png?ver=1536833180) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/550C.png?ver=1536833180) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=gpsu4337"
												title="이작가의 다른 작품보기">율운 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;LD/자캐/반셀식/반무테/비상업/상업/커미션
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">상업용 / 비상업용
										</dl>
										<dl class="price">10,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box both left">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=1635&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/1635.jpg?ver=1536832579) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1635B.jpg?ver=1536832579) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1635C.png?ver=1536832579) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=kyoung0790"
												title="이작가의 다른 작품보기">대호 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;캐릭터 /
											팬아트 / 소년
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">비상업용
										</dl>
										<dl class="price">6,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box right">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=1597&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/1597.png?ver=1536830848) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1597B.png?ver=1536830848) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1597C.png?ver=1536830848) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=usso1017"
												title="이작가의 다른 작품보기">세루 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;커미션,
											외주 다 받아요!
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">상업용 / 비상업용
										</dl>
										<dl class="price">15,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box both left">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=1577&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/1577.png?ver=1536824314) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1577B.png?ver=1536824314) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1577C.png?ver=1536824314) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=stercrew"
												title="이작가의 다른 작품보기">묘야 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;트위치/유튜브/방송화면/일러스트
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">비상업용
										</dl>
										<dl class="price">15,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box right">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=1414&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/1414.png?ver=1536821985) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1414B.png?ver=1536821985) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1414C.jpg?ver=1536821985) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=chyoling"
												title="이작가의 다른 작품보기">치요 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;미소녀 /
											캐릭터 / TCG 외주구합니다
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">상업용
										</dl>
										<dl class="price">400,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box both left">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=851&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/851.jpg?ver=1536814786) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/851B.jpg?ver=1536814786) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/851C.jpg?ver=1536814786) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=kbr7416"
												title="이작가의 다른 작품보기">루비앙 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;일러스트/유튜브/개인방송/프로필/채널아트/배너
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 101%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">비상업용
										</dl>
										<dl class="price">10,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box right">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=1617&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/1617.jpg?ver=1536813194) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1617B.png?ver=1536813194) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1617C.jpg?ver=1536813194) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=monana0104"
												title="이작가의 다른 작품보기">모나 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;sd캐릭터+ld캐릭터
											커미션 받아요
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">비상업용
										</dl>
										<dl class="price">10,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box both left">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=541&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/541.jpg?ver=1536812411) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/541B.png?ver=1536812411) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/541C.png?ver=1536812411) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=dhql4845"
												title="이작가의 다른 작품보기">오이비둘기 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;일러스트/
											캐쥬얼/ 반실사/LD/SD/ 커미션/외주
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 101%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">상업용 / 비상업용
										</dl>
										<dl class="price">6,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box right">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=1623&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/1623.png?ver=1536806755) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1623B.png?ver=1536806755) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1623C.jpg?ver=1536806755) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=wldms6191"
												title="이작가의 다른 작품보기">쥿피 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;풀일러스트/캐릭터/팬아트/캐리커쳐/삽화그립니다!!
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">상업용 / 비상업용
										</dl>
										<dl class="price">150,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box both left">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=1598&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/1598.jpg?ver=1536805914) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1598B.jpg?ver=1536805914) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1598C.jpg?ver=1536805914) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=xodid3819"
												title="이작가의 다른 작품보기">라스 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;2D캐릭터,캐쥬얼
											일러스트 커미션
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">비상업용
										</dl>
										<dl class="price">15,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box right">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=1489&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/1489.jpg?ver=1536802117) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1489B.jpg?ver=1536802117) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1489C.jpg?ver=1536802117) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=vvdbvv"
												title="이작가의 다른 작품보기">PAXCAL 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;일러스트/커미션
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">상업용 / 비상업용
										</dl>
										<dl class="price">30,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box both left">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=1629&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/1629.png?ver=1536802077) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1629B.png?ver=1536802077) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1629C.png?ver=1536802077) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=sorosoro636"
												title="이작가의 다른 작품보기">SORO 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;표지
											및 삽화 / 컬러 일러스트
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">상업용 / 비상업용
										</dl>
										<dl class="price">50,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
							<div class="list_img_box right">
								<ul>
									<ol style="height: 145px;">
										<a
											onclick="goods_view(&quot;index.php?channel=view&amp;uid=1630&quot;)">
											<dl class="thumb3" style="margin-left: 0;">
												<li
													style="background: url(image/goods_img2/1630.png?ver=1536801994) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/goods_img2/1630B.png?ver=1536801994) no-repeat center 15%"></li>
											</dl>
											<dl class="thumb3">
												<li
													style="background: url(image/no_goods/no_goods2.gif) no-repeat center 15%"></li>
											</dl>
										</a>
									</ol>
									<ol style="height: 28px;">
										<dl class="left ellip"
											style="padding-left: 6px; width: 360px;">
											<a
												href="index.php?channel=list&amp;field=brand&amp;search=dkanrjsk_00"
												title="이작가의 다른 작품보기">dkanrjsk_0 작가</a>&nbsp;&nbsp;/&nbsp;&nbsp;소년/소녀/커미션
										</dl>
									</ol>
									<ol>
										<dl class="starBg_list">
											<div style="width: 1%; overflow: hidden">
												<img src="skin/default//img/shop/icon_star.gif">
											</div>
										</dl>
										<dl class="commercial">비상업용
										</dl>
										<dl class="price">5,000~
										</dl>
									</ol>
								</ul>
								<div class="clear" style="height: 10px;">&nbsp;</div>
							</div>
						</div>-->
					</form>



					<div id="paging" style='clear: both'></div>
					<!-- <div id="paging_dupl"></div> -->


					<div class="ad_banner5"></div>

					<div class="clear" style="height: 20px">&nbsp;</div>
					<div class="paginate">
						<a href="#" class="btn-first" title="처음"><em class="blind">목록에서
								처음 페이지 이동</em></a> <a href="#" class="btn-prev" title="이전"><em
							class="blind">목록에서 이전 페이지 이동</em></a> <span class="paging-numbers">
							<a href="#">1<span class="blind">페이지로 이동</span></a> <a href="#"
							class="on">2<span class="blind">페이지로 이동</span></a> <a href="#">3<span
								class="blind">페이지로 이동</span></a> <a href="#">4<span
								class="blind">페이지로 이동</span></a> <a href="#">5<span
								class="blind">페이지로 이동</span></a>
						</span> <a href="#" class="btn-next" title="다음"><span class="spr"><em
								class="blind">목록에서 다음 페이지 이동</em></span></a> <a href="#" class="btn-last"
							title="끝"><span class="spr"><em class="blind">목록에서
									끝 페이지 이동</em></span></a>
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