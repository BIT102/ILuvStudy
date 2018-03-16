<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>관리자 비밀번호 변경</title>
    <style>
        table{
            border-collapse:collapse;
        }
        td,th{
            border:1px solid black;
        }
    </style>
</head>
<body>
    <a>관리자 비밀번호 변경</a>

    <table>
        <tr>
            <th>아이디</th>
            <td>test123</td>
        </tr>
        <tr>
            <th>기존 비밀번호</th>
            <td><input type="text"></td>
        </tr>
        <tr>
            <th>신규 비밀번호</th>
            <td><input type="text"></td>
        </tr>
        <tr>
            <th>신규 비밀번호 확인</th>
            <td><input type="text"></td>
        </tr>
    </table>

    <button>비밀번호 변경</button>
    
</body>
</html>