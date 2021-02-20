<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adelete</title>
<link href="../css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<hr class="main_line" align="left">
<nav id="top_menu_s">
<ul>
	<li><a href="../company/welcome.jsp">ABOUT</a></li>
	<li><a href="../aboard/anotice.jsp" class="sel">COMMUNITY</a></li>
	<li><a href="../gboard/gnotice.jsp">PORTFOLIO</a></li>
	<li><a href="../sns/sns.jsp">SNS</a></li>
</ul>
</nav>
<div class="clear"></div>
<div id="solution_w">
<nav id="sub_menu">
<ul>
	<li><a href="../aboard/anotice.jsp">이달의 행사</a></li>
	<li><a href="../fboard/fnotice.jsp">예약/문의</a></li>
</ul>
</nav>
<article id="mid">
<h1>글 삭제</h1>
<%
int Num=Integer.parseInt(request.getParameter("num"));
%>
<form action="adeletePro.jsp" id="delete" method="post">
<input type="hidden" name="num" value="<%=Num %>">
<table id="delete">
	<tr><td class="del_td"><span>글을 삭제하시겠습니까?</span></td></tr>
</table>
<div id="table_search">
<input type="submit" value="삭제하기" class="u_btn">
</div>
</form>
<div class="clear"></div>
</article>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>