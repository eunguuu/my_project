<%@page import="board.gBoardDAO"%>
<%@page import="board.gBoardBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
// request.setCharacterEncoding("utf-8");

String uploadPath = request.getRealPath("/upload");
System.out.println(uploadPath);

int maxSize = 10*1024*1024;

MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());

String Name = multi.getParameter("name");
String Subject = multi.getParameter("subject");
String Content = multi.getParameter("content");
int num = 0;
int readcount = 0;
Timestamp date = new Timestamp(System.currentTimeMillis());
String file = multi.getFilesystemName("file");

gBoardBean bb = new gBoardBean();
bb.setName(Name);
bb.setSubject(Subject);
bb.setContent(Content);
bb.setNum(num);
bb.setReadcount(readcount);
bb.setDate(date);
bb.setFile(file);

gBoardDAO bdao = new gBoardDAO();
bdao.insertgBoard(bb);
%>
<script type="text/javascript">
	alert("등록되었습니다.");
	location.href = "gnotice.jsp";
</script>
</body>
</html>