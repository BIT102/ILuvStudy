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


                        
                     <form name="addInfoForm" action="/addInfo" method="post">   
                        				<div>* 부가정보</div>
											<table class="table table-hover">
												<tbody>
												 <tr>
								
													<th>자기소개</th>
														<td>
																<%-- <textarea row="5" cols="50" name="introduction">${vo.introduction}</textarea> --%>
														<textarea id="summernote" name="introduction">${vo.introduction}</textarea>
														
														</td>
														
												</tr>
											
																																															
												</tbody>	
											</table>
											
													<input type="hidden" value="${login.email}" name="email" readonly>
											
													<div>
														<input type="submit" id="btn-success" value="저장하기" style="width:80px; height:42px;">
													</div>
										<!-- </form>	 -->							
													
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