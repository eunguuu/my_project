<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
    
<%
	//session 객체에 저장된 id 값 가져와서 변수에 저장
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<script src="js/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	// TOP 이동 버튼
	$(window).scroll(function() {
        if ($(this).scrollTop() > 300) {
            $('a.btn_top').fadeIn(100);
        } else {
            $('a.btn_top').fadeOut(100);
        }
    });
    
    $("a.btn_top").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 500);
        return false;
    });
	
});

</script>

<!-- TOP 이동 버튼 -->
<a href="#" class="btn_top">TOP</a>

<header class="main_menu home_menu">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="logo" href="./"> <img src="img/logo.png" alt="logo"> </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="menu_icon"><i class="fas fa-bars"></i></span>
                        </button>

                        <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="MovMain.mo">영화</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="ReserveMain.re">예매</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="StoreList.go" id="navbarDropdown_1"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                               		         스토어
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                        <a class="dropdown-item" href="StoreList.go#package">패키지</a>
                                        <a class="dropdown-item" href="StoreList.go#ticket">관람권</a>
                                        <a class="dropdown-item" href="StoreList.go#snack">스낵음료</a>
                                        
                                    </div>
                                </li>
                              <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.jsp" id="navbarDropdown_3"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        이벤트
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_3">
                                        
                                         <a class="dropdown-item" href="EventList.ev"> 영화</a>
                                        <a class="dropdown-item" href="PreviewList.pr">시사회/무대인사</a>
                                        <a class="dropdown-item" href="WinList.wi">당첨자 발표</a>
                                        <a class="dropdown-item" href="EventListHot.ev">HOT</a>
                                    </div>
                                </li>
                                
                                                            
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="blog.jsp" id="navbarDropdown_4"
                                        role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        고객센터
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown_4">
                                        <a class="dropdown-item" href="NoticeList.no"> 공지사항</a>
                                        <a class="dropdown-item" href="NoticeFaq.no">FAQ</a>
                                        <a class="dropdown-item" href="QnaList.qn">1대1 문의</a>
                                        
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="hearer_icon d-flex">
<!--                             <a id="search_1" href="javascript:void(0)"><i class="ti-search"></i></a> -->
                            
                            <!-- 세션값에 따라서 로그인 또는 마이페이지 이동 -->
                            <%
                          	if (id == null) {
                            %>
                            <a href="MemberLogin.me" class="btn_mypage"><img src="img/user.png"></a><a href="BasketList.go" class="btn_cart"><img src="img/cart.png"></a>
                            <%
                          	} else {
                          		if (id.equals("admin")) {
                          	%>
                          	<a href="AdminMain.ad" class="btn_mypage"><img src="img/user.png"></a><a href="MemberLogout.me" class="btn_logout"><img src="img/logout.png"></a>
                          	<%
                          		} else {
                            %>
                            <a href="MemberMain.me" class="btn_mypage"><img src="img/user.png"></a><a href="BasketList.go" class="btn_cart"><img src="img/cart.png"></a><a href="MemberLogout.me" class="btn_logout"><img src="img/logout.png"></a>
                            <%
                          		}
                          	}
                            %>
                            
<!--                             <a href="BasketList.go" class="btn_cart"><img src="img/cart.png"></a>  -->
                            
                        </div>
                    </nav>
                </div>
            </div>
        </div>
<!--         <div class="search_input" id="search_input_box"> -->
<!--             <div class="container "> -->
<!--                 <form class="d-flex justify-content-between search-inner"> -->
<!--                     <input type="text" class="form-control" id="search_input" placeholder="Search Here"> -->
<!--                     <button type="submit" class="btn" ></button> -->
<!--                     <span class="ti-close" id="close_search" title="Close Search"></span> -->
<!--                 </form> -->
<!--             </div> -->
<!--         </div> -->
    </header>
    <!-- Header part end-->