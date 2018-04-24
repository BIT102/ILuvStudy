<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE htm>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->

<html class="no-js">
<!--<![endif]-->
<head>

<title>I Luv Study</title>

<!-- meta -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- fafa img -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- stylesheets -->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/assets/css/animate.css">
<link rel="stylesheet" href="/resources/assets/css/owl.carousel.css">
<link rel="stylesheet" href="/resources/assets/css/owl.theme.css">
<link rel="stylesheet" href="/resources/assets/css/style.css">

<!-- fonts for this template -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Kaushan+Script"
	type="text/css">

<!-- scripts -->
<script type="text/javascript"
	src="/resources/assets/js/modernizr.custom.97074.js"></script>

<!-- Loading -->


<style>

.fp-box{
    background-color:#fff;
}
.fp-box-header{
    width: 100%;
    height: 45px;
    background-color: #656565;
    font-size: 15px;
    color: white;
    padding: 13px;
    letter-spacing: 1px;
    font-weight: 570;
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
}
.fp-box-body{
    width: 100%;
    padding: 10px 50px 40px 50px;
}
.footer-content{
    width:100%;
}
.body-text{
    width:100%;
    height:30px;
    margin-top:5px;
    font-size:14px;
    letter-spacing:0;
    text-align:left;
}
.body-text:first-child{
    margin-top:26px;
}

.changePw{
    width: 100%;
    margin:0 auto;
    background-color: #00beff;
    color: white;
    font-size: 15px;
    height:40px;
    border:none;
}

</style>

</head>

<body>

<%@include file="nav.jsp"%>

<section class="bg-light-gray">
			<div class="container">
				<div class="login-container" style="width:450px; padding:0px;">
					<div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding:0px;">
                                <div class="fp-box">
                                        <div class="fp-box-header">
                                        	<span>비밀번호 변경</span>
										</div>
                                        <div class="fp-box-body">
                							<div class="body-text">비밀번호 입력</div>
                							<input type="password" pattern=".{8,16}" name="newPw1" class="form-control" id="newPw1"
													placeholder="8자리에서 16자리 이하 영문, 숫자">
                							<p class="body-text" id = "pwcheck" style = "color:red;">비밀번호를 입력하세요</p>
                							
                							<div class="body-text">비밀번호 확인</div>
                							<input type="password" pattern=".{8,16}" name="newPw2" class="form-control" id="newPw2">
                							<p class="body-text" id = "pwcheck2" style = "color:red;">비밀번호를 재입력하세요</p>
                							<button type="button" class="changePw">비밀번호 변경</button>
            							</div>
                                </div>
                            </div>
                       </div>
           		</div>       
          </div>          
				
</section>				
				
<%@include file="footer.jsp"%>



<script type="text/javascript" src="/resources/assets/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/owl.carousel.js"></script>
<script type="text/javascript" src="/resources/assets/js/jquery.hoverdir.js"></script>


<script>
$(".changePw").on("click", function(){
	
	var newPw1 = $('#newPw1').val();
	var newPw2 = $('#newPw2').val();
	var email = "<%=request.getParameter("email")%>";
	
	console.log(email);
	console.log(newPw1);
	console.log(newPw2);
	
	$.ajax({
		url: '/resetPassword',
		contentType: 'application/json',
		method: 'POST',
		data:JSON.stringify({
			"email" : email,
			"newPw1" : newPw1, // 앞에는 컨트롤러에서 가져다 쓸 이름이고 뒤에는 값임!
			"newPw2" : newPw2
		}),  
		success : function(result){ //alert으로 result값을 하면 컨트롤에서 ""안에 쓴 값이 뜸
			console.log("통신 성공했음");
			console.log(result);
			
			if(result == 1){ //1인 경우 비밀번호 변경 완료
				$('#toast').html('<em class="fa fa-check"></em> 비밀번호 변경 성공!'); 
				$('#toast').css('background-color', 'rgb(0, 183, 238)');
				viewSnackbar(); //스낵바 띄움
				//location.href = "/study/main.jsp"; //스낵바 내려간 후에 메인으로 이동 처리
				setTimeout(function(){ location.href = "/study/main"; }, 2000);
			}else{  //0인 경우 비밀번호 변경 실패, 비밀번호 입력, 확인 불일치한 경우
				$('#toast').html('<em class="fa fa-times"></em> 입력하신 비밀번호가 다릅니다.'); 
				$('#toast').css('background-color', 'rgb(255, 110, 110)');
				viewSnackbar(); //스낵바 띄움
			}
		}
	});
});

	var charPw = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

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

		//========= Password 부분 ============
		
	// 비밀번호 유효성검사 비밀번호의 경우에는 버튼을 누를때마다 변화가 생기도록 하여 keyup event를 활용함.
	$('#newPw1').keyup(function(){
		var password = document.getElementById("newPw1").value;

		// 길이, 알파벳 
		if(password.length >= 8 && password.length <= 16 
					&& containsCharOnly(password, charPw)){
				
			$('#pwcheck').html("사용 가능한 비밀번호입니다.");
			document.getElementById("pwcheck").style.color = 'blue';
		}else{
			$('#pwcheck').html("사용 불가능한 비밀번호입니다.");
			document.getElementById("pwcheck").style.color = 'red';
		}
	});
	
	//========= Password 확인부분 ============
	// 단순히 password와 비교만 하면됨.
	$('#newPw2').keyup(function(){
		var passwordConf = document.getElementById("newPw2").value;
		var password = document.getElementById("newPw1").value; 
		
		if(passwordConf == password){
			$('#pwcheck2').html("비밀번호 일치");
			document.getElementById("pwcheck2").style.color = 'blue';
		}else{
			$('#pwcheck2').html("비밀번호 불일치");
			document.getElementById("pwcheck2").style.color = 'red';
		}
	});
	
	var passwordV = false;
	
	// 비밀번호 변경하기 클릭 시,
	$('.changePw').on("click", function(){
 		
		// password 유효성
		if(document.getElementById("pwcheck").style.color == 'blue' && 
				document.getElementById("pwcheck2").style.color == 'blue'){
			passwordV = true;
		}
	});
</script>

</body>
</html>