
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

.fileDrop{
width:100%;
height:100px;
border:1px dotted blue;
}

small {
	margin-left:3px;
	font-weight:bold;
	color:gray;
}
</style>
</head>
<body>

파일올려요

<form id="form1" action="uploadForm" method="post" enctype="multipart/form-data">
	<input type="file" name="file"> <input type='submit'>
</form>

<div class="fileDrop"></div>
<div class="uploadedList"></div>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script>

	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
		
	});	
	
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		
		var file = files[0];
		
		var formData = new FormData();
		
		formData.append("file", file);
		
		$.ajax({
			url:'/uploadAjax',
			data:formData,
			dataType:'text',
			processData:false,
			contentType:false,
			type:'POST',
			success:function(data){
				
				alert(data);
			}
		});
	});

</script>

</body>
</html>