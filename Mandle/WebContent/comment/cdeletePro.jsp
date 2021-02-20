<%@page import="board.CommentDAO"%>
<%@page import="board.CommentBean"%>
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

int cnum = Integer.parseInt(request.getParameter("cnum"));
int bnum = Integer.parseInt(request.getParameter("bnum"));
String name = request.getParameter("name");
String content = request.getParameter("content");

CommentBean cb = new CommentBean();
cb.setCnum(cnum);
cb.setBnum(bnum);
cb.setName(name);
cb.setContent(content);

CommentDAO cdao = new CommentDAO();
cdao.deleteComment(cb);
%>

<script type="text/javascript">
	alert("댓글이 삭제되었습니다.");
	window.close();
	opener.location.reload();
</script>

</body>
</html>