<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>기본 홈페이지</title>
  <style>
    /* 기본 스타일 */
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #ffffff;
      color: #333;
    }
    header {
      background-color: #ffa500;
      color: #fff;
      padding: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    header h1 {
      color: #ffff00;
    }
    nav {
      display: flex;
      background-color: #333;
      padding: 10px 0;
    }
    nav a {
      color: #ffff00; /* 게시판, 로그인, 회원가입 메뉴의 색상을 노란색으로 변경 */
      text-decoration: none;
      padding: 10px 20px;
      margin: 0 10px;
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
    <h1>기본 홈페이지</h1>
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
    </div>
    <div class="banner-container">
      <div class="banner">배너 1</div>
      <div class="banner">배너 2</div>
      <div class="banner">배너 3</div>
      <div class="banner">배너 4</div>
      <div class="banner">배너 5</div>
    </div>
  </div>
</body>
</html>
