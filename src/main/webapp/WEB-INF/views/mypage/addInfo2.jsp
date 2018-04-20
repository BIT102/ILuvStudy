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

<!-- fafa img -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- scripts -->
<script type="text/javascript"
	src="/resources/assets/js/modernizr.custom.97074.js"></script>
	
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<!-- ========================================================= -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- ========================================================= -->
 
 <style>
  
    
.service-list .col-md-4 {
 	 width:280px !important;
}

.service-list .service-content text-center {
 	 width:280px !important;
}


.row {
 margin:0 !important;
}

#btn-success:hover {
    background-color: #31b0d5;
    border-color: #269abc;
    color:white;
}

#btn-success {
    background-color: #5bc0de;
    border: 1px solid black;
    margin-right: 10px;
    float:right;
    color:white;
}

.center-block i{
	margin-top:10px;
}

.faq-a {
	height:300px !important;
}

.faq-q {
	background-color:white;
	margin-bottom:15px;
}

.page-head {
    background: url(/resources/assets/img/services-bg.jpg) !important;
    background-size: cover !important;
    background-position: center !important;
    background-repeat: no-repeat !important;
}
    
    </style>
    
    
    <script>
	$(document).ready(function(){
		if("${result}"=="수정되었습니다."){
			alert("${result}");
		}
	})
</script>
    
    
</head>


<body>


	<!-- // Navigation -->
<%@include file="../nav.jsp"%>
<!-- header begin -->
<div id="about-page">
            <header class="page-head">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <ol class="breadcrumb">
                                    <li><a href="/study/main">Home</a></li>
                                    <li class="active">Profile</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->
</div>


<section class="bg-light-gray">

		<div class="container" style="top:30%; background-color: #f9f9f9;">

      <div id="service-page">

                <!--  begin services section -->


                        <div class="headline text-center">
                        
                            <div class="row">

                                <div class="col-md-6 col-md-offset-3">
                                    <h2 class="section-title">My page</h2>
                                </div>
                            </div>
                        </div> <!-- /.headline -->

                        <div class="service-list">
                            <div class="row">
                            
                                <div class="col-md-4">
                                    <div class="service-content text-center">
                                        <div class="service-icon-box">
                                            <div class="service-icon center-block">
                                                <a href="profile"><i class="fa fa-address-book"></i></a>
                                            </div>
                                        </div> <!--  end of .service-icon-box  -->
                                        <div class="service-info">
                                            <h3 class="service-heading">My profile</h3>
                                        </div> <!--   end of .service-info  -->
                                    </div> <!--  end of .service-content  -->
                                </div>
                            
                                <div class="col-md-4">
                                    <div class="service-content text-center">
                                        <div class="service-icon-box">
                                            <div class="service-icon center-block">
                                                <a href="addInfo"><i class="fa fa fa-address-card"></i></a>
                                            </div>
                                        </div> <!--  end of .service-icon-box  -->
                                        <div class="service-info">
                                        
                                        <!-- 부가정보랑 비밀번호 변경을 넣습니다. -->
                                            <h3 class="service-heading">부가정보 관리</h3>
                                        </div> <!--   end of .service-info  -->
                                    </div> <!--  end of .service-content  -->
                                </div>

                                <div class="col-md-4">
                                    <div class="service-content text-center">
                                        <div class="service-icon-box">
                                            <div class="service-icon center-block">
                                               <a href="bookmark"><i class="fa fa fa-leanpub"></i></a>
                                            </div>
                                        </div> <!--  end of .service-icon-box  -->
                                        <div class="service-info">
                                           <h3 class="service-heading">스터디 관리</h3>      
                                        </div> <!--   end of .service-info  -->
                                    </div> <!--  end of .service-content  -->
								</div>
								
								<div class="col-md-4">
                                    <div class="service-content text-center">
                                        <div class="service-icon-box">
                                            <div class="service-icon center-block">
                                               <a href=""><i class="fa fa-frown-o" onclick="quit();"></i></a>
                                            </div>
                                        </div> <!--  end of .service-icon-box  -->
                                        <div class="service-info">
                                            <h3 class="service-heading">회원 탈퇴</h3>      
                                        </div> <!--   end of .service-info  -->
                                    </div> <!--  end of .service-content  -->
								</div>
								
                            </div> <!--  end of .row  -->
                        </div> <!--  end of .service-list  -->
                        
                        
                        <!-- 프로필 -->
                        <div class="headline text-center">
                        
                            <div class="row">

                                <div class="col-md-6 col-md-offset-3">
                                    <h2 class="section-title">부가정보 관리</h2>
                                </div>
                            </div>
                        </div> <!-- /.headline -->
                        
                     <form name="addInfoForm" action="/addInfo" method="post">   
                        				<div>* 부가정보</div>
											<table class="table table-hover">
												<tbody>
												 <tr>
								
													<th>관심 카테고리</th>
														<td><button onclick="show()">#IT</button></span> <span><button
															onclick="show2()">#영어</button></span> <span><button
															onclick="show3()">#공무원</button></span> <br>
																<div class="IT" id="IT">
																	<input type="checkbox" name="IT" value="JAVA" id="01"> JAVA <input
																		type="checkbox" name="IT" value="spring" id="02"> SPRING <input
																		type="checkbox" name="IT" value="html" id="03"> HTML/CSS
																</div>
														
																<div class="ENGLISH" id="ENGLISH">
																	<input type="checkbox" name="english" value="toeic" id="04">
																	TOEIC <input type="checkbox" name="english" value="speaking" id="05">
																	SPEAKING <input type="checkbox" name="english" value="opic" id="06">
																	OPIC
																</div>
														
																<div class="GONG" id="GONG">
																	<input type="checkbox" name="civil" value="administration" id="07">
																	행정 <input type="checkbox" name="civil" value="police" id="08">
																	경찰 <input type="checkbox" name="civil" value="fireman" id="09">
																	소방
																</div>
														</td>
														
												</tr>
												 <tr>
								
													<th>관심지역</th>
													<td>
													<p>지역대분류</p>
													<select name="rDId" id="rDId">
									
														<option value='' selected>--</option>
									
														<% int cataNum2 = 64; %>
														<c:forEach items="${rglist}" var="StudyVO">
															<% cataNum2++; %>
															<option value="<%=(char)cataNum2%>">${StudyVO.rDName}</option>
														</c:forEach>
													</select>
									
													<!-- 소분류 -->
													<p>지역소분류</p>
													<select name="rSId" id="rSId">
														<option selected>--</option>
													</select>
														</td>
														
												</tr>
												 <tr>
								
													<th>자기소개</th>
														<td>
																<%-- <textarea row="5" cols="50" name="introduction">${vo.introduction}</textarea> --%>
														<textarea id="summernote" name="introduction">${vo.introduction}</textarea>
														
														</td>
														
												</tr>
												 <tr>
								
													<th>홈페이지</th>
														<td><input type="url" name="homepage"
														value="${vo.homepage}" class="form-control" id="homepage"
														style="width: 550px;" readonly>
														</td>
														
												</tr>
																																															
												</tbody>	
											</table>
											
													<input type="hidden" value="${login.email}" name="email" readonly>
											
													<div>
														<input type="submit" id="btn-success" value="저장하기" style="width:80px; height:42px;">
													</div>
										<!-- </form>	 -->							
													
                                                <!-- begin faq-widget -->
                            <div class="faq-widget" style="margin-top:70px;">

	                                <div class="topics">
	                                    <div class="faq-c">
	                                        <div class="faq-q">
	                                                                                                            비밀번호 변경 <span class="faq-t">+</span>
	                                        </div>
	                                        <div class="faq-a">
												<div>* 비밀번호변경</div>
													<table class="table table-hover">
													<tbody>
												 		<tr>
												 		<th>기존 비밀번호</th>
															<td><input type="password" name="nowPw"
																 class="form-control" id="nowPw"
																style="width: 550px;">
															</td>
															
												 		</tr>
												 		
												 		<tr>
												 		<th>새 비밀번호</th>
															<td><input type="password" pattern=".{8,16}" name="newPw1"
																 class="form-control" id="newPw1"
																style="width: 550px;" placeholder="8자리에서 16자리 이하 영문, 숫자로만 설정해 주세요.">
																<p id = "pwcheck" style = "color:red;padding-top: 15px;margin: 0;">비밀번호를 입력하세요</p>
															</td>
												 		</tr>												 		
												 		
												 		<tr>												 		<tr>
												 		<th>비밀번호 확인</th>
															<td><input type="password" pattern=".{8,16}" name="newPw2"
																 class="form-control" id="newPw2"
																style="width: 550px;" placeholder="비밀번호를 한번 더 입력해주세요.">
																<p id = "pwcheck2" style = "color:red;padding-top: 15px;margin: 0;">비밀번호를 재입력하세요</p>
															</td>
												 		</tr>	
												 	</tbody>
												 	</table>
												 	
												 	<input type="hidden" value="${login.email}" name="email" readonly>
												 		
												 	<div>
  														 <input id="btn-success" class="changePw" type="submit" value="변경하기" style="width:80px; height:42px;">
													</div>		
	                                        </div>
	                                    </div>
	                                </div>
	                            </div> <!-- /.faq-widget -->

                 </div> <!-- end of .container -->
        </div>
  </form>	      
</section>

<%@include file="../footer.jsp"%>

</body>

	<!-- 메뉴 드랍다운 버튼 (비밀번호 변경 뜨게 하는 거) -->
	 <script>
	 $(".faq-q").click( function () {
	     var container = $(this).parents(".faq-c");
	     var answer = container.find(".faq-a");
	     var trigger = container.find(".faq-t");
	     
	     answer.slideToggle(200);
	     
	     if (trigger.hasClass("faq-o")) {
	       trigger.removeClass("faq-o");
	     }
	     else {
	       trigger.addClass("faq-o");
	     }
	   });
	</script>

	<!-- 카테고리 -->
 	<script>
			function show() {
				document.getElementById("IT").style.visibility = "visible";
			}

			function show2() {
				document.getElementById("ENGLISH").style.visibility = "visible";
			}

			function show3() {
				document.getElementById("GONG").style.visibility = "visible";
			}

			// // class명으로 보이기/사라지기
			// function show(){
			//     var kk = document.getElementsByClassName("IT");
			//     kk[0].style.visibility = "visible"
			// }
	
	</script>
	<!-- select지역 이벤트       -->
 	<script>
		$("#rDId").change(function(){
		
			var bigNum2 = $(this).val()
			
			console.log(bigNum2);
			smallCat2(bigNum2);
		})

		function smallCat2(bigNum2){
			$.getJSON(
				"register1/region/"+bigNum2,
				function(data){
					var str = "";

					$(data).each(function(){
						str += "<option value="+this.rSId+">"+this.rSName+"</option>";							
					});
					
					$("#rSId").html(str);
				}
			)
		}			
	</script> 
			
	<!-- 자기소개 -->		
	<script>
		$(document).ready(function() {
			  $('#summernote').summernote();
			});
	</script>
			
	<script>
		$(document).ready(function() {
			alert("${result}");
		})
	</script>
	
	<!-- 비밀번호 변경 -->	
<!-- 	<script>
	
	$(".changePw").on("click", function(){
		
		var nowPw = $('#nowPw').val();			//화면에서 입력된 내용은 변수 처리
		var newPw1 = $('#newPw1').val();
		var newPw2 = $('#newPw2').val();
		
		
		console.log(nowPw);
		console.log(newPw1);
		console.log(newPw2);
		
		$.ajax({
			url: '/changePw',
			type: 'POST',
			header:{
				"X-HTTP-Method-Override" : "POST"
			},
			data:{ 	nowPw : nowPw,
					newPw1 : newPw1, // 앞에는 컨트롤러에서 가져다 쓸 이름이고 뒤에는 값임!!
					newPw2 : newPw2		
			},
			success : function(result){ //alert으로 result값을 하면 컨트롤에서 ""안에 쓴 값이 뜸
			alert("수정되었습니다.");
			}
		})
	})
	
	</script> -->
	
	 	<script>
	
	$(".changePw").on("click", function(){
		
		var nowPw = $('#nowPw').val();			//화면에서 입력된 내용은 변수 처리
		var newPw1 = $('#newPw1').val();
		var newPw2 = $('#newPw2').val();
		
		
		console.log(nowPw);
		console.log(newPw1);
		console.log(newPw2);
		
		$.ajax({
			url: '/changePw',
			type: 'POST',
			header:{
				"X-HTTP-Method-Override" : "POST"
			},
			data:{ 	nowPw : nowPw,
					newPw1 : newPw1, // 앞에는 컨트롤러에서 가져다 쓸 이름이고 뒤에는 값임!!
					newPw2 : newPw2		
			},
			success : function(result){ //alert으로 result값을 하면 컨트롤에서 ""안에 쓴 값이 뜸
				if(result == "success"){
					alert("수정되었습니다.");
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
	
	<!-- 회원 탈퇴 -->
	<script>
	function quit() {
		var msg = "정말 탈퇴하시겠습니까?"
		var flag = confirm(msg);
		
		if(flag==true) {
				
			$.ajax({
				url: '/quit',
				type: 'POST',
				header:{
					"X-HTTP-Method-Override" : "POST"
				},
				success : function(result){ //alert으로 result값을 하면 컨트롤에서 ""안에 쓴 값이 뜸
				alert("안녕히가세요");
				}
			});
			
		} else {
			alert("취소하였습니다.")
		}
	}

	</script>
	
	<script>
	$(document).ready(function() {
	     $('#summernote').summernote({
	             height: 300,                 // set editor height
	             minHeight: null,             // set minimum height of editor
	             maxHeight: null,             // set maximum height of editor
	             focus: true                  // set focus to editable area after initializing summernote
	     });
	});

	
	</script>
	
		

</html>