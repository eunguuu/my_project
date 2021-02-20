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
String id = request.getParameter("id");
// MemberDAO mdao 객체생성
MemberDAO mdao = new MemberDAO();
// int check = dupCheck(wid)
int check = mdao.dupCheck(id);
// check==1  "아이디 중복"
// check==0  "아이디 사용가능"
if(check==1){
	out.println("이미 사용중인 아이디입니다.");
}else{
	out.println("사용 가능한 아이디입니다.");
}
%>
</body>
</html>






