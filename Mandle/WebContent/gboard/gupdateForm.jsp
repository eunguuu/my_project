<%@page import="board.gBoardBean"%>
<%@page import="board.gBoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gupdate</title>
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
<%
int Num = Integer.parseInt(request.getParameter("num"));

gBoardDAO bdao = new gBoardDAO();
gBoardBean bb = bdao.getgBoard(Num);
%>
<h1 style="margin-left: 180px;">글 수정</h1>
<form action="gupdatePro.jsp" id="update" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="<%=bb.getNum() %>">
<table id="fwrite" style="margin-left: 180px;">
<tr><td class="h">글쓴이</td><td colspan="2"  class="d"><input type="text" name="name" value=<%=bb.getName() %>></td></tr>
<tr><td class="h">제목</td><td colspan="2"  class="d"><input type="text" name="subject" value=<%=bb.getSubject() %> required></td></tr>
<tr><td class="h">첨부파일</td><td colspan="2"  class="d"><input type="file" name="file">
						  <input type="hidden" name="oldfile" value="<%=bb.getFile() %>"><%=bb.getFile() %></td></tr>
<tr><td class="h">글내용</td>
    <td colspan="2"  class="c"><textarea name="content" rows="15" cols="45"><%=bb.getContent() %></textarea></td></tr>
</table>
<div id="table_search" style="margin-right: 60px;">
<input type="submit" value="수정하기" class="u_btn">
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