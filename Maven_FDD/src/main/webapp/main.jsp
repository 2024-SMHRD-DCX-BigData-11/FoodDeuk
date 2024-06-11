<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<form action="LogoutCon" method="post">
	<style>
    .big-square-button {
        width: 200px; /* 버튼의 너비 */
        height: 200px; /* 버튼의 높이 */
        font-size: 24px; /* 글자 크기 */
        background-color: #007bff; /* 배경색 */
        color: #ffffff; /* 글자색 */
        border: none; /* 테두리 없음 */
        border-radius: 10px; /* 버튼의 모서리 둥글게 */
        margin: 10px; /* 버튼 간격 */
    }
</style>
</head>
<body>
<%  String id = request.getParameter("id");
if(id.equals("admin")){%>
	<button class="big-square-button">회원관리</button>
	<button class="big-square-button">도서관리</button>
	<button class="big-square-button">대여관리</button>
	<button class="big-square-button">재고관리</button>
<%}else{ %>
	<button class="big-square-button">도서검색</button>
	<button class="big-square-button">나의책방</button>
	<button class="big-square-button">즐겨찾기</button>
	<button class="big-square-button">회원정보</button>
<%} %>


</body>
</html>
      
	

</body>
</html>