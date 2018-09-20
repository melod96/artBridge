<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal" id="hugiModal">
	<div class="modal-dialog" style = "width:830px; height:600px;">
			<form action="<%=request.getContextPath()%>/hugi.sp" method = "post">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">이용후기</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<p>※ 본 작품과 관련 없는 글, 통신 예절에 어긋난 글은 임의로 삭제될 수 있습니다.</p>
			<span>평점 : </span>
			<div class="rateit" data-rateit-mode="font" data-rateit-icon=""
				style="font-family: fontawesome"data-rateit-min="0"></div>
			<script
				src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
			<script type="text/javascript">
				var configFontAwesome = {
					custom : {
						families : [ 'fontawesome' ],
						urls : [ 'https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css' ]
					},
					fontactive : function() {
						$('.rateit-fa').rateit();
					}
				};
				WebFont.load(configFontAwesome);
			</script>

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
			<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
			<button type="submit" class="btn btn-primary" data-dismiss="modal">저장</button>
		</div>
			</form>

	</div>
</div>
</div>