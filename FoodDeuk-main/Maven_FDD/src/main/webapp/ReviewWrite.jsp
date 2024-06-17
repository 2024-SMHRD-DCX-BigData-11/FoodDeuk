<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.smhrd.model.Member" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<style>
    #board {
        max-width: 800px;
        margin: 50px auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    #board h1 {
        color: #333;
        text-align: center;
        margin-bottom: 30px;
    }

    #board table {
        width: 100%;
        border-collapse: collapse;
    }

    #board table td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }

    #board table input[type="text"],
    #board table textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    #board table input[type="reset"],
    #board table input[type="submit"] {
        padding: 10px 20px;
        background-color: #0056b3;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    #board table input[type="reset"]:hover,
    #board table input[type="submit"]:hover {
        background-color: #004494;
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
        window.location.href = "ReviewMain.jsp"; // 로그인 페이지로 이동
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
                    <td>식당 고유 번호 가져오기</td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td><%=login_member.getUser_id() %></td>
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
                    </td>
                </tr>
            </table>
        </form>
    </div>
<%} %>
</body>
</html>
