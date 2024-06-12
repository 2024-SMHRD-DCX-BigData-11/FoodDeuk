<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
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
        .login-form {
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
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #45a049;
        }
        .forgot-password {
            text-align: right;
            margin-top: 10px;
        }
        .forgot-password a {
            color: #4CAF50;
            text-decoration: none;
        }
        .forgot-password a:hover {
            color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-form">
            <h1>로그인</h1>
            <form action="LoginProgram" method="post">
                <label for="userId">아이디:</label>
                <input type="text" id="userId" name="userId" required>
                <label for="userPw">비밀번호:</label>
                <input type="password" id="userPw" name="userPw" required>
                <button type="submit">로그인</button>
            </form>
            <div class="join-now">
                <a href="Join.jsp">회원가입</a>
            </div>
        </div>
    </div>
</body>
</html>
