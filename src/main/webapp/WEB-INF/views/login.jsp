<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href="www.naver.com">네이버배너</a>
	<a href="www.kakao.com">카카오배너</a>
	<br/><br/>
	
	<form action="loginPost" method="post">
		<input type="text" placeholder = "이메일주소" name = "id" value = "${id}" /><br/>
		<input type="password" placeholder = "비밀번호" name = "pw" />
		
		<br/>
			<input type="checkbox" name = "rememberId" value = "1" ${checked} /> 아이디저장
		
			<input type="checkbox" name="useCookies" /> 자동로그인
		<br/>
		
		<input type="submit" value ="로그인" />
	</form>
	
	아이디/비밀번호를 잊으셨나요? <a href="">아이디찾기</a> <a href="">비밀번호찾기</a> <br/>
	아직 I LOVE STUDY 회원이 아니신가요? <a href="join">회원가입</a>
</body>
</html>