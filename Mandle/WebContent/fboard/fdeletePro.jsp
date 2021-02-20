<%@page import="board.fBoardDAO"%>
<%@page import="board.fBoardBean"%>
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
String Pass = request.getParameter("pass");
String Subject = request.getParameter("subject");
String Content = request.getParameter("content");

fBoardBean bb = new fBoardBean();
bb.setNum(Num);
bb.setName(Name);
bb.setPass(Pass);
bb.setSubject(Subject);
bb.setContent(Content);

fBoardDAO bdao = new fBoardDAO();

int check = bdao.numCheck(bb);

if(check == 1) {
	
bdao.deletefBoard(bb);
%>
		<script type="text/javascript">
		alert("삭제되었습니다.");
		location.href = "fnotice.jsp";
		</script>
		<%
		
} else if(check == 0) {
	%>
	<script type="text/javascript">
		alert("비밀번호가 일치하지않습니다.");
		history.back();
	</script>
	<%	
} else if(check == -1) {
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