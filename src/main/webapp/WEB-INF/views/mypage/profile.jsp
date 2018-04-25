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

	<!-- 섬머노트 시작 -->
	
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<script>
var sn = jQuery.noConflict();
</script>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script>
sn(document).ready(function() {
	
	
	sn('#summernote').summernote({

		height: 150,                 // set editor height
		minHeight: null,             // set minimum height of editor
		maxHeight: null,             // set maximum height of editor
		focus: true,                  // set focus to editable area after initializing summernote
		
		// 편집도구 툴팁 종류 선택   
		toolbar: [
		   ['style', ['bold', 'italic', 'underline', 'clear']],
		   ['font', ['strikethrough']], 
		   ['fontsize', ['fontsize']],
		   ['color', ['color']],
		   ['para', ['ul', 'ol', 'paragraph']]
		 ]
           
	});   
 
});
</script>

	<!-- 섬머노트 끝 -->

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


/* 썸머노트 버튼 스타일 시작 */
button[type="button"] {

	width:1px;
	height:35px;
	/* margin:5px; */
	border-radius:10%;
	border: 1px solid gray;
	/* style="padding-right : 30px; */
	padding-right : 30px;
}

.note-toolbar .note-fontsize .note-btn-group button,
.note-toolbar .note-para .note-btn-group button {
    line-height: 12px !important;
}
/* 썸머노트 버튼 스타일 끝 */

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
                                    <h2 class="section-title">My page</h2>
                                </div>
                            </div>
                        </div> <!-- /.headline -->

                        <div class="service-list">
                            <div class="row">
                            
                                <div class="col-md-3 col-xs-4">
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
                            
                                <div class="col-md-3 col-xs-4">
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

                                <div class="col-md-3 col-xs-4">
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
								
								<div class="col-md-3 col-xs-4">
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
									style="width: 550px; display:inline-block;"
									onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
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
									style="width: 550px; display:inline-block" pattern="[0-9]{11}"
									placeholder="ex)01012345678">
								<!-- <input type="button" value="인증하기" class="btn btn-black"></input> -->
								</td>
						</tr>
						
						<tr>
							<th>자기소개</th>
								<td>
									<textarea id="summernote" name="introduction">${vo.introduction}</textarea>
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
	
	console.log(files[0]);
	console.log("check");
	
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
        		success: function(result){
					console.log(result);
					if(result == "success"){
						console.log("들어옴");
						alert("사용 가능한 닉네임입니다.")
					}else{
						alert("중복된 닉네임입니다.");		
					}
				}	
        	})	 
        });
    });
	
   
   function noSpaceForm(obj) { // 공백사용못하게
       var str_space = /\s/;  // 공백체크
       if(str_space.exec(obj.value)) { //공백 체크
           alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
           obj.focus();
           obj.value = obj.value.replace(' ',''); // 공백제거
           return false;
       }
    // onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"
   }
   
</script>

</html>