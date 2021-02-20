<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info</title>
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
<h1 class="info_h1">회원정보</h1>
<hr class="hr3"><br>
<form action="" id="info" method="post">
<fieldset>
	<%
	String sid = (String)session.getAttribute("id");

	MemberDAO mdao = new MemberDAO();
	MemberBean mb = mdao.getMember(sid);
	
	if(sid != null) {
		%>
		<label>아이디</label>
		  <input type="text" value="<%=mb.getId() %>" disabled><br>
		<label>비밀번호</label>
		  <input type="text" value="<%=mb.getPass() %>" disabled><br>
		<label>이름</label>
		  <input type="text" value="<%=mb.getName() %>" disabled><br>
		<label>이메일</label>
		  <input type="text" value="<%=mb.getEmail() %>" disabled><br>
		<label>주소</label>
		  <input type="text" value="(<%=mb.getPostcode() %>) <%=mb.getAddress() %>" disabled><br>
		<label></label>
		  <input type="text" value="<%=mb.getExtraAddress() %> <%=mb.getDetailAddress() %>" disabled><br>
		<label>전화번호</label>
		  <input type="text" value="<%=mb.getPhone() %>" disabled><br>
		<label>휴대폰번호</label>
		  <input type="text" value="<%=mb.getMobile() %>" disabled><br>
		<label>가입날짜</label>
		  <input type="text" value="<%=mb.getDate() %>" disabled><br>
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
<div id="buttons">
	<input type="button" value="회원정보 수정" class="submit" onclick="location.href='updateForm.jsp'">
	<input type="button" value="회원 탈퇴" class="cancel" onclick="location.href='deleteForm.jsp'">
</div>
</fieldset>
<div class="clear"></div>
</form>
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