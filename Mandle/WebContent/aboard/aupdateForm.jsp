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
<article id="mid">
<%
int Num = Integer.parseInt(request.getParameter("num"));

aBoardDAO bdao = new aBoardDAO();
aBoardBean bb = bdao.getaBoard(Num);
%>
<h1>글 수정</h1>
<form action="aupdatePro.jsp" id="update" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="<%=bb.getNum() %>">
<table id="update">
<tr><td class="h">글쓴이</td><td class="d"><input type="text" name="name" value="<%=bb.getName() %>" readonly></td></tr>
<tr><td class="h">제목</td><td class="d"><input type="text" name="subject" value="<%=bb.getSubject() %>"required></td></tr>
<tr><td class="h">첨부파일</td><td class="d"><input type="file" name="file">
						  <input type="hidden" name="oldfile" value="<%=bb.getFile() %>"><%=bb.getFile() %></td></tr>
<tr><td class="h">글내용</td>
    <td class="c"><textarea name="content" rows="15" cols="45"><%=bb.getContent() %></textarea></td></tr>
</table>
<div id="table_search">
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