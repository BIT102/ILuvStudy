<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>계정 관리</title>

</head>
<body>

<a>I love study 관리자 로그인</a>

<!-- 로그인 처리 -->
<form action="/admin/adminLoginPost" method="post">
<div>아이디 : <input type="text" name="adminId" ></div>
<div>비밀번호 : <input type="password" name="adminPw"></div>

<button type="submit">로그인</button>
</form>

</body>
</html> 