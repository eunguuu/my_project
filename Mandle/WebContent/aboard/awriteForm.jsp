<%@page import="board.aBoardBean"%>
<%@page import="board.aBoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aupdate</title>
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
<%
String sess = (String)session.getAttribute("id");

if(sess == null) {
	response.sendRedirect("../member/login.jsp");
}
%>
<article id="mid">
<h1>글 작성</h1>
<form action="awritePro.jsp" method="post" enctype="multipart/form-data">
<table id="update">
<tr><td class="h">글쓴이</td><td class="d"><input type="text" name="name" value="admin" readonly></td></tr>
<tr><td class="h">제목</td><td class="d"><input type="text" name="subject" required></td></tr>
<tr><td class="h">첨부파일</td><td class="d"><input type="file" name="file" required></td></tr>
<tr><td class="h">글내용</td>
    <td class="c"><textarea name="content" rows="15" cols="45"></textarea></td></tr>
</table>
<div id="table_search_w">
<input type="submit" value="작성하기" class="btn">
<input type="button" value="글목록" class="btn" onclick="location.href='anotice.jsp'">
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