<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>


	<form role="form" name="joinForm" action="/join" method="post">
		이메일주소<br/>
		<input id = "email1" type="text" placeholder="아이디를 입력하세요" name="email1" /> 
		@ 
		<input id = "email2" type="text" placeholder="주소값을 입력하세요" name="email2" /> 
		<select name="" id=""> 
			<option>직접입력</option>
			<option>naver.com</option>
			<option>daum.net</option>
			<option>google.com</option>
		</select>
		<br/>
		<input class = "ajaxTest" type="button" value = "인증하기"> <!-- 중복체크도 겸비할 것 -->
		
		<br/>
		이름<br/>
		<input type="text" placeholder = "실명을 입력하세요" name="name" />
		<br/>
		
		비밀번호<br/>
		<input type="password" style = "width:500px" placeholder = "비밀번호 8자리 이상 20자리 이하 영문 숫자로만 입력해 주세요" name="password"/>
		<p id = "pwcheck" style = "color:red">사용이 불가능한 비밀번호입니다.</p>
		<br/>
		
		비밀번호 확인<br/>
		<input type="password" style = "width:500px" placeholder = "비밀번호를 재입력하세요" />
		<p id = "pwcheck2" style = "color:red">비밀번호가 일치하지 않습니다.</p>
		<br/>
		
		닉네임<br/>
		<input type="text" placeholder = "닉네임을 입력하세요" name="nickName"/>
		<br/>
		
		생년월일<br/>
		<input type="text" placeholder = "주민번호 앞자리를 입력하세요" name="birth"/>
		<br/>
		
		성별<br/> <!-- 남이 눌리면 여는 안눌리도록 처리필요 -->
		남<input type = "checkbox"/>  여<input type = "checkbox" />
		
		<br/>
		전화번호<br/>
		<input type="text" name="phoneNum"/>
		<br/>
		<button>인증하기</button> 
		
		<br/>
		<input type="checkbox" /> 서비스이용약관에 동의하시겠습니까?
		<br/>
		
		<input type = "submit" value = "회원가입">
		 <input type="reset"
	           value="다시입력" />
	
	</form>
	
</body>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script>
	
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$(".ajaxTest").on("click",function(){
			
			var email1 = $('#email1').val(); 
			var email2 = $('#email2').val();
			
			console.log(email1);
			console.log(email2);
			
			$.ajax({
				type : 'POST',
				url : '/chkEmailAjax',
				headers : {
					/* "Content-Type" : "application/json", */
					"X-HTTP-Method-Override" : "POST"
				},
				data : {
					email1 : email1,
					email2 : email2
				},
				/* dataType: 'text', */
				success : function(result){
					
					console.log("result = " + result);
					
					alert(result);
					
					/* if(result == "test1"){
						alert("test1 입니다");
					}else if(result == "test2"){
						alert("test2 입니다.");						
					}else{
						
					} */
				}
			});
		})
		
	});
	
	
	
	
	
	</script>

</html>