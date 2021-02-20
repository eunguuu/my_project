<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
	//session 객체에 저장된 id 값 가져와서 변수에 저장
	String id = (String)session.getAttribute("id");
 
	// MemberBean 객체 가져오기
	MemberBean article = (MemberBean)request.getAttribute("article");
	
	String nowPage = request.getParameter("page");
%>

<!DOCTYPE html>
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
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/sub.css">
</head>

<body>
    <!--::header part start::-->
    <jsp:include page="../inc/top.jsp"/>
    <!-- Header part end-->
    <!--     서브비주얼 -->
	<jsp:include page="/inc/sub_main1.jsp"/>

    <!--================ 메뉴 영역 =================-->
    <section class="cat_product_area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="left_sidebar_area">
                        <aside class="left_widgets p_filter_widgets">
                            <div class="side_menu">
								<h3>관리자메뉴</h3>
								<ul class="list side_list">
									<li><a href="AdminMovList.mo">영화목록</a></li>
									<li><a href="CinemaAddForm.re">영화관</a></li>
									<li><a href="MovieAddForm.re">상영중인 영화</a></li>
									<li><a href="GoodsList.go">스토어</a></li>
									<li><a href="AdminNoticeList.ad">공지사항</a></li>
									<li><a href="AdminQnAList.ad">1대1 문의</a></li>
									<li class="active"><a href="AdminMemberList.ad">회원 목록</a></li>
								</ul>
							</div><!-- .side_menu -->
                        </aside>
                    </div>
                </div>
          <!--================ 메뉴 영역 =================-->          
                
                <div class="col-lg-9">
                	<h2 class="member_title">회원목록</h2><!-- .member_title -->
                    <div class="row align-items-center latest_product_inner">
                    	<table class="table">
                    		<tr>
                    			<th>아이디</th>
                    			<td><%=article.getId() %></td>
                    			<th>비밀번호</th>
                    			<td><%=article.getPass() %></td>
                    		</tr>
                    		<tr>
                    			<th>이름</th>
                    			<td><%=article.getName() %></td>
                    			<th>전화번호</th>
                    			<td><%=article.getPhone() %></td>
                    		</tr>
                    		<tr>
                    			<th>이메일</th>
                    			<td><%=article.getEmail() %></td>
                    			<th>성별</th>
                    			<td><%=article.getGender() %></td>
                    		</tr>                    		
                    		<tr>
                    			<th>생년월일</th>
                    			<td><%=article.getBirthday() %></td>
                    			<th>우편번호</th>
                    			<td><%=article.getPostcode() %></td>
                    		</tr>                    		
                    		<tr>
                    			<th>주소</th>
                    			<td colspan="3"><%=article.getAddress() + article.getDetailAddress() + article.getExtraAddress() %></td>
                    		</tr>
                    		<tr>
                    			<th>쿠폰</th>
                    			<td>1000원 할인권 : <%=article.getCoupon_1000() %> 장</td>
                    			<td>2000원 할인권 : <%=article.getCoupon_2000() %> 장</td>
                    			<td>3000원 할인권 : <%=article.getCoupon_3000() %> 장</td>
                    		</tr>
                    		<tr>
                    			<th>무료영화쿠폰</th>
                    			<td><%=article.getFree_ticket() %> 장</td>
                    			<th>멤버 등급 포인트</th>
                    			<td><%=article.getMembership() %></td>
                    		</tr>
                    		<tr>
                    			<td colspan="4"><input type="button" value="목록" class="genric-btn primary circle" onclick="location.href='AdminMemberList.ad?page=<%=nowPage %>'"></td>
                    		</tr>                   		
                    	</table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Category Product Area =================-->


    <!--::footer_part start::-->
    <jsp:include page="../inc/bottom.jsp"/>
    <!--::footer_part end::-->

    <!-- jquery plugins here-->
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