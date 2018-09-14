<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Art Bridge</title>
	<%@ include file="/views/common/head.jsp" %>
</head>
<body>
    <div id="all">
       
        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
        <!-- // Header -->

        <!-- subHeader -->
 		<%@ include file="/views/common/subHeader.jsp" %>
        <!-- //subHeader -->

        <!-- 주석 영역 -->
        <div class="contents"><!-- contents 필수 사용 -->
            <div class="container"><!-- container 필수 사용 -->
                <div class="col-md-12">
                    <div class="heading">
                        <h2>일반 타이틀</h2>
                    </div>

                    <hr>

                    <div class="heading">
                        <h2 class="tit1">뽀짝 타이틀 쓸 경우</h2>
                    </div>

                    <hr>

                    <h3>input 스타일</h3>
                    <h5 style="line-height:2;">input-lg : 높이 큼 <br> (default) : 높이 중간</h5>
                    <input id="" name="" class="form-control input-lg" type="text" placeholder="텍스트를 입력하세요">
                    <br>
                    <input id="" name="" class="form-control" type="text" placeholder="텍스트를 입력하세요">
                    <br>
                    <h5 style="line-height:2;">(default) : 길이 100% <br> input-mid : 길이 중간 <br> input-short : 길이 짧음 </h5>
                    <input id="" name="" class="form-control" type="text" placeholder="텍스트를 입력하세요">
                    <br>
                    <input id="" name="" class="form-control input-mid" type="text" placeholder="텍스트를 입력하세요">
                    <br>
                    <input id="" name="" class="form-control input-short" type="text" placeholder="텍스트를 입력하세요">
                    <h5>#input의 높이와 길이 class는 중첩 사용가능, 원하는 길이가 없을경우 해당 input에 스타일을 입혀주세요!</h5>

                    <br><hr><br>

                    <h3>select 스타일</h3>
                    <h5 style="line-height:2;">input-lg : 높이 큼 <br> (default) : 높이 중간</h5>
                    <select class="form-control input-lg">
                        <option>옵션을 선택하세요1</option>
                        <option>옵션을 선택하세요2</option>
                    </select>
                    <br>
                    <select class="form-control">
                        <option>옵션을 선택하세요1</option>
                        <option>옵션을 선택하세요2</option>
                    </select>
                    <br>
                    <h5 style="line-height:2;">(default) : 길이 100% <br> input-mid : 길이 중간 <br> input-short : 길이 짧음 <br> input-xshort : 매우 짧음</h5>
                    <select class="form-control">
                        <option>옵션을 선택하세요1</option>
                        <option>옵션을 선택하세요2</option>
                    </select>
                    <br>
                    <select class="form-control input-mid">
                        <option>옵션을 선택하세요1</option>
                        <option>옵션을 선택하세요2</option>
                    </select>
                    <br>
                    <select class="form-control input-short">
                        <option>옵션을 선택하세요1</option>
                        <option>옵션을 선택하세요2</option>
                    </select>
                    <br>
                    <select class="form-control input-xshort">
                        <option>선택하세요1</option>
                        <option>선택하세요2</option>
                    </select>
                    <h5>#input의 높이와 길이 class는 중첩 사용가능, 원하는 길이가 없을경우 해당 input에 스타일을 입혀주세요!</h5>

                    <br><hr><br>

                    <h3>table 스타일1</h3>
                    <div class="btn-right add-some">
                         <p>텍스트나 어떤 요소 는 왼쪽, 버튼은 오른쪽으로  한줄에 있을 경우</p>
                         <button type="button" class="btn btn-primary btn-sm">작품등록/수정</button>
                     </div>
                    <table class="tbl-type01">
                        <colgroup>
                            <col style="width: 20%;">
                            <col style="width: 30%;">
                            <col style="width: 20%;">
                            <col style="width: 30%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>ID</th>
                                <td colspan="3">
                                    <input id="" name="" class="form-control ipt-long" type="text" placeholder="아이디를 입력하세요">
                                </td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td>
                                    <input id="" name="" class="form-control ipt-long" type="text" placeholder="">
                                </td>
                                <th>전화번호</th>
                                <td>
                                    <input id="" name="" class="form-control ipt-long" type="text" placeholder="">
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <br><hr><br>

                    <h3>table 스타일2</h3>
                    <table class="tbl-type02">
                        <colgroup>
                            <col style="width: 8%;">
                            <col style="width: 10%;">
                            <col style="width: 15%;">
                            <col style="width: 13%;">
                            <col style="width: 15%;">
                            <col style="width: *;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">선택</th>
                                <th scope="col">NO</th>
                                <th scope="col">작가명</th>
                                <th scope="col">게시글ID</th>
                                <th scope="col">작성일</th>
                                <th scope="col">게시글 제목</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox" name=""></td>
                                <td>10</td>
                                <td>소나나</td>
                                <td>18083001</td>
                                <td>2018-08-30</td>
                                <td class="txt-fl"><a href="#">귀여운 일러스트/캐릭터/방송화면/커미션</a></td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name=""></td>
                                <td>9</td>
                                <td>쏘나</td>
                                <td>18083001</td>
                                <td>2018-08-30</td>
                                <td class="txt-fl"><a href="#">귀여운 일러스트/캐릭터/방송화면/커미션</a></td>
                            </tr>
                        </tbody>
                    </table>

                    <br><hr><br>

                    <h3>페이징 스타일</h3>
                    <div class="paginate">
                        <a href="#" class="btn-first" title="처음"><em class="blind">목록에서 처음 페이지 이동</em></a>
                        <a href="#" class="btn-prev" title="이전"><em class="blind">목록에서 이전 페이지 이동</em></a>
                        <span class="paging-numbers">
                            <a href="#">1<span class="blind">페이지로 이동</span></a>
                            <a href="#" class="on">2<span class="blind">페이지로 이동</span></a>
                            <a href="#">3<span class="blind">페이지로 이동</span></a>
                            <a href="#">4<span class="blind">페이지로 이동</span></a>
                            <a href="#">5<span class="blind">페이지로 이동</span></a>
                        </span>
                        <a href="#" class="btn-next" title="다음"><span class="spr"><em class="blind">목록에서 다음 페이지 이동</em></span></a>
                        <a href="#" class="btn-last" title="끝"><span class="spr"><em class="blind">목록에서 끝 페이지 이동</em></span></a>
                    </div>

                   <br><hr><br>

                    <h3>button 태그</h3>
                    <h5>페이지 하단 큰 버튼</h5>
                    <div class="btn-center">
                      <button type="button" class="btn btn-default btn-lg">취소</button>
                      <button type="submit" class="btn btn-primary btn-lg">확인</button>
                    </div>

                     <br><br> <br><br>
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