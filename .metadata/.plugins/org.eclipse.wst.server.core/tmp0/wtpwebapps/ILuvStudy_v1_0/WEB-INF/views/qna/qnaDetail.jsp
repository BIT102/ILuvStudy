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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	
	<form role="form" action="listPage" method="post">
		<input type='hidden' name='bno' value="${qnaVO.bno}">
		<input type='hidden' name='page' value="${cri.page}">  <!-- page, perPageNum추가 -->
		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	</form>
	
	<div>
		
		<div>
			<label>Title</label><input type="text" name="title" value="${qnaVO.title}" readonly="readonly">
		</div>
		
		<div>
			<label>Content</label><textarea name="content" rows="3" readonly="readonly">${qnaVO.content}</textarea> 
		</div>
		
		<div>
			<label>Writer</label><input type="text" name="writer" value="${qnaVO.writer}" readonly="readonly">
		</div>
	
	</div>
	
	<div>
		<button type="submit" class="btn-warning modifyBtn">MODIFY</button>
		<button type="submit" class="btn-danger ">REMOVE</button><!-- 삭제는 POST방식으로 조회화면에서 처리 (controller에서 /remove를 매핑) -->
		<button type="submit" class="btn-primary goListBtn">LIST ALL</button>
	</div>
	
	<script>
	$(document).ready(function(){
	
	var formObj = $("form[role='form']"); 
	
	console.log(formObj);
	
	$(".modifyBtn").on("click", function(){
		formObj.attr("action", "/qna/modify");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	$(".btn-danger").on("click", function(){
		formObj.attr("action", "/qna/remove");
		formObj.submit();
	});
	
	$(".goListBtn").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/qna/listPage");
		formObj.submit();
	});
	
	
	});

	</script>
</body>
</html>