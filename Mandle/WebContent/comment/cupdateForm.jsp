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
<div id="n_comment2">
<form action="cupdatePro.jsp" method="post" id="n_comment2">
<input type="hidden" name="cnum" value="<%=cb.getCnum() %>">
<input type="hidden" name="bnum" value="<%=cb.getBnum() %>">
<table id="n_comment2">
<tr><td>댓글 작성자</td><td><input type="text" name="name" value=<%=cb.getName() %> readonly></td></tr>
<tr><td>댓글 내용</td>
    <td class="c_td"><textarea name="content" rows="5" cols="20"><%=cb.getContent() %></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="수정" class="btn1"><input type="button" value="취소" onclick="window.close()" class="btn2"></td></tr>
</table>
</form>
</div>

</body>
</html>