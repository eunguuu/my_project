<%@page import="board.CommentDAO"%>
<%@page import="board.CommentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/comment.css" rel="stylesheet" type="text/css">
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
%>
<div id="n_comment3">
<form action="cdeletePro.jsp" method="post" id="n_comment3">
<input type="hidden" name="cnum" value="<%=cb.getCnum() %>">
<input type="hidden" name="bnum" value="<%=cb.getBnum() %>">
<input type="hidden" name="name" value="<%=cb.getName() %>">
<input type="hidden" name="content" value="<%=cb.getContent() %>">
<table id="n_comment3">
<tr><td><span>댓글을 삭제하시겠습니까?</span></td></tr>
<tr><td colspan="2"><input type="submit" value="삭제" class="btn1"><input type="button" value="취소" onclick="window.close()" class="btn2"></td></tr>
</table>
</form>
</div>

</body>
</html>