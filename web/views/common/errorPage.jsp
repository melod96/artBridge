<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css" media="screen">
body {
	background-color: #f1f1f1;
	margin: 0;
}

body, input, button {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}

.container {
	margin: 30px auto 40px auto;
	width: 800px;
	text-align: center;
}

a {
	color: #4183c4;
	text-decoration: none;
	font-weight: bold;
}

a:hover {
	text-decoration: underline;
}

h3 {
	color: #666;
}

ul {
	list-style: none;
	padding: 25px 0;
}

li {
	display: inline;
	margin: 10px 50px 10px 0px;
}

input[type=text], input[type=password] {
	font-size: 13px;
	min-height: 32px;
	margin: 0;
	padding: 7px 8px;
	outline: none;
	color: #333;
	background-color: #fff;
	background-repeat: no-repeat;
	background-position: right center;
	border: 1px solid #ccc;
	border-radius: 3px;
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.075);
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.15s ease-in;
	transition: all 0.15s ease-in;
	vertical-align: middle;
}

.btn {
	position: relative;
	display: inline-block;
	padding: 6px 12px;
	font-size: 13px;
	font-weight: bold;
	line-height: 20px;
	color: #333;
	white-space: nowrap;
	vertical-align: middle;
	cursor: pointer;
	background-color: #EEE;
	background-image: -webkit-linear-gradient(#FCFCFC, #EEE);
	background-image: linear-gradient(#FCFCFC, #EEE);
	background-repeat: repeat-x;
	border: 1px solid #d5d5d5;
	border-radius: 3px;
	user-select: none;
	-webkit-appearance: none;
}

.btn:focus, input[type=text]:focus, input[type=password]:focus {
	text-decoration: none;
	border-color: #51a7e8;
	outline: none;
	box-shadow: 0 0 5px rgba(81, 167, 232, 0.5);
}

.btn:hover, .btn:active {
	text-decoration: none;
	background-color: #ddd;
	background-image: -webkit-linear-gradient(#eee, #ddd);
	background-image: linear-gradient(#eee, #ddd);
	background-repeat: repeat-x;
	border-color: #ccc;
}

.btn:active {
	background-color: #dcdcdc;
	background-image: none;
	border-color: #b5b5b5;
	box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.15);
}

@media only screen and (-webkit-min-device-pixel-ratio: 2) , only screen and (
		min--moz-device-pixel-ratio: 2) , only screen and (
		-o-min-device-pixel-ratio: 2/1) , only screen and (
		min-device-pixel-ratio: 2) , only screen and ( min-resolution: 192dpi)
		, only screen and ( min-resolution: 2dppx) {
	.logo-img-1x {
		display: none;
	}
	.logo-img-2x {
		display: inline-block;
	}
}

#suggestions {
	margin-top: 35px;
	color: #ccc;
}

#suggestions a {
	color: #666666;
	font-weight: 200;
	font-size: 14px;
	margin: 0 10px;
}

#parallax_wrapper {
	position: relative;
	z-index: 0;
	-webkit-transition: all 0.25s ease-in;
	transition: all 0.25s ease-in;
}

#parallax_field {
	overflow: hidden;
	position: absolute;
	left: 0;
	top: 0;
	height: 370px;
	width: 100%;
}

#parallax_field #parallax_bg {
	position: absolute;
	top: -20px;
	left: -20px;
	width: 110%;
	height: 425px;
	z-index: 1;
}

#parallax_illustration {
	display: block;
	margin: 0 auto;
	width: 940px;
	height: 370px;
	position: relative;
	overflow: hidden;
	clear: both;
}

#parallax_illustration img {
	position: absolute;
}

#parallax_illustration #parallax_error_text {
	top: 72px;
	left: 72px;
	z-index: 10;
}

#parallax_illustration #parallax_octocat {
	top: 94px;
	left: 356px;
	z-index: 9;
}

#parallax_illustration #parallax_speeder {
	top: 150px;
	left: 432px;
	z-index: 8;
}

#parallax_illustration #parallax_octocatshadow {
	top: 297px;
	left: 371px;
	z-index: 7;
}

#parallax_illustration #parallax_speedershadow {
	top: 263px;
	left: 442px;
	z-index: 6;
}

#parallax_illustration #parallax_building_1 {
	top: 73px;
	left: 467px;
	z-index: 5;
}

#parallax_illustration #parallax_building_2 {
	top: 113px;
	left: 762px;
	z-index: 4;
}

.msg_area {
	position: absolute;
	z-index: 99999;
	top: 175px; left: 60px; transform: translate3d(9.90901px, -3.60269px, 0px);
	width:264px;
	height:146px;
	text-align:center;
}
.msg_area .txt h1{
	word-break:keep-all;
	font-size:28px;
	color:#2c2525;
}
</style>
</head>
<body>

	<div id="parallax_wrapper">
		<div id="parallax_field">
			<img alt="" class="js-plaxify" data-invert="true" data-xrange="0"
				data-yrange="20" height="415" id="parallax_bg" width="940"
				src="/artBridge/image/common/error/img_error00.jpg"
				style="top: -20px; left: -20px; transform: translate3d(0px, 7.20539px, 0px);">
		</div>
		<div id="parallax_illustration">
			<div class="msg_area">
				<div class="txt">
					<h1 align="center"><%=msg%></h1>
					<button type="button" id="goMain" class="btn" onclick="location.href='<%=request.getContextPath()%>/index.jsp'">메인으로</button>
				</div>
			</div>
			
			<img alt="404 “This is not the web page you are looking for”"
				class="js-plaxify" data-xrange="20" data-yrange="10" height="249"
				id="parallax_error_text" width="271"
				src="/artBridge/image/common/error/img_error01.png"
				style="top: 72px; left: 72px; transform: translate3d(9.90901px, -3.60269px, 0px);">
	
			<img alt="" class="js-plaxify" data-xrange="10" data-yrange="10"
				height="230" id="parallax_octocat" width="188"
				src="/artBridge/image/common/error/img_error02.png"
				style="top: 94px; left: 356px; transform: translate3d(4.9545px, -3.60269px, 0px);">
	
			<img alt="" class="js-plaxify" data-xrange="10" data-yrange="10"
				height="156" id="parallax_speeder" width="440"
				src="/artBridge/image/common/error/img_error03.png"
				style="top: 150px; left: 432px; transform: translate3d(4.9545px, -3.60269px, 0px);">
	
			<img alt="" class="js-plaxify" data-xrange="10" data-yrange="10"
				height="49" id="parallax_octocatshadow" width="166"
				src="/artBridge/image/common/error/img_error04.png"
				style="top: 297px; left: 371px; transform: translate3d(4.9545px, -3.60269px, 0px);">
	
			<img alt="" class="js-plaxify" data-xrange="10" data-yrange="10"
				height="75" id="parallax_speedershadow" width="430"
				src="/artBridge/image/common/error/img_error05.png"
				style="top: 263px; left: 442px; transform: translate3d(4.9545px, -3.60269px, 0px);">
	
			<img alt="" class="js-plaxify" data-invert="true" data-xrange="50"
				data-yrange="20" height="123" id="parallax_building_1" width="304"
				src="/artBridge/image/common/error/img_error06.png"
				style="top: 73px; left: 467px; transform: translate3d(-24.7725px, 7.20539px, 0px);">
	
			<img alt="" class="js-plaxify" data-invert="true" data-xrange="75"
				data-yrange="30" height="50" id="parallax_building_2" width="116"
				src="/artBridge/image/common/error/img_error07.png"
				style="top: 113px; left: 762px; transform: translate3d(-37.6588px, 10.8081px, 0px);">
		</div>
	</div>

	<script>
    !function(t){function n(t){var n=[0,0,0],r=t.css("-webkit-transform")||t.css("-moz-transform")||t.css("-ms-transform")||t.css("-o-transform")||t.css("transform");if("none"!==r){var e=r.split("(")[1].split(")")[0].split(","),o=0,a=0,i=0;16==e.length?(o=parseFloat(e[e.length-4]),a=parseFloat(e[e.length-3]),i=parseFloat(e[e.length-2])):(o=parseFloat(e[e.length-2]),a=parseFloat(e[e.length-1]),i=0),n=[o,a,i]}return n}function r(t){if(0===t.offsetWidth||0===t.offsetHeight)return!1;for(var n=document.documentElement.clientHeight,r=t.getClientRects(),e=0,o=r.length;o>e;e++){var a=r[e],i=a.top>0?a.top<=n:a.bottom>0&&a.bottom<=n;if(i)return!0}return!1}function e(){return v===!0?!1:void 0!==window.DeviceOrientationEvent}function o(t){var n=t.gamma,r=t.beta;if(90===Math.abs(window.orientation)){var e=n;n=r,r=e}return window.orientation<0&&(n=-n,r=-r),p=null===p?n:p,u=null===u?r:u,{x:n-p,y:r-u}}function a(t){if(!((new Date).getTime()<f+s)){f=(new Date).getTime();var n=0,a=0,i=t.pageX-n,p=t.pageY-a;if(r(g[0].obj.get(0).parentNode)){if(e()){if(void 0===t.gamma)return void(v=!0);var u=o(t);i=u.x/l,p=u.y/l,i=c>i?c:i>m?m:i,p=c>p?c:p>m?m:p,i=(i+1)/2,p=(p+1)/2}var h,b,y,w,x,R=document.body.getBoundingClientRect(),F=i/(e()===!0?m:R.width),S=p/(e()===!0?m:R.height);for(b=g.length;b--;)h=g[b],d&&!h.background?(y=h.transformStartX+h.inversionFactor*(h.xRange*F),w=h.transformStartY+h.inversionFactor*(h.yRange*S),x=h.transformStartZ,h.obj.css({transform:"translate3d("+y+"px,"+w+"px,"+x+"px)"})):(y=h.startX+h.inversionFactor*(h.xRange*F),w=h.startY+h.inversionFactor*(h.yRange*S),h.background?h.obj.css({"background-position":y+"px "+w+"px"}):h.obj.css({left:y,top:w}))}}}var i=25,s=1/i*1e3,f=(new Date).getTime(),g=[],l=30,m=1,c=-1,p=null,u=null,v=!1;t.plaxify=function(t,r){return function(){var e=-1;r.xRange=r.xRange?parseInt(r.xRange):0,r.yRange=r.yRange?parseInt(r.yRange):0,r.zRange=r.zRange?parseInt(r.zRange):0;for(var o=0;o<g.length;o++)this===g[o].obj.get(0)&&(e=o);if(r.inversionFactor=r.invert?-1:1,r.obj={get:function(){return t},css:function(n){if("string"==typeof n){var r=n.replace(/-+(.)?/g,function(t,n){return n?n.toUpperCase():""});return t.style[r]||getComputedStyle(t,"").getPropertyValue(n)}var e="";for(var o in n){var a=n[o];a||0===a?e+=o+":"+a+";":t.style.removeProperty(n)}t.style.cssText+=";"+e},position:function(){var n=t.getBoundingClientRect(),r=t.offsetParent?t.offsetParent.getBoundingClientRect():{top:0,left:0};return{left:n.left-r.left+window.pageXOffset,top:n.top-r.top+window.pageYOffset}}},!r.background){var a=r.obj.position(),i=n(r.obj);r.obj.css({transform:i.join()+"px",top:a.top+"px",left:a.left+"px",right:"",bottom:""}),r.originX=r.startX=a.left,r.originY=r.startY=a.top,r.transformOriginX=r.transformStartX=i[0],r.transformOriginY=r.transformStartY=i[1],r.transformOriginZ=r.transformStartZ=i[2]}r.startX-=r.inversionFactor*Math.floor(r.xRange/2),r.startY-=r.inversionFactor*Math.floor(r.yRange/2),r.transformStartX-=r.inversionFactor*Math.floor(r.xRange/2),r.transformStartY-=r.inversionFactor*Math.floor(r.yRange/2),r.transformStartZ-=r.inversionFactor*Math.floor(r.zRange/2),e>=0?g.splice(e,1,r):g.push(r)}()};var d=function(){var t,n=document.createElement("p"),r={webkitTransform:"-webkit-transform",OTransform:"-o-transform",msTransform:"-ms-transform",MozTransform:"-moz-transform",transform:"transform"};document.body.insertBefore(n,null);for(var e in r)void 0!==n.style[e]&&(n.style[e]="translate3d(1px,1px,1px)",t=window.getComputedStyle(n).getPropertyValue(r[e]));return document.body.removeChild(n),void 0!==t&&t.length>0&&"none"!==t}();document.body.addEventListener("mousemove",a),e()&&(window.ondeviceorientation=a)}(window);

    var layers = document.querySelectorAll('.js-plaxify')

    for (var layer, i = 0; layer = layers[i]; i++) {
      window.plaxify(layer, {
        xRange: layer.getAttribute('data-xrange'),
        yRange: layer.getAttribute('data-yrange'),
        invert: layer.getAttribute('data-invert') === 'true'
      })
    }
    </script>
</body>
</html>