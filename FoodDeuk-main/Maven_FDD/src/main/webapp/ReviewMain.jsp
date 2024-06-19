<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
	<link rel="stylesheet" href="assetsBoard/css/ReviewMain.css" />
<style>
body {
  font-family: 'Nanum Gothic', sans-serif;
  margin: 0;
  padding: 0;
  background-color: #F5F5F5;
}
</style>
</head>
<body>
    <div id="board">
        <h1 style="font-size: 24px; margin-bottom: 20px;">리뷰 게시판</h1>
         <%
        Member login_member = (Member)session.getAttribute("login_member");
      %><div class="buttons">
            <a href="main.jsp"><button id="writer">홈으로가기</button></a>
        </div>
        <table id="list">
            
            <%
            String res_no = request.getParameter("res_no");
    ReviewDAO reviewDAO = new ReviewDAO();
    if(res_no==null){
    	List<Review> reviews = reviewDAO.getAllReviews();
    	for (Review review : reviews) {
    		%>
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
    <%}else{
    	List<Review> reviews = reviewDAO.detailReviews(res_no);
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
    		        
    		        <%}%></table> <% }%>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.scrolly.min.js"></script>
    <script src="assets/js/jquery.scrollex.min.js"></script>
    <script src="assets/js/skel.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>

