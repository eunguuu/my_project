<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome</title>
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
	<li><a href="../company/welcome.jsp" class="sel">ABOUT</a></li>
	<li><a href="../aboard/anotice.jsp">COMMUNITY</a></li>
	<li><a href="../gboard/gnotice.jsp">PORTFOLIO</a></li>
	<li><a href="../sns/sns.jsp">SNS</a></li>
</ul>
</nav>
<div class="clear"></div>
<div id="solution_w">
<nav id="sub_menu">
<ul>
<li><a href="welcome.jsp">인사말</a></li>
<li><a href="service.jsp">서비스소개</a></li>
<li><a href="location.jsp">찾아오시는길</a></li>
</ul>
</nav>
<article id="mid">
<h1>인사말</h1>
<p class="ceo_p">
한분 한분 꼼꼼하게 시술 해 드리겠습니다.<br><br>
시술시간 넉넉하게 예상하시고 방문해주세요 :) <br>
</p>
<figure class="ceo">
<img src="../images/company/ceo_nb.png" alt="CEO" width="200">
<figcaption>맨들네일 사장님</figcaption>
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