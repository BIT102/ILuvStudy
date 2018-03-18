<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- 부트스트랩 영역 -->
<link rel="stylesheet" href="/resources/dist/css/bootstrap.min.css">
<link href="/resources/dist/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/dist/css/join.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<title>Insert title here</title>
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
		
		$('.chkNickname').on("click",function(){
			
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
		$('.smsForm').on("click",function(){
			
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
	                <h1 class="entry-title"><span>Sign Up</span> </h1>
	                <hr>
	                    <form class="form-horizontal" action="/join" method="post" name="signup" id="signup" enctype="multipart/form-data" >        
	                <div class="form-group">
	                  <label class="control-label col-sm-3">Email ID <span class="text-danger">*</span></label>
	                  <div class="col-md-8 col-sm-9">
	                      <div class="input-group">
	                      <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
	                      <input class="form-control" id = "email1" type="text" placeholder="아이디를 입력하세요" name="email1">
	                    </div>
	                    <small> Your Email Id is being used for ensuring the security of your account, authorization and access recovery. </small> </div>
	                </div>
	                
	                <div class="form-group">
	                  <label class="control-label col-sm-3">Set Password <span class="text-danger">*</span></label>
	                  <div class="col-md-5 col-sm-8">
	                    <div class="input-group">
	                      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	                      <input type="password" class="form-control" name="password" id="password" placeholder="Choose password (5-15 chars)" value="">
	                   </div>   
	                  </div>
	                </div>
	                <div class="form-group">
	                  <label class="control-label col-sm-3">Confirm Password <span class="text-danger">*</span></label>
	                  <div class="col-md-5 col-sm-8">
	                    <div class="input-group">
	                      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	                      <input type="password" class="form-control" name="cpassword" id="cpassword" placeholder="Confirm your password" value="">
	                    </div>  
	                  </div>
	                </div>
	                <div class="form-group">
	                  <label class="control-label col-sm-3">Full Name <span class="text-danger">*</span></label>
	                  <div class="col-md-8 col-sm-9">
	                    <input type="text" class="form-control" name="mem_name" id="mem_name" placeholder="Enter your Name here" value="">
	                  </div>
	                </div>
	                <div class="form-group">
	                  <label class="control-label col-sm-3">Date of Birth <span class="text-danger">*</span></label>
	                  <div class="col-xs-8">
	                    <div class="form-inline">
	                      <div class="form-group">
	                        <select name="dd" class="form-control">
	                          <option value="">Date</option>
	                          <option value="1" >1 </option><option value="2" >2 </option><option value="3" >3 </option><option value="4" >4 </option><option value="5" >5 </option><option value="6" >6 </option><option value="7" >7 </option><option value="8" >8 </option><option value="9" >9 </option><option value="10" >10 </option><option value="11" >11 </option><option value="12" >12 </option><option value="13" >13 </option><option value="14" >14 </option><option value="15" >15 </option><option value="16" >16 </option><option value="17" >17 </option><option value="18" >18 </option><option value="19" >19 </option><option value="20" >20 </option><option value="21" >21 </option><option value="22" >22 </option><option value="23" >23 </option><option value="24" >24 </option><option value="25" >25 </option><option value="26" >26 </option><option value="27" >27 </option><option value="28" >28 </option><option value="29" >29 </option><option value="30" >30 </option><option value="31" >31 </option>                </select>
	                      </div>
	                      <div class="form-group">
	                        <select name="mm" class="form-control">
	                          <option value="">Month</option>
	                          <option value="1">Jan</option><option value="2">Feb</option><option value="3">Mar</option><option value="4">Apr</option><option value="5">May</option><option value="6">Jun</option><option value="7">Jul</option><option value="8">Aug</option><option value="9">Sep</option><option value="10">Oct</option><option value="11">Nov</option><option value="12">Dec</option>                </select>
	                      </div>
	                      <div class="form-group" >
	                        <select name="yyyy" class="form-control">
	                          <option value="0">Year</option>
	                          <option value="1955" >1955 </option><option value="1956" >1956 </option><option value="1957" >1957 </option><option value="1958" >1958 </option><option value="1959" >1959 </option><option value="1960" >1960 </option><option value="1961" >1961 </option><option value="1962" >1962 </option><option value="1963" >1963 </option><option value="1964" >1964 </option><option value="1965" >1965 </option><option value="1966" >1966 </option><option value="1967" >1967 </option><option value="1968" >1968 </option><option value="1969" >1969 </option><option value="1970" >1970 </option><option value="1971" >1971 </option><option value="1972" >1972 </option><option value="1973" >1973 </option><option value="1974" >1974 </option><option value="1975" >1975 </option><option value="1976" >1976 </option><option value="1977" >1977 </option><option value="1978" >1978 </option><option value="1979" >1979 </option><option value="1980" >1980 </option><option value="1981" >1981 </option><option value="1982" >1982 </option><option value="1983" >1983 </option><option value="1984" >1984 </option><option value="1985" >1985 </option><option value="1986" >1986 </option><option value="1987" >1987 </option><option value="1988" >1988 </option><option value="1989" >1989 </option><option value="1990" >1990 </option><option value="1991" >1991 </option><option value="1992" >1992 </option><option value="1993" >1993 </option><option value="1994" >1994 </option><option value="1995" >1995 </option><option value="1996" >1996 </option><option value="1997" >1997 </option><option value="1998" >1998 </option><option value="1999" >1999 </option><option value="2000" >2000 </option><option value="2001" >2001 </option><option value="2002" >2002 </option><option value="2003" >2003 </option><option value="2004" >2004 </option><option value="2005" >2005 </option><option value="2006" >2006 </option>                </select>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	                <div class="form-group">
	                  <label class="control-label col-sm-3">Gender <span class="text-danger">*</span></label>
	                  <div class="col-md-8 col-sm-9">
	                    <label>
	                    <input name="gender" type="radio" value="Male" checked>
	                    Male </label>
	                       
	                    <label>
	                    <input name="gender" type="radio" value="Female" >
	                    Female </label>
	                  </div>
	                </div>
	                <div class="form-group">
	                  <label class="control-label col-sm-3">Contact No. <span class="text-danger">*</span></label>
	                  <div class="col-md-5 col-sm-8">
	                      <div class="input-group">
	                      <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
	                    <input type="text" class="form-control" name="contactnum" id="contactnum" placeholder="Enter your Primary contact no." value="">
	                    </div>
	                  </div>
	                </div>
	                <div class="form-group">
	                  <label class="control-label col-sm-3">Alternate No. <br>
	                  <small>(if any)</small></label>
	                  <div class="col-md-5 col-sm-8">
	                    <input type="text" class="form-control" name="contactnum2" id="contactnum2" placeholder="Any other or Landline no (if any)" value="">
	                  </div>
	                </div>
	                <div class="form-group">
	                  <label class="control-label col-sm-3">Profile Photo <br>
	                  <small>(optional)</small></label>
	                  <div class="col-md-5 col-sm-8">
	                    <div class="input-group"> <span class="input-group-addon" id="file_upload"><i class="glyphicon glyphicon-upload"></i></span>
	                      <input type="file" name="file_nm" id="file_nm" class="form-control upload" placeholder="" aria-describedby="file_upload">
	                    </div>
	                  </div>
	                </div>
	                <div class="form-group">
	                  <label class="control-label col-sm-3">Security Code </label>
	                  <div class="col-md-5 col-sm-8">
	                    <div >
	                        
	                        <input type="text" name="captcha" id="captcha" class="form-control label-warning"  />                
	                      </div>
	                  </div>
	                </div>
	                <div class="form-group">
	                  <div class="col-xs-offset-3 col-md-8 col-sm-9"><span class="text-muted"><span class="label label-danger">Note:-</span> By clicking Sign Up, you agree to our <a href="#">Terms</a> and that you have read our <a href="#">Policy</a>, including our <a href="#">Cookie Use</a>.</span> </div>
	                </div>
	                <div class="form-group">
	                  <div class="col-xs-offset-3 col-xs-10">
	                    <input name="Submit" type="submit" value="Sign Up" class="btn btn-primary">
	                  </div>
	                </div>
	              </form>
	            </div>
	        </div>
	        </div>
	

















	<form role="form" action="/join" method="post">
		이메일주소<br/>
		<input id = "email1" type="text" placeholder="아이디를 입력하세요" name="email1" /> 
		@ 
		<input  id = "email2" type="text" placeholder="주소값을 입력하세요" name="email2" /> 
		<select   id="selectEmail"> 
			<option id = "selectEmail1" selected>직접입력</option>
			<option id = "selectEmail2">naver.com</option>
			<option id = "selectEmail3">daum.net</option>
			<option id = "selectEmail4">google.com</option>
		</select>
		<input  id = "email" type="text" name="email" />
		<br/>
		이름<br/>
		<input type="text" placeholder = "실명을 입력하세요" name="name" />
		<br/>
		
		비밀번호<br/>
		<input id = "password" maxlength="20" type="password" style = "width:500px" placeholder = "비밀번호 8자리 이상 20자리 이하 영문 숫자로만 입력해 주세요" name="password"/>
		<p id = "pwcheck" style = "color:red">비밀번호를 입력하세요</p>
		<br/>
		
		비밀번호 확인<br/>
		<input id = "passwordConf" type="password" style = "width:500px" placeholder = "비밀번호를 재입력하세요" />
		<p id = "pwcheck2" style = "color:red"></p>
		<br/>
		
		닉네임<br/>
		<input id = "nickName" type="text"  placeholder = "닉네임을 입력하세요" name="nickName"/>
		<input type="button" class="chkNickname" value="중복체크" />
		<br/>
		<p id = "nickNamecheck" style = "color:red"></p>
		<br/>
		
		생년월일<br/>
		<input type="text" id = "birth" placeholder = "주민번호 앞자리를 입력하세요" name="birth"/>
		<br/>
		
		성별<br/> <!-- 남이 눌리면 여는 안눌리도록 처리필요 -->
		남<input name = "gender" value = "1" type = "radio" checked/>  여<input name = "gender" value = "2" type = "radio" />
		
		<br/>
		전화번호<br/>
		<input type="text" id = "phoneNum1" name="phoneNum1"/>-
		<input type="text" id = "phoneNum2" name="phoneNum2"/>-
		<input type="text" id = "phoneNum3" name="phoneNum3"/>
		<input type = "text" id = "phoneNum" name = "phoneNum">
		<br/>
		<input type = "button" class = "smsForm" value = "인증번호 전송">
		<br/>
		<input type = "text" id = "smsText" style = "visibility: hidden" placeholder = "인증번호를 입력하세요" >
		<input type = "button" id = "smsConfirm" style = "visibility: hidden" value = "확인">
		<br/>
		<input type="checkbox" /> 서비스이용약관에 동의하시겠습니까?
		<br/>
		
		<input id = "valid" class = "valid" type = "button" value = "회원가입" />
		<input type="reset" value="다시입력" />
	
	</form>
	
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