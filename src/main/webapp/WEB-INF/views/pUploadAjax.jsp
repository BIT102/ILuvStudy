<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajax 파일 업로드</title>

<style>
.fileDrop{
	width: 100%;
	height: 200px;
	border: 1px dotted blue;
}

small{
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>

</head>
<body>

	<h3>Ajax File Upload</h3>
	<div class="fileDrop"></div>
	
	<div class="uploadedList"></div>
	
	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script>
		$(".fileDrop").on("dragenter dragover", function(event){
			event.preventDefault();  // dragenter, dragover, drop시 기본 동작을 막도록 작성
		});
		
		$(".fileDrop").on("drop", function(event){
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files; // 전달된 파일 데이터를 가져오는 부분(dataTransfer.files)
			var file = files[0];
			console.log(file);
		
			var formData = new FormData();
			formData.append("file", file);
			
			//Ajax 활용
			$.ajax({
				url: "/pUploadAjax",
				data: formData,
				dataType: 'text',
				processData: false,
				contentType: false,
				type : 'POST',
				success : function(data){
					alert(data);
					
					console.log(data);
					console.log(checkImageType(data));
					
					var str = "";
					
					if(checkImageType(data)){
						  str ="<div><a href=pDisplayFile?fileName="+getImageLink(data)+">"
								  +"<img src='pDisplayFile?fileName="+data+"'/>"
								  +"</a><small data-src="+data+">X</small></div>";
					  }else{
						  str = "<div><a href='displayFile?fileName="+data+"'>" 
								  + getOriginalName(data)+"</a>"
								  +"<small data-src="+data+">X</small></div></div>";
					  }
					
					$(".uploadedList").append(str);
				}
				
			});
			
		});
	
		// jsp에서 파일 출력하기
		function checkImageType(fileName){
			
			var pattern  = /jpg$|gif$|png$|jpeg$/i; 	//마지막 i는 대,소문자 구분 없음
			
			return fileName.match(pattern);
		}
		
		
		//파일 링크 처리(파일의 이름이 길게 출력되는 걸 줄여주는 기능)
		function getOriginalName(fileName){
			
			if(checkImageType(fileName)){
				return;
			}
			
			var idx = fileName.indexOf("_") + 1;
			return fileName.substr(idx);
		}
		
		
		//이미지 파일의 원본 파일 찾기
		function getImageLink(fileName){
			
			if(!checkImageType(fileName)){
				return;
			}
			var front = fileName.substr(0,12); //년/월/일 경로를 추출하는 용도
			var end = fileName.substr(14);		// 파일 이름 앞의 's_'를 제거하는 용도
			
			return front + end;
		}
		
		// 첨부파일 삭제 처리
		$(".uploadedList").on("click", "small", function(event){
			
			var that = $(this);
			
			$.ajax({
				url:"deleteFile",
				type:"post",
				data:{fileName:$(this).attr("data-src")},
				dataType:"text",
				success:function(result){
					if(result == 'deleted'){
						alert("deleted");
						that.parent("div").remove(); // 파일 삭제 후 브라우져 화면에서 썸네일 삭제
					}
				}
			});
		});
		
	</script>

</body>
</html>