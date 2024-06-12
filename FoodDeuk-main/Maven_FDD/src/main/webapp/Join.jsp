<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.join-form {
	background-color: white;
	padding: 30px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 400px;
}

h1 {
	text-align: center;
	color: #333;
	margin-bottom: 20px;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	width: 100%;
}

button:disabled {
	background-color: gray;
}
button:not(:disabled) {
	cursor: pointer;
}

button:hover:not(:disabled) {
	background-color: #45a049;
}
</style>
</head>
<body>
	<div class="container">
		<div class="join-form">
			<h1>회원가입</h1>
			<form action="JoinProgram" method="post">
				<label for="userId">아이디:</label> <input type="text" id="userId"
					name="userId" required>
				<input type="button" value="중복체크" id="inputE"
					onclick="checkE()"><br></br>
				 <label for="userPw">비밀번호:</label>
				<input type="password" id="userPw" name="userPw" required> <label
					for="userAddress">주소:</label> <input type="text" id="userAddr"
					name="userAddr" required>
				<button id="submit" type="submit" disabled>가입하기</button>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function checkE() {
			$.ajax({
				type : 'GET',
				url : 'IdCheckCon?userId=' + $('#userId').val(),
				success : function(res) {
					if (res == 'true') {
						alert('사용할 수 없는 아이디입니다.')
						$('#submit').attr("disabled", true);
					} else {
						alert('사용 가능한 아이디입니다.')
						$('#submit').attr("disabled", false);
					}
				},
				error : function(res) {
					alert('실패')
				}
			})
		}
	</script>
</body>
</html>
