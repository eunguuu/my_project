<%@page import="board.fBoardDAO"%>
<%@page import="board.fBoardBean"%>
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
String Pass = multi.getParameter("pass");
String Subject = multi.getParameter("subject");
String Content = multi.getParameter("content");
String Mal = multi.getParameter("mal");
// 수정해서 새롭게 추가할 file
String file = multi.getFilesystemName("file");
// 기존 file 이름
if(file == null) {
	file = multi.getParameter("oldfile");
}

fBoardBean bb = new fBoardBean();
bb.setNum(Num);
bb.setName(Name);
bb.setPass(Pass);
bb.setSubject(Subject);
bb.setContent(Content);
bb.setFile(file);
bb.setMal(Mal);

fBoardDAO bdao = new fBoardDAO();

int check = bdao.numCheck(bb);

if (check == 1) {
	
	bdao.updatefBoard(bb);
	%>
	<script type="text/javascript">
		alert("수정되었습니다.");
		location.href = "fnotice.jsp";
	</script>
	<%
	
} else if (check == 0) {
	
	%>
	<script type="text/javascript">
		alert("비밀번호가 일치하지않습니다.");
		history.back();
	</script>
	<%
	
} else if (check == -1) {
	
	%>
	<script type="text/javascript">
		alert("글이 존재하지않습니다.");
		history.back();
	</script>
	<%
}
%>
</body>
</html>