<%@page import="board.aBoardDAO"%>
<%@page import="board.aBoardBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

int Num = Integer.parseInt(multi.getParameter("num"));
String Name = multi.getParameter("name");
String Subject = multi.getParameter("subject");
String Content = multi.getParameter("content");
// 수정해서 새롭게 추가할 file
String file = multi.getFilesystemName("file");
// 기존 file 이름
if(file == null) {
	file = multi.getParameter("oldfile");
}

aBoardBean bb = new aBoardBean();
bb.setNum(Num);
bb.setName(Name);
bb.setSubject(Subject);
bb.setContent(Content);
bb.setFile(file);

aBoardDAO bdao = new aBoardDAO();

bdao.updateaBoard(bb);
%>
<script type="text/javascript">
	alert("수정되었습니다.");
	location.href = "anotice.jsp";
</script>

</body>
</html>