<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member list</title>
<link href="../css/member.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->
<!-- 본문들어가는 곳 -->
<!-- 본문내용 -->
<% 
String sess = (String)session.getAttribute("id");
if(!(sess.equals("admin"))) {
	%>
	<script type="text/javascript">
		alert("관리자만 접근 가능합니다.");
		history.back();
	</script>
	<%
}
%>
<article>
<hr class="main_line" align="left">
<h1 class="info_h1">회원목록</h1>
<form action="" id="info" method="post">
<fieldset>
<%
request.setCharacterEncoding("utf-8");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

MemberDAO mdao = new MemberDAO();
	
List memberList = mdao.getMemberList();

%>
<table id="memberList">
  <tr><th class="cid">아이디</th><th>비밀번호</th><th>이름</th><th>이메일</th>
      <th>주소</th><th>전화번호</th><th>휴대폰번호</th><th class="cdate">가입날짜</th></tr>
<%
for(int i=0;i<memberList.size();i++) {
		
	MemberBean mb = (MemberBean)memberList.get(i);
%>
  <tr><td><%=mb.getId() %></td><td><%=mb.getPass() %></td><td><%=mb.getName() %></td><td><%=mb.getEmail() %></td>
      <td>(<%=mb.getPostcode() %>) <%=mb.getAddress() %> <%=mb.getExtraAddress() %> <%=mb.getDetailAddress() %></td>
      <td><%=mb.getPhone() %></td><td><%=mb.getMobile() %></td><td><%=sdf.format(mb.getDate()) %></td></tr>
<%
}
%>
</table>
</fieldset>
</form>
</article>
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>