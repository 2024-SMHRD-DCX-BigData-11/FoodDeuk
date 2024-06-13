<%@page import="com.smhrd.model.Review"%>
<%@page import="com.smhrd.model.ReviewDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.smhrd.model.Review" %>
<%@ page import="com.smhrd.model.ReviewDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>리뷰 게시판 - 네이버</title>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Nanum Gothic', sans-serif;
            background-color: #f5f5f5;
        }
        #board {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px;
            background-color: #FFF5E1; /* 노란색 배경 */
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        #list {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
        }
        #list th, #list td {
            padding: 16px;
            text-align: center;
            border: 1px solid #ddd;
        }
        #list th {
            background-color: #f2f2f2;
            text-align: center;
        }
        #list .review-content {
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
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
            padding: 10px 16px;
            background-color: #ff9800; /* 주황색 */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        .buttons button:hover {
            background-color: yellow;
        }
        #list td img {
    max-width: 200px; /* 이미지 최대 너비 설정 */
    height: auto; /* 이미지 높이는 자동으로 조정 */
}
    </style>
</head>
<body>
    <div id="board">
        <h1 style="font-size: 24px; margin-bottom: 20px;">리뷰 게시판</h1>
         <%
        Member login_member = (Member)session.getAttribute("login_member");
      %>
        <table id="list">
            
            <%
                ReviewDAO reviewDAO = new ReviewDAO();
                List<Review> reviews = reviewDAO.getAllReviews();
                for (Review review : reviews) {
            %>
           
               <!-- <td><%= review.getReview_no() %></td>
                <td><%= review.getRes_no() %></td>-->
            <tr>
                <td><%= review.getUser_no() %></td>
                <td><%= review.getR_date() %></td>
                <td></td>
             </tr>
             <tr>
                <td><img src="./images/<%= review.getFilename() %>"></td>
                <td><%= review.getReview_content()%></td>
                <td><%= review.getRatings() %></td>     
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

