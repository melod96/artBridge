window.onload = function(){
	//gnb menu hover action
	$("header .dropdown-toggle, header .dropdown-menu").hover(function(){
		$(this).parent().siblings().removeClass("open");
		$(this).parent().addClass("open");
	}, function(){
		$(this).parent().removeClass("open");
	});

	//top area tab hover action
	$(".tit-area .tab-menu a").hover(function(){
		$(this).parent().children('a').css("padding-bottom", "10px");
		$(this).css({"padding-bottom": "20px", "bottom":"0"});
	}, function(){
		$(this).css({"bottom":"-10px"});
	});

}