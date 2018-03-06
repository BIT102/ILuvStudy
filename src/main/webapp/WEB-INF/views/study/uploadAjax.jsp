
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

small:hover {
	background-color:black;
}
</style>
</head>
<body>

	<h3>Ajax File upload</h3>
	<div class='fileDrop'></div>

	<div class='uploadedList'></div>

	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script>
		$(".fileDrop").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		
		$(".fileDrop").on("drop", function(event){
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files;
			
			var file = files[0];
			
			//console.log(file);
			
			var formData = new FormData();
			
			formData.append("file", file);
			
			$.ajax({
				url: '/study/uploadAjax',
				data: formData,
				dataType: 'text',
				processData: false,
				contentType: false,
				type: 'POST',
				success: function(data){
				
					var str = "";
					
//					console.log(data);
//		   			console.log(checkImageType(data));
					
					if(checkImageType(data)){
						str="<div><a href=study/displayFile?fileName="+getImageLink(data)+">"
						   + "<img src='study/displayFile?fileName="+data+"'/>"
						   + "</a><small data-src="+data+">X</small></div>";		   
						
					} else {
						str = "<div><a href='study/displayFile?fileName="+data+"'>" 
						+ getOriginalName(data)+"</a>"
						+"<small data-src="+data+">X</small></div>";
					}
					
					$(".uploadedList").append(str);
				}
			});
		});
		
		$(".uploadedList").on("click", "small", function(event){
			
			var that = $(this);
			
			$.ajax({
				url:"deleteFile",
				type:"post",
				data:{fileName:$(this).attr("data-src")},
				dataType:"text",
				success:function(result){
					if(result == 'deleted') {
						alert("deleted");
					}
				}
			})
			
		});
		

		function checkImageType(fileName) {
			
			var pattern = /jpg|gif|png|jpeg/i;
			
			return fileName.match(pattern);
		}

		function getImageLink(fileName) {
			
			if(!checkImageType(fileName)) {
				return;
			}
			
			var front = fileName.substr(0,12);
			var end = fileName.substr(14);
			
			return front + end;
		}
		
		function getOriginalName(fileName) {
			
			if(checkImageType(fileName)) {
				return;
			}
			
			var idx = fileName.indexOf("_")+1;
			return fileName.substr(idx);
		}

	
	</script>

</body>
</html>