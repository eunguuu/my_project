<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sns</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<!-- <div id="main_img"><img src="../images/sky.jpg" width="971" height="282"></div> -->
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<hr class="main_line" align="left">
<nav id="top_menu_s">
<ul>
	<li><a href="../company/welcome.jsp">ABOUT</a></li>
	<li><a href="../aboard/anotice.jsp">COMMUNITY</a></li>
	<li><a href="../gboard/gnotice.jsp">PORTFOLIO</a></li>
	<li><a href="../sns/sns.jsp" class="sel">SNS</a></li>
</ul>
</nav>
<div class="clear"></div>
<div id="solution_w">
<article id="sns">
<h1>SNS</h1>
<img alt="instagram" src="../images/insta.png" width="150px" onclick="window.open('https://www.instagram.com/mandlenail/')">
<img alt="naver_blog" src="../images/blog.png" width="150px" onclick="window.open('https://blog.naver.com/zusehfl')">
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