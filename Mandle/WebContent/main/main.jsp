<%@page import="board.aBoardBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.aBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<script src="../script/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.brown').click(function() {
			$.getJSON('mainjson.jsp', function(rdata) {
				$.each(rdata, function(index, item) {
					// 게시판글 num, subject, date 가져오기
					$('table').append("<tr><td>"+item.num+"</td><td>"+item.subject+"</td><td>"+item.date+"</td></tr>");
				});
			});
			$(this).unbind();
		});
	});
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
<nav id="top_menu">
<ul>
	<li><a href="../company/welcome.jsp">ABOUT</a></li>
	<li><a href="../aboard/anotice.jsp">COMMUNITY</a></li>
	<li><a href="../gboard/gnotice.jsp">PORTFOLIO</a></li>
	<li><a href="../sns/sns.jsp">SNS</a></li>
</ul>
</nav>
<div class="clear"></div>
<div id="solution">
<!-- 하나더 구현하기~! -->
<div id="m_div">
<h1><span style="color: #d58a62;">이달</span>의 <span style="color: #c52c4e">EVENT!</span></h1>
<img alt="art10" src="../images/nail/10월.png">
<h2>* 유광/무광 • 컬러 변경 가능</h2>
</div>
<div class="clear"></div>
<hr class="m_hr">
<div id="location">
<a href="../company/location.jsp"><img src="../images/company/location.png" width="100px"></a>
<h3>찾아오시는 길</h3>
<h2>미리 확인하시고</h2>
<h2>오시면 편리합니다.</h2>
</div>
<div id="event">
<a href="../aboard/anotice.jsp"><img src="../images/company/event.png" width="100px"></a>
<h3>이달의 행사</h3>
<h2>매달 새로운 이벤트를</h2>
<h2>소개해드립니다.</h2>
</div>
<div id="inquiry">
<a href="../fboard/fnotice.jsp"><img src="../images/company/chat.png" width="100px"></a>
<h3>예약/문의</h3>
<h2>빠르고 친절하게</h2>
<h2>답변해드리겠습니다.</h2>
</div>
<div class="clear"></div>
</div>
<div id="sec_news">
<h3><span style="color: #f26522; margin-left: 24px;">C</span>aution</h3>
<dl>
<dt>1:1 예약제</dt>
<dd>한분 한분 꼼꼼하게 시술 해 드리겠습니다 : )</dd>
</dl>
<dl>
<dt>문의 환영</dt>
<dd>원하시는 시술을 자유롭게 문의해주세요!</dd>
</dl>
</div>
<div id="news_notice">
<h3 class="brown" ><span style="color: #f26522; margin-left: 28px;">E</span>vent</h3>
<table>
<!-- json 로 가져오기 -->
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>