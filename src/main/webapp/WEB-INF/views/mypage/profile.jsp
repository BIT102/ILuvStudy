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
                                    <li class="active">Profile</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->
</div>


<form name="profileForm" method="post">
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
                                    <h2 class="section-title">My profile</h2>
                                </div>
                            </div>
                        </div> <!-- /.headline -->
                        
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
								<td><input type="text" name="birth"
									value="${vo.birth}" class="form-control" id="birth"
									style="width: 550px;">
								</td>
							</tr>
							
							
						<tr>
							<th>성별</th>
							<td>
								<input type="radio" id="userWoman" name="gender" value="1"  <c:if test="${vo.gender eq '1'}">checked</c:if>> 남성 
                				<input type="radio" id="userWoman" name="gender" value="2"  <c:if test="${vo.gender eq '2'}">checked</c:if>> 여성 
                			</td>
					   </tr>
					   
					   	<tr>
								
							<th>전화번호</th>
								<td style="width:550px"><input type="text" name="phoneNum"
									value="${vo.phoneNum}" class="form-control" id="phone"
									style="width: 550px; display:inline-block">
								<input type="button" value="인증하기" class="btn btn-black"></input>
								</td>
						</tr>
						
						<tr>
						
						     <th>프로필 사진</th>
						     	<td> 회원님의 정면 사진을 올려주세요!<br>
						     	     상대방이 신뢰를 갖고 연락할 확률이 높아져요!<br><br>
						     	     
						     	  <input type='file' name='file' value=${login.photo } style="display:inline-block;"/> 
						     	  <input type="submit" value="사진업로드">
						     	    
						     	</td>
		
										
						</tbody>	
					</table>
					
		<div>
			<input type="submit" id="btn-success" value="저장하기">
		</div>
					
                 </div> <!-- end of .container -->
        </div> <!--  end of #service-page  -->

</section>
	</form>
<%@include file="../footer.jsp"%>
</body>


<script>
	
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
	 
	 
		$(".fileDrop").on("dragenter dragover", function(event){
			event.preventDefault();  // dragenter, dragover, drop시 기본 동작을 막도록 작성
		});
		
		$(".fileDrop").on("drop", function(event){
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files; // 전달된 파일 데이터를 가져오는 부분(dataTransfer.files)
			var file = files[0];
			console.log(file);
		
			var formData = new FormData();
			formData.append("file", file);
			
			
			//Ajax 활용
			$.ajax({
				url: "/pUploadAjax",
				data: formData,
				dataType: 'text',
				processData: false,
				contentType: false,
				type : 'POST',
				success : function(data){ // 파일명(스트링)이 담김
//					alert(data);
					
					console.log(data);
					console.log(checkImageType(data));
					
					var str = "";
					
					if(checkImageType(data)){
						  str ="<div><a href=pDisplayFile?fileName="+getImageLink(data)+">"
								  +"<img src='pDisplayFile?fileName="+data+"'/>"
								  +"</a><small data-src="+data+">X</small></div>";
					  }else{
						  str = "<div><a href='displayFile?fileName="+data+"'>" 
								  + getOriginalName(data)+"</a>"
								  +"<small data-src="+data+">X</small></div></div>";
					  }
					
	        	$.ajax({
	        		url : "/insertImgUrl",
	        		type : "post",
	        		headers : {
	        			"X-HTTP-Method-Override" : "POST"
	        		},
	        	data:{
	    //    		imgAddrParam : imgAddr
	        		photo : data,
	        		email : document.getElementById("email").value 
	        	},
	        	success:function(result){
//	        		alert(result);
	        	}
		        	})
		        	
		        
		        //photo에 담긴 스트링값(이름)을 vo.photo에 보내고 싶어요.
		       	// 그러려면 어떻게 해야 할까요?
		       	// 이러지말고 src전체를 		
		        
//		    	document.getElementById("changeImg").src = "pDisplayFile?fileName="+data;
	        	document.getElementById("changeImg").setAttribute("src","pDisplayFile?fileName="+data);
	        						
//				$(".uploadedList").append(str);
					
//					imgAddr = data; //data를 imgAddr에 담아 둠
				}
			});
			
		});
		
		// jsp에서 파일 출력하기
		function checkImageType(fileName){
			
			var pattern  = /jpg$|gif$|png$|jpeg$/i; 	//마지막 i는 대,소문자 구분 없음
			
			return fileName.match(pattern);
		}
		
		
		//파일 링크 처리(파일의 이름이 길게 출력되는 걸 줄여주는 기능)
		function getOriginalName(fileName){
			
			if(checkImageType(fileName)){
				return;
			}
			
			var idx = fileName.indexOf("_") + 1;
			return fileName.substr(idx);
		}
		
		
		//이미지 파일의 원본 파일 찾기
		function getImageLink(fileName){
			
			if(!checkImageType(fileName)){
				return;
			}
			var front = fileName.substr(0,12); //년/월/일 경로를 추출하는 용도
			var end = fileName.substr(14);		// 파일 이름 앞의 's_'를 제거하는 용도
			
			return front + end;
		}
		
		// 첨부파일 삭제 처리
 		$(".uploadedList").on("click", "small", function(event){
			
			var that = $(this);
			
			$.ajax({
				url:"deleteFile",
				type:"post",
				data:{fileName:$(this).attr("data-src")},
				dataType:"text",
				success:function(result){
					if(result == 'deleted'){
//						alert("deleted");
						that.parent("div").remove(); // 파일 삭제 후 브라우져 화면에서 썸네일 삭제
					}
				}
			}); 
		});
function quit() {
	var msg = "정말 탈퇴하시겠습니까?"
	var flag = confirm(msg);
	
	if(flag==true) {
		
		var nowPw = $('#nowPw').val();			//화면에서 입력된 내용은 변수 처리
		var newPw1 = $('#newPw1').val();
		var newPw2 = $('#newPw2').val();
		
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
			alert("안녕히가세요");
			}
		});
		
	} else {
		alert("취소하였습니다.")
	}
}
</script>

</html>