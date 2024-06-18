<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smhrd.model.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<link rel="stylesheet" href="assetsBoard/css/ReviewMain.css" />
<link rel="stylesheet" href="assetsBoard/css/ReviewWrite.css" />
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	background-color: #FFF5E1;
	color: #333;
	margin: 0;
	padding: 0;
}
</style>
</head>
<body>
<%
    Member login_member = (Member)session.getAttribute("login_member");
    if(login_member==null){
%>
    <script>
        alert("로그인이 필요한 기능입니다.");
        window.location.href = "Login.jsp"; // 로그인 페이지로 이동
    </script>
<%
    } else {
%>
    <div id="board">
        <h1>리뷰 작성</h1>
        <form action="ReviewCon" enctype="multipart/form-data" method="post">
            <table>
                <tr>
                    <td>식당</td>
                    <td><%=request.getParameter("res_name")%></td>
                    <input type="hidden" name="res_no" value="<%=request.getParameter("res_no") %>">
                </tr>
                <tr>
                    <td>작성자</td>
                    <td><%=login_member.getUser_id() %></td>
                    <input type="hidden" name="user_no" value="<%=login_member.getUser_no() %>">
                </tr>
                <tr>
                    <td colspan="2">내용</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="file" name="filename" style="float: right;">
                        <textarea name="review_content" rows="10" style="resize: none;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>평점</td>
                    <td><input type="text" value="0~5" name="ratings"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="reset" value="초기화">
                        <input type="submit" value="작성하기">
                        <button><a href="ReviewMain.jsp">뒤로가기</a></button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
<%} %>
</body>
</html>
