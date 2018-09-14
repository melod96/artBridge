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
        .team-info{font-size:18px; margin:20px 0 50px; line-height:1.5;}
        .memlist{overflow:hidden; margin-bottom:100px;}
        .memlist li{float:left; width:300px; margin-left:105px; margin-bottom:30px; text-align:center;}
        .memlist li:nth-child(1), .memlist li:nth-child(4){margin-left:0; clear:both;}
        .memlist li img{width:100%; border-radius:50%;}
         .memlist li img:hover{border:5px solid transparent;}
        .memlist .name{font-size:27px; font-weight:bold; margin-top:15px; margin-bottom:5px;}
        .memlist .sub{font-size:19px;}

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
                <h2>회사소개</h2>
            </div>
        </section>

        <!-- contents area -->
        <div class="contents">
            <div class="container">
                <div class="col-md-12">
                    
                    <div style="width:1110px;">
                        <div class="heading">
                            <h2 class="tit1">아트브릿지 개발팀</h2>
                        </div>
                        <p class="team-info">팀명 <strong>COMVISION</strong>은 Commission과 Vision의 합성어로, <br><strong>커미션을 통해 작가들에게 비전을 안겨주겠다!</strong> 라는 의미를 담고 있습니다.</p>
                        <div class="memlist">
                            <ul>
                                <li>
                                    <img src="../image/member01.png">
                                    <p class="name">양소나</p>
                                    <p class="sub">작가 작품등록, 관리자</p>
                                </li>
                                <li>
                                    <img src="../image/member02.png">
                                    <p class="name">이형우</p>
                                    <p class="sub">메인, 이용안내, 공지사항</p>
                                </li>
                                <li>
                                    <img src="../image/member03.png">
                                    <p class="name">박소진</p>
                                    <p class="sub">관리자 페이지</p>
                                </li>
                                <li>
                                    <img src="../image/member04.png">
                                    <p class="name">이혜미</p>
                                    <p class="sub">커미션 페이지, 결제</p>
                                </li>
                                <li>
                                    <img src="../image/member05.png">
                                    <p class="name">김현도</p>
                                    <p class="sub">회원가입, 로그인</p>
                                </li>
                                <li>
                                    <img src="../image/member06.png">
                                    <p class="name">최수정</p>
                                    <p class="sub">마이페이지</p>
                                </li>
                            </ul>
                        </div>
                    </div>

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