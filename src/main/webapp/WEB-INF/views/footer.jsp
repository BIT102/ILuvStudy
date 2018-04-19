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

<!-- scripts -->
<script type="text/javascript"
	src="/resources/assets/js/modernizr.custom.97074.js"></script>

<script type="text/javascript"
	src="/resources/assets/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript"
	src="/resources/assets/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/resources/assets/js/owl.carousel.js"></script>
<script type="text/javascript"
	src="/resources/assets/js/jquery.hoverdir.js"></script>
</head>

<style>
footer{
height: 90px;
background-color:#2d2d2d;
}
.navbar-brand div{
font-size:12px;
color:#6b6b6b;
}
</style>
<body>

	<!-- footer-navigation start -->
	<footer style="padding:0 !important">
	<nav class="hidden-xs hidden-sm navbar footer-nav" role="navigation">
		<div class="container" style="width:80%">

			<div class="navbar-header">
				<!-- navbar logo -->
				<div class="navbar-brand">
				<!-- 	<span class="sr-only">&copy;ILuvStudy</span> 
					<a href="/study/main">&copy;ILuvStudy </a> -->
					<div>프로젝트명 : I Luv Study</div>
					<div>팀명 : 코드인</div>
					<div>팀원 : 김상욱, 김소희, 조정인, 박영원, 권한길</div>
				</div>
				<!-- navbar logo -->
			</div>
			<!-- /.navbar-header -->

			<!-- nav links -->
			<div class="collapse navbar-collapse" id="main-nav-collapse">
				<ul class="nav navbar-nav navbar-right text-capitalize">
					<c:choose>
						<c:when test="${login eq null}">
							<li><a><span
									onclick="document.getElementById('id01').style.display='block'"
									style="width: auto;">로그인</span></a></li>
							<li class="dropdown"><a href="/join"><span>회원가입</span></a></li>
						</c:when>
						<c:otherwise>
							<li class="dropdown"><a href="/profile"><span>My
										page</span></a></li>
							<!-- end of /.dropdown -->
							<li class="dropdown"><a href="/logout"><span>로그아웃</span></a>
							</li>
							<li class="dropdown"><a href="/study/register">스터디 등록하기</a>
						</c:otherwise>
					</c:choose>
					<li class="dropdown"><a href="/study/listAll"><span>스터디
								구경하기</span></a></li>
					<li class="dropdown"><a href="/sqna/list"><span>FAQ</span></a>
					</li>
					<li class="dropdown"><a href="/study/notice"><span>공지사항</span></a>
					</li>
				</ul>
			</div>
			<!-- nav links -->
			<div class="navbar-header">
				
			</div>
		</div>
		<!-- /.container -->
	</nav>
	<!-- footer-navigation end -->
</footer>

</body>
</html>