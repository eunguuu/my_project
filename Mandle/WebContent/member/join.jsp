<%@page import="member.MemberDAO"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link href="../css/member.css" rel="stylesheet" type="text/css">
<script src="../script/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	// submit 조건
		$('#join').submit(function() {
			if($('#id').val() == "") {
				alert("아이디를 입력하세요.");
				$('#id').focus();
				return false;
			}
			if($('#pass').val() == "") {
				alert("비밀번호를 입력하세요.");
				$('#pass').focus();
				return false;
			}
			if($('#pass2').val() == "") {
				alert("비밀번호를 입력하세요.");
				$('#pass2').focus();
				return false;
			}
			if($('#name').val() == "") {
				alert("이름을 입력하세요.");
				$('#name').focus();
				return false;
			}
			if($('#email').val() == "") {
				alert("이메일을 입력하세요.");
				$('#email').focus();
				return false;
			}
			if($('#email2').val() == "") {
				alert("이메일을 입력하세요.");
				$('#email2').focus();
				return false;
			}
		});
		
		// 커서 옮길때 마다 아이디, 비밀번호, 이메일 체크하기
		$('#join input').blur(function() {
			// 아이디 중복여부 확인
			if($('#id').val() == "") {
				$('#s1').html("아이디를 입력하세요.");
			} else if($('#id').val().includes(" ")) {
				$('#s1').html("아이디에는 공백이 포함될 수 없습니다.");
			} else if($('#id').val().length < 3 || $('#id').val().length > 10) {
				$('#s1').html("아이디는 3 ~ 10자만 입력해주세요.");
			} else {
				$.ajax('dupCheck.jsp', {
					data:{id:$('#id').val()},
					success:function(rdata) {
						$('#s1').html(rdata);
					}
				});
			}
			// 비밀번호 확인
			if($('#pass').val() == "") {
				$('#s2').html("비밀번호를 입력하세요.");
			} else if($('#pass').val().includes(" ")) {
				$('#s2').html("비밀번호에는 공백이 포함될 수 없습니다.");
			} else if($('#pass').val().length < 3 || $('#pass').val().length > 10) {
				$('#s2').html("비밀번호는 3 ~ 10자만 입력해주세요.");
			} else if($('#pass').val() != $('#pass2').val()) {
				$('#s2').html("비밀번호가 일치하지 않습니다.");
			} else if($('#pass').val() == $('#pass2').val()) {
				$('#s2').html("사용가능한 비밀번호 입니다.");
			}
			// 이메일 확인
			if($('#email').val() == "") {
				$('#s3').html("이메일을 입력하세요.")
			} else if($('#email').val() != $('#email2').val()) {
				$('#s3').html("이메일이 일치하지 않습니다.")
			} else if($('#email').val() == $('#email2').val()) {
				$('#s3').html("사용가능한 이메일 입니다.");
			}
		});
	});
</script>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->
<!-- 본문들어가는 곳 -->
<!-- 본문내용 -->
<article>
<hr class="log_hr" align="left">
<h1 class="jh1">회원가입</h1>
<hr class="hr3"><br>
<form action="joinPro.jsp" id="join" method="post" name="fr">
<fieldset>
<legend>▶&nbsp;&nbsp;기본 정보</legend>
	<input type="text" name="id" id="id" placeholder="아이디 ( 3~10자 이하의 문자 )">
	<span id="s1">아이디를 입력하세요.</span><br>
	<input type="password" name="pass" id="pass" placeholder="비밀번호 ( 3~10자 이하의 문자 )"><br>
	<input type="password" name="pass2" id="pass2" placeholder="비밀번호 확인">
	<span id="s2">비밀번호를 입력하세요.</span><br>
	<input type="text" name="name" id="name" placeholder="이름"><br>
	<input type="email" name="email" id="email" placeholder="이메일" ><br>
	<input type="email" name="email2" id="email2" placeholder="이메일 확인">
	<span id="s3">이메일을 입력하세요.</span><br>
</fieldset>

<fieldset>
<legend>▷&nbsp;&nbsp;추가 정보</legend>
	<input type="text" id="postcode" name="postcode" placeholder="우편번호">
	<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기" class="dup"><br>
	<input type="text" id="address"  name="address" placeholder="주소"><br>
	<input type="text" id="detailAddress"  name="detailAddress" placeholder="상세주소">
	<input type="text" id="extraAddress"  name="extraAddress" placeholder="참고항목"><br>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
	</script>
	<input type="text" name="phone" placeholder="전화번호"><br>
	<input type="text" name="mobile" placeholder="휴대폰번호"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
  <input type="submit" value="가입하기" class="submit">
  <input type="reset" value="취소" class="cancel">
<!--   <input type="button" value="화긴" id="btn" class="submit"> -->
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