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
                                <div class="col-md-3">
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
               
                                <div class="col-md-3">
                                    <div class="service-content text-center">
                                        <div class="service-icon-box">
                                            <div class="service-icon center-block">
                                                <!-- <a href="changePw"><i class="fa fa-expeditedssl"></i> -->
                                                <a href="changePw"><i class="fa fa-lock"></i>
                                            </div>
                                        </div> <!--  end of .service-icon-box  -->
                                        <div class="service-info">
                                            <h3 class="service-heading">비밀번호 변경</h3>
                                        </div> <!--   end of .service-info  -->
                                    </div> <!--  end of .service-content  -->
                                </div>

                                <div class="col-md-3">
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
								
								<div class="col-md-3">
                                    <div class="service-content text-center">
                                        <div class="service-icon-box">
                                            <div class="service-icon center-block">
                                               <a href="quit"><i class="fa fa-frown-o"></i></a>
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
                                    <h2 class="section-title">회원 탈퇴</h2>
                                </div>
                            </div>
                        </div> <!-- /.headline -->
                        
                     <!-- <form name="quitForm" action="/quit" method="post">   --> 
                        				<div>* 회원 탈퇴 시, 3개월간 재가입이 불가능합니다.
                        					 	탈퇴를 원하시면, 비밀번호를 입력해 주시기 바랍니다.
                        				</div>
													<table class="table table-hover">
													<tbody>
												 		<tr>
												 		<th>비밀번호 입력</th>
															<td><input type="password" name="confirmPw"
																 class="form-control" id="confirmPw"
																style="width: 550px;">
															</td>											
												 		</tr>
							
												 	</tbody>
												 	</table>
												 	
												 	<input type="hidden" value="${login.email}" name="email" readonly>
												 		
												 	<div>
  														 <input id="btn-success" class="quit" type="submit" value="탈퇴하기" style="width:80px; height:42px;">
  														 <!-- <button id="btn-success" class="quit" onclick="quit();" style="width:80px; height:42px;">탈퇴하기</button> -->
													</div>		
			    

                 </div> <!-- end of .container -->
        </div>
					<!-- </form> -->
</section>

<%@include file="../footer.jsp"%>

</body>



	<!-- 회원 탈퇴 -->
	<script>
 	
 	$(".quit").on("click", function(){
		
		var msg = "정말 탈퇴하시겠습니까?"
		var flag = confirm(msg);
		var confirmPw = $('#confirmPw').val();
		
			if(flag==true) {
					
				$.ajax({
					url: '/quit',
					type: 'POST',
					header:{
						"Content-type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					data:{
						confirmPw : confirmPw
					},
					success : function(result){ //alert으로 result값을 하면 컨트롤에서 ""안에 쓴 값이 뜸
						console.log(result);
						if(result == "success"){
							alert("안녕히 가세요");
							location.href = "http://localhost:8080/study/main"
						}else{
							alert("비밀번호를 확인해 주세요.")
						}	
					}
				});
				
			} else {
				alert("취소하였습니다.")
				return false;
			}
	});  
	
	</script>
	

</html>