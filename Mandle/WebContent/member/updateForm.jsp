<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
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
<h1 class="uh1">회원정보 수정</h1>
<hr class="hr3"><br>
<%
String sid = (String)session.getAttribute("id");

	MemberDAO mdao = new MemberDAO();
	MemberBean mb = mdao.getMember(sid);

if (sid != null) {
	%>
	<form action="updatePro.jsp" id="update" method="post" name="fr">
	<fieldset>
	<legend>▶&nbsp;&nbsp;기본 정보</legend>
	  <label>아이디</label>
		<input type="text" name="id" class="id" value="<%=mb.getId() %>" readonly><br>
	  <label>비밀번호</label>
		<input type="password" name="pass" ><br>
	  <label>이름</label>
		<input type="text" name="name" value="<%=mb.getName() %>" ><br>
	  <label>이메일</label>
		<input type="email" name="email" value="<%=mb.getEmail() %>" ><br>
	</fieldset>

	<fieldset>
	<legend>▷&nbsp;&nbsp;추가 정보</legend>
	<label>우편번호</label>
	<input type="text" id="postcode" name="postcode" value="<%=mb.getPostcode() %>" placeholder="우편번호">
	<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="dup"><br>
	<label>주소</label>
	<input type="text" id="address"  name="address" value="<%=mb.getAddress() %>" placeholder="주소"><br>
	<label>상세주소</label>
	<input type="text" id="detailAddress"  name="detailAddress" value="<%=mb.getDetailAddress() %>" placeholder="상세주소"><br>
	<label></label>
	<input type="text" id="extraAddress"  name="extraAddress" value="<%=mb.getExtraAddress() %>" placeholder="참고항목"><br>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
	</script>
	<label>전화번호</label>
	<input type="text" name="phone" value="<%=mb.getPhone() %>"><br>
	<label>휴대폰번호</label>
	<input type="text" name="mobile" value="<%=mb.getMobile() %>"><br>
	</fieldset>
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

<div class="clear"></div>
<div id="buttons">
  <input type="submit" value="수정하기" class="submit">
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