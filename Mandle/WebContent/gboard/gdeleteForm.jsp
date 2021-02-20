<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gdelete</title>
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
	<li><a href="../aboard/anotice.jsp">COMMUNITY</a></li>
	<li><a href="../gboard/gnotice.jsp" class="sel">PORTFOLIO</a></li>
	<li><a href="../sns/sns.jsp">SNS</a></li>
</ul>
</nav>
<div class="clear"></div>
<div id="solution_w">
<article id="gal">
<h1 style="margin-left: 180px;">글 삭제</h1>
<%
int Num=Integer.parseInt(request.getParameter("num"));
%>
<form action="gdeletePro.jsp" id="delete2" method="post">
<input type="hidden" name="num" value="<%=Num %>">
<table id="delete" style="margin-left: 180px;">
	<tr><td class="del_td"><span>글을 삭제하시겠습니까?</span></td></tr>
</table>
<div id="table_search" style="margin-right: 40px;">
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