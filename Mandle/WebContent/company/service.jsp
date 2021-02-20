<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>service</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 
</head>
<body>
<div id="wrap">
<!-- 헤더가 들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더가 들어가는 곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<hr class="main_line" align="left">
<nav id="top_menu_s">
<ul>
	<li><a href="../company/welcome.jsp" class="sel">ABOUT</a></li>
	<li><a href="../aboard/anotice.jsp">COMMUNITY</a></li>
	<li><a href="../gboard/gnotice.jsp">PORTFOLIO</a></li>
	<li><a href="../sns/sns.jsp">SNS</a></li>
</ul>
</nav>
<div class="clear"></div>
<div id="solution_s">
<nav id="sub_menu">
<ul>
<li><a href="welcome.jsp">인사말</a></li>
<li><a href="service.jsp">서비스소개</a></li>
<li><a href="location.jsp">찾아오시는길</a></li>
</ul>
</nav>
<article id="mid">
<h1>서비스</h1>
<figure class="menu">
<img src="../images/company/menu_y.png" alt="menu" width="500">
<figcaption>기본 가격표</figcaption>
</figure>
</article>
</div>
<div class="clear"></div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>