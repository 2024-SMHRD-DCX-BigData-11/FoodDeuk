<%@page import="com.smhrd.model.Review"%>
<%@page import="com.smhrd.model.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.smhrd.model.Review" %>
<%@ page import="com.smhrd.model.ReviewDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>리뷰 게시판</title>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="assetsBoard/css/main.css" />
    <link rel="stylesheet" href="assetsBoard/css/board.css" />
    <style>
        #board {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        #list {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }
        #list th, #list td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        #list th {
            background-color: #f2f2f2;
        }
        #list a {
            color: #333;
            text-decoration: none;
        }
        #list a:hover {
            color: #000;
        }
        .buttons {
            margin-top: 20px;
            text-align: right;
        }
        .buttons button {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .buttons button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div id="board">
        <h1>리뷰 게시판</h1>
        <table id="list">
            <tr>
                <th>번호</th>
                <th>식당</th>
                <th>작성자</th>
                <th>리뷰</th>
                <th>평점</th>
                <th>작성일</th>
            </tr>
            <%
                ReviewDAO reviewDAO = new ReviewDAO();
                List<Review> reviews = reviewDAO.getAllReviews();
                for (Review review : reviews) {
            %>
            <tr>
                <td><%= review.getId() %></td>
                <td><a href="ReviewDetail.jsp?id=<%= review.getId() %>"><%=  "예시"%></a></td>
                <td><%= review.getAuthor() %></td>
                <td><%= review.getContent() %></td>
                <td><%= review.getRating() %></td>
                <td><%= review.getDate() %></td>
            </tr>
            <% } %>
        </table>
        <div class="buttons">
            <a href="main.jsp"><button id="writer">홈으로가기</button></a>
            <a href="ReviewWrite.jsp"><button id="writer">리뷰 작성하기</button></a>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.scrolly.min.js"></script>
    <script src="assets/js/jquery.scrollex.min.js"></script>
    <script src="assets/js/skel.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>


