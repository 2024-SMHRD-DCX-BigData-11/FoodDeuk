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
      margin: 0;
 	 padding: 0;
      
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
      max-width: 100%;
 	 padding-left: 0;
  	padding-right: 0; 
      
    }
    .map-container {
      flex: 0 0 75%;
      position: relative;
      padding-right: 1px;
    }
     .recommendation-container {
  display: flex;
   justify-content: flex-end;
}

    .banner-container {
      flex: 0 0 25%;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }
    .banner {
      background-color: #ccc;
      text-align: center;
      padding: 40px;
      font-size: 1em;
      flex: 1;
      margin-bottom: 1px;
    }
    #map {
      width: 100%;
      height: 100%;
      min-height: 600px; /* 높이 증가 */
    }

    /* 추가된 flip-horizontal-bottom 애니메이션 */
    @-webkit-keyframes flip-horizontal-bottom {
      0% {
        -webkit-transform: rotateX(0);
                transform: rotateX(0);
      }
      100% {
        -webkit-transform: rotateX(-180deg);
                transform: rotateX(-180deg);
      }
    }
    @keyframes flip-horizontal-bottom {
      0% {
        -webkit-transform: rotateX(0);
                transform: rotateX(0);
      }
      100% {
        -webkit-transform: rotateX(-180deg);
                transform: rotateX(-180deg);
      }
    }
    .flip-horizontal-bottom {
      -webkit-animation: flip-horizontal-bottom 0.2s linear 9 both;
              animation: flip-horizontal-bottom 0.2s linear 9 both;
    }
    .search-txt{
    position: relative;
    width: 600px;
    }
   input {
     width: 100%;
     border: 1px solid #bbb;
     border-radius: 8px;
     padding: 10px 12px;
     font-size: 14px;
   }
   
   img {
     position : absolute;
     width: 17px;
     top: 10px;
     right: 12px;
     margin: 0;
   }
	.recommendation-button, .high-price-button, .low-price-button {
  background-color: #ffa500; /* 연주황색 */
  color: white;
  border : none;
  text-align : right;
  text-decoration: none;
  font-size: 16px;
  margin-left:10px;
}
   
  </style>
</head>
<body>
  <header class="p-3 mb-3 border-bottom">
    <div class="container d-flex flex-wrap justify-content-between align-items-center">
      <h1 class="mb-0">푸드득</h1>
      <form class="search-box" action="search" method="get">
       <input class="search-txt" type="text" name="query" placeholder="검색어를 입력하세요">
       <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
       <button class="search-btn" type="submit">검색</button>
    </form>
      <%
        Member login_member = (Member)session.getAttribute("login_member");
      %>
      <nav class="nav">
        <a class="nav-link" href="ReviewMain.jsp">게시판</a>
        <% if (login_member == null) { %>
          <a class="nav-link" href="Login.jsp">로그인</a>
          <a class="nav-link" href="Join.jsp">회원가입</a>
        <% } else { %>
          <a class="nav-link" href="UpdateMember.jsp">개인정보수정</a>
          <a class="nav-link" href="LogoutCon">로그아웃</a>
        <% } %>
      </nav>
    </div>
  </header>
  <div class="container">
    <div class="map-container">
   <div class="recommendation-container">
        <div class="flip-horizontal-bottom">메뉴</div>
        <button class="recommendation-button">음식추천</button>
      <button class="high-price-button">상한가</button>
      <button class="low-price-button">최저가</button>
      </div>
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
