<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>푸드득</title>
  <script type="text/javascript" src="http://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=0x06a17qwi"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    @font-face {
      font-family: 'Jalnan';
      font-weight: normal;
      font-style: normal;
      src: url('https://cdn.jsdelivr.net/gh/webfontworld/goodchoice/Jalnan.eot');
      src: url('https://cdn.jsdelivr.net/gh/webfontworld/goodchoice/Jalnan.eot?#iefix') format('embedded-opentype'),
          url('https://cdn.jsdelivr.net/gh/webfontworld/goodchoice/Jalnan.woff2') format('woff2'),
          url('https://cdn.jsdelivr.net/gh/webfontworld/goodchoice/Jalnan.woff') format('woff'),
          url('https://cdn.jsdelivr.net/gh/webfontworld/goodchoice/Jalnan.ttf') format("truetype");
      font-display: swap;
    }
    body {
    font-family: Arial, sans-serif;
    background-color: #ffffff;
    color: #333;
}
header {
    background-color: #ADD8E6;
    color: #fff;
}
header h1 {
    font-family: 'Jalnan', sans-serif;
    font-size: 2em;
    color: #FFD700;
    text-shadow: 
        -3px -3px 0 #fff,  
        3px -3px 0 #fff,
        -3px 3px 0 #fff,
        3px 3px 0 #fff,
        -3px 0 0 #fff,  
        3px 0 0 #fff,
        0 -3px 0 #fff,
        0 3px 0 #fff;
}
nav a {
    font-family: 'Jalnan', sans-serif;
    color: #FFD700;
    text-shadow: 
        -1px -1px 0 #fff,  
        1px -1px 0 #fff,
        -1px 1px 0 #fff,
        1px 1px 0 #fff,
        -1px 0 0 #fff,  
        1px 0 0 #fff,
        0 -1px 0 #fff,
        0 1px 0 #fff;
}
.container {
    display: flex;
    flex-wrap: wrap;
}
.map-container {
    flex: 0 0 75%; /* 변경된 비율 */
    padding: 10px;
}
.banner-container {
    flex: 0 0 25%; /* 변경된 비율 */
    padding: 10px;
}
.banner {
    background-color: #ccc;
    text-align: center;
    padding: 40px; /* 배너 크기 증가 */
    margin-bottom: 20px;
    font-size: 1em; /* 텍스트 크기 증가 */
}
#map {
    width: 100%;
    height: 100%;
    min-height: 600px; /* 높이 증가 */
}
  </style>
</head>
<body>
  <header class="p-3 mb-3 border-bottom">
    <div class="container d-flex flex-wrap justify-content-between align-items-center">
      <h1 class="mb-0">푸드득</h1>
      <%
        Member login_member = (Member)session.getAttribute("login_member");
      %>
      <nav class="nav">
        <a class="nav-link" href="BoardMain.jsp">게시판</a>
        <% if (login_member == null) { %>
          <a class="nav-link" href="Login.jsp">로그인</a>
          <a class="nav-link" href="Join.jsp">회원가입</a>
        <% } else { %>
          <a class="nav-link" href="UpdateMember.jsp">개인정보수정</a>
          <a class="nav-link" href="LogoutCon.jsp">로그아웃</a>
        <% } %>
      </nav>
    </div>
  </header>
  <div class="container">
    <div class="map-container">
      <div id="map"></div>
    </div>
    <div class="banner-container">
      <div class="banner">배너 1</div>
      <div class="banner">배너 2</div>
      <div class="banner">배너 3</div>
      <div class="banner">배너 4</div>
      <div class="banner">배너 5</div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
    var mapOptions = {
      center: new naver.maps.LatLng(34.9683954, 127.4841841),
      zoom: 17
    };
    var map = new naver.maps.Map('map', mapOptions);
  </script>
</body>
</html>
