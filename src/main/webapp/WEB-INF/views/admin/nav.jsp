<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/resources/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="/resources/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="/resources/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="/resources/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/resources/img/favicon.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/resources/js/upload.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/resources/scripts/klorofil-common.js"></script>

<body>
<!--헤더-->
<div class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="userList"><img src="/resources/img/logo.JPG" alt="Iluvstudy Logo" class="img-responsive logo"></a> 
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
					<a href="/study/main"><button type="button" class="lnr lnr-home"></button></a>
				</div>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span>${login.id} 님</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="adminDetail?bno=${login.bno}"><i class="lnr lnr-user"></i> <span>정보수정</span></a></li>
								<li><a href="/adminLogout"><i class="lnr lnr-envelope"></i> <span>로그아웃</span></a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
</div>
    <!--메뉴-->

		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<div>
					<ul class="nav">
						<li><a id="userListnav" href="userList" class=""><i class="lnr lnr-user"></i> <span>회원관리</span></a></li>
						<li>
							<a href="#subPages" data-toggle="collapse" class="collapsed" id="studyListsuv"><i class="lnr lnr-pencil"></i> <span>스터디관리</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse">
								<ul class="nav">
									<li><a href="studyList" id="studyListnav">스터디 목록</a></li>
									<li><a href="replyList" id="replyListnav">댓글 관리</a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href="#subPages2" data-toggle="collapse" class="collapsed" id="qnaListsuv"><i class="lnr lnr-cog"></i> <span>사이트관리</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages2" class="collapse">
								<ul class="nav">
									<li><a href="qnaList" id="qnaListnav">QNA 관리</a></li>
									<li><a href="noticeList" id="noticeListnav">공지사항 등록</a></li>
								</ul>
							</div>
						</li>
						<li><a id="statisticnav" href="statistic" class=""><i class="lnr lnr-chart-bars"></i> <span>통계관리</span></a></li>
						<li><a id="adminListnav" href="adminList" class=""><i class="lnr lnr-text-format"></i> <span>Admin관리</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
 
</body>
</html>