<%@page import="member.MemberDAO"%>
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
String Id = request.getParameter("id");
String Pass = request.getParameter("pass");

MemberDAO mdao = new MemberDAO();
int check = mdao.userCheck(Id, Pass);

if (check == 1) {
	
	session.setAttribute("id", Id);
	%>
	<script type="text/javascript">
		location.href = "../main/main.jsp";
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
		alert("아이디가 존재하지않습니다.");
		history.back();
	</script>
	<%
}
%>
</body>
</html>