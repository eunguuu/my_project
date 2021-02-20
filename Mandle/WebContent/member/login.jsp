<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link href="../css/member.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->
<!-- 본문들어가는 곳 -->
<!-- 본문내용 -->
<article style="height: 440px;">
<hr class="log_hr" align="left">
<h1 class="lh1">로그인</h1>
<hr class="hr3"><br>
<form action="loginPro.jsp" id="login" method="post">
<fieldset>
  <label>아이디</label>
	<input type="text" name="id"><br>
  <label>비밀번호</label>
	<input type="password" name="pass"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
	<input type="submit" value="로그인" class="submit">
	<input type="reset" value="취소" class="cancel">
</div>
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