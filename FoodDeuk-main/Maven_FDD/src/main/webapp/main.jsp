<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>푸드득</title>
  <script type="text/javascript" src="http://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=0x06a17qwi"></script>
  <style>
    /* 기본 스타일 */
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
      margin: 0;
      padding: 0;
      background-color: #ffffff;
      color: #333;
    }
    header {
      background-color: #ADD8E6;
      color: #fff;
      padding: 10px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    header h1 {
      font-family: 'Jalnan', sans-serif; /* 폰트 적용 */
      font-size: 2em; /* 글자 크기 키움 */
      color: #FFD700; /* 진한 노랑 색상 */
      text-shadow: 
          -3px -3px 0 #fff,  
          3px -3px 0 #fff,
          -3px 3px 0 #fff,
          3px 3px 0 #fff,
          -3px 0 0 #fff,  
          3px 0 0 #fff,
          0 -3px 0 #fff,
          0 3px 0 #fff; /* 더 두꺼운 흰색 테두리 효과 */
    }
    }
    nav {
      display: flex;
      background-color: #333;
      padding: 10px 0;
    }
    nav a {
    font-family: 'Jalnan', sans-serif;
      color: #FFD700; /* 게시판, 로그인, 회원가입 메뉴의 색상을 노란색으로 변경 */
      text-decoration: none;
      padding: 10px 20px;
      margin: 0 10px;
      text-shadow: 
          -1px -1px 0 #fff,  
          1px -1px 0 #fff,
          -1px 1px 0 #fff,
          1px 1px 0 #fff,
          -1px 0 0 #fff,  
          1px 0 0 #fff,
          0 -1px 0 #fff,
          0 1px 0 #fff; /* 더 두꺼운 흰색 테두리 효과 */
    }
    nav a:hover {
      background-color: #444;
    }
    .content-container {
      display: flex;
      justify-content: space-between;
      margin: 20px;
    }
    .main-content {
      flex-grow: 1;
      margin-right: 20px;
      color: #333;
    }
    .banner-container {
      display: flex;
      flex-direction: column;
    }
    .banner {
      width: 300px;
      height: 100px;
      background-color: #ccc;
      margin-bottom: 20px;
      color: #333;
    }
  </style>
</head>
<body>
  <header>
    <h1>푸드득</h1>
    <%
    // session 값 가지고 오기
        		Member login_member = (Member)session.getAttribute("login_member");
    %>
    <nav>
    						<%if(login_member == null){ %>
								<a href="BoardMain.jsp">게시판</a>
      							<a href="Login.jsp">로그인</a>
      							<a href="Join.jsp">회원가입</a>
							<%}else{%>
							<a href="BoardMain.jsp">게시판</a>
							<a href="UpdateMember.jsp">개인정보수정</a>
							<a href="LogoutCon.jsp">로그아웃</a>
							<%} %>
    </nav>
  </header>
  <div class="content-container">
    <div class="main-content">
      <!-- 메인 콘텐츠 영역 -->
      <div id="map" style="width:100%;height:100%"></div>
    </div>
    <div class="banner-container">
      <div class="banner">배너 1</div>
      <div class="banner">배너 2</div>
      <div class="banner">배너 3</div>
      <div class="banner">배너 4</div>
      <div class="banner">배너 5</div>
    </div>
  </div>
  <script type="text/javascript">
  	var mapOptions = {
  			center: new naver.maps.LatLng(34.9683954, 127.4841841),
  			zoom: 17
  	};
  	var map = new naver.maps.Map('map', mapOptions)
  </script>
</body>
</html>
