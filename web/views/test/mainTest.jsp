<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

@import url('https://fonts.googleapis.com/css?family=Bevan');
html { height: 100%; display: flex; overflow: hidden; }
body { margin: auto; }
html, body {
  background: #3446D1;
  color: #FFF;
  font-family: 'Bevan', sans-serif;
  font-size: 14vw;
}

*, *:before, *:after {
  animation-timing-function: cubic-bezier(.5, 0, .5, 1);
}

/* ---------------------------------- */

:root {
  --duration: .5s;
}

.char {
  animation-name: char-transform;
  animation-duration: calc(var(--duration));
  animation-fill-mode: both;
  animation-delay: calc(var(--duration) + .05s * (var(--char-total) - var(--char-index)));
  text-shadow: 0 3vh 4vh rgba(black, 0.03);
  
  &:first-child {
    animation-name: first-char-transform; 
    animation-duration: calc(var(--duration) * 2);
    animation-delay: 0s;
  }
}


@keyframes char-transform {
  0% { opacity: 0; transform: translateY(50%); }
  70% {
    transform: translateY(-6%);
  }
  90% {
    transform: translateY(1%); 
  }
  to {
    transform: translateY(0%);
  }
}

@keyframes char-rotate {
  0% { transform: rotate(30deg); } 
  30% { transform: rotate(-10deg); }
  100% { transform: rotate(0deg); }
}

@keyframes first-char-transform {
  0% {
    transform: translateX(calc(.75ch * var(--char-total))) translateY(200%);
  }
  40% {
    transform: translateX(calc(.75ch * var(--char-total))) translateY(-10%);
  }
  60% {
    transform: translateX(calc(.75ch * var(--char-total))) translateY(7%);
  }
  100% {
    transform: none;
  }
}

@keyframes first-char-rotate {
  0% {
    transform: rotate(.5turn);
  }
  40% {
    transform: rotate(-.1turn);
  }
  70% {
    transform: rotate(.1turn);
  }
  100% {
    transform: rotate(0turn);
  }
}


/* ---------------------------------- */

.splitting .char { 
  visibility: hidden; 
  
  &::before {
    visibility: visible;
    animation: inherit;
    animation-name: char-rotate;
    animation-duration: calc(var(--duration) * 1.1);
  }
  
  &:first-child::before {
    animation-name: first-char-rotate; 
    animation-duration: inherit;
  }
}
</style>
<title>Insert title here</title>
</head>
<body>

<a href="https://youtu.be/Yix-rJKLt98" target="_blank" data-keyframers-credit style="color: #000"></a>
<script src="https://codepen.io/shshaw/pen/QmZYMG.js"></script>
<div data-splitting>Art Bridge</div>

<script>
Splitting();

/* ---------------------------------- */

var lr = document.querySelector("[data-splitting]");
window.addEventListener("click", function() {
  var newone = lr.cloneNode(true);
  lr.parentNode.replaceChild(newone, lr);
  lr = newone;
});

</script>
</body>


</html>