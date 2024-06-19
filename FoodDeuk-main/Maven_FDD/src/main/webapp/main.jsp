<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>푸드득</title>
<script type="text/javascript"
	src="http://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=0x06a17qwi"></script>
<link rel="stylesheet" href="assetsBoard/css/main.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
body {
  font-family: 'Nanum Gothic', sans-serif;
  margin: 0;
  padding: 0;
  background-color: #F5F5F5;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<header class="p-3 mb-3 border-bottom">
		<div
			class="container d-flex flex-wrap justify-content-between align-items-center">
			<h1 class="mb-0">푸드득</h1>
			<form class="search-box" action="search" method="get">
				<select id="search-type" name="searchType">
					<option value="menu">메뉴 검색</option>
					<option value="category">카테고리 검색</option>
				</select> <input id="search-txt" class="search-txt" type="text" name="query"
					placeholder="검색어를 입력하세요"> <input id="upperSearch-txt"
					class="upperSearch-txt" type="text" name="query"
					placeholder="상한가 지정">
				<button id="search-btn" type="button"><img
					src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" width = 20px height=auto></button>
			</form>
			<%
			Member login_member = (Member) session.getAttribute("login_member");
			%>
			<nav class="nav d-flex align-items-center">
 			 <a class="nav-link" href="ReviewMain.jsp">게시판</a>
  			<%
  				if (login_member == null) {
  				%>
  				<div class="d-flex align-items-center">
   				 <a class="nav-link" href="Login.jsp">로그인</a>
    			<a class="nav-link" href="Join.jsp">회원가입</a>
  				</div>
  				<%} else {%>
  				<div class="d-flex align-items-center">
    			<a class="nav-link" href="LogoutCon">로그아웃</a>
  				</div>
 				 <%}%>
					</nav>


		</div>
	</header>
	<div class="container">
		<div class="map-container">
			<div class="recommendation-container">
				<div id="flip_menu"></div>
				<button id="recommendation-button" class="recommendation-button">음식추천</button>
			</div>
			<div id="map"></div>
		</div>
		<div class="banner-container" id="banner-container"></div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="assetsBoard/js/main.js"></script>
</body>
</html>
