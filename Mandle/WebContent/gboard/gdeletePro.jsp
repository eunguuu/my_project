<%@page import="board.gBoardDAO"%>
<%@page import="board.gBoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int Num = Integer.parseInt(request.getParameter("num"));
String Name = request.getParameter("name");
String Subject = request.getParameter("subject");
String Content = request.getParameter("content");

gBoardBean bb = new gBoardBean();
bb.setNum(Num);
bb.setName(Name);
bb.setSubject(Subject);
bb.setContent(Content);

gBoardDAO bdao = new gBoardDAO();

bdao.deletegBoard(bb);
	%>
	<script type="text/javascript">
		alert("삭제되었습니다.");
		location.href = "gnotice.jsp";
	</script>
	<%
%>
</body>
</html>