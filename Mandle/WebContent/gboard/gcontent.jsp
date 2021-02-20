<%@page import="board.CommentBean"%>
<%@page import="board.CommentDAO"%>
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
<title>gcontent</title>
<link href="../css/board.css" rel="stylesheet" type="text/css">
<link href="../css/comment.css" rel="stylesheet" type="text/css">
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
bdao.updategReadcount(Num);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<h1 style="margin-left: 95px;"><%=bb.getSubject() %></h1>
<table id="content" style="margin-left: 95px;">
  <tr><td class="h">글번호</td><td class="d"><%=bb.getNum() %></td>
       <td class="h">글쓴날짜</td><td class="d"><%=sdf.format(bb.getDate()) %></td></tr>
   <tr><td class="h">작성자</td><td class="d"><%=bb.getName() %></td>
       <td class="h">조회수</td><td class="d"><%=bb.getReadcount() %></td></tr>
   <tr><td class="h">제목</td><td colspan="3" class="d"><%=bb.getSubject() %></td></tr>
   <tr><td class="h">첨부파일</td><td colspan="3" class="d">
   <%if(bb.getFile() != null) {
		%><a href="../upload/<%=bb.getFile() %>" class="a3"><%=bb.getFile() %></a><br>
		<a href="file_down.jsp?file_name=<%=bb.getFile() %>" class="a2">
   		파일다운 : <%=bb.getFile() %></a><br><%
   } else {%>첨부파일 없음<%}%></td></tr>
   <tr><td class="h">내용</td><td colspan="3" class="c">
   <%if(bb.getFile() != null) {
		%><br><img src="../upload/<%=bb.getFile() %>" width="500"><br><br><br><%
   }%>
   <%=bb.getContent() %><br><br></td></tr>
</table>
<div id="table_search_c" style="margin-right: 290px;">
<input type="button" value="글수정" class="btn" onclick="location.href='gupdateForm.jsp?num=<%=bb.getNum() %>'">
<input type="button" value="글삭제" class="btn" onclick="location.href='gdeleteForm.jsp?num=<%=bb.getNum() %>'">
<input type="button" value="글목록" class="btn" onclick="location.href='gnotice.jsp'">
</div>
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