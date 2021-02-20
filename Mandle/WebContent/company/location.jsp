<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>location</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
 
</head>
<body>
<div id="wrap">
<!-- 헤더가 들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더가 들어가는 곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<hr class="main_line" align="left">
<nav id="top_menu_s">
<ul>
	<li><a href="../company/welcome.jsp" class="sel">ABOUT</a></li>
	<li><a href="../aboard/anotice.jsp">COMMUNITY</a></li>
	<li><a href="../gboard/gnotice.jsp">PORTFOLIO</a></li>
	<li><a href="../sns/sns.jsp">SNS</a></li>
</ul>
</nav>
<div class="clear"></div>
<div id="solution_l">
<nav id="sub_menu">
<ul>
<li><a href="welcome.jsp">인사말</a></li>
<li><a href="service.jsp">서비스소개</a></li>
<li><a href="location.jsp">찾아오시는길</a></li>
</ul>
</nav>
<article id="mid">
<h1>찾아오시는길</h1>
<div id="map" style="width:550px;height:450px;border:solid 2px #a07654;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=baee41a5523552eb68b3e8625c46d718"></script>
<script>
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(35.232657, 128.865010),
		level: 3
	};
	
	var map = new kakao.maps.Map(container, options);
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(35.232657, 128.865010); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
		
	var iwContent = '<div style="padding:5px; text-align:center;"><span style="font-size:15px;font-weight: bold;color:#F90;">맨들네일</span><br>경남 김해시 함박로101번길 23 대동주상가 2층</div>',
    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker); 

	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);	
</script>
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