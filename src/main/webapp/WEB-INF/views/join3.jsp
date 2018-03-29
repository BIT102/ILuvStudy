<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원 가입</title>

<link href="/resources/css/bootstrap.css" rel="stylesheet">
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> --> 
<link rel="stylesheet" href="/resources/css/join.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
</head>

<script>
	$('document').ready(function(){

		var charDot = ".abcdefghijklmnopqrstuvwxyz0123456789"; // dot 때문에 나누어놈
		var chars = "abcdefghijklmnopqrstuvwxyz0123456789";
		var charPw = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"; // 비밀번호는 대소문자 구분
		var charNum = "0123456789";
		
		// 알파벳 소문자, 숫자로만 이루어졌는지 체크
		function containsCharOnly(input, chars){ // input값이 chars에 있는 값인지를 체크
			console.log(input)
			console.log((input.charAt(2)));
			for(var i=0; i<input.length ; i++)
				if(chars.indexOf(input.charAt(i))==-1)
					return false;
					
			return true;
		}
		
		//========= Email 부분 ============
		// 이메일 select 박스 선택시 바뀌도록 설정
		$('#selectEmail').change(function(){
			if(document.getElementById('selectEmail').value=="직접입력"){
				document.getElementById('email2').value = "";	
			}else{
				document.getElementById('email2').value = document.getElementById('selectEmail').value;	
			}
		});
		// email 유효성 검사 (길이검사, 알파벳검사, . 1개 검사)
		function emailValid(email1, email2){
			
			email1 = email1.toLowerCase(); // 소문자 변형
			email2 = email2.toLowerCase(); // 소문자 변형
			var dotCnt = 0;
			
			// .1개 검사
			for(var i = 0; i<email2.length; i++){
				if(email2.charAt(i)=='.'){
					dotCnt++;
				}	
			}
			
			if(dotCnt != 1){
				return false;
			}			
			
			// 알파벳, 길이 검사
			if((containsCharOnly(email1, chars)&&containsCharOnly(email2, charDot))
					&&(6<=email1.length&&email1.length<=30)){
				
				emailV = true; // 최종 유효성 검사를 위함
				document.getElementById("email").value = email1+"@"+email2;
				return true;
			}
			return false;
		}
		
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
		
		//========= 닉네임 확인부분 ============
		
		$('#chkNickname').on("click",function(){
			
			var nickname = document.getElementById("nickName").value;
			console.log("chkNick......"+nickname);
			
			$.ajax({
				url : "/join/nickname",
				type: "post",
				headers: {
					//"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				data: {
					nickname : nickname
				},
				success: function(result){
					console.log(result);
					if(result == "success"){
						$('#nickNamecheck').html("사용가능한 닉네임입니다.");
						document.getElementById("nickNamecheck").style.color = 'blue';
					}else{
						$('#nickNamecheck').html("사용불가능한 닉네임입니다.");
					}
				}
			})
		});
		
		//========= 생년월일 확인부분 ============ 
		
		function birthChk(birth){
			//길이확인
			if(birth.length != 6)
				return false;
			
			return containsCharOnly(birth, charNum);
		}
		
		//========= 전화번호 ============
		// 전화번호 입력 및 인증번호 전송하기
		$('#smsForm').on("click",function(){
			
			var phoneNum1 = document.getElementById("phoneNum1").value;
			var phoneNum2 = document.getElementById("phoneNum2").value;
			var phoneNum3 = document.getElementById("phoneNum3").value;
			
			var phoneNum = phoneNum1 +"-"+ phoneNum2 +"-"+ phoneNum3;
			console.log("phoneNum......"+phoneNum);
			
			$.ajax({
				url : "/smssend",
				type: "post",
				headers: {
					//"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				data: {
					rphone : phoneNum
				},
				success: function(result){
					console.log(result);
					if(result == "success"){ // 성공시 입력란과 버튼이 생성
						alert("인증번호를 입력하세요");
						document.getElementById("smsText").style.visibility = "visible";
						document.getElementById("smsConfirm").style.visibility = "visible";
						
					}else{ 
						alert("유효한 전화번호가 아닙니다.");
					}
				}
			})
		});
		
		// 인증번호 일치 확인란
		$('#smsConfirm').on("click",function(){
			
			$.ajax({
				url : "/smsConfirm",
				type : "post",
				headers : {
					"X-HTTP-Method-Override" : "POST"
				},
				data: {
					code : document.getElementById("smsText").value
				},
				success: function(result){
					if(result == "success"){
						alert("인증번호가 확인되었습니다.");
						phoneNumV = true;
						
						document.getElementById("phoneNum").value = document.getElementById("phoneNum1").value
																	+document.getElementById("phoneNum2").value
																	+document.getElementById("phoneNum3").value;
					}else if(result == "fail"){
						alert("인증번호를 다시 확인해 주세요");
					}
				}
			})
		});
		
		// 완료 유효성 검사
		var emailV = false;
		var passwordV = false;
		var nicknameV = false;
		var birthV = false;
		var phoneNumV = false;
		
		// 회원가입 클릭
		$('#valid').on("click", function(){
			
			
			var formObj = $("form[role='form']");
			// email 유효성
			emailV = emailValid(document.getElementById("email1").value,document.getElementById("email2").value);
				 		
			// password 유효성
			if(document.getElementById("pwcheck").style.color == 'blue' && 
					document.getElementById("pwcheck2").style.color == 'blue'){
				passwordV = true;
			}
			
			// 닉네임 유효성
			if(document.getElementById("nickNamecheck").style.color == 'blue'){
				nicknameV = true;
			}
			
			// 생년월일 유효성
			birthV = birthChk(document.getElementById("birth").value);
			
			// 전화번호는 인증 시 변환
			
			console.log("emailV : " + emailV + "passwordV : " + passwordV + "nicknameV : " + nicknameV + "birthV" + birthV + "phoneNumV : "+ phoneNumV);
			
			if(emailV && passwordV && nicknameV && birthV && phoneNumV){
				formObj.submit();
			}else{
				alert("내용을 확인하세요");	
			}
			
		});
			
			
	})
</script>



<body>
<div class="container">
	<div class="row">
    <div class="col-md-8">
      <section>      
        <h1 class="entry-title"><span>회원 가입</span> </h1>
        <hr>
            <form class="form-horizontal" role="form" action="/join" method="post" name="signup" id="signup" enctype="multipart/form-data" >        
       <div class="form-group">
          <label class="control-label col-sm-3">이메일 ID <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
              <div class="input-group idgroup">
              <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
              <input type="text" class="form-control col" name="email1" id="email1" placeholder="아이디를 입력하세요." value="" required >
              <input type="text" class="form-control col" name="email2" id="email2" placeholder="주소값을 입력하세요." value="" required>
              <select id="selectEmail" class="form-control col"> 
					<option id = "selectEmail1" selected>직접입력</option>
					<option id = "selectEmail2">naver.com</option>
					<option id = "selectEmail3">daum.net</option>
					<option id = "selectEmail4">gmail.com</option>
			  </select>  
            <input type="email" class="form-control" name="email" id="email" style="position: absolute; visibility: hidden; placeholder="Enter your Email ID" value="">
            </div>
            <small> Your Email Id is being used for ensuring the security of your account, authorization and access recovery. </small> </div>
        </div>
        
        <div class="form-group">
          <label class="control-label col-sm-3">비밀번호 입력 <span class="text-danger" required >*</span></label>
          <div class="col-md-8 col-sm-9">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" maxlength="20" class="form-control" id="password" style="width: 100%" placeholder="비밀번호 8자리 이상 20자리 이하 영문, 숫자로만 입력해 주세요." value="" required>   
           </div>  
           <p id = "pwcheck" style = "color:red">비밀번호를 입력하세요</p> 
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">비밀번호 재입력 <span class="text-danger" >*</span></label>
          <div class="col-md-8 col-sm-9">
            <div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <input type="password" class="form-control" id="passwordConf" style="width: 100%" placeholder="비밀번호를 재입력하세요." value="" required>
            </div> 
            <p id = "pwcheck2" style = "color:red"></p> 
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">이름 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <input type="text" class="form-control" name="name" id="name" placeholder="실명을 입력하세요." value="" required>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">닉네임 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <input type="text" class="form-control" name="nickName" id="nickName" placeholder="닉네임을 입력하세요." value="" required>
            <input type="button" value="중복 확인" id="chkNickname" class="btn btn-primary">
            <p id = "nickNamecheck" style = "color:red"></p>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">생년월일 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <input type="text" class="form-control" name="birth" id="birth" pattern="[0-9]{6}" title="생년월일 6자리를 입력해주세요." placeholder="생년월일을 입력해주세요. ex) 850401" value="" required>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">성별 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <label>
            <input name="gender" type="radio" value="1" checked>
            	남성 </label>   
            <label>
            <input name="gender" type="radio" value="2" >
            	여성 </label>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">핸드폰 번호 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
          	<div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
            <input type="text" class="form-control" name="phoneNum1" id="phoneNum1" placeholder="010" value="" pattern="[0-9]{3}" title="숫자 3자리를 입력해주세요." required>
            <input type="text" class="form-control" name="phoneNum2" id="phoneNum2" placeholder="1234" value="" pattern="[0-9]{3,4}" title="숫자 3~4자리를 입력해주세요." required>
            <input type="text" class="form-control" name="phoneNum3" id="phoneNum3" placeholder="5678" value="" pattern="[0-9]{4}" title="숫자 4자리를 입력해주세요." required>
            <input type="text" class="form-control" name="phoneNum" style="position: absolute; visibility: hidden;" id="phoneNum" placeholder="Enter your Primary contact no." value="">
            </div>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">프로필 사진<br>
          <small>(optional)</small></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group"> <span class="input-group-addon" id="file_upload"><i class="glyphicon glyphicon-upload"></i></span>
              <input type="file" name="file_nm" id="file_nm" class="form-control upload" style="width:100%"placeholder="" aria-describedby="file_upload">
            </div>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">인증번호 </label>
          <div class="col-md-5 col-sm-8">
            <div >
                <input type="text" name="captcha" id="captcha" class="form-control label-warning" required / >
                <input name="Submit" type="button" value="인증번호 전송" id="smsForm" class="btn btn-primary">
                <input type = "button" id = "smsConfirm" style = "visibility: hidden" value = "확인">
                <input type = "text" id = "smsText" style = "visibility: hidden" placeholder = "인증번호를 입력하세요" >                
              </div>
          </div>
        </div>
        <div class="form-group">
          <div class="col-xs-offset-3 col-md-8 col-sm-9"><span class="text-muted"><span class="label label-danger">Note:-</span> By clicking Sign Up, you agree to our <a href="#">Terms</a> and that you have read our <a href="#">Policy</a>, including our <a href="#">Cookie Use</a>.</span> </div>
        </div>
        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-10">
            <input name="Submit" type="submit" value="회원가입" class="btn btn-primary">
            <input type="reset" value="다시 입력" class="btn btn-primary">
          </div>
        </div>
      </form>
    </div>
</div>
</div>
</body>


<script>	
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		
		// 인증번호 보내기 버튼
		$(".vailed").on("click",function(){
			
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
					
					if(result == "unvaild"){
						alert("유효하지 않은 이메일 주소입니다.");
					}else if(result == "duplicated"){
						alert("이미 가입된 이메일 입니다.");
					}else{
						alert("인증번호를 입력하세요.");
					}	
					
					
				}
			});
		})
		
	});
</script>

  
</html>