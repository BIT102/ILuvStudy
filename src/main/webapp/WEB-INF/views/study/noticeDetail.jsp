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
	
	<form role="form" method="post">
		<input type='hidden' name='bno' value="${noticeVO.bno}">
	</form>
	
	<div>
		
		<div>
			<label>Title</label><input type="text" name="title" value="${noticeVO.title}" readonly="readonly">
		</div>
		
		<div>
			<label>Content</label><textarea name="content" rows="3" readonly="readonly">${noticeVO.content}</textarea> 
		</div>
		
		<div>
			<label>Writer</label><input type="text" name="writer" value="${noticeVO.writer}" readonly="readonly">
		</div>
	
	</div>
	
	<div>
		수정과 삭제는관리자만
		<button type="submit" class="btn-warning modifyBtn">MODIFY</button>
		<button type="submit" class="warning">REMOVE</button><!-- 삭제는 POST방식으로 조회화면에서 처리 (controller에서 /remove를 매핑) -->
		
		<button type="submit" class="btn-primary goListBtn">LIST ALL</button>
	</div>
	
	<script>
	$(document).ready(function(){
	
	var formObj = $("form[role='form']"); 
	
	console.log(formObj);
	
	$(".modifyBtn").on("click", function(){
		formObj.attr("action", "/study/modifyNotice");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	
	$(".warning").on("click", function(){
			formObj.attr("action", "/study/removeNotice");
			formObj.submit();
		});

	
	$(".goListBtn").on("click", function(){
		self.location = "/study/notice?page=${cri.page}&perPageNum=${cri.perPageNum}";
	});
	
	
	});

	</script>
</body>
</html>