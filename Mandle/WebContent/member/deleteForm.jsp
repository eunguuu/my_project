<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
<link href="../css/member.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->
<!-- 본문들어가는 곳 -->
<!-- 본문내용 -->
<article>
<hr class="main_line" align="left">
<h1 class="jh1">회원탈퇴</h1>
<hr class="hr3"><br>
<%
String sid = (String)session.getAttribute("id");

	MemberDAO mdao = new MemberDAO();
	MemberBean mb = mdao.getMember(sid);

if (sid != null) {
	%>
	<form action="deletePro.jsp" id="delete" method="post">
	<fieldset>
	  <label>아이디</label>
		<input type="text" name="id" value="<%=mb.getId() %>" readonly><br>
	  <label>비밀번호</label>
		<input type="password" name="pass"><br>
	</fieldset>
	<div class="clear"></div>
	<div id="buttons">
		<input type="submit" value="탈퇴하기" class="submit">
		<input type="reset" value="취소" class="cancel">
	</div>
	</form>
	<%	
} else {
	%>
	<script type="text/javascript">
		alert("로그인이 필요합니다.");
		location.href = "login.jsp";
	</script>
	<%
}
%>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>