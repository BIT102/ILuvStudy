<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page session = "false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청 스터디</title>


</head>

<body> 	

<!-- iframe내에서 동작하기 위해서 작성된 페이지
자신이 속한 화면의 바깥족 parent의 addFilePath() 함수 호출 -->

<script>
var result = '${savedName}';

parent.addFilePath(result);

</script>

</body>


</html>