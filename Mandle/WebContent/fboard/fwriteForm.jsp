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
<article id="mid">
<%
String sess = (String)session.getAttribute("id");
%>
<h1>글 작성</h1>
<form action="fwritePro.jsp" method="post" enctype="multipart/form-data">
<table id="fwrite">
<tr><td class="h">작성자</td><td colspan="2" class="d"><input type="text" name="name" required></td></tr>
<tr><td class="h">비밀번호</td><td colspan="2" class="d"><input type="password" name="pass" required></td></tr>
<tr><td class="h">말머리</td><td class="d"><input type="radio" name="mal" value="예약"> 예약</td>
							<td class="d"><input type="radio" name="mal" value="문의"> 문의</td></tr>
<tr><td class="h">제목</td><td colspan="2" class="d"><input type="text" name="subject" required></td></tr>
<tr><td class="h">첨부파일</td><td colspan="2" class="d"><input type="file" name="file"></td></tr>
<tr><td class="h">글내용</td>
    <td colspan="2" class="c"><textarea name="content" rows="15" cols="45"></textarea></td></tr>
</table>
<div id="table_search_w">
<input type="submit" value="작성하기" class="btn">
<input type="button" value="글목록" class="btn" onclick="location.href='fnotice.jsp'">
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