<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <!-- // Navigation -->
<%@include file="include/header.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

    
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

