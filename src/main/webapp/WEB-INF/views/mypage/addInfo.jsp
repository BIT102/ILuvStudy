<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Summernote test</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


<script>

	
$(document).ready(function() {
	
	
	
	$('#summernote').summernote({
		  height: 150,                 // set editor height
		  minHeight: null,             // set minimum height of editor
		  maxHeight: null,             // set maximum height of editor
		  focus: true                  // set focus to editable area after initializing summernote
		  
		});

});



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

<script>
var upload = document.getElementsByTagName('input')[0],
    holder = document.getElementById('holder'),
    state = document.getElementById('status');

if (typeof window.FileReader === 'undefined') {
  state.className = 'fail';
} else {
  state.className = 'success';
  state.innerHTML = 'File API & FileReader available';
}
 
upload.onchange = function (e) {
  e.preventDefault();

  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
    // note: no onload required since we've got the dataurl...I think! :)
    if (img.width > 560) { // holder width
      img.width = 560;
    }
    holder.innerHTML = '';
    holder.appendChild(img);
  };
  reader.readAsDataURL(file);

  return false;
};
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
                                                <a href="addInfo"><i class="fa fa fa-address-card"></i></a>
                                            </div>
                                        </div> <!--  end of .service-icon-box  -->
                                        <div class="service-info">
                                        
                                        <!-- 부가정보랑 비밀번호 변경을 넣습니다. -->
                                            <h3 class="service-heading">부가정보 관리</h3>
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
                                               <a href=""><i class="fa fa-frown-o" onclick="quit();"></i></a>
                                            </div>
                                        </div> <!--  end of .service-icon-box  -->
                                        <div class="service-info">
                                            <h3 class="service-heading">회원 탈퇴</h3>      
                                        </div> <!--   end of .service-info  -->
                                    </div> <!--  end of .service-content  -->
								</div>
								
								<div class="col-md-3">
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
                        <article>
  <p id="status">File API & FileReader API not supported</p>
  <p><input type=file></p>
  <p>Select an image from your machine to read the contents of the file without using a server</p>
  <div id="holder"></div>
</article>
                     <form name="addInfoForm" action="/addInfo" method="post">   
                        				<div>* 부가정보</div>
											<table class="table table-hover">
												<tbody>
												 <tr>
												 <p><input type=file></p>
													<p><input type=file></p>
  <p>Select an image from your machine to read the contents of the file without using a server</p>
  <div id="holder"></div>
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
																<p><input type=file></p>
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
					  </form>	    
                 </div> <!-- end of .container -->
        </div>
  
</section>

<%@include file="../footer.jsp"%>

</body>
</html>