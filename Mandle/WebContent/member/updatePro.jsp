<%@page import="member.MemberBean"%>
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
request.setCharacterEncoding("utf-8");

String Id = request.getParameter("id");
String Pass = request.getParameter("pass");
String Name = request.getParameter("name");
String Email = request.getParameter("email");
String Postcode = request.getParameter("postcode");
String Address = request.getParameter("address");
String DetailAddress = request.getParameter("detailAddress");
String ExtraAddress = request.getParameter("extraAddress");
String Phone = request.getParameter("phone");
String Mobile = request.getParameter("mobile");

MemberDAO mdao = new MemberDAO();

int check = mdao.userCheck(Id, Pass);

if (check == 1) {
	
	MemberBean mb = new MemberBean();
	mb.setId(Id);
	mb.setPass(Pass);
	mb.setName(Name);
	mb.setEmail(Email);
	mb.setPostcode(Postcode);
	mb.setAddress(Address);
	mb.setDetailAddress(DetailAddress);
	mb.setExtraAddress(ExtraAddress);
	mb.setPhone(Phone);
	mb.setMobile(Mobile);
	mdao.updateMember(mb);
	%>
	<script type="text/javascript">
		alert("수정되었습니다.");
		location.href = "info.jsp?id=<%=mb.getId() %>";
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