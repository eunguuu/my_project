<%@page import="board.gBoardBean"%>
<%@page import="board.gBoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gnotice</title>
<link href="../css/board.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function yesWrite() {
	location.href = "gwriteForm.jsp";
}

function noWrite() {
	alert("관리자만 작성 가능합니다");
}
</script>
</head>
<body>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<hr class="main_line" align="left">
<nav id="top_menu_s">
<ul>
	<li><a href="../company/welcome.jsp">ABOUT</a></li>
	<li><a href="../aboard/anotice.jsp">COMMUNITY</a></li>
	<li><a href="../gboard/gnotice.jsp" class="sel">PORTFOLIO</a></li>
	<li><a href="../sns/sns.jsp">SNS</a></li>
</ul>
</nav>
<div class="clear"></div>
<div id="solution_w">
<%
//request한글처리
request.setCharacterEncoding("utf-8");
//search 파라미터 가져오기
String search=request.getParameter("search");

//날짜를 원하는 모양으로 변경하여 문자열로 리턴
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

gBoardDAO bdao = new gBoardDAO();

//게시판 글 전체 갯수 count()
int count = bdao.getgBoardCount(search);
//한 페이지에 보여줄 글의 갯수 설정
int pageSize = 16;

//현페이지 페이지번호 가져오기
//response.sendRedirect("list.jsp");				// => pageNum 없으면 "1" 페이지 설정
//response.sendRedirect("list.jsp?pageNum=X");		// => pageNum 있으면 해당 페이지 설정

//pageNum 파라미터 가져오기
String pageNum = request.getParameter("pageNum");
if(pageNum == null) {
	pageNum = "1";
}

//시작하는 행번호 구하기
int currentPage = Integer.parseInt(pageNum);
//currentPage    pageSize    =>    startRow
//   1            12                 1
//   2            12                13
//   3            12                25
//  10            12                119
int startRow = (currentPage - 1) * pageSize + 1;

//String sql = "select * from board order by num desc limit ?,?"; 추가
//? startRow-1 ? pasgeSize => 0 부터 12 개를 자름

List boardList = bdao.getgBoardList(startRow, pageSize, search);
%>
<article id="gal">
<h1>PORTFOLIO</h1>
<h2>전체 글 갯수 [<%=count%>]</h2>
<table id="g">
<tr><th class="glist" colspan="4">list</th></tr>
<tr>
<%
int oneLine = 0;

for(int i=0;i<boardList.size();i++) {
	
	gBoardBean bb = (gBoardBean)boardList.get(i);
%>
   <td class="gtd" onclick="location.href='gcontent.jsp?num=<%=bb.getNum()%>'"><img src="../upload/<%=bb.getFile()%>" width="150" height="150"><br>
   <%=bb.getSubject() %><br><%=bb.getName() %><br><%=sdf.format(bb.getDate()) %></td>
<%
	oneLine++;

	if(oneLine % 4 == 0) {
		%></tr><%
		oneLine = 0;
	}
	
}
%>
</table>
<div id="table_search">
<form action="gnoticeSearch.jsp" method="post">
<input type="text" name="search" value="<%=search %>" class="input_box">
<input type="submit" value="검색" class="btn">
</form>
<%
// admin 만 글작성 가능
String sess = (String)session.getAttribute("id");

if(sess != null) {%><input type="button" value="글작성" class="g_btn"
					onclick="<%if(sess.equals("admin")){%>yesWrite();<%}
					else{%>noWrite();<%}%>"><%}%>
</div>
<div class="clear"></div>
<div id="page_control">

<!-- <a href="notice.jsp?pageNum=1">1</a><a href="notice.jsp?pageNum=2">2</a><a href="#">3</a> -->
<!-- <a href="#">4</a><a href="#">5</a><a href="#">6</a> -->
<!-- <a href="#">7</a><a href="#">8</a><a href="#">9</a> -->
<!-- <a href="#">10</a> -->

<%
// 한 화면에 보여줄 페이지 갯수 설정
int pageBlock = 10;
//   currentPage    pageBlock     startPage    endPage
//      1            10            1             10
//      10           10            1             10
//      11           10            11            20
//      19           10            11            20
//      22           10            21            30
//      31           10            31            40
int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
int endPage = startPage + pageBlock - 1;

// 페이지 번호가 10까지 없을 경우
// 전체페이지수 구하기
// count     pageSize     pageCount
//   1           10           1
//   10          10           1
//   11          10           2
//   15          10           2
//   20          10           2
//   21          10           3
int pageCount = (count - 1) / pageSize + 1;
// int pageCount = count / pageSize + (count%10==0 ? 0 : 1);
if(pageCount < endPage) {
	endPage = pageCount;
}

if(startPage > pageBlock) {
	%><a href="gnotice.jsp?pageNum=<%=startPage - pageBlock %>">[이전]</a><%
}

for(int i=startPage;i<=endPage;i++) {
	%>
	<a href="gnotice.jsp?pageNum=<%=i %>"><%=i %></a>
	<%
}

if(endPage < pageCount) {
	%><a href="gnotice.jsp?pageNum=<%=startPage + pageBlock %>">[다음]</a><%
}
%>
</div>
</article>
</div>
<div class="clear"></div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>