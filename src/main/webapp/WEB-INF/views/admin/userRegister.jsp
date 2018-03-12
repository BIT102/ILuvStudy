<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>계정 관리</title>
    
</head>
<body>
<div id="wrapper">
<%@ include file="nav.jsp" %>
    
    
     <!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">회원조회</h3>
					<div class="row">
						<div class="col-md-12">
    						<div class="panel">
        <div class="panel-heading">
			<h3 class="panel-title">회원 등록</h3>
		</div>

<div class="panel-body">
	<form role="form" method="post">
        <table class="table table-hover">
        <tbody>
            <tr>
                <th>아이디</th>
                <td>
                	<input type="text" id="email" name="email" placeholder="asdf@gmail.com" class="form-control">
                	<p id = "emailck" style = "color:red">이메일을 입력하세요</p>
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" id="name" name="name" class="form-control"></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                	<input id = "password" type="password" name="password" class="form-control" placeholder="8자 이상 입력하세요">
                	<p id = "pwcheck" style = "color:red">비밀번호를 입력하세요</p>
                </td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td>
                	<input id = "passwordConf" type="password" maxlength="20" name="passwordcheck" class="form-control">
                	<p id = "pwcheck2" style = "color:red"></p>
                </td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>
    	            <input id = "nickName" type="text" name="nickName" class="form-control">
    	            <button type="button" class="btn btn-default btn-xs chkNickname">중복확인</button>
    	            <p id = "nickNamecheck" style = "color:red"></p>
                </td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                	<label class="fancy-radio" style="display:inline-block;">
                    	<input type="radio" name="gender" value="1"><span><i></i>남성&nbsp;</span>
                    </label>
                    <label class="fancy-radio" style="display:inline-block;">
                    	<input type="radio" name="gender" value="2" checked><span><i></i>여성</span>
                    </label>
                </td>
            </tr>
            <tr>
            	<th>핸드폰번호</th>
            	<td><input type="text" id="phoneNum" name="phoneNum" placeholder="01012345678" class="form-control"></td>
            </tr>
            <tr>
            	<th>생년월일</th>
            	<td><input type="text" id="birth" name="birth" placeholder="900101" class="form-control"></td>
            </tr>
            </tbody>
        </table>
        <input type="hidden" name="registUser" value="${login.id}">
	</form>   
	     
		<button type="button" id="listBtn" class="btn btn-primary">목록</button>
		<button type="submit" id="registerBtn" class="btn btn-success" style="float:right">등록</button>
        </div>
        <!-- panel-body end -->  
           		 			</div>
						</div>
					</div>
					</div>
				</div>
			<!-- END MAIN CONTENT -->
			</div>
		<!-- END MAIN -->
		</div>
    
<script>
		
	$(document).ready(function(){
		$("#userListnav").attr("class", "active");
		
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		// 완료 유효성 검사
		var emailV = false;
		var nameV = false;
		var passwordV = false;
		var nicknameV = false;
		var birthV = false;
		var phoneNumV = false;
		
		//등록 클릭 시 액션
		$("#registerBtn").on("click", function(){
			//form 유효성 검사
			
			// email 유효성
			if(document.getElementById("emailck").style.color == 'blue'){
				emailV = true;
			}
			
			// name 유효성
			if($("#name").val() != ""){
				nameV = true;
			}
			
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
			
			// 전화번호 유효성
			if($("#phoneNum").val() != ""){
				phoneNumV = true;
			}
			
			console.log("emailV : " + emailV + " nameV : " + nameV + " passwordV : " + passwordV + " nicknameV : " + nicknameV + " birthV : " + birthV + " phoneNumV : "+ phoneNumV);
			
			if(emailV && nameV && passwordV && nicknameV && birthV && phoneNumV){
				formObj.submit();
			}else{
				alert("내용을 확인하세요");	
			}
		});
		
		//목록 클릭 시 액션
		$("#listBtn").on("click", function(){
			self.location = "/admin/userList";
		});
		
		//======== email 부분 ========
		$('#email').keyup(function(){
			var email = document.getElementById("email").value;
			
			if(emailValid(email)){
				$('#emailck').html("사용가능한 이메일입니다.");
				document.getElementById("emailck").style.color = 'blue';
			}else{
				$('#emailck').html("유효하지 않은 이메일입니다.");
				document.getElementById("emailck").style.color = 'red';
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
		
		//========= 닉네임 확인부분 ============
		$('.chkNickname').on("click",function(){
			
			var nickname = document.getElementById("nickName").value;
			console.log("chkNick......"+nickname);
			
			$.ajax({
				url : "/join/nickname",
				type: "post",
				headers: {
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
						document.getElementById("nickNamecheck").style.color = 'red';
					}
				}
			})
		});
		
	});
	
	var charDot = "@.abcdefghijklmnopqrstuvwxyz0123456789"; // dot, @ 때문에 나누어놈
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

		// email 유효성 검사 (길이검사, 알파벳검사, . 1개 검사)
		function emailValid(email){
			
			email = email.toLowerCase(); // 소문자 변형
			var dotCnt = 0;
			var domainCnt = 0;
			
			// .1개 검사
			for(var i = 0; i<email.length; i++){
				if(email.charAt(i)=='.'){
					dotCnt++;
				} else if(email.charAt(i)=='@'){
					domainCnt++;
				}
			}
			
			if(dotCnt != 1 || domainCnt != 1){
				return false;
			}			
			
			// 알파벳, 길이 검사
			if((containsCharOnly(email, charDot))
					&&(16<=email.length&&email.length<=40)){
				return true;
			}
			return false;
		}
		
		//========= 생년월일 확인부분 ============ 
		function birthChk(birth){
			//길이확인
			if(birth.length != 6)
				return false;
			
			return containsCharOnly(birth, charNum);
		}

</script>
</body>
</html>