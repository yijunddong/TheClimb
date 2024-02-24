<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ProjectClimb</title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=PT+Sans+Narrow&family=Quicksand:wght@500&display=swap" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            font-family: 'Quicksand', sans-serif;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        form {
            max-width: 600px;
            margin: 0 auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        textarea, input[type="text"], input[type="submit"] {
            margin-bottom: 10px;
        }
        input[type="submit"] {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        a {
            text-decoration: none;
            color: #007bff;
            margin-right: 20px;
            display: block;
            text-align: center;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1 class="text-center">글 상세</h1>
    <a href="logout.do" class="d-block text-center">Log-out</a>
    <hr>
    <form action="updateBoard.do" method="post">
        <input name="seq" type="hidden" value="${board.seq}" />
        <table class="table">
            <tr>
                <td>제목</td>
                <td><input name="title" type="text" class="form-control" value="${board.title}" /></td>
            </tr>
            <tr>
                <td>작성자</td>
                <td>${board.writer}</td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea name="content" class="form-control" cols="40" rows="10">${board.content}</textarea></td>
            </tr>
            <tr>
                <td>조회수</td>
                <td>${board.cnt}</td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" class="btn btn-success btn-block" value="글 수정" /></td>
            </tr>
        </table>
        <hr>
        <a href="insertBoard.jsp" class="d-inline-block mr-2">글 등록</a>
        <a href="deleteBoard.do?seq=${board.seq}" class="d-inline-block mr-2">글 삭제</a>
        <a href="mainBoardList.do" class="d-inline-block">글 목록</a>
    </form>
</body>
</html>
