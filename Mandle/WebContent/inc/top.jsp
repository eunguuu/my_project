<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/inc.css" rel="stylesheet" type="text/css">
</head>
<body>
<header id="header">
<%
String sid = (String)session.getAttribute("id");

if (sid == null) {
	
	%><img src="../images/member/guest.png" id="char_n"><%
			
	%><div id="login_n"><a href="../member/login.jsp">로그인</a> | <a href="../member/join.jsp">회원가입</a></div><%
			
} else if(sid.equals("admin")){

	%><img src="../images/member/admin.png" id="char_y"><%
			
	%>	<div id="login_ay">관리자님, 반갑습니다!<br><br>
		<a href="../member/logout.jsp">로그아웃</a> | <a href="../member/info.jsp">내정보</a><br><br>
		<a href="../member/memberList.jsp"><span class="slist">[회원목록]</span></a></div> <%

} else {
	
	%><img src="../images/member/member.png" id="char_y"><%
			
	%>	<div id="login_y"><%=sid %> 님, 반갑습니다!<br><br>
	    <a href="../member/logout.jsp" onclick="location.reload()">로그아웃</a> | <a href="../member/info.jsp">내정보</a></div> <%
	    
}
%>
<!-- 로고들어가는 곳 -->
<div id="logo">
	<a href="../main/main.jsp"><img src="../images/circlelogo_nb.png" width="200" alt="MANDLE NAIL"></img ></a>
</div>
<!-- 로고들어가는 곳 -->
<div class="clear"></div>
<!-- <nav id="top_menu"> -->
<!-- <ul> -->
<!-- 	<li><a href="../company/welcome.jsp">소개</a></li> -->
<!-- 	<li><a href="../center/notice.jsp">게시판</a></li> -->
<!-- 	<li><a href="../center/notice.jsp">자료실</a></li> -->
<!-- 	<li><a href="../customer/customer.jsp">예약&문의</a></li> -->
<!-- </ul> -->
<!-- </nav> -->
</header>
</body>
</html>