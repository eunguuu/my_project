<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//session 객체에 저장된 id 값 가져와서 변수에 저장
	String id = (String)session.getAttribute("id");
	
	LocalDate today = LocalDate.now();
%>
<html lang="zxx">

<head>
<%
	if (id == null) {
%>
		<script type="text/javascript">
			alert("로그인이 필요합니다.");
			location.href = "MemberLogin.me";
		</script>
<%
	} else if (!id.equals("admin")) {
%>
		<script type="text/javascript">
			alert("잘못된 접근입니다.");
			history.back();
		</script>
<%
	}
%>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>MVC</title>
  <link rel="icon" href="img/favicon.png">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- animate CSS -->
  <link rel="stylesheet" href="css/animate.css">
  <!-- owl carousel CSS -->
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <!-- nice select CSS -->
  <link rel="stylesheet" href="css/nice-select.css">
  <!-- font awesome CSS -->
  <link rel="stylesheet" href="css/all.css">
  <!-- flaticon CSS -->
  <link rel="stylesheet" href="css/flaticon.css">
  <link rel="stylesheet" href="css/themify-icons.css">
  <!-- font awesome CSS -->
  <link rel="stylesheet" href="css/magnific-popup.css">
  <!-- swiper CSS -->
  <link rel="stylesheet" href="css/slick.css">
  <link rel="stylesheet" href="css/price_rangs.css">
  <!-- style CSS -->
  <link rel="stylesheet" href="css/style.css">
<!--   <link rel="stylesheet" href="css/reservation.css" type="text/css"> -->
  <link rel="stylesheet" href="css/common.css">
  <link rel="stylesheet" href="css/sub.css">
<script src="js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 등록된 영화관 리스트 가져오기
		$.getJSON('CinemaListJson.re', function(rdata) {
			$.each(rdata, function(index, item) {
				$('#cldiv').append("<li class='cl_div "+item.cinema_local+"'><input type='radio' name='cinema' id='"+item.cinema_name+"' value='"+item.cinema_name+"' class='rcinema'/><label for='"+item.cinema_name+"'>"
						+"<span id='span_c1'>["+item.cinema_localfull+"]</span><span id='span_c2'>"+item.cinema_name+"</span></label></li>");
			});
		});
		// 필수 조건
		$('#cinema_fr').submit(function() {
			var local = $('#local').val();
			var name = $('#name').val();
			
			if(local == "") {
				alert("지역을 선택하세요.");
				$('#local').focus();
				return false;
			}
			if(name == "") {
				alert("영화관명을 입력하세요.");
				$('#name').focus();
				return false;
			}
		});
	});
</script>
</head>

<body>
  <!--::header part start::-->
	<jsp:include page="/inc/top.jsp"/>
  <!-- Header part end-->

	<!-- 서브비주얼 -->
	  <jsp:include page="/inc/sub_main1.jsp"/>

  

  <!--================Reservation Area =================-->
  <section id="sub_content" class="reserveMain">
	  <div class="container">
<!-- 	  	<h3 class="sub_title"><b>관리자님! 영화관을 등록/삭제 해주세요.</b></h3> -->
	  	<div class="row">
			<div class="col-lg-3">
	            <div class="left_sidebar_area">
	                <aside class="left_widgets p_filter_widgets">
	                    <div class="side_menu">
							<h3>관리자메뉴</h3>
							<ul class="list side_list">
								<li><a href="AdminMovList.mo">영화목록</a></li>
								<li class="active"><a href="CinemaAddForm.re">영화관</a></li>
								<li><a href="MovieAddForm.re">상영중인 영화</a></li>
								<li><a href="GoodsList.go">스토어</a></li>
								<li><a href="AdminNoticeList.ad">공지사항</a></li>
								<li><a href="AdminQnAList.ad">1대1 문의</a></li>
								<li><a href="AdminMemberList.ad">회원 목록</a></li>
							</ul>
						</div><!-- .side_menu -->
					</aside>
	            </div>
	        </div>
	        <div class="col-lg-9">
	        	<h2 class="member_title">영화관</h2><!-- .member_title -->
			  	<!-- 등록된 영화 목록 -->
			  	<div id="cinemadiv">
				  	<form action="CinemaDeletePro.re" method="post" id="clistform">
						<table>
							<tr>
								<th>운영중인 영화관</th>
							</tr>
							<tr>
								<td>
									<ul id="cldiv">
									<!-- 영화관 리스트 표출 -->
									</ul>
								</td>
							</tr>
							<tr>
								<td id="tdBox">
									<input type="submit" class="genric-btn default circle" value="삭제">
								</td>
							</tr>
						</table>
					</form>
				  	<!-- 등록된 영화 목록 -->
					<!-- 영화관 등록 폼 -->
					<form action="CinemaAddPro.re" method="post" id="cinemaform">
						<select name="sellocal" id="sellocal">
							<option value="">지역을 선택하세요.</option>
							<option value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="인천">인천</option>
							<option value="강원">강원</option>
							<option value="대전/충청">대전/충청</option>
							<option value="대구">대구</option>
							<option value="부산/울산">부산/울산</option>
							<option value="경상">경상</option>
							<option value="광주/전라/제주">광주/전라/제주</option>
						</select><br><br><br>
						<input type="text" name="txtcname" id="txtcname" placeholder="영화관명을 입력하세요."><br><br>
						<div class="btnBox"><input type="submit" class="genric-btn primary circle" value="등록"></div>
					</form>
				</div>
				<!-- 영화관 등록 폼 -->
			</div>
		</div>
	  </div>
  </section>
  <!--================End Reservation Area =================-->

  <!--::footer_part start::-->
  <jsp:include page="/inc/bottom.jsp"/>
  <!--::footer_part end::-->

  <!-- jquery plugins here-->
  <!-- jquery -->
  <script src="js/jquery-1.12.1.min.js"></script>
  <!-- popper js -->
  <script src="js/popper.min.js"></script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.min.js"></script>
  <!-- easing js -->
  <script src="js/jquery.magnific-popup.js"></script>
  <!-- swiper js -->
  <script src="js/swiper.min.js"></script>
  <!-- swiper js -->
  <script src="js/masonry.pkgd.js"></script>
  <!-- particles js -->
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.nice-select.min.js"></script>
  <!-- slick js -->
  <script src="js/slick.min.js"></script>
  <script src="js/jquery.counterup.min.js"></script>
  <script src="js/waypoints.min.js"></script>
  <script src="js/contact.js"></script>
  <script src="js/jquery.ajaxchimp.min.js"></script>
  <script src="js/jquery.form.js"></script>
  <script src="js/jquery.validate.min.js"></script>
  <script src="js/mail-script.js"></script>
  <script src="js/stellar.js"></script>
  <script src="js/price_rangs.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
</body>

</html>