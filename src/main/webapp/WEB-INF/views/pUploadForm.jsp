<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청 스터디</title>

<style>
<!-- 크기를 0으로 지정해서 실제 화면에 보이지 않음 -->
iframe{
	width: 0px;
	height: 0px;
	border: 0px;
}
</style>
</head>


<body>
 	
	<form name="form1" action="pUploadForm" method="post" enctype="multipart/form-data" target="zeroFrame"> <!-- target 속성이 zeroFrame -->
        <p3>프로필 사진</p3>
        <input type='file' name='file'>
        <input type="submit">
	</form>
	
	<iframe name = "zeroFrame"></iframe> <!-- target 속성이 zeroFrame -->
	
	<script>
		function addFilePath(msg){
			alert(msg);
			document.getElementById("form1").reset();
		}
	</script>
	
	
</body>


</html>