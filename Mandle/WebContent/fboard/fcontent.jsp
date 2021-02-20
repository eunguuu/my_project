<%@page import="board.CommentDAO"%>
<%@page import="board.CommentBean"%>
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
<title>acontent</title>
<link href="../css/board.css" rel="stylesheet" type="text/css">
<link href="../css/comment.css" rel="stylesheet" type="text/css">
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
<article id="mid">
<%
int Num = Integer.parseInt(request.getParameter("num"));
fBoardDAO bdao = new fBoardDAO();
fBoardBean bb = bdao.getfBoard(Num);
bdao.updatefReadcount(Num);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<h1><%=bb.getSubject() %></h1>
<table id="content">
  <tr><td class="h">글번호</td><td class="d"><%=bb.getNum() %></td>
       <td class="h">글쓴날짜</td><td class="d"><%=sdf.format(bb.getDate()) %></td></tr>
   <tr><td class="h">말머리</td><td class="d"><%=bb.getMal() %></td>
       <td class="h">조회수</td><td class="d"><%=bb.getReadcount() %></td></tr>
   <tr><td class="h">작성자</td><td class="d"><%=bb.getName() %></td>
   	   <td class="h">첨부파일</td><td colspan="3" class="d">
   <%if(bb.getFile() != null) {
		%><a href="../upload/<%=bb.getFile() %>" class="a3"><%=bb.getFile() %></a><br>
		<a href="file_down.jsp?file_name=<%=bb.getFile() %>" class="a4">
   		파일다운 : <%=bb.getFile() %></a><br><%
   } else {%>첨부파일 없음<%}%></td>
   <tr><td class="h">제목</td><td colspan="3" class="d"><%=bb.getSubject() %></td></tr>
   <tr><td class="h">내용</td><td colspan="3" class="c">
   		<%if(bb.getFile() != null) {
		%><br><img src="../upload/<%=bb.getFile() %>" width="500"><br><br><br><%
   		}%>
   		<%=bb.getContent() %><br><br></td></tr>
</table>
<div id="table_search_c">
<input type="button" value="글수정" class="btn" onclick="location.href='fupdateForm.jsp?num=<%=bb.getNum() %>'">
<input type="button" value="글삭제" class="btn" onclick="location.href='fdeleteForm.jsp?num=<%=bb.getNum() %>'">
<input type="button" value="글목록" class="btn" onclick="location.href='fnotice.jsp'">
</div>
<div class="clear"></div>
</article>
<article id="gal_com">
<%
// 댓글 가져오기
CommentDAO cdao = new CommentDAO();

CommentBean cb = cdao.getComment(bb.getNum());

int count = cdao.getCommentCount(bb.getNum());
int pageSize = 10;
String pageNum = request.getParameter("pageNum");
if(pageNum == null) {
	pageNum = "1";
}
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * pageSize + 1;
List commentList = cdao.getCommentList(bb.getNum(), startRow, pageSize);
SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy.MM.dd hh시mm분");

String sess = (String)session.getAttribute("id");

if(count == 0){
	%><div id="nocomment">등록된 댓글이 없습니다.</div><%
} else {
	%><table id="comment"><%
		for(int i=0;i<commentList.size();i++) {
		cb = (CommentBean)commentList.get(i);
		%><tr><td class="h"><%=cb.getName() %></td><td></td><td></td></tr>
   		  <tr><td colspan="3" class="c" style="white-space: pre;"><%=cb.getContent() %>
   		  
   		                                                                       <%=sdf2.format(cb.getDate()) %></td></tr>
   		  <%if(sess!=null){
   		  %>
   			<tr><td colspan="4" class="b">
   		    <input type="button" class="c_btn" value="수정" onclick="<%if(sess.equals(cb.getName())){%>window.open('../comment/cupdateForm.jsp?cnum=<%=cb.getCnum()%>&bnum=<%=cb.getBnum()%>&name=<%=cb.getName()%>&content=<%=cb.getContent()%>&date=<%=cb.getDate()%>', 'cupdate','width=500,height=350,top=300,left=600');<%}
   		    											else{%>alert('댓글 작성자가 아닙니다.');<%}%>">
		    <input type="button" class="c_btn" value="삭제" onclick="<%if(sess.equals(cb.getName())){%>window.open('../comment/cdeleteForm.jsp?cnum=<%=cb.getCnum()%>&bnum=<%=cb.getBnum()%>&name=<%=cb.getName()%>&content=<%=cb.getContent()%>&date=<%=cb.getDate()%>', 'cdelete','width=500,height=350,top=300,left=600');<%}
					else{%>alert('댓글 작성자가 아닙니다.');<%}%>"></td></tr>
   			<%  
   		  }
	}
	%></table><%
}

// 로그인한 사람만 댓글 쓰기 가능
if(sess != null) {
	%>
	<form action="../comment/commentPro.jsp" method="post" id="n_comment">
	<input type="hidden" name="bnum" value="<%=bb.getNum()%>">
	<table id="n_comment">
	<tr><td><input type="text" class="w" name="name" value="<%=sess%>" readonly></td></tr>
	<tr><td><textarea class="c" name="content" placeholder="댓글을 남겨보세요"></textarea></td></tr>
	<tr><td><input type="submit" value="댓글작성" class="c_btn"></td></tr>
	</table>
	</form>
	<%
}
%>
<div class="clear"></div>
</article>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>