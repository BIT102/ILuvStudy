<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>
<body>
	
	<form role="form" method="post">
		<input type='hidden' name='bno' value="${qnaVO.qnaBno}">
	</form>
	
	<div>
		
		<div>
			<label>Title</label><input type="text" name="title" value="${qnaVO.qnaTitle}" readonly="readonly">
		</div>
		
		<div>
			<label>Content</label><textarea name="content" rows="3" readonly="readonly">${qnaVO.qnaContent}</textarea> 
		</div>
		
		<div>
			<label>Writer</label><input type="text" name="writer" value="${qnaVO.qnaWriter}" readonly="readonly">
		</div>
	
	</div>
	
	<div>
		<button type="submit" class="btn-warning">MODIFY</button>
		<button type="submit" class="btn-danger">REMOVE</button><!-- 삭제는 POST방식으로 조회화면에서 처리 (controller에서 /remove를 매핑) -->
		<button type="submit" class="btn-primary">LIST ALL</button>
	</div>
	
	<script>
	$(document).ready(function(){
	
	var formObj = $("form[role='form']"); 
	
	console.log(formObj);
	
	$(".btn-warning").on("click", function(){
		formObj.attr("action", "/qna/modify");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	$(".btn-danger").on("click", function(){
		formObj.attr("action", "/qna/remove");
		formObj.submit();
	});
	
	$(".btn-primary").on("click", function(){
		self.location = "/qna/qnaList";
	});
	});

	</script>
</body>
</html>