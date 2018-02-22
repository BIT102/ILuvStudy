
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="test.css">

    
</head>
<body>
<!-- 공지사항 페이지11111111 -->
<h1>공지사항이다</h1>

<!-- 나중에 수정 삭제 작업에 값을 넘겨주기 위해서 사용
<form role="form" method="post">
	<input type="hidden" name="ntBno" value="${NoticeVO.ntBno}">
</form>-->

<!-- 공지사항 내용들111111111 -->
<div class="header">

<c:forEach items="${list}" var="noticeVO">
	<!-- 처음보일 부분1 -->
	<div class="ntTitle">
		<p>공지사항 제목</p>
		<input type="text" name="ntTitle" value="${noticeVO.ntTitle}">
		<p>올린날짜</p>
		<fmt:formatDate pattern="yyyy-MM-dd HH:mm" 
		value="${noticeVO.ntRegdate}" />
	</div>
	
	<!-- 클릭하면 내용, 쓴사람 (관리자)-->
	<div class="ntContentt">
		<p>글쓴이</p>
		<input type="text" name="ntWriter" value="${noticeVO.ntWriter}">
		<p>내용</p>
		<textarea name="ntContent" row="10">${noticeVO.ntContent}</textarea>
	</div>
	
</c:forEach>	
	
</div>
	
</body>
</html>