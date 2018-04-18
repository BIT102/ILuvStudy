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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<title>I Luv Study</title>

<!-- meta -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<script type="text/javascript" src="/resources/js/upload.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

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

<style>
/* 프로필 사진 폼 */
.fileDrop{
	width: 150px;
	height: 100px;
	border: 1px dotted blue;
	}

	small{
	margin-left: 3px;
	font-weight: bold;
	color: gray;
	}
/* 프로필 사진 끝     */

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

th{
	width:270px;
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
		if("${result11}"=="수정되었습니다."){
			alert("${result11}");
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
                                    <li class="active">마이페이지</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->
</div>



<section class="bg-light-gray">
		<div class="container" style="top:30%; background-color: #f9f9f9; margin-bottom:30px;">


      <div id="service-page">
     
                <!--  begin services section -->


                        <div class="headline text-center">
                        
                            <div class="row">

                                <div class="col-md-6 col-md-offset-3">
                                    <h2 class="section-title">마이페이지</h2>
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
                                            <h3 class="service-heading">프로필</h3>
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
                                    <h2 class="section-title">프로필</h2>
                                </div>
                            </div>
                        </div> <!-- /.headline -->
 						<table class="table table-hover">
						<tbody>
						                       
	                       <tr>
							     <th>프로필 사진</th>
									<td>
										 <div class='uploadedList'>
										  
										  	<div class="mailbox-attachment-info">
												<span class="mailbox-attachment-icon has-img">
													<img src="/study/displayFile?fileName=${vo.photo}" alt="Attachment" style="width:150px; height:150px;" id="proimg">
												</span>
											</div>
										  
										  </div>	
									
									</td>
							     	<td> 
							     	    <p style="margin-bottom:0;">회원님의 정면 사진을 올려주세요!</p>
							     	    <p>상대방이 신뢰를 갖고 연락할 확률이 높아져요!</p>
							     		<input type='file' name='file' style="display:inline-block;" id="i_file"/> 

							     	</td>	
							</tr>	
                       </tbody>
                       </table>
                        
                        
<form name="profileForm" method="post">                        
                        <div>* 기본정보</div>
						<table class="table table-hover">
						<tbody>

                        <tr>
							<th>이메일</th>
								<td><input type="text" name="email"
									value="${login.email}" class="form-control" id="email"
									style="width: 550px;" readonly>
								</td>
						</tr>
							
						 <tr>
							<th>이름</th>
								<td><input type="text" name="name"
									value="${vo.name}" class="form-control" id="name"
									style="width: 550px;">
								</td>
						</tr>
							
					     <tr>
							<th>닉네임</th>
								<td><input type="text" name="nickName"
									value="${vo.nickName}" class="form-control" id="nickName"
									style="width: 550px; display:inline-block;">
									<input type="button" id="nickCheck" value="중복확인" class="btn btn-black"></input>
								</td>
							</tr>		
							
						  <tr>
							<th>생년월일</th>
								<td><input type="text" pattern="[0-9]{6}" placeholder="생년월일 6자리를 입력해 주세요. ex) 950101" name="birth"
									value="${vo.birth}" class="form-control" id="birth"
									style="width: 550px;">
								</td>
							</tr>
														
						<tr>
							<th>성별</th>
							<td>
								<input type="radio" id="userman" name="gender" value="1"  <c:if test="${vo.gender eq '1'}">checked</c:if>> 남성 
                				<input type="radio" id="userWoman" name="gender" value="2"  <c:if test="${vo.gender eq '2'}">checked</c:if>> 여성 
                			</td>
					   </tr>
					   
					   	<tr>
							<th>전화번호</th>
								<td style="width:550px"><input type="text" name="phoneNum"
									value="${vo.phoneNum}" class="form-control" id="phone"
									style="width: 550px; display:inline-block" readonly>
								<!-- <input type="button" value="인증하기" class="btn btn-black"></input> -->
								</td>
						</tr>
					
						</tbody>	

					</table>	
					
		<div>
			<input type="submit" id="btn-success" value="저장하기" style="width:80px; height:42px;">
		</div>
</form>					
                 </div> <!-- end of .container -->
        </div> <!--  end of #service-page  -->

</section>

<%@include file="../footer.jsp"%>
</body>
<script id="template" type="text/x-handlebars-template">
	<div class="mailbox-attachment-info">
		<span class="mailbox-attachment-icon has-img">
			<img src="{{imgsrc}}" alt="Attachment" style="width:150px; height:150px;" value = "{{name}}" id="proimg">
		</span>
			<small class = "small" value = "{{name}}" data-src=data style="cursor:pointer">X</small>
	</div>
</script>
<script>

var count=1;
var sel_file; 
var template = Handlebars.compile($("#template").html()); 

$(document).ready(function(){
	$("#i_file").on("change", handleImgFileSelect);
	
});

function handleImgFileSelect(e) {

	var files = e.target.files;
	var file = files[0]
	
	/* var filesArr = Array.prototype.slice.call(files); */
	
	var formData = new FormData();
	formData.append("file", file);
	

	$.ajax({
		url : '/pUploadForm',
		data : formData,
		dataType : 'text',
		processData : false,
		contentType : false,
		type : 'POST',
		//파일을 드롭했을때 성공시
		success : function(data) {

			console.log("3*****************");
			var fileInfo = getFileInfo(data);
			var html = template(fileInfo);
			if(count>=1){
				/* alert("프로필사진은 한 장만 등록됩니다.") */
				
				console.log($(".uploadedList img").parent().parent());
				
				$(".uploadedList img").parent().parent().remove();
				
				$(".uploadedList").append(html);
				
				count = 1;
			} else {
			$(".uploadedList").append(html);
			count++;
			
			}
		}
	});
}	

//취소버튼
$(".uploadedList").on("click", "small", function(event) {
	--count;
	var that = $(this);
	$.ajax({
		url : "/study/deleteFile",
		type : "post",
		data : {
			fileName : $(this).attr("data-src")
		},
		dataType : "text",
		success : function(result) {
				
				alert("deleted");
				$(this).parent("div").remove();
				$(".uploadedList img").parent().parent().remove();
		}
	});
});

</script> 
<script>
	
	// 닉네임 변경
	 $(document).ready(function(){
	        $("#nickCheck").click(function(){
	        	$.ajax({
	        		url : "/nickCheck",
	        		type : "post",
	        		headers : {
	        			"X-HTTP-Method-Override" : "POST"
	        		},
	        		data:{
	        			nickName : document.getElementById("nickName").value // id가 nickCheck인 value값(중복확인)을 가지고 오겠다.
	        		},
	        		success:function(result){
	        		alert(result);
	        	}
	        	
	        	})	 
	        	 
	        });
	    });
	 
		// 회원 탈퇴 스크립트
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

</html>