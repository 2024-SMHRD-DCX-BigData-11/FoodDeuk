<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.smhrd.model.Member"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>리뷰 작성</title>
  <meta charset="utf-8" />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <style>
    #board {
      background-color: #FFF5E1; /* 노란색 배경 */
      padding: 20px;
    }

    table#list {
      width: 100%;
      border-collapse: collapse;
      font-size: 16px;
    }

    table#list td {
      padding: 10px;
      border-bottom: 1px solid #FFB84C; /* 주황색 테두리 */
    }

    table#list input[type="text"], table#list textarea {
      width: 100%;
      padding: 5px;
      font-size: 14px;
      border: 1px solid #FFB84C; /* 주황색 테두리 */
    }

    table#list input[type="reset"], table#list input[type="submit"] {
      background-color: #FFB84C; /* 주황색 버튼 */
      color: white;
      padding: 10px 20px;
      border: none;
      cursor: pointer;
      border-radius: 4px;
      float: right; /* 버튼을 오른쪽으로 정렬 */
    }
  </style>
</head>
<body>
<%
        Member login_member = (Member)session.getAttribute("login_member");
      %>
  <!-- Q16. 게시글 작성 기능(작성된 게시글은 DB에 저장) - 파일업로드 cos.jar 사용 -->
  <div id="board">
    <form action="ReviewCon" enctype="multipart/form-data" method="post">
      <table id="list">
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

  <!-- Scripts -->
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/jquery.scrolly.min.js"></script>
  <script src="assets/js/jquery.scrollex.min.js"></script>
  <script src="assets/js/skel.min.js"></script>
  <script src="assets/js/util.js"></script>
  <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
  <script src="assets/js/main.js"></script>
</body>
</html>
