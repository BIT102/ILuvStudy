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

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<a href="www.naver.com">네이버배너</a> 
				<a href="www.kakao.com">카카오배너</a>
				<br /> <br />

				<form action="smssend" method="post">

					<p>가입시 입력한 전화번호를 넣어주세요.</p>

					<div class="form-group">
						<label class="control-label col-sm-3">Contact No. <span
							class="text-danger">*</span></label>
						<div class="col-md-5 col-sm-8">
							<div class="input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span> 
								<input type="text" class="form-control" style="width: 30%" name="phoneNum1"	id="phoneNum1" placeholder="" value=""> 
								<input type="text" class="form-control" style="width: 30%" name="phoneNum2" id="phoneNum2" placeholder="" value="">
								<input type="text" class="form-control" style="width: 30%" name="phoneNum3" id="phoneNum3" placeholder="" value="">
							</div>
						</div>
						<input type="text" id="phoneNum" name="phoneNum" style="visibility: hidden; position: absolute;"> 
						<input	type="button" class="smsForm" value="전화번호로 이메일전송">
					</div>
				</form>
				<a href="/study/main" id="loginBtn" style="visibility: hidden">메인페이지 이동</a>
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