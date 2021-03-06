<%@page import="board.CommentDAO"%>
<%@page import="board.fBoardBean"%>
<%@page import="board.fBoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fnotice</title>
<link href="../css/board.css" rel="stylesheet" type="text/css">
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
	<li><a href="../aboard/anotice.jsp" class="sel">COMMUNITY</a></li>
	<li><a href="../gboard/gnotice.jsp">PORTFOLIO</a></li>
	<li><a href="../sns/sns.jsp">SNS</a></li>
</ul>
</nav>
<div class="clear"></div>
<div id="solution_w">
<nav id="sub_menu">
<ul>
	<li><a href="../aboard/anotice.jsp">이달의 행사</a></li>
	<li><a href="../fboard/fnotice.jsp">예약/문의</a></li>
</ul>
</nav>
<%
fBoardDAO bdao = new fBoardDAO();

//게시판 글 전체 갯수 count()
int count = bdao.getfBoardCount();

//한 페이지에 보여줄 글의 갯수 설정
int pageSize = 10;

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
//   1            10                 1
//   2            10                11
//   3            10                21
//  10            10                91
int startRow = (currentPage - 1) * pageSize + 1;

//String sql = "select * from board order by num desc limit ?,?"; 추가
//? startRow-1 ? pasgeSize => 0 부터 10 개를 자름

List boardList = bdao.getfBoardList(startRow, pageSize);

//날짜를 원하는 모양으로 변경하여 문자열로 리턴
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<article id="mid">
<h1>예약/문의</h1>
<h2>전체 글 갯수 [<%=count%>]</h2>
<table id="notice">
<tr><th class="cno">No.</th>
	<th class="cmal">말머리</th>
    <th class="ctitle">Title</th>
    <th class="cwrite">Writer</th>
    <th class="cdate">Date</th>
    <th class="cread">Read</th></tr>
<%
	for(int i=0;i<boardList.size();i++) {
		
		fBoardBean bb = (fBoardBean)boardList.get(i);
		
		CommentDAO cdao = new CommentDAO();

		int com_count = cdao.getCommentCount(bb.getNum());
%>
  	   <tr onclick="location.href='fcontent.jsp?num=<%=bb.getNum()%>'"><td><%=bb.getNum() %></td>
   	     <td><%=bb.getMal() %></td>
         <td class="left"><%=bb.getSubject()%> (<%=com_count %>)</td>
         <td><%=bb.getName() %></td>
         <td><%=sdf.format(bb.getDate()) %>
         </td><td><%=bb.getReadcount() %></td></tr>
<%
}
%>
</table>
<div id="table_search">
<form action="fnoticeSearch.jsp" method="post">
<input type="button" value="글작성" class="btn" onclick="location.href='fwriteForm.jsp'">
<input type="text" name="search" class="input_box">
<input type="submit" value="검색" class="btn">
</form>
</div>
<div class="clear"></div>
<div id="page_control">
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
	%><a href="fnotice.jsp?pageNum=<%=startPage - pageBlock %>">[이전]</a><%
}

for(int i=startPage;i<=endPage;i++) {
	%><a href="fnotice.jsp?pageNum=<%=i %>"><%=i %></a><%
}

if(endPage < pageCount) {
	%><a href="fnotice.jsp?pageNum=<%=startPage + pageBlock %>">[다음]</a><%
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