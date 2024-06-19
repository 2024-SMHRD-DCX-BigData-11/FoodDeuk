<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.Review"%>
<%@page import="com.smhrd.model.ReviewDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.util.List, com.smhrd.model.Review" %>
<%@ page import="com.smhrd.model.ReviewDAO" %>
<%@ page import="com.smhrd.model.memberDAO" %>
<%@ page import="com.smhrd.model.RestaurantDAO" %>
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
 	<%
        Member login_member = (Member)session.getAttribute("login_member");
      %>
    <div id="board">
        <h1 style="font-size: 24px; margin-bottom: 20px;">리뷰 게시판</h1>
         <div class="buttons">
            <a href="main.jsp"><button id="writer">홈으로가기</button></a>
        </div>
        <table id="list" enctype="multipart/form-data" method="post">
            
            <% String res_no = request.getParameter("res_no");
    ReviewDAO reviewDAO = new ReviewDAO();
    if(res_no==null){
    	List<Review> reviews = reviewDAO.getAllReviews();
    	for (Review review : reviews) {
    		int user_no = review.getUser_no(); // 사용자 번호 가져오기
    	    String user_id = memberDAO.loginName(user_no); // 사용자 ID 가져오기
    	    int res_nos = review.getRes_no();
    	    String res_name = RestaurantDAO.resNames(res_nos); // 사용자 ID 가져오기
    		%>
    		            <tr>
    		            <td><%=res_name%></td>
    		                <td><%= review.getR_date() %></td>
    		             <td><%= user_id %></td>
    		             </tr>
    		             <tr>
    		             <%if(review.getFilename()==null) {%>
    		                <td></td>
    		                <%}else{ %>
    		                <td><img src="./images/<%= review.getFilename() %>"></td>
    		                <%} %>
    		                <td><%= review.getReview_content()%></td>
    		                <td><%= review.getRatings() %></td>     
    		            </tr>
    		            <% } %>
    		        </table>
    <%}else{
    	
    	List<Review> reviews = reviewDAO.detailReviews(res_no);
    	for (Review review : reviews) {
    		int user_no = review.getUser_no(); // 사용자 번호 가져오기
    	    String user_id = memberDAO.loginName(user_no); // 사용자 ID 가져오기
    	    String res_name = RestaurantDAO.resName(res_no); // 사용자 ID 가져오기
    		%>
    		       
    		            <tr>
    		                <td><%=request.getParameter("res_name")%></td>
    		                <td><%= review.getR_date() %></td>
    		             <td><%= user_id  %></td>
    		             </tr>
    		             <tr>
    		                <td><img src="./images/<%= review.getFilename() %>"></td>
    		                <td><%= review.getReview_content()%></td>
    		                <td><%= review.getRatings() %></td>     
    		            </tr>
    		        
    		        <%}%></table> <%}%>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.scrolly.min.js"></script>
    <script src="assets/js/jquery.scrollex.min.js"></script>
    <script src="assets/js/skel.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>

