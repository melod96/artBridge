<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.comvision.artBridge.files.model.vo.*, com.comvision.artBridge.admin.model.vo.Notice"%>
    
    
<%
   ArrayList<Files> slidelist = null;
   ArrayList<Files> bestWriterList = null;
   ArrayList<Files> newList = null;
   ArrayList<Notice> noticeList = null;
   
   if((ArrayList<Files>)request.getAttribute("slidelist") != null){
      slidelist = (ArrayList<Files>)request.getAttribute("slidelist");
   }
   
   if((ArrayList<Files>)request.getAttribute("bestWriterList") != null){
      bestWriterList= (ArrayList<Files>)request.getAttribute("bestWriterList");
   }
      
   if((ArrayList<Files>)request.getAttribute("newList") != null){
	   newList= (ArrayList<Files>)request.getAttribute("newList");
   }

   if((ArrayList<Notice>)request.getAttribute("noticeList") != null){
      noticeList= (ArrayList<Notice>)request.getAttribute("noticeList");
   }

%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Art Bridge</title>
   <%@ include file="/views/common/head.jsp" %>
   
   <!-- 180929 sona 추가 -->
   <!-- 아래 파일들도 올렸으니까 경로 잘 맞춰서 올려줘! 저거 없으면 안돌아감~~ -->
   <link rel="stylesheet" type="text/css" href="/artBridge/css/slick.css"/>
   <link rel="stylesheet" type="text/css" href="/artBridge/css/slick-theme.css"/>
   <script type="text/javascript" src="/artBridge/js/slick.min.js"></script>
   <!-- // 180929 sona 추가 -->
   
   <style>
   .row{padding-bottom:70px;}
   
   .noticeArea{width:500px;height:300px;padding-top:60px;display:inline-block;padding-left:20px;}
   .noticeArea h5{padding-left:25px;padding-top:14px;background:#3446d1;color:white;height:40px;
               border-radius:30px;}
   
   .notice1 li{border-bottom:0.1em solid white; ;padding-top:10px;}
   .ntTitle{color:black;width:70%;height:20px;text-overflow: ellipsis;display:inline-block;overflow: hidden;white-space: nowrap}
   .ntTitle a{color:black; font-weight:bold;}
   .ntDate{color:gray;font-size:0.9em;float:right;font-weight:bold;}
   
   #faqDiv{ padding-right:70px;float:right;padding-top:78px;}
   .faq{width:450px; height:45px; border:5px solid white;cursor: pointer; margin:40px;margin-left:20px;text-align:center;padding-top:12px;
         border-radius:50px; font-weight:bold;}
   #testRadius{border-radius:50%;}
   .faqtt{padding-left:30px;}
   
   
   .container{width:1100px;}
   #carousel-example-generic{width:1110px;}
   .item{margin-right:auto;margin-left:auto;width:1110px;height:480px;}   
   .item img{margin-top:0px;margin-bottom:40px;margin-right:auto;margin-left:auto;
   width: auto; height: auto;
    max-width: 1110px;
    max-height: 480px;}
    .bestH{margin-top:0px;margin-bottom:0px;}
   
   
   .carousel-inner{margin-top:0px;}
   
   
   .box-wrap {
         width:1140px;
         height: 300px;
         display: flex;
         align-items: center;
         justify-content: center;
         margin-left:auto; margin-right:auto; margin-top:110px;
         padding-right:23px;
      }
      .box {
         position: relative;  
         margin:30px; 
         box-shadow: 1px 1px 3px rgba(0,0,0,0.3); 
         cursor: pointer; 
         overflow: hidden; 
         width:250px; height: 301px; 
         padding:0px;
         border:3px solid #ddd;
         
         
      }
      .img {width: 250px; height: 301px;margin-right:auto;margin-left:auto;}
      .box img {
         margin-right:auto;margin-left:auto;   
         display: block; 
         width: 250px; 
         height: 301px;
         /* max-width:300px;
         max-height:330px; */
         /* position: absolute;  */
         z-index: 10;
         transform: translatey(0px)
         z-index: 30;
         transition: all 0.35s ease-in-out;
         
      }
      .box .info {
         opacity:0; visibility:visible; z-index: 50;
         position: absolute; left: 50%; top:50%; 
         transform: translate(-50%, -50%);
         
         
         text-align: center;
         transition: all 0.35s ease-in-out; 
      }
      .box .info p{color:white;background:gray;opacity:0.8;border-radius:7px;width:150px;height:25px;padding-top:3px;}
      .box .info h3 {
         font-size:28px; padding-bottom: 3px; opacity:0.8; color:lightblack;background:lightgray;
         border-bottom-right-radius:7px; border-top-left-radius:7px; 
      }
      .box:before{
         content: '';
         width: 500px; height: 500px; 
         background:rgba(0,0,0,0.7);
         position: absolute; z-index:40;
         top: 0; right: 0; left: 0;/*원래 여기 left가 auto, 밑에꺼가 0;이였음*/
         transform-origin: 100% 0;
         transform: rotate(52.5deg) translatex(-280px);
         transition: all 0.35s ease-in-out;
      }
      .box:after {
         content: '';
         width: 500px; height: 500px; 
         background:rgba(0,0,0,0.7);
         position: absolute; z-index:40;
         bottom: 0; right: 0; left: auto;
         transform-origin: 0 100%;
         transform: rotate(52.5deg) translatex(280px);
         transition: all 0.35s ease-in-out;
      }
      .box:hover .info {
         opacity:1; visibility: visible; 
      }
      .box:hover:before {
         transform: rotate(53.1deg) translatex(0px);
      }
      .box:hover:after {
         transform: rotate(53.1deg) translatex(0px);
      }
      .back img{width:1110px; height:1000px;opacity:0.8;}
   
      .popArea{align:center; width:1075px;margin-left:50px;width:210px;height:50px;border:1px solid black ;margin-top:160px;
            margin-bottom:-50px;}
      #popA{margin-top:10px;}
      
      .bestArtist{ width:1200px; height: 500px; margin-left:auto;margin-right:auto;margin-top:220px;}
      .newContent{ width:1200px; height: 500px; margin-left:auto;margin-right:auto;margin-top:-50px;}
      
      /* 180929 sona 추가 */
      .slider-area1{width:1070px; margin:0 auto;} 
      /* 슬릭슬라이더 스타일 */
      .slider-area{width:1070px; margin:0 auto;}
      .slider-area .inner li{text-align:center;padding-top: 25px;}
      .slider-area .name{margin-top:10px; font-size:15px; font-weight:bold;}
      .slick-slide img{width:65%; margin:0 auto; margin-top:60px;}
      .slick-slide.slick-current img{width:100%; margin-top:0;}
      .slick-slide.slick-current .name{font-size:20px;}
      /* // 180929 sona 추가 */
      
      .draggable{height:670px;}
      .ntNFaq{margin-top:-40px;}
   /*    .slick-dots{position:relative; top:50px;} */
       .slider-area1{height:580px;}
      
      /* .particule {
           position: absolute;
           top: 50%;
           left: 50%;
           width: 1rem;
           height: 1rem;
           margin: -.5rem 0 0 -.5rem;
           border: 1px solid currentColor;
           transform: scale(0);
         } */
         
      .slick-dots li button:before{/* background-image:url("/artBridge/image/mainContent/slide/back02.png"); */ background:#FAEEC5;font-size:0px; border-radius : 75%; width:12px; height:12px;}
      .slick-prev:before{font-size:50px; content:"◀";position:relative; left:-30px;}
      .slick-next:before{font-size:50px; content:"▶";}
      
      /*fixed area*/
      /* .left-fixed-area{ width : 150px; height: 200px; position: fixed;top:250px; left:10px; border:3px solid darkgray;}
      button[name='left-menu-btn']{margin-left:24%;margin-top:5px;} */
      
      /*background*/
      /* body{background-image:url("/artBridge/image/mainContent/slide/back02.png");/* background-size:contain; *//*background-size:100% 100%;background-repeat: no-repeat} */
      body{background:linear-gradient(#3446d1 5%, #FBB0FF 45%, #F7FFB0 90%);}
      .name{color:white;}
      .txt{color:white;}
      
      
       /*=====================star====================*/
      .twingkle1{
      animation-name:trans1;
      animation-duration:0.7s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: alternate;
      }
      
      .twingkle2{
      animation-name:trans1;
      animation-duration:1s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: alternate;
      }
      
      .twingkle3{
      animation-name:trans1;
      animation-duration:1.2s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: alternate;
      }
      
      
       /*=====================movingStar====================*/
         .movingStar{
      animation-name: moving1;
      animation-delay:2s;
      animation-duration:10s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: nomal;
       opacity:0;
       }
       
       .movingStar2{
      animation-name: moving2;
      animation-delay:0s;
      animation-duration:10s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: nomal;
       opacity:0;
       }
       
       .movingStar3{
      animation-name: moving3;
      animation-delay:5s;
      animation-duration:10s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: nomal;
       opacity:0;
       }
       
       
       /*=====================blossom====================*/
       .blossom1{
       animation-name: blossom1;
      animation-delay:2s;
      animation-duration:40s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: nomal;
       opacity:0;}
       
       .blossom11{
       animation-name: blossom2;
      animation-delay:5s;
      animation-duration:40s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: nomal;
       opacity:0;}
       
       .blossom111{
       animation-name: blossom1;
      animation-delay:7s;
      animation-duration:40s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: nomal;
       opacity:0;}
       
        .blossom1111{
       animation-name: blossom1;
      animation-delay:10s;
      animation-duration:40s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: nomal;
       opacity:0;}
       
        .blossom2{
       animation-name: blossom2;
      animation-delay:3s;
      animation-duration:40s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: nomal;
       opacity:0;}
       
        .blossom22{
       animation-name: blossom2;
      animation-delay:15s;
      animation-duration:40s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: nomal;
       opacity:0;}
       
        .blossom3{
       animation-name: blossom1;
      animation-delay:20s;
      animation-duration:40s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: nomal;
       opacity:0;}
       
        .blossom4{
       animation-name: blossom2;
      animation-delay:25s;
      animation-duration:40s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: nomal;
       opacity:0;}
       
       
       .blossom5{
       animation-name: blossom3;
      animation-delay:30s;
      animation-duration:40s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: nomal;
       opacity:0;}
       
       
       
       
       
        .blossom6{
       animation-name: blossom1;
      animation-delay:35s;
      animation-duration:40s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: nomal;
       opacity:0;}
       
        .blossom7{
       animation-name: blossom2;
      animation-delay:40s;
      animation-duration:40s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: nomal;
       opacity:0;}
       
        .blossom8{
       animation-name: blossom1;
      animation-delay:45s;
      animation-duration:40s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: nomal;
       opacity:0;}
       
        .blossom9{
       animation-name: blossom2;
      animation-delay:50s;
      animation-duration:40s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: nomal;
       opacity:0;}
       
        .blossom0{
       animation-name: blossom3;
      animation-delay:55s;
      animation-duration:40s;
      animation-iteration-count: infinite;
      animation-timing-function: linear;
       animation-direction: nomal;
       opacity:0;}
       
       
      
      @keyframes trans1 {
           0% {
             opacity: 1;
           }
           100% {
             opacity: 0;
           }
      }
      
      @keyframes moving1 {
           0% {
           opacity: 1;
           }
           7% {
                transform:translate(-1600px, 900px);
                
           }
           8%{
           opacity:0;
           }
           100%{
           opacity:0;
           }
      }
      
      @keyframes moving2 {
           0% {
           opacity: 1;
           }
           11% {
                transform:translate(-1600px, 900px);
                
           }
           12%{
           opacity:0;
           }
           100%{
           opacity:0;
           }
      }
      
      @keyframes moving3 {
           0% {
           opacity: 1;
           }
           15% {
                transform:translate(-1600px, 900px);
           }
           16%{
           opacity:0;
           }
           100%{
           opacity:0;
           } 
      }
      
      @keyframes blossom1 {
           0% {
           opacity: 1;
           }
           10% {
           transform:translate(800px, 370px);
           }
           35%{
           transform:translate(-800px, 740px);
           }
           75%{
           transform:translate(800px, 1150px);
           } 
           97%{
           transform:translate(-800px, 1500px);
           opacity:1;
           } 
           98%{
           transform:translate(-800px, 1500px);
           opacity:0;
           }
           100%{
           transform:translate(-800px, 1500px);
           opacity:0;
           }
      }
      
       @keyframes blossom2 {
           0% {
           opacity: 1;
           }
           10% {
           transform:translate(-800px, 370px);
           }
           35%{
           transform:translate(800px, 740px);
           }
           75%{
           transform:translate(-800px, 1150px);
           } 
           97%{
           transform:translate(800px, 1500px);
           opacity:1;
           } 
           98%{
           transform:translate(800px, 1500px);
           opacity:0;
           }
           100%{
           transform:translate(800px, 1500px);
           opacity:0;
           }
      }
      
       @keyframes blossom3 {
           0% {
           opacity: 1;
           }
           10% {
           transform:translate(-400px, 370px);
           }
           35%{
           transform:translate(400px, 740px);
           }
           75%{
           transform:translate(-400px, 1150px);
           } 
           97%{
           transform:translate(400px, 1500px);
           opacity:1;
           } 
           98%{
          transform:translate(400px, 1500px);
           opacity:0;
           }
           100%{
           transform:translate(400px, 1500px);
           opacity:0;
           }
      }
      
</style>
   
</head>
<body>
<img style="position: absolute; bottom : -1500px; left:auto; right:auto; width:1800px; height:350px; opacity: 0.08; z-index:-5" src='/artBridge/image/mainContent/mainBottom.png'>




    <div id="all">

        <!-- Header -->
        <%@ include file="/views/common/header.jsp" %>
        <!-- // Header -->
<img class="movingStar" style="position: absolute;top : 0px; left:1400px; width:150px; height:75px;" src='/artBridge/image/mainContent/movingStar.png' >
<img class="movingStar2" style="position: absolute;top : 0px; left:800px; width:150px; height:75px;" src='/artBridge/image/mainContent/movingStar.png' >
<img class="movingStar3" style="position: absolute;top : 500px; left:1200px; width:150px; height:75px;" src='/artBridge/image/mainContent/movingStar.png' >
 
<img class="twingkle1" style="position: relative;top : 100px; left:100px;width:30px; height:30px;" src='/artBridge/image/mainContent/star.png'>

<img style="position: relative;top : 500px; left:150px;width:15px; height:15px;" src='/artBridge/image/mainContent/star.png'>
<img style="position: relative;top : 300px; left:120px;width:14px; height:14px;" src='/artBridge/image/mainContent/star.png'>
<img style="position: relative;top : 720px; left:80px;width:16px; height:16px;" src='/artBridge/image/mainContent/star.png'>
<img style="position: relative;top : 200px; left:200px;width:13px; height:13px;" src='/artBridge/image/mainContent/star.png'>

<img class="twingkle1" style="position: relative;top : 620px; left:200px;width:12px; height:12px;" src='/artBridge/image/mainContent/star.png'>
<img class="twingkle3" style="position: relative;top : 400px; left:180px;width:17px; height:17px;" src='/artBridge/image/mainContent/star.png'>
<img style="position: relative;top : 220px; left:350px;width:14px; height:14px;" src='/artBridge/image/mainContent/star.png'>
<img style="position: relative;top : 680px; left:250px;width:16px; height:16px;" src='/artBridge/image/mainContent/star.png'>
<img class="twingkle2" style="position: relative;top : 560px; left:300px;width:13px; height:13px;" src='/artBridge/image/mainContent/star.png'>

<img style="position: relative;top : 580px; left:400px;width:15px; height:15px;" src='/artBridge/image/mainContent/star.png'>
<img style="position: relative;top : 300px; left:370px;width:14px; height:14px;" src='/artBridge/image/mainContent/star.png'>
<img class="twingkle3" style="position: relative;top : 150px; left:500px;width:12px; height:12px;" src='/artBridge/image/mainContent/star.png'>
<img style="position: relative;top : 50px; left:700px;width:17px; height:17px;" src='/artBridge/image/mainContent/star.png'>
<img class="twingkle1" style="position: relative;top : 100px; left:340px;width:13px; height:13px;" src='/artBridge/image/mainContent/star.png'>

<img style="position: relative;top : 480px; left:970px;width:14px; height:14px;" src='/artBridge/image/mainContent/star.png'>
<img style="position: relative;top : 100px; left:840px;width:16px; height:16px;" src='/artBridge/image/mainContent/star.png'>
<img class="twingkle3" style="position: relative;top : 210px; left:720px;width:12px; height:12px;" src='/artBridge/image/mainContent/star.png'>
<img class="twingkle1" style="position: relative;top : 180px; left:900px;width:14px; height:14px;" src='/artBridge/image/mainContent/star.png'>
<img style="position: relative;top : 300px; left:950px;width:15px; height:15px;" src='/artBridge/image/mainContent/star.png'>

<img style="position: relative;top : 200px; left:1000px;width:16px; height:16px;" src='/artBridge/image/mainContent/star.png'>
<img style="position: relative;top : 600px; left:1010px;width:16px; height:16px;" src='/artBridge/image/mainContent/star.png'>
<img class="twingkle2" style="position: relative;top : 400px; left:1020px;width:16px; height:16px;" src='/artBridge/image/mainContent/star.png'>
<img style="position: relative;top : 300px; left:1030px;width:16px; height:16px;" src='/artBridge/image/mainContent/star.png'>
<img class="twingkle3" style="position: relative;top : 500px; left:1040px;width:16px; height:16px;" src='/artBridge/image/mainContent/star.png'>

<img style="position: relative;top : 700px; left:850px;width:16px; height:16px;" src='/artBridge/image/mainContent/star.png'>
<img class="twingkle2" style="position: relative;top : 640px; left:520px;width:16px; height:16px;" src='/artBridge/image/mainContent/star.png'>
<img class="twingkle1" style="position: relative;top : 700px; left:560px;width:16px; height:16px;" src='/artBridge/image/mainContent/star.png'>
<img style="position: relative;top : 600px; left:650px;width:16px; height:16px;" src='/artBridge/image/mainContent/star.png'>
<img class="twingkle3" style="position: relative;top : 500px; left:420px;width:16px; height:16px;" src='/artBridge/image/mainContent/star.png'>

<img class="twingkle3" style="position: relative;top : 80px; left:880px;width:16px; height:16px;" src='/artBridge/image/mainContent/star.png'>
<img class="twingkle2" style="position: relative;top : 120px; left:-170px;width:16px; height:16px;" src='/artBridge/image/mainContent/star.png'>
<img class="twingkle3" style="position: relative;top : 30px; left:-250px;width:16px; height:16px;" src='/artBridge/image/mainContent/star.png'>
<img style="position: relative;top : 30px; left:690px;width:16px; height:16px;" src='/artBridge/image/mainContent/star.png'>

<!--Blossom선발-->
<img class = "blossom1" style="position: absolute; top : 700px; left:150px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom5" style="position: absolute; top : 900px; left:300px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom1" style="position: absolute; top : 800px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>


<img class = "blossom11" style="position: absolute; top : 700px; left:150px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom5" style="position: absolute; top : 900px; left:300px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom11" style="position: absolute; top : 800px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>


<img class = "blossom111" style="position: absolute; top : 700px; left:150px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom5" style="position: absolute; top : 900px; left:300px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom111" style="position: absolute; top : 800px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>


<img class = "blossom1111" style="position: absolute; top : 700px; left:150px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom5" style="position: absolute; top : 900px; left:300px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom1111" style="position: absolute; top : 800px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>

<img class = "blossom2" style="position: absolute; top : 700px; left:150px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom5" style="position: absolute; top : 900px; left:300px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom2" style="position: absolute; top : 800px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>


<img class = "blossom22" style="position: absolute; top : 700px; left:150px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom5" style="position: absolute; top : 900px; left:300px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom22" style="position: absolute; top : 800px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>


<img class = "blossom3" style="position: absolute; top : 700px; left:150px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom5" style="position: absolute; top : 900px; left:300px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom3" style="position: absolute; top : 800px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>


<img class = "blossom4" style="position: absolute; top : 700px; left:150px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom5" style="position: absolute; top : 900px; left:300px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom4" style="position: absolute; top : 800px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>


<!--후발-->
<img class = "blossom6" style="position: absolute; top : 700px; left:150px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom0" style="position: absolute; top : 900px; left:300px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom6" style="position: absolute; top : 800px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>



<img class = "blossom7" style="position: absolute; top : 700px; left:150px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom0" style="position: absolute; top : 900px; left:300px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom7" style="position: absolute; top : 800px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>



<img class = "blossom8" style="position: absolute; top : 700px; left:150px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom0" style="position: absolute; top : 900px; left:300px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom8" style="position: absolute; top : 800px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>


<img class = "blossom9" style="position: absolute; top : 700px; left:150px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom0" style="position: absolute; top : 900px; left:300px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom9" style="position: absolute; top : 800px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>


<!--격리-->
<!-- 
<img class = "blossom5" style="position: absolute; top : 1100px; left:600px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom1" style="position: absolute; top : 1000px; left:750px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom5" style="position: absolute; top : 1300px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom1" style="position: absolute; top : 1200px; left:1000px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom4" style="position: absolute; top : 1100px; left:600px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom5" style="position: absolute; top : 1000px; left:750px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom4" style="position: absolute; top : 1300px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom4" style="position: absolute; top : 1200px; left:1000px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom5" style="position: absolute; top : 1100px; left:600px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom3" style="position: absolute; top : 1000px; left:750px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom5" style="position: absolute; top : 1300px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom3" style="position: absolute; top : 1200px; left:1000px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom22" style="position: absolute; top : 1100px; left:600px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom5" style="position: absolute; top : 1000px; left:750px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom22" style="position: absolute; top : 1300px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom22" style="position: absolute; top : 1200px; left:1000px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom2" style="position: absolute; top : 1100px; left:600px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom5" style="position: absolute; top : 1000px; left:750px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom2" style="position: absolute; top : 1300px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom2" style="position: absolute; top : 1200px; left:1000px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom1111" style="position: absolute; top : 1100px; left:600px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom1111" style="position: absolute; top : 1000px; left:750px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom5" style="position: absolute; top : 1300px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom1111" style="position: absolute; top : 1200px; left:1000px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom111" style="position: absolute; top : 1100px; left:600px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom111" style="position: absolute; top : 1000px; left:750px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom5" style="position: absolute; top : 1300px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom111" style="position: absolute; top : 1200px; left:1000px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom11" style="position: absolute; top : 1100px; left:600px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom11" style="position: absolute; top : 1000px; left:750px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom5" style="position: absolute; top : 1300px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom11" style="position: absolute; top : 1200px; left:1000px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom9" style="position: absolute; top : 1100px; left:600px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom0" style="position: absolute; top : 1000px; left:750px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom9" style="position: absolute; top : 1300px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom9" style="position: absolute; top : 1200px; left:1000px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom8" style="position: absolute; top : 1100px; left:600px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom0" style="position: absolute; top : 1000px; left:750px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom8" style="position: absolute; top : 1300px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom8" style="position: absolute; top : 1200px; left:1000px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom7" style="position: absolute; top : 1100px; left:600px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom0" style="position: absolute; top : 1000px; left:750px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom7" style="position: absolute; top : 1300px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom7" style="position: absolute; top : 1200px; left:1000px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom6" style="position: absolute; top : 1100px; left:600px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom0" style="position: absolute; top : 1000px; left:750px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom6" style="position: absolute; top : 1300px; left:900px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'>
<img class = "blossom6" style="position: absolute; top : 1200px; left:1000px; width:16px; height:16px; " src='/artBridge/image/mainContent/blossom3.png'> 
-->
<br><br><br><br>
<!--
   180929 sona 추가
-->


   <script>
    $(document).ready(function(){
       $('.slider-area .inner').slick({
             autoplay: true,
             arrows: true,
             dots: true,
             centerMode: true,
            centerPadding: '50px',
            slidesToShow: 3,
            responsive: [
              {
                breakpoint: 768,
                settings: {
                  arrows: false,
                  centerMode: true,
                  centerPadding: '40px',
                  slidesToShow: 3
                }
              },
              {
                breakpoint: 480,
                settings: {
                  arrows: false,
                  centerMode: true,
                  centerPadding: '40px',
                  slidesToShow: 1
                }
              }
            ]
          });
       });
     </script>
     
     
     <!-- // 180929 sona 추가 -->


<!--Best 작품 추천-->
      <div class="slider-area1">
         <img style="margin-left:385px;" src='/artBridge/image/mainContent/best5.png'>

         <div class="slider-area">

            <ul class="inner">
                  
               <%
                  if ((ArrayList<Files>) request.getAttribute("slidelist") != null) {
                     for (int i = 0 ; i < 5 ; i++) {
               %>
                  <li class="bestH" onclick="selectOneSale(this);">
                     <input type="hidden" value=<%=slidelist.get(i).getBoard_no()%>>
                     
                     <img src="<%=request.getContextPath()%><%=slidelist.get(i).getFiles_root()%><%=slidelist.get(i).getChange_title()%>">
                     					
                     <p class="name"><%=slidelist.get(i).getMem_name()%></p>
                     <p class="txt"><%=slidelist.get(i).getBoard_title()%></p>
                  </li>
               <%
                     }
                  }
               %>
                  
            </ul>
         </div>
      </div>



      <!--인기 작가 영역-->
<section name="bbox">
<div class="bestArtist">
      <!-- <h3 style="margin-left:155px; margin-bottom:-75px;">인기작가추천</h3> -->
      <img style="margin-left:155px; margin-bottom:-75px;" src='/artBridge/image/mainContent/bestWriter.png'>

<div class="box-wrap">
   <% if((ArrayList<Files>)request.getAttribute("bestWriterList") != null){
      for(int i = 0 ; i < 3 ; i++){
      
   %>
         <div class="box" onclick="bestArtist(this);">
            <input type = "hidden" value = <%=bestWriterList.get(i).getMem_no()%>>
            <div class="img"><img src="<%=request.getContextPath()%>/<%=bestWriterList.get(i).getFiles_root()%>/<%=bestWriterList.get(i).getChange_title()%>" alt=""></div>
            <div class="info">
               <h3><%=bestWriterList.get(i).getMem_name() %></h3>
               <p class="goProfile">작가프로필로 이동<input type="hidden" value=<%=bestWriterList.get(i).getMem_no()%>></p>
               <!-- 스크립트로 goProfile click 시 location.href로 작가 프로필로 연결 해당 사진의 member_no까지 전달-->
            </div>
         </div>
   
   <%}} %>
      
      
   </div>   
   </div>
</section>






<!--최신 글 영역-->
<section name="bbox">
<div class="newContent">
   <!-- <h3 style="margin-left:155px; margin-bottom:-75px;">최신글</h3> -->
   <img style="margin-left:155px; margin-bottom:-75px; margin-top:50px;" src='/artBridge/image/mainContent/newContent.png'>
<div class="box-wrap">
         <%if((ArrayList<Files>)request.getAttribute("newList") != null){
            for (int i = 0 ; i < 3 ; i++) {
         %>
         <div class="box" onclick="newContent(this);">
            <input type = "hidden" value = <%=newList.get(i).getBoard_no()%>>
            <div class="img"><img src="<%=request.getContextPath()%>/<%=newList.get(i).getFiles_root()%>/<%=newList.get(i).getChange_title()%>"   alt="">   </div>
            <div class="info">
                  <h3><%=newList.get(i).getBoard_title()%></h3>
                  <p class="goBoard">
                     작가 글로 이동<input type="hidden" value=<%=newList.get(i).getBoard_no()%>>
                  </p>
               <!-- 스크립트로 goProfile click 시 location.href로 작가 프로필로 연결 해당 사진의 member_no까지 전달-->
            </div>
         </div>
         <%}} %>

   </div>   
   </div>
</section>




<script>
   function selectOneSale(is){
      location.href = "/artBridge/selectOneSalepage.bo?num=" + $(is).children().eq(0).val();
      
   };
   
   function bestArtist(is){
      location.href = "/artBridge/selectWriterView.wr?memberNo=" + $(is).children().eq(0).val();
   };
   
   function newContent(is){
      location.href = "/artBridge/selectOneSalepage.bo?num=" + $(is).children().eq(0).val();
   };

   $(function (){
      $(".bestH").mouseenter(function(){
         $(this).css({"cursor" : "pointer"});
      });
   });
   
</script>






   <section class="background-white no-mb">
   <div class= "ntNFaq">
             <div class="container">
            
               <div class="row">
                              
              <!--공지사항 : 주석처리 해제하면 됨.--> 
                  <div class="noticeArea">
                 
                      <h5> <img style="width:160px; margin-top:-12px;margin-left:-15px;" src='/artBridge/image/mainContent/noticeTitle.png'><a class="noticeMore" style="float:right;font-size:0.8em;margin-top:-1px;margin-right:15px;color:#F2F2F2;">more</a></h5>
                      <ul class="notice1">
                  
                     <!-- for (Notice ntl : noticeList) -->
                  <%if((ArrayList<Notice>)request.getAttribute("noticeList") != null){
                            for(int i = 0 ; i < 5; i++) {
                               if(i < noticeList.size()){
                         %>
                  
                  <li>
                     <input type="hidden" value=<%=noticeList.get(i).getnNo() %>>
                     <span class="ntTitle">
                           <a class="ntTitleTag"><%=noticeList.get(i).getnTitle() %><input type="hidden" value="<%=noticeList.get(i).getnNo()%>"></a></span><span class="ntDate"><%=noticeList.get(i).getnDate()%>
                     </span>
                  </li>
                  
                  <%}else{%>
                     
                     <li>
                     <span class="ntTitle">
                           <a class="ntTitleTag"> <input type="hidden" value=""></a>
                     </span>
                     <span class="ntDate"></span>
                  </li>
                     
                     
                     
                  <% }
                               
                     }}
                  %>

                  
                  
                 </ul>
                  </div>

         <!--/공지사항-->
         
         <!--고객센터-->
                  <div id="faqDiv">
                      <div class="faqtt"><h3 style="display:inline;"><img style="width:100px; margin-top:-12px;margin-left:-15px;" src='/artBridge/image/mainContent/customerCenter.png'></h3></div>
                 <div class="faq" onclick="location.href='/artBridge/views/faq/faq_requester.jsp'">의뢰자 FAQ 바로 가기</div>
                 <div class="faq" onclick="location.href='/artBridge/views/faq/faq_artist.jsp'">구매자 FAQ 바로 가기</div>
                  </div>
           <!--/고객센터-->
         
         
                  
                  
               </div>
               
               
             </div>
             </div>
        </section>
	
        <!-- Footer -->
        <%@ include file="/views/common/footer.jsp" %>
       <!-- // Footer -->

    </div>







   <script>
             $(function(){
         
            $(".noticeMore").mouseenter(function(){
               $(this).css({ "cursor":"pointer"});
            }).click(function(){
            
               location.href = "/artBridge/selectList.nb";
   
               });
            });
             
             $(function(){
             
               $(".ntTitleTag").mouseenter(function(){
                  $(this).css({ "cursor":"pointer"});
               }).click(function(){
                  var num = $(this).children().val();
               
                  location.href = "/artBridge/selectDetail.nb?num="+num;
      
                  });
               });
             
             
   </script>


</body>
</html>