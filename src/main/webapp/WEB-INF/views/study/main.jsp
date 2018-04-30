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

#load {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: fixed;
	display: block;
	opacity: 0.8;
	background: white;
	z-index: 99;
	text-align: center;
}

#load > img {
	position: absolute;
	top: 50%;
	left: 50%;
	z-index: 100;
}



#keywordInput {
	width: 300px;
	height: 40px;
	padding-left: 8px;
	margin-right: 30px;
	border: none;
	border-bottom: 2px solid black;
	background-color: transparent;
}
#loadMore { 
	width:100%;
	height:35px;
	background-color:white;
	border:1px solid gray;
	border-radius:8%;
	margin-top:10px;
}
.vctmo {
	top:100%;
	position:absolute;
	left:33%;
	right:33%;
	bottom:3px;
}
.container{
	position:relative;
}
input:focus{
	outline:0;
}
.itemmore{
	display:none;
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



<body onload="gogogo();">

<div id="load">
	<img src="/resources/assets/img/loading.gif" alt="loading">
</div>

<!-- 
<div id="load">
	<img src="/resources/assets/img/loader.gif" alt="loading">
</div>
 -->



	<div id="home-page">
		
		<!-- // Navigation -->
		<%@include file="../nav.jsp"%>

		<!-- header start -->
		<header id="header" class="header-wrapper home-parallax home-fade">
			<div class="header-overlay"></div>
			<div class="header-wrapper-inner">
				<div class="container">

					<div class="welcome-speech">
						<h1>Welcome to I Luv Study</h1>
						<p id="prakash"></p>
						<input type="text" onKeyDown="onKeyDown();"
							name="keyword" id="keywordInput" placeholder="검색어를 입력하세요">
						<button class="btn btn-white">Search</button>
					</div>
					<!-- /.intro -->

				</div>
				<!-- /.container -->

			</div>
			<!-- /.header-wrapper-inner -->
		</header>
		<!-- /#header -->

		<!--  begin testimonial section  -->
		<!--  begin testimonial section  -->

		<section class="bg-light-gray">
			<div class="container">

				<div class="headline text-center">
					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<h2 class="section-title">New Study</h2>
							<p class="section-sub-title">최근 등록된 스터디 입니다 &amp; 방문을 원하시면
								이미지를 클릭해 주세요</p>
							<!-- /.section-sub-title -->
						</div>
					</div>
				</div>
				<!-- /.headline -->

				<div id="client-speech" class="owl-carousel owl-theme">
					<c:forEach items="${list}" var="studyVO" step="2" varStatus="status">
						<div class="item">
							<div class="row">
								<c:if test="${staus.index%2==0}">
									<div class="col-md-6">
										<div class="client-box">
											<div class="about-client">
												<a
													href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}?bno=${studyVO.bno}">
													
													<c:choose>
													<c:when test="${studyVO.name ne 'a'}">
													<img src="/study/displayFile?fileName=${studyVO.name}" style="width:140px; height:120px;">
													</c:when>
													<c:otherwise>
													<img src="/resources/assets/img/ha.jpg" style="width:140px; height:120px;">
													</c:otherwise>
													</c:choose>
												</a>
											</div>
											<!-- end of /.about-client -->
											<div class="main-speech">
												<p>
													<strong class="text-cut" style="font-size:20px; margin-bottom:10px;">${studyVO.title}</strong><br> 
													${studyVO.nickname}<br> 
													${studyVO.cDName} ${studyVO.cSName}<br> 
													${studyVO.rDName} [ ${studyVO.rSName} ]<br> 
										
												</p>
											</div>
											<!-- end of /.main-speech  -->
										</div>
										<!-- end of /.client-box -->
									</div>
								</c:if>
								<c:set var="test" value="${list[status.index+1]}" />

								<div class="col-md-6">
									<div class="client-box">
										<div class="about-client">
											<a
												href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}?bno=${test.bno}">
											
											<c:choose>
											<c:when test="${test.name ne 'a'}">
											<img src="/study/displayFile?fileName=${test.name}" style="width:140px; height:120px; object-fit: cover;">
											</c:when>
											<c:otherwise>
											<img src="/resources/assets/img/ha.jpg" style="width:140px; height:120px; object-fit: cover;">
											</c:otherwise>
											</c:choose>
				
											</a>
										</div>
										<!-- end of /.about-client -->
										<div class="main-speech">
											<p>
												<strong class="text-cut" style="font-size:20px; margin-bottom:10px;"> ${test.title}</strong><br> 
												${test.nickname}<br> 
												${test.cDName} ${test.cSName}<br> 
												${test.rDName} [ ${test.rSName} ]<br>
			
											</p>
										</div>
										<!-- end of /.main-speech  -->
									</div>
									<!-- end of /.client-box -->
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			
			<div class="container" style="margin-bottom:70px; margin-top:30px;">

				<div class="headline text-center">
					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<h2 class="section-title">Best Study</h2>
							<p class="section-sub-title">조회 Best 스터디 입니다 &amp; 방문을 원하시면 이미지를 클릭해 주세요</p>
							<p class="section-sub-title">더 보기를 눌러서 항목을 늘려주세요 </p>
							<!-- /.section-sub-title -->
						</div>
					</div>
				</div>

				
				<c:forEach items="${vctList}" var="studyVO" >
				
						<div class="col-md-4 col-sm-6 itemmore">
						
							<div class="portfolio-item" style="width:370px;">
								
								

							<a href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}?bno=${studyVO.bno}">
								<div class="img-text">
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
								
									<a href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}?bno=${studyVO.bno}">

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
				
					<%-- 	<div class="col-md-4 col-sm-6 itemmore">
							<div class="portfolio-item">
								<div class="item-image">
									<a
										href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}?bno=${studyVO.bno}">


										<c:choose>
											<c:when test="${studyVO.name ne 'a'}">
												<img src="/study/displayFile?fileName=${studyVO.name}"
													class="img-responsive center-block"
													style="width: 370px; height: 216px;object-fit: cover;">
											</c:when>
											<c:otherwise>
												<img src="/resources/assets/img/ha.jpg"
													class="img-responsive center-block"
													style="width: 370px; height: 216px;object-fit: cover;">
											</c:otherwise>
										</c:choose>

										<div>
											<span><i class="fa fa-plus"></i></span>
										</div>
									</a>
								</div>

								<div class="item-description">
									<div class="row">
										<div class="col-xs-6">
											<span class="item-name text-cut">제목 :
												${studyVO.title} </span> <span style="width: 280px;">주인 :
												${studyVO.nickname}<br> 종류 : ${studyVO.cDName} /
												${studyVO.cSName}<br> 지역 : ${studyVO.rDName} /
												${studyVO.rSName}<br> 등록 : <fmt:formatDate
													pattern="yyyy-MM-dd" value="${studyVO.regdate}" />
											</span>
										</div>
										<div class="col-xs-6">
											<span class="like"> <i class="fa fa-eercast"></i>
												${studyVO.vct}
											</span>
										</div>
									</div>
								</div>
								<!-- end of /.item-description -->
							</div>
							<!-- end of /.portfolio-item -->
						</div> --%>
					</c:forEach>
					<div class="vctmo">
						<input type="button" id="loadMore" value="더 보기">
					</div>
			</div>		
	</section>
	<!--  end of testimonial  section -->

	<!-- footer-navigation start -->
<!-- 	<nav class="hidden-xs hidden-sm navbar footer-nav" role="navigation">
		<div class="container">

			<div class="navbar-header">

				navbar logo
				<div class="navbar-brand">
					<span class="sr-only">&copy;I Luv Study</span> <a href="index.html">
						&copy;I Luv Study </a>
				</div>
				navbar logo

			</div> -->
			<!-- /.navbar-header -->

			<!-- nav links -->
			<%@include file="../footer.jsp"%>


		</div>
		<!-- /.container -->

	<!--  Necessary scripts  -->

	<script type="text/javascript"
		src="/resources/assets/js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript"
		src="/resources/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="/resources/assets/js/owl.carousel.js"></script>
	<script type="text/javascript"
		src="/resources/assets/js/jquery.hoverdir.js"></script>


	<script>
	//더보기하려고 만든 함수입니다
	$(function () {
		//세개먼저보여주기
		$(".itemmore").slice(0,3).show()
		//더보기 클릭햇을대
		$("#loadMore").on("click", function(){
			//숨겨진걸 보여준다 3개 더
			$(".itemmore:hidden").slice(0, 3).slideDown();
		})
	});
	</script>


	<!-- script for portfolio section using hoverdirection -->
	<script type="text/javascript">
            $(function() {
                $('.portfolio-item > .item-image').each( function() { $(this).hoverdir({
                    hoverDelay : 75
                }); } );
            });
        </script>



	<!-- script for testimonial section using owl carousel -->
	<script type="text/javascript">
            $(document).ready(function() {
 
                $("#client-speech").owlCarousel({
                 
                    autoPlay: 5000, //Set AutoPlay to 3 seconds
                    stopOnHover: true,
                    singleItem:true
                });
 
            });
        </script>

	<!-- 타이핑 효과 -->
	<script>
        
        var mess = "여기는 I Luv Study 홈페이지 입니다.";
        
    	var count=0;
    	var newsno=0;
    	
    	function gogogo() {
    		document.all("prakash").innerText="_"+mess.substring(0,count++);
    		if(count>=mess.length){
    			count=0;
    			newsno++;
    			
    			if(newsno>=mess.length)
    				newsno--;
    			
    		}
    		setTimeout("gogogo()", 200);
    	}
        
        </script>
	<!-- 검색 -->
	<script>
  $(document).ready(function(){
	$(".btn-white").on("click", function(event){
		self.location = "listAll"
			+ '${pageMakerStudy.makeQuery(1)}'
			+ "?searchType="
			+ "tcn"
			/* + $("select option:selected").val() */
			+ "&keyword=" + encodeURIComponent($('#keywordInput').val());            
	})  
  })
  
  function onKeyDown() {
	  if(event.keyCode==13){
		  self.location = "listAll"
				+ '${pageMakerStudy.makeQuery(1)}'
				+ "?searchType="
				+ "x"
				/* + $("select option:selected").val() */
				+ "&keyword=" + encodeURIComponent($('#keywordInput').val());  
	  }
  }
  
  </script>

<script type="text/javascript">
	$(window).load(function() {
		$('#load').hide();
	});
</script>
</body>
</html>