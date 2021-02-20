<%@page import="board.CommentBean"%>
<%@page import="board.CommentDAO"%>
<%@page import="java.sql.Timestamp"%>
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
request.setCharacterEncoding("utf-8");

String sess = (String)session.getAttribute("id");

int bnum = Integer.parseInt(request.getParameter("bnum"));
String name = request.getParameter("name");
String content = request.getParameter("content");
Timestamp date = new Timestamp(System.currentTimeMillis());
int cnum = 0;

CommentBean cb = new CommentBean();
cb.setBnum(bnum);
cb.setName(name);
cb.setContent(content);
cb.setDate(date);

CommentDAO cdao = new CommentDAO();
cdao.insertComment(cb);
%>
<script type="text/javascript">
	alert("등록되었습니다.");
	location.href = "../fboard/fcontent.jsp?num=<%=cb.getBnum()%>";
</script>
</body>
</html>










