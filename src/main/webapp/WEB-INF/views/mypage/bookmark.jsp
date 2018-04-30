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
	overflow:hidden !important;
	height:auto !important;
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
.text-cut{
	display: inline-block;
	width:283px;
	white-space: nowrap;
	overflow: hidden; 
	text-overflow: ellipsis;
}

.img-text{
	position:absolute;
	top:0;
	z-index:1;
	max-width: 370px;
    width: 100%;
	height:300px;
    object-fit: cover;
    background-color:black;
    opacity:0.7;
    color:white;
    line-height:60px;
}

.portfolio-item {
 	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);"
 	}
.img-text p {
	margin-bottom:0;
	color:white;
	margin-left:30px;
	font-size:15px;
}

.img-text:hover{
	background-color:#4892a8;
    opacity:0.7;
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
                                    <h2 class="section-title">스터디 관리</h2>
                                </div>
                            </div>
                        </div> <!-- /.headline -->
                        
                                                <!-- begin faq-widget -->
                            <div class="faq-widget">

                                <div class="topics">
                                    <div class="faq-c">
                                        <div class="faq-q">
                                            	스크랩 <span class="faq-t">+</span>
                                        </div>
                                        <div class="faq-a">
						                    <c:forEach items="${list}" var="studyVO">
												<div class="col-md-4 col-sm-6 itemmore">
												
													<div class="portfolio-item" style="width:370px;">
														
														
						
													<a href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}&bno=${studyVO.bno}">
														<div class="img-text" >
															<div style="margin-top:20px;">
																<div class="col-md-12 col-xs-12 text-cut" style=" font-size:30px; text-align:center;">${studyVO.title}</div>
																<div class="col-md-12 col-xs-12"></div>
															</div>
															<div>
																<p style="margin-top:174px;"><strong>#  ${studyVO.cDName}</strong></p>
																<p>#  ${studyVO.cSName}</p>
																
															</div>
						
															<div style="margin-top:19px; margin-left:47%">
															
																<p style="width:150px; text-align:right;"><fmt:formatDate
																			pattern="yyyy-MM-dd" value="${studyVO.regdate}" /><br>
																 <i class="fa fa-eye" style="color:red;"></i> ${studyVO.vct}　
																 <i class="fa fa-user" style="color:red;"></i> ${studyVO.now}　
																 <i class="fa fa-comment" style="color:red;"></i> ${studyVO.rct}
																 </p>
															</div>					
														</div>
													</a>
													
													
														<div class="item-image">
														
															<a href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}&bno=${studyVO.bno}">
						
																<c:choose>
																	<c:when test="${studyVO.name ne 'a'}">
																	
																	 	<img src="/study/displayFile?fileName=${studyVO.name}"
																			class="list-img img-responsive center-block"
																			style="max-width:370px; width:100%;height:300px;object-fit: cover;">
																	
																	
																	</c:when>
																	<c:otherwise>
																	
																		 <img src="/resources/assets/img/ha.jpg"
																			class="list-img img-responsive center-block "
																			style="max-width:370px; width:100%;height:300px;object-fit: cover;">
																	
																	</c:otherwise>
																</c:choose>
						
															</a>
														
														</div>
															
														<div class="item-description">
															<div class="row">
																<div style="margin-left:10%; font-size:15px;">
																	<p style="margin-bottom:0;"><strong>작성자 : ${studyVO.nickname}</strong></p>
																</div>
																<div style="margin-left:45%; font-size:17px; color:#5bc0de;">
																<strong>${studyVO.rDName}[ ${studyVO.rSName} ]</strong>
																</div>
															</div>
														</div>
														<!-- end of /.item-description -->
													</div>
													<!-- end of /.portfolio-item -->
												</div>
											</c:forEach>
	                                        </div>
	                                    </div>
	                                </div>
	
	                                <div class="topics">
	                                    <div class="faq-c">
	                                        <div class="faq-q">
	                                            	모집 <span class="faq-t">+</span>
	                                        </div>
	                                        <div class="faq-a">
	          
								          		<c:forEach items="${relist}" var="studyVO">
													<div class="col-md-4 col-sm-6 itemmore">
												
													<div class="portfolio-item" style="width:370px;">
														
														
						
													<a href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}&bno=${studyVO.bno}">
														<div class="img-text" >
															<div style="margin-top:20px;">
																<div class="col-md-12 col-xs-12 text-cut" style=" font-size:30px; text-align:center;">${studyVO.title}</div>
																<div class="col-md-12 col-xs-12"></div>
															</div>
															<div>
																<p style="margin-top:174px;"><strong>#  ${studyVO.cDName}</strong></p>
																<p>#  ${studyVO.cSName}</p>
																
															</div>
						
															<div style="margin-top:19px; margin-left:47%">
															
																<p style="width:150px; text-align:right;"><fmt:formatDate
																			pattern="yyyy-MM-dd" value="${studyVO.regdate}" /><br>
																 <i class="fa fa-eye" style="color:red;"></i> ${studyVO.vct}　
																 <i class="fa fa-user" style="color:red;"></i> ${studyVO.now}　
																 <i class="fa fa-comment" style="color:red;"></i> ${studyVO.rct}
																 </p>
															</div>					
														</div>
													</a>
													
													
														<div class="item-image">
														
															<a href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}&bno=${studyVO.bno}">
						
																<c:choose>
																	<c:when test="${studyVO.name ne 'a'}">
																	
																	 	<img src="/study/displayFile?fileName=${studyVO.name}"
																			class="list-img img-responsive center-block"
																			style="max-width:370px; width:100%;height:300px;object-fit: cover;">
																	
																	
																	</c:when>
																	<c:otherwise>
																	
																		 <img src="/resources/assets/img/ha.jpg"
																			class="list-img img-responsive center-block "
																			style="max-width:370px; width:100%;height:300px;object-fit: cover;">
																	
																	</c:otherwise>
																</c:choose>
						
															</a>
														
														</div>
															
														<div class="item-description">
															<div class="row">
																<div style="margin-left:10%; font-size:15px;">
																	<p style="margin-bottom:0;"><strong>작성자 : ${studyVO.nickname}</strong></p>
																</div>
																<div style="margin-left:45%; font-size:17px; color:#5bc0de;">
																<strong>${studyVO.rDName}[ ${studyVO.rSName} ]</strong>
																</div>
															</div>
														</div>
														<!-- end of /.item-description -->
													</div>
													<!-- end of /.portfolio-item -->
												</div>
												</c:forEach>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div> <!-- /.faq-widget -->
	                            
					
					  <div class="faq-widget">

                                <div class="topics">
                                    <div class="faq-c">
                                        <div class="faq-q">
                                            	신청<span class="faq-t faq-o">+</span>
                                        </div>
                                        <div class="faq-a" style="display:block">
													<!-- 신청 스터디 불러오기 -->
											<c:forEach items="${aplist}" var="studyVO">
												<div class="col-md-4 col-sm-6 itemmore">
												
													<div class="portfolio-item" style="width:370px;">
														
														
						
													<a href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}&bno=${studyVO.bno}">
														<div class="img-text" >
															<div style="margin-top:20px;">
																<div class="col-md-12 col-xs-12 text-cut" style=" font-size:30px; text-align:center;">${studyVO.title}</div>
																<div class="col-md-12 col-xs-12"></div>
															</div>
															<div>
																<p style="margin-top:174px;"><strong>#  ${studyVO.cDName}</strong></p>
																<p>#  ${studyVO.cSName}</p>
																
															</div>
						
															<div style="margin-top:19px; margin-left:47%">
															
																<p style="width:150px; text-align:right;"><fmt:formatDate
																			pattern="yyyy-MM-dd" value="${studyVO.regdate}" /><br>
																 <i class="fa fa-eye" style="color:red;"></i> ${studyVO.vct}　
																 <i class="fa fa-user" style="color:red;"></i> ${studyVO.now}　
																 <i class="fa fa-comment" style="color:red;"></i> ${studyVO.rct}
																 </p>
															</div>					
														</div>
													</a>
													
													
														<div class="item-image">
														
															<a href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}&bno=${studyVO.bno}">
						
																<c:choose>
																	<c:when test="${studyVO.name ne 'a'}">
																	
																	 	<img src="/study/displayFile?fileName=${studyVO.name}"
																			class="list-img img-responsive center-block"
																			style="max-width:370px; width:100%;height:300px;object-fit: cover;">
																	
																	
																	</c:when>
																	<c:otherwise>
																	
																		 <img src="/resources/assets/img/ha.jpg"
																			class="list-img img-responsive center-block "
																			style="max-width:370px; width:100%;height:300px;object-fit: cover;">
																	
																	</c:otherwise>
																</c:choose>
						
															</a>
														
														</div>
															
														<div class="item-description">
															<div class="row">
																<div style="margin-left:10%; font-size:15px;">
																	<p style="margin-bottom:0;"><strong>작성자 : ${studyVO.nickname}</strong></p>
																</div>
																<div style="margin-left:10%; font-size:15px;">
																	<p style="margin-bottom:0;"><strong>승인여부 : <font color = "red">
 																	<c:if test="${studyVO.apStatus eq 'O'}">승인되었습니다. </c:if>
 																	<c:if test="${studyVO.apStatus eq 'D'}">승인 대기 중입니다.</c:if>
 																	<c:if test="${studyVO.apStatus eq 'X'}">승인 거절되었습니다.</c:if>
 																	</font></strong></p>
																</div>
																<div style="margin-left:45%; font-size:17px; color:#5bc0de;">
																<strong>${studyVO.rDName}[ ${studyVO.rSName} ]</strong>
																</div>
															</div>
														</div>
														<!-- end of /.item-description -->
													</div>
													<!-- end of /.portfolio-item -->
												</div>
											</c:forEach>
	                                     	</div>
	                                    </div>
	                                </div>
					
					
                 </div> <!-- end of .container -->
        </div>
</section>


<%@include file="../footer.jsp"%>

</body>
 
 <!-- 아코디언 메뉴 -->
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

<!-- 회원 탈퇴 스크립트 --> 
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
	<!-- 승인 여부(버튼) -->
	<script>
		$(".apStatus").on("click", function(){
			console.log($(this).val());				
				
			if($(this).val() =="O") {
					alert("승인 되었습니다.")
			}else if($(this).val() =="D"){
					alert("승인 대기중입니다.")
			}else{
					alert("승인 거절되었습니다.")
			};
		});
	</script>  
</html>