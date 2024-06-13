<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Forty by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        /* 네이버 웹툰 댓글 스타일 적용 */
        #board {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f5f5;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        #list {
            width: 100%;
            border-collapse: collapse;
        }
        #list td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        #list input[type="text"],
        #list textarea {
            width: 100%;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 3px;
        }
        #list textarea {
            resize: none;
        }
        #list input[type="reset"],
        #list input[type="submit"] {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        #list input[type="reset"] {
            background-color: #f44336;
        }
    </style>
</head>
<body>
    <div id="board">
        <form action="BoardCon.do" enctype="multipart/form-data" method="post">
            <table id="list">
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title"> </td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td><input type="text" name="writer"> </td>
                </tr>
                <tr>
                    <td colspan="2">내용</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="file" name="filename" style="float: right;">
                        <textarea name="content" rows="10" style="resize: none;"></textarea>
                    </td>
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
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.scrolly.min.js"></script>
    <script src="assets/js/jquery.scrollex.min.js"></script>
    <script src="assets/js/skel.min.js"></script>
    <script src="assets/js/util.js"></script>
    <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
    <script src="assets/js/main.js"></script>
</body>
</html>
