<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
         <!-- // Navigation -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="/resources/dist/css/join.css">
<title>Insert title here</title>

<style>
select.form-control:not([size]):not([multiple]) {
    height: calc(2.25rem + 11px);
}

#valid {
	background-color: #5bc0de;
	border: 1px solid black;
	margin-right: 10px;
}

#valid:hover {
	background-color: #31b0d5;
	border-color: #269abc;
}

.btn {
	padding: 5px 20px !important;
	margin-left: 20px !important;
}

.btn-xs {
	margin-top: 5px;
}

</style>


</head>    
<script>
	$('document').ready(function(){

		var charDot = ".abcdefghijklmnopqrstuvwxyz0123456789"; // dot 때문에 나누어놈
		var chars = "abcdefghijklmnopqrstuvwxyz0123456789_-";
		var charPw = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"; // 비밀번호는 대소문자 구분
		var charNum = "0123456789";
		
		// 알파벳 소문자, 숫자로만 이루어졌는지 체크
		function containsCharOnly(input, chars){ // input값이 chars에 있는 값인지를 체크
			console.log(input)
			console.log((input.charAt(2)));
			for(var i=0; i<input.length ; i++)
				if(chars.indexOf(input.charAt(i))==-1){
					console.log("문자체크 이거안되");
					return false;
				}

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
		// email 유효성 검사 (길이검사, 알파벳검사, . 1개 검사, 중복검사)
		function emailValid(email1, email2){
			
			email1 = email1.toLowerCase(); // 소문자 변형
			email2 = email2.toLowerCase(); // 소문자 변형
			var dotCnt = 0;
			var resultF;
			
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
			if(!((containsCharOnly(email1, chars)&&containsCharOnly(email2, charDot))
					&&(4<=email1.length&&email1.length<=30))){
				return false;
			}
			return true;// 중복 체크
			
		}
		
		$('#chkEmail').on("click",function(){
			
			$.ajax({
				url : "/chkEmail",
				type: "post",
				headers: {
					//"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				data: {
					email : document.getElementById("email1").value+"@"+document.getElementById("email2").value
				},
				success: function(result){
					console.log(result);
					if(result == "success"){
						console.log("들어옴");
						alert("사용가능한 이메일입니다.")
						emailV = true;
						document.getElementById("email").value = document.getElementById("email1").value+"@"+document.getElementById("email2").value;
						
					}else{
						alert("중복된 이메일입니다.");
						emailV = false;
					}
				}
			})
		})
		
		function chkEmail(email1,email2){
			
			
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
					rphone : phoneNum,
					type : "join"
				},
				success: function(result){
					console.log(result);
					if(result == "success"){ // 성공시 입력란과 버튼이 생성
						alert("인증번호를 입력하세요");
						//document.getElementById("smsText").style.visibility = "visible";
						//document.getElementById("smsConfirm").style.visibility = "visible";
						
					}else{ 
						alert("유효한 전화번호가 아닙니다.");
					}
				}
			})
		});
		
		// 인증번호 일치 확인란
		$('#smsConfirm').on("click",function(){
			
			var phoneNum1 = document.getElementById("phoneNum1").value;
			var phoneNum2 = document.getElementById("phoneNum2").value;
			var phoneNum3 = document.getElementById("phoneNum3").value;
			
			var phoneNum = phoneNum1 +"-"+ phoneNum2 +"-"+ phoneNum3;
			
			$.ajax({
				url : "/smsConfirm",
				type : "post",
				headers : {
					"X-HTTP-Method-Override" : "POST"
				},
				data: {
					code : document.getElementById("smsText").value,
					rphone : phoneNum
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
			
			
			var formObj = document.getElementById("signup");
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
			
			console.log("emailV : " + emailV + " passwordV : " + passwordV + " nicknameV : " + nicknameV + " birthV" + birthV + " phoneNumV : "+ phoneNumV);
			
			if(emailV && passwordV && nicknameV && birthV && phoneNumV){
				alert("입력하신 이메일로 인증을 완료하세요");
				formObj.submit();
			}else{
				alert("내용을 확인하세요");	
			}
		});
	})
</script>


<body>

<%@include file="nav.jsp"%>

            <header class="page-head" style="background:url(/resources/assets/img/portfolio-bg.jpg);">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <ol class="breadcrumb">
                                    <li><a href="/study/main">Home</a></li>
                                    <li class="active">Sign Up</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->

	<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content" style="background-color: #f9f9f9">
				<div class="container">
					<h3 class="page-title">가입하기</h3>
					<div class="row">
						<div class="col-md-12">
							<div class="panel">
								<div class="panel-body">
									 <form class="form-horizontal" action="/join" method="post" name="signup" id="signup" enctype="multipart/form-data" >
										<table class="table table-hover">
						
												<tr>
													<th>Email ID </th>
													<td>
			                <div class="form-group">
	                  <div class="col-md-8 col-sm-9">
	                    <div class="input-group">
	                   	 	<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
	                    	<input class="form-control" style = "width:160px" id = "email1" type="text" placeholder="아이디를 입력하세요" name="email1">
		              		<input class="form-control" style = "width:140px; margin-left:5px;" id = "email2" type="text" placeholder="주소값 직접입력" name="email1">
		              		<select   id="selectEmail" class = "form-control" style = "width:130px; height: calc(2.25rem + 11px);"> 
								<option id = "selectEmail1" selected>직접입력</option>
								<option id = "selectEmail2">naver.com</option>
								<option id = "selectEmail3">daum.net</option>
								<option id = "selectEmail4">gmail.com</option>
							</select>
							<input type="button" id="chkEmail" value="중복체크" />
	                 	 </div>
	                    <small> Your Email Id is being used for ensuring the security of your account, authorization and access recovery. </small> </div>
	                </div>
	                <input  id = "email" type="text" name="email" style = "position: absolute; visibility: hidden;" />
	                
	                
					</td>
					</tr>
					</table>
					<table class="table table-hover">
					<tr>
					<th>Set Password</th>
					<td>
					<div class="form-group">   
	                  <div class="col-md-5 col-sm-8">
	                    <div class="input-group">
	                      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	                      <input type="password" class="form-control" name="password" id="password" placeholder="Choose password (8-16 chars)" value="">
	                   </div>
	                  </div>
	                  <small id = "pwcheck" style = "color:red">비밀번호를 입력하세요</small>
	                </div>
	                <div class="form-group">          
	                  <div class="col-md-5 col-sm-8">
	                    <div class="input-group">
	                      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	                      <input type="password" class="form-control" name="cpassword" id="passwordConf" placeholder="Confirm your password" value="">
	                    </div>  
	                  </div>
	                  <small id = "pwcheck2" style = "color:red">비밀번호를 재입력하세요</small>
	                </div>
			</tr>										
												<tr>
													<th>Name</th>
													<td>
													  <div class="form-group">
	                
	                  <div class="col-md-8 col-sm-9">
	                    <input type="text" id = "name" class="form-control" name="name" id="mem_name" placeholder="Enter your Name here" value="">
	                  </div>
	                </div>
	                <div class="form-group">
	                  
	                  <div class="col-md-8 col-sm-9">
	                    <input type="text" class="form-control" name="nickName" id="nickName" placeholder="Enter your NICKNAME here" value="">
	                    <input type="button" id="chkNickname" value="중복체크" />
	                    <p id = "nickNamecheck" style = "color:red"></p>
	                  </div>
	                </div>
													</td>
												</tr>
												<tr>
													<th>Date of Birth</th>
													<!-- 아래 방장은 나중에 세션으로 전송 -->
													<%-- <td><input name="writer" value="${studyVO.writer}"></td> --%>
													<td>
													
													 <div class="form-group">
	                  
	                  <div class="col-md-8 col-sm-9">
	                    <input type="text" id = "birth" class="form-control" name="birth" placeholder="Enter Your Birth(ex.901111)" value="">
	                  </div>
	                </div>
													
													</td>
												</tr>
	
												<tr>
													<th>Gender</th>
													<td>
													  <div class="form-group">
	                  
	                  <div class="col-md-8 col-sm-9">
	                    <label>
	                    <input name="gender" type="radio" value="1" checked>
	                    Male </label>
	                       
	                    <label>
	                    <input name="gender" type="radio" value="2" >
	                    Female </label>
	                  </div>
	                </div>
													</td>
												</tr>
												<tr>

													<th>Contact No.</th>
													<td>
														                <div class="form-group">
	                  
	                  <div class="col-md-5 col-sm-8">
                      	<div class="input-group">
	                      <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
	                      <input type="text" class="form-control" style="width:30%" name="phoneNum1" id="phoneNum1" placeholder="" value="">
	                      <input type="text" class="form-control" style="width:30%" name="phoneNum2" id="phoneNum2" placeholder="" value="">
	                      <input type="text" class="form-control" style="width:30%" name="phoneNum3" id="phoneNum3" placeholder="" value="">
	                      <input type = "button" class = "smsForm" value = "인증번호 전송">
	                    </div>
	                  </div>
	                  <input type = "text" id = "phoneNum" name = "phoneNum" style="visibility: hidden; position: absolute;">
	                </div>
	                <div class="form-group">
	               
	                  <div class="col-md-5 col-sm-8">
	                    <div >
	                        <input type="text" name="smsText" id="smsText" placeholder = "인증번호를 입력하세요" class="form-control label-warning"  />
	                        <input type = "button" id = "smsConfirm" value = "확인">                
	                    </div>
	                  </div>
	                </div>
	                <div class="form-group">
	                  <div class="col-xs-offset-3 col-md-8 col-sm-9"><span class="text-muted"><span class="label label-danger">Note:-</span> By clicking Sign Up, you agree to our <a href="#">Terms</a> and that you have read our <a href="#">Policy</a>, including our <a href="#">Cookie Use</a>.</span> </div>
	                </div>
													</td>
												</tr>
		
										</table>
										<!-- 일등록 핸들러 -->

										<div class="text-right">
											<!-- <button type="submit" id="btn-success" class = "btn btn-success" style="background-color:#5bc0de; border:1px solid black;">등록</button> -->
											<input id = "valid" name="valid" type="button" value="등록" class="btn btn-primary">
											<!-- <input type="submit" id = "insertBtn" class = "btn btn-success" value = "등록" /> -->
										</div>
									</form>

								</div>
								<!-- panel-body end -->


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
	
	        
<%@include file="footer.jsp"%>	        
	        
</body>

</html>