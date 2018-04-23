<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 영역 -->
<link rel="stylesheet" href="/resources/dist/css/bootstrap.min.css">
<link href="/resources/dist/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/dist/css/join.css">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<script>
	$('document').ready(function(){
		// 이메일 select 박스 선택시 바뀌도록 설정
		$('#selectEmail').change(function(){
			if(document.getElementById('selectEmail').value=="직접입력"){
				document.getElementById('email2').value = "";	
			}else{
				document.getElementById('email2').value = document.getElementById('selectEmail').value;	
			}
		});
		
		//========= Password 부분 ============
		
				// 비밀번호 유효성검사 비밀번호의 경우에는 버튼을 누를때마다 변화가 생기도록 하여 keyup event를 활용함.
				$('#password').keyup(function(){
					var password = document.getElementById("password").value;

					// 길이, 알파벳 
					if(password.length >= 8 && password.length <= 16 
								&& containsCharOnly(password, charPw)){
							
						$('#pwcheck').html("사용가능한 비밀번호입니다.");
						document.getElementById("pwcheck").style.color = 'blue';
					}else{
						$('#pwcheck').html("사용불가능한 비밀번호입니다.");
						document.getElementById("pwcheck").style.color = 'red';
					}
				});
				
				//========= Password 확인부분 ============
				// 단순히 password와 비교만 하면됨.
				$('#passwordConf').keyup(function(){
					var passwordConf = document.getElementById("passwordConf").value;
					var password = document.getElementById("password").value; 
					
					if(passwordConf == password){
						$('#pwcheck2').html("비밀번호 일치");
						document.getElementById("pwcheck2").style.color = 'blue';
					}else{
						$('#pwcheck2').html("비밀번호 불일치");
						document.getElementById("pwcheck2").style.color = 'red';
					}
				});
	})

</script>
</head>
<body>
	<div class="container">
    	<div class="row">
	    	<div class="col-md-8">
	    	
	    		<div id = "emailForm">
		    		<div class="form-group">
	                  <label class="control-label col-sm-3">Email ID <span class="text-danger">*</span></label>
	                  <div class="col-md-8 col-sm-9">
	                    <div class="input-group">
	                   	 	<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
	                    	<input class="form-control" style = "width:160px" id = "email1" type="text" placeholder="아이디를 입력하세요" name="email1">
		              		<input class="form-control" style = "width:140px" id = "email2" type="text" placeholder="주소값 직접입력" name="email1">
		              		<select   id="selectEmail" class = "form-control" style = "width:130px; height: calc(2.25rem + 11px);"> 
								<option id = "selectEmail1" selected>직접입력</option>
								<option id = "selectEmail2">naver.com</option>
								<option id = "selectEmail3">daum.net</option>
								<option id = "selectEmail4">gmail.com</option>
							</select>
	                 	 </div>
	                 	 <input type = "button" id = "sendEmail" value = "전송">
	                    </div>
	                </div>
	    		</div>
	    		<div id = "confirm">
	    			<div class="form-group">
	    				<label class="control-label col-sm-3">인증번호 입력<span class="text-danger">*</span></label>
		                  <div class="col-md-8 col-sm-9">
		                    <div class="input-group">
		                   	 	<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
			              		<input class="form-control" style = "width:140px" id = "emailConf" type="text" placeholder="인증번호입력" >
		                 	 </div>
		                    <input type = "button" id = "emailConfBtn" value = "전송"> 
		                  </div>
	                </div>
	    		</div>
		    	<div id = "changePW" style="visibility: hidden">
		    		<div class="form-group">
	                  <label class="control-label col-sm-3">Set Password <span class="text-danger">*</span></label>
	                  <div class="col-md-5 col-sm-8">
	                    <div class="input-group">
	                      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	                      <input type="password" class="form-control" name="password" id="password" placeholder="Choose password (8-16 chars)" value="">
	                   </div>
	                  </div>
	                  <small id = "pwcheck" style = "color:red">비밀번호를 입력하세요</small>
		            </div>
		    	
		    		<div class="form-group">
		                  <label class="control-label col-sm-3">Confirm Password <span class="text-danger">*</span></label>
		                  <div class="col-md-5 col-sm-8">
		                    <div class="input-group">
		                      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
		                      <input type="password" class="form-control" name="cpassword" id="passwordConf" placeholder="Confirm your password" value="">
		                    </div>  
		                  </div>
		                  <small id = "pwcheck2" style = "color:red">비밀번호를 재입력하세요</small>
		                </div>
		    	</div>
	    	</div>
	    </div>
	</div>
	

</body>

<script>

$("#loginBtn").on("click",function(){
	self.location = "/login";
})

$('.smsForm').on("click",function(){
	
	var phoneNum1 = document.getElementById("phoneNum1").value;
	var phoneNum2 = document.getElementById("phoneNum2").value;
	var phoneNum3 = document.getElementById("phoneNum3").value;
	
	var phoneNum = phoneNum1 + phoneNum2 + phoneNum3;
	console.log("phoneNum......"+phoneNum);
	
	$.ajax({
		url : "/smssend",
		type: "post",
		headers: {
			//"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		data: {
			type : "searchId",
			rphone : phoneNum
		},
		success: function(result){
			console.log(result);
			if(result == "success"){ // 성공시 입력란과 버튼이 생성
				alert("전화번호로 이메일이 전송되었습니다.");
				document.getElementById("loginBtn").style.visibility = "visible";
				//document.getElementById("smsConfirm").style.visibility = "visible";
				
			}else if(result == "fail"){ 
				alert("가입되지 않은 전화번호입니다.");
			}
		}
	})
});
</script>

</html>