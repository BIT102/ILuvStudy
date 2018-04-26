<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<link href="/resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Document</title>
<style>
h1 {
	float: left;
}

h2 {
	color:#5bc0de !important;
} 


#nav1 {
	float: left;
	height: 40px;
}

#nav1>a {
	text-decoration-line: none;
}

#nav2 {
	float: right;
}

#nav2>a {
	text-decoration-line: none;
}

#header {
	height: 150px;
}

body {
	margin-left: 50px;
}

#repliesDiv {
	font-size: 40px;
	border: 2px dotted black;
}

.textcenter1 {
	text-align: center;
}

.btn-black:hover {
	background-color: gray !important;
}

/*지도스타일입니다*/
#map {
	width: 100%;
	height: 442px;
	margin-top:20px;
	margin-bottom:100px;
}

.gallery {
	margin-top: 40px;
	margin-bottom: 100px;
}

.gallery li {
	display: inline-block;
	margin-left: 15px;
}

.imgstyle {
	margin-top: 100px;
}

.app {
	margin-top: 25px;
	margin-bottom:90px;
}

.applyList {
	margin: 15px 25px;
}

.replypage li{
	border:1px solid black;
	width:20px;
	text-align:center;
	background-color:black;
	margin-left:10px;
}

.replypage a {
	color:white;
}

.btn {
	background-color:black;
	color:white;

}

.aplist {
	float:right;
}
.reglist{
	float:right;
}


/* #modDiv{
	width:450px;
	height:220px;
	background-color:white;
	position:absolute;
	top:50%;
	left:30%;
	z-index:1000;
	border: 3px double gray;
} */

/* #amodDiv {
	width:450px;
	height:600px;
	background-color:white;
	border:3px double gray;
	position:absolute;
	top:3150px;
	left:50%;
	margin-top:-50px;
	margin-left:-150px;
	padding:20px;
	z-index:1000;
}
 */
.modal-title{
	color:white;
}

<!--팝업-->
.setDiv {
	padding-top: 100px;
	text-align: center;
}
.mask {
	position:absolute;
	left:0;
	top:0;
	z-index:9999;
	background-color:#000;
	display:none;
}
.popwindow {
	display: none;
	background-color: #ffffff;
	z-index:99999;
	max-width:100%;
	max-height:100%;
	width:auto !important;
	height:auto !important;
}

.btn-clipboard {
	width:200px important;
	height:40px;
	font-size:13px;
}

.col-md-2 img{
	width:100px;
	height:90px;
}

.time{
	margin-top:30px;
}

.time th {
	width:100px;
	padding:10px;
}

.fa-heartbeat {
	color:red;
}


.basic-content th{
	font-size:20px;
	padding-bottom: 20px;
    padding-top: 20px;
}

.basic-content td{
	font-size:20px;
	padding-right:220px;
	padding-bottom: 20px;
    padding-top: 20px;
}

.time th{
	padding-bottom:0 !important;
	width:127px;
}

.time td{
	padding-bottom:0 !important;	
	padding-right:200px;
}

.region th{
	width:257px;	
	
}

.back-img{
	position:relative;
}

.back{
	position:absolute;
	top:0;
    object-fit: cover;
    background-color:black;
    width:50px;
    height:50px;
    opacity:0.7;
    width:100%;
    height:480px;
}


.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

#applyDiv {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;

}


#amodDiv {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}


.login-container {
	position: relative;
	width: 300px;
	margin: 80px auto;
	padding: 20px 40px 40px;
	text-align: center;
	background: #fff;
	border: 1px solid #ccc;
}

.login-container::after {
	top: 5px;
	z-index: -2;
	-webkit-transform: rotateZ(-2deg);
	-moz-transform: rotateZ(-2deg);
	-ms-transform: rotateZ(-2deg);
}

.close {
	position: absolute;
	right: 25px;
	top: 20px;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

.introdu .col-md-6 {
	border:1px solid gray;
	height:57px; 
	padding-top:10px; 
	font-size:25px;
	border-radius:10px;
}

.intro-table th{
	padding-right:50px;
}

.intro-table td{
	text-align:left;
}


.intro-is th {
	padding-bottom:7px;
}
</style>
</head>

<body>

	<%@ include file="../nav.jsp" %>
		
	<div id="multiple-blog-page">
		<!-- header begin -->
		<header class="page-head" style="margin-bottom:10px;">
			<div class="header-wrapper">
				<div class="container">
					<div class="row">
						<div class="col-md-12">

							<ol class="breadcrumb">
								<li><a href="index.html">Home</a></li>
								<li class="active">Board</li>
							</ol>
							<!-- end of /.breadcrumb -->

						</div>
					</div>
				</div>
				<!-- /.container -->
			</div>
			<!-- /.header-wrapper -->
		</header>
		<!-- /.page-head (header end) -->

		<!-- bno값 유지하자 -->
		<form role="form" method="post">
			<input type="hidden" name="bno" id="bno" value="${studyVO.bno}">
		</form>


	
		<div class="back-img">
			<c:choose>
				<c:when test="${studyVO.name ne 'a'}">
					<img src="/study/displayFile?fileName=${studyVO.name}"
						 class="img-responsive center-block "
						 style="width:100%; height:480px;object-fit: cover;">
				</c:when>
			    <c:otherwise>
					<img src="/resources/assets/img/ha.jpg"
						 class="img-responsive center-block "
						 style="width:100%; height:480px;object-fit: cover;">
			    </c:otherwise>
			</c:choose>
		<div class="back">
			<div class=container style="height:100%; width:1300px; margin-top:80px; padding:10px;">
			
				<div class="row" style="text-align:center; color:white; font-size:50px;">
						${studyVO.title}
				</div>
					<div style="margin-top:150px;">
						<img src="/study/displayFile?fileName=${studyVO.photo}"
							 class="img-responsive center-block img-circle" style="width:150px; height:150px; margin-left:65px;">

					</div>
					<div>
						<p style="font-size:20px; color:white; margin-top:-72px; margin-left:257px;">${studyVO.nickname}<br>
						<i class="fa fa-eercast" style="color:red;"></i> ${studyVO.vct}　　<fmt:formatDate pattern="yyyy-MM-dd" value="${studyVO.regdate}" /></p>	 
					</div>
					
					<div style="margin-top:-65px; color:white;">
						<p class="pull-left" style="position:absolute; margin-left:950px;">
					<!-- 북마크등록 // 로그인한 사람만 -->
						<span><c:if test="${not empty login}">
							<!-- 등록 안되어있을때 -->
							<c:if test="${bolist.checked == 0}">
								<i class="fa fa-heart-o" id="heart"
								onclick="myFunction1(this)" style="font-size: 35px; cursor:pointer;"></i>
							</c:if>
							<!-- 북마크 등록되어있을때 -->
							<c:if test="${bolist.checked == 1}">
								<span id="delete"> <i class="fa fa-heartbeat"
														id="heart" onclick="myFunction1(this)"
														style="font-size: 35px; cursor:pointer;"></i>
								</span>
							</c:if>
							<strong  style="color:white; font-size:20px;"> 스크립을 해주세요 </strong>
							</c:if> </span> 					
						</p>
					</div>
					
<%-- 				
					<div class="col-md-12" >
						<h1 style="color:white; font-size:50px; margin-left:30px;">${studyVO.title}</h1>
											
					</div>
					<div class="imgback">
						<img src="/study/displayFile?fileName=${studyVO.photo}"
												class="img-responsive center-block img-circle" style="width:150px; height:150px;">
					</div>  --%>
			</div>
		</div>
		
  
		<div class="container" style="margin-bottom:30px;">
			<div class="row">

				<article class="blog-item">




					<div class="bodycontent">

						<div class="nicecontent" style="float: top; margin-top: 25px;">
							
							<h2>기본정보</h2>
							<table class="basic-content">
								<tr>
									<td>카테고리</td>
									<th>${studyVO.cDName}　[ ${studyVO.cSName} ]</th>
								</tr>
							</table>
							
						<table class="basic-content time">
							<tr>
								<td>모임시간</td>
									<th style="padding-left:20px;">월요일</th>
									<th style="padding-left:20px;">화요일</th>
									<th style="padding-left:20px;">수요일</th>
									<th style="padding-left:20px;">목요일</th>
									<th style="padding-left:20px;">금요일</th>
									<th style="padding-left:20px;">토요일</th>
									<th style="padding-left:20px;">일요일</th>
							</tr>
							<tr>
								<td></td>
									<th>${studyVO.clock.get("월요일")}</th>
									<th>${studyVO.clock.get("화요일")}</th>
									<th>${studyVO.clock.get("수요일")}</th>
									<th>${studyVO.clock.get("목요일")}</th>
									<th>${studyVO.clock.get("금요일")}</th>
									<th>${studyVO.clock.get("토요일")}</th>
									<th>${studyVO.clock.get("일요일")}</th>
							</tr>
						</table>
						
						<table class="basic-content region" style="margin-top:70px;">
							<tr>
								<td>기본지역</td>
								<th>${studyVO.rDName} [ ${studyVO.rSName} ]</th>	
							</tr>
							<tr>
								<td style="padding-bottom:0;">상세지역</td>
							</tr>
						</table>
						
						<!-- 지도입니다 -->
					<div id="map"></div>	
							
							
							
							<h2>추가정보</h2>
							<table class="basic-content">

								<tr>
									<td>참여인원</td>
									<th>현재  ${studyVO.now}명　☞　최대  ${studyVO.max}명 </th>
								</tr>
								<tr>
									<td>선호대상</td>
									<th>${studyVO.age}</th>
								</tr>
								<tr>
									
								</tr>
							</table>

						</div>
						<!-- 지도입니다. -->
					</div>
					<!-- 콘덴트바디바디 -->

					<!-- 스터디 이미지 -->
					<div class="imgstyle">
						
						<h2>스터디 소개</h2>
						<p style="font-size:20px; color:black; margin-top:30px;">스터디 소개</p>
						<div class="intro" style="margin-top:8px; padding:2px; font-size:20px;">
								<strong>${studyVO.content}</strong>
						</div>
						<p style="font-size:20px; color:black; margin-top:30px;">스터디 이미지</p>
						<div class="gallery"></div>
					</div>


					<!-- 신청한 사람 목록 -->
					<div class="app">
						<h2>신청자목록</h2>
						<div class="applyList" style="display:inline-block"></div>
					</div>
					

			</div>
			<!-- end grycontainer -->
			



         <c:if test="${not empty login}">
			<div class="comments">
				<div class="row">
					<div class="col-md-12">

			<div class="comment-post">
				<h3>댓글을 달아주세요　[${studyVO.rct}]</h3>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<input name="writer" id="writer" type="text" class="form-control"
								value="${login.email}" readonly>
						</div>
					</div>

					<div class="col-md-12">
						<textarea name="content" type="text" class="form-control"
							id="content" rows="8" required="required"
							placeholder="댓글을 입력해 주세요"></textarea>
					</div>
				</div>

				<button type="button" id="addBtn" class="btn btn-black"
					style="color: white;">댓글 등록</button>
				<button type="button" id="seeBtn" class="btn btn-black"
					style="color: white;">댓글 보기</button>
			</div>
			</article>



			<div id="replies" style="margin-top:15px;"></div>
					
				<!-- 댓글 수정 삭제 부분 -->

				<div id="modDiv" class="modal">
					<div class="container">
						<div class="login-container" style="width:470px;">
							<div class="modal-title"></div>
				
							<span
							onclick="document.getElementById('modDiv').style.display='none'"
							class="close" title="Close Modal">&times;</span>
							
							<div style="text-align:center; margin-bottom:30px; margin-top:30px;">
							
							<input type="text" id="recon" style="width:350px; height:70px; padding-left:15px;">
							</div>
							
							<div style="text-align:center; margin-bottom:10px;">
								<button type="button" id="remodify" class="btn">수정하기</button>
								<button type="button" id="redelege" class="btn">지우기</button>
								<button type="button" id="reclose" class="btn">닫기</button>
							</div>
						</div>
					</div>
				</div>
			
			<ul class="replypage"></ul>
		</div>
	</div>
	</div>
</c:if>

		<br> <br>
		<!-- 로그인했는데 로그인아이디가 글작성자와 같지않을때. -->
<div>
		<!-- 신청하면 이미지와 닉네임 만들기 -->
	<div class="aplist">
			<c:if test="${empty login}">
   				로그인 하면 다양한 기능들을 이용할 수 있습니다　　　　　　　　　　　　　　　　　　　　　　　　　
 				<input type="submit" class="btn preee" value="목록으로" style="float:right;">
			</c:if>

		<c:if test="${not empty login}">
		  <c:if test="${login.email != studyVO.writer}">
		 
			<c:if test="${ap.checked == 0 }">
				<input type="submit" class="btn apply" id="apap" value="신청하기">
				<input type="submit" class="btn deapply" id="apap" value="신청취소" style="display:none;">
			</c:if>
			
			<c:if test="${ap.checked == 1 }">
				<input type="submit" class="btn apply" id="apap" value="신청하기" style="display:none;">
				<input type="submit" class="btn deapply" id="apap" value="신청취소">
			</c:if>
				<input type="submit" class="btn preee" value="목록으로">
		  </c:if>		
			
			<!-- 로그인시 -->
			<br> <br>
			<!-- 로그인한아이디가 글쓴이일때. -->
			<c:if test="${login.email == studyVO.writer}">
				<br>
				<input type="submit" class="btn aList" value="신청자목록" onclick="wait();">
				<input type="submit" class="btn preee" value="목록으로"> 
				<input type="submit" class="btn modifybo" value="스터디 수정"> 
				<input type="submit" class="btn delete" value="스터디 지우기">

				<div id="amodDiv" class="modal">
					<div class="container">
						<div class="login-container" style="width:600px; padding-bottom:70px; overflow: hidden !important;
    					height: auto !important; padding-top:50px;">
							<span
							onclick="document.getElementById('amodDiv').style.display='none'"
							class="close" title="Close Modal">&times;</span>
						
							<div class='modal-applyList'></div>
							
						</div>
					</div>
				</div>
				
				
			</c:if>
		</c:if>
	</div>
	
		
	 

		</div>
	</div>
</div>

	<!-- 신청자 정보보기 -->
			<div id="applyDiv" class="modal">
					<div class="container">
						<div class="login-container" style="width:600px; height:350px;">

							<span
							onclick="document.getElementById('applyDiv').style.display='none'"
							class="close" title="Close Modal">&times;</span>
							
					
								<div class="introdu" style="margin-top:30px;">
										<div class="col-md-12" style="background-color:#5bc0de; color:white; height:53px; 
										                              border-radius:19px; font-size:30px; padding-top:6px;">
											회원소개
										</div>
								</div>	
							
								
								<div class="intro-img" style="margin-top:120px;">
					 				<img src=""
									 class="img-responsive center-block img-circle" style=" width:150px; height:150px; margin:0;">  
								</div>

									
								<div class="introtro" style="margin-top:-154px; margin-left:200px;">
										<table class="intro-table" style="font-size:18px;">
											<tr>
												<th>닉네임</th>
												<td class="intro-nick"></td>
											</tr>
											<tr>
												<th>성별</th>
												<td class="intro-gender"></td>
											</tr>
											<tr>
												<th>홈페이지</th>
												<td class="intro-home"></td>
											</tr>
										</table>
										
										<table class="intro-is" style="font-size:18px; margin-top:20px;">
																					
											<tr>
												<th>소개</th>
											</tr>
											<tr>	
												<td class="intro-intro"></td>
											<tr>
										</table>
								</div>
					</div>
				</div>
			</div> 
				
<div class="setDiv">
    <a class="showMask"></a>
 
	<div class="mask"></div>
    <div class="popwindow">
 		<input type="button" class="close" value="X"/>
    </div>
</div> 


<%@include file="../footer.jsp"%>	

	<script>
//북마크를 등록합니다	


function myFunction1(x) {

	var bno = $("#bno").val();
	var writer = $("#writer").val();
	
	//클래스이름으로 구별
	var heart = $("#heart").attr('class');
	
	//만약에 등록이 안되어 있으면
	if(heart==="fa fa-heart-o") {
		//데이터등록
		$.ajax({
			type:"post",
			url:"/study/bookmark/a",
			headers : {
				"Content-type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType:'text',
			data : JSON.stringify({
				bsBno : bno,
				userEmail : writer
			}),
			success : function(result) {
				if(result=='success') {
					alert("등록되었습니다");
					//클래스 변경하면서 이미지 변경
					$("#heart").removeClass('fa fa-heart-o');
					$("#heart").addClass('fa fa-heartbeat');
				}
			}
		});
	//북마크가 등록되어있으면
	} else if(heart==="fa fa-heartbeat") {
		//삭제
		$.ajax({
			type:"post",
			url:"/study/bookmark/dee",
			dataType:'text',
			data : {
				bsBno : bno,
				userEmail : writer
			},
			success : function(result) {
				if(result=='success') {
					alert("삭제되었습니다 ");
					//클래스 변경하면서 이미지 변경
					$("#heart").removeClass('fa fa-heartbeat');
					$("#heart").addClass('fa fa-heart-o');
				}
			}
		});
	} else {
		alert("이미 처리되었습니다");
	}
}

</script>
	<!-- 파일업로드 핸들러 -->
<!--  <script id="templateAttach" type="text/x-handlebars-template">
    <li data-src='{{name}}'>
		<span class="mailbox-attachment-icon has-img">
			<div class="setDiv">
				<img src="{{imgsrc}}" class="showMask" alt="Attachment" style="width:150px; height:150px;">
				<img src="{{imgsrc}}" class="window">
			</div>
		</span>
  		<div class="mailbox-attachment-info">
		</div>
	</li>
    </script>	-->
    
	<script id="templateAttach" type="text/x-handlebars-template">
    <li data-src='{{name}}'>
		<span class="mailbox-attachment-icon has-img">
			<div class="setDiv">
				<img src="{{imgsrc}}" class="showMask" alt="Attachment" style="width:150px; height:150px; object-fit: cover;">
				<img src="{{imgsrc}}" class="popwindow">
			</div>
		</span>
	</li>
    </script>
    
	<script>
	
	//==========레이어 팝업============
   $(document).ready(function(){
        // showMask를 클릭시 작동하며 검은 마스크 배경과 레이어 팝업을 띄웁니다.
      /*   $('.showMask').click(function(){
        	console.log("클릭했다");
            // preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
            wrapWindowByMask();
        }); */
        
        $(document).on('click', '.showMask', function(){
        	console.log(this);
        	console.log($(this).next());
        	
            // preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
        	// 화면의 높이와 너비를 변수로 만듭니다.
            var maskHeight = $(document).height();
            var maskWidth = $(window).width();
     
            // 마스크의 높이와 너비를 화면의 높이와 너비 변수로 설정합니다.
            $('.mask').css({'width':maskWidth,'height':maskHeight});
     
            // fade 애니메이션 : 80%의 불투명으로 변합니다.
            $('.mask').fadeTo(0,0.8);
     
            // 레이어 팝업을 가운데로 띄우기 위해 화면의 높이와 너비의 가운데 값과 스크롤 값을 더하여 변수로 만듭니다.
            var left = ( $(window).scrollLeft() + ( $(window).width() - $(this).next().width()) / 2 );
             var top = ( $(window).scrollTop() + ( $(window).height() - $(this).next().height()*2) / 2 );  
     
            // css 스타일을 변경합니다.
            $(this).next().css({'left':left,'top':top, 'position':'absolute'});
     
            // 레이어 팝업을 띄웁니다.
            $(this).next().show();
        });
 
        // 닫기(close)를 눌렀을 때 작동합니다.
        $('.popwindow .close').click(function (e) {
            e.preventDefault();
            $('.mask, .popwindow').hide();
        });
 
        // 뒤 검은 마스크를 클릭시에도 모두 제거하도록 처리합니다.
        $('.mask').click(function () {
            $(this).hide();
            $('.popwindow').hide();
        });
  });
   //==========레이어 팝업 end===============

    //파일불러오기
    var bno = ${studyVO.bno};
    var template = Handlebars.compile($("#templateAttach").html());
    
    $.getJSON("/study/getFile/"+bno, function(list){
    	$(list).each(function(){
    		
    		var fileInfo = getFileInfo(this);
    		var html = template(fileInfo);
    		
    		$(".gallery").append(html)
    	})
    })
    

    </script>
	<script>
var applyEmail = $("#writer").val();
var applybsBno = $("#bno").val();
var now = ${studyVO.now};
var max = ${studyVO.max}
var bno = ${studyVO.bno};
//스터디 등록
$(".apply").on("click", function(){
	if(now == max){
		
		console.log(now);
		console.log(max);
		
	alert("참석하실수 없습니다");
	
	} else {
	
	$.ajax({
		type:"post",
		url:"/study/apply/create/",
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType:"text",
		data:JSON.stringify({
			bsBno : applybsBno,
			usEmail : applyEmail
		}),
		success : function(result){
		wait();
		alert("대기상태입니다.");
		$(".apply").hide();
		$(".deapply").show();
		}
	
	})
	}
});

//스터디 취소하기
$(".deapply").on("click", function(){
$.ajax({
	type:'post',
	url:'/study/apply/de',
	headers:{
		"Content-Type" : "application/json",
		"X-HTTP-Method-Override" : "DELETE"
	},
	dataType : "text",
	data:JSON.stringify({
		bsBno : applybsBno,
		usEmail : applyEmail
	}),
 	success : function(result) {
 		if(result=='success'){
 			apply();
			wait();
 			alert("삭제되었네");
 			$(".deapply").hide();
 			$(".apply").show();
 		}
 	}
})
})
//신청자목록
$(".aList").on("click", function(){
		$("#amodDiv").show("slow");
})
//신청자 목록 닫기
$("#applyclose").on("click", function(){
	$("#amodDiv").hide("slow");
})
//신청자 수락 거절 status 바꾸자
//수락지 o
//거절시 x


function okstudy(event) {
	
	var applyEmail = $(".modal-applyList .applyLi").attr("data-usemail"); //잘못됬음
	
	console.log(applyEmail)
	
	var applybsBno = $("#bno").val();
	
	console.log(applybsBno)
	
	var kk = event.parentElement;
	
	$.ajax({
		type:"put",
		url:"/study/apply/update",
		headers: {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "PUT"},
		data:JSON.stringify({
			bsBno : applybsBno,
			usEmail : applyEmail,
			status:"O" }),
		dataType:"text",
		success:function(result){
			if(result=="success"){
				kk.remove();
				apply();
				alert("수락했승ㅁ");

			}
		 }
	});
}
//거절시
function nostudy(event) {
	
	var kk = event.parentElement;
	
	$.ajax({
		type:"put",
		url:"/study/apply/update",
		headers: {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "PUT"},
		data:JSON.stringify({
			bsBno : applybsBno,
			usEmail : applyEmail,
			status:"X" }),
		dataType:"text",
		success:function(result){
			if(result=="success"){
				kk.remove();
				apply();
				alert("거절했습니다");
			}
		 }
	});
}

//신청자 대기상태
function wait(){
			
$.getJSON("/study/apply/"+bno, function(data){
	

	
	var str="";
	$(data).each(function(){
		
		if(this.status=='D'){
			
		str +="<div class='applyLi' data-usEmail='"+this.usEmail+"' style='float:left;'>"
			+ "<span class='mailbox-attachment-icon has-img'><img src='/study/displayFile?fileName="+this.photo+"'"
			+ "alt=Attachment style='width:50px; height:50px; margin-right:10px; border-radius:50%;' onclick='mypage(this);'></span>"
		    + this.nickname
		    + "<button type='button' onclick='okstudy(this);' class='btn' style='margin:0 10px; margin-left:100px;'>수락</button>"
		    + "<button type='button' onclick='nostudy(this);' class='btn'>거절</button>"
		    + "<input type='hidden' class='intro-nick' value='"+this.nickname+"'/>"
		    + "<input type='hidden' class='intro-gender' value='"+this.gender+"'/>"
		    + "<input type='hidden' class='intro-home' value='"+this.homepage+"'/>"
		    + "<input type='hidden' class='intro-intro' value='"+this.introduction+"'>"
		    +"</div>";   
		}
	});
	$(".modal-applyList").html(str);
});
}

// 신청자 정보 보기
function mypage(x) {
	
	console.log($(x).parent().parent().children("input.intro-nick").val())
	
	var img = $(x).attr("src");
	var nick = $(x).parent().parent().children("input.intro-nick").val();
	var gender = $(x).parent().parent().children("input.intro-gender").val();
	var home = $(x).parent().parent().children("input.intro-home").val();
	var intro = $(x).parent().parent().children("input.intro-intro").val();
	
	$(".intro-img img").attr("src", img);
 	$(".intro-nick").html(nick); 

	$(".intro-home").html(home);
	$(".intro-intro").html(intro);
	
	if(gender == 1) {
		
		$(".intro-gender").html("남자"); 	
	} else {
		$(".intro-gender").html("여자"); 	
	}
 	
	
	$("#applyDiv").show();

}
	



//스터디 등록자 불러오기
function apply(){
 $.getJSON("/study/apply/"+bno, function(data){
	var str="";
	
	$(data).each(function(){
		
		if(this.status=='O'){
		
		str += "<div class='applyLi' data-usEmail='"+this.usEmail+"' style='display:inline-block; margin-right:10px;'>"
			+ "<span class='mailbox-attachment-icon has-img'><img src='/study/displayFile?fileName="+this.photo+"'"
			+ "alt=Attachment style='width:50px; height:50px; margin-right:10px; border-radius:50%;'></span>"
		    + this.nickname
		    +"</div>";
		    
	$(".applyList").html(str);
		    
		}		    
	});
});
}
//신청자 화면에 고정시키기
$("document").ready(function apply() {
$.getJSON("/study/apply/"+bno, function(data){
	var str="";
	
	$(data).each(function(){
		
		if(this.status=='O'){
		
		str += "<div class='applyLi' data-usEmail='"+this.usEmail+"' style='display:inline-block; margin-right:10px;'>"
			+ "<span class='mailbox-attachment-icon has-img'><img src='/study/displayFile?fileName="+this.photo+"'"
			+ "alt=Attachment style='width:50px; height:50px; margin-right:10px; border-radius:50%;'></span>"
		    + this.nickname
		    +"</div>";
		    
	$(".app .applyList").html(str);
		}
	})
})
})
</script>


	<!-- 상세페이지 -->
	<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	$(".preee").on("click", function(){
		self.location = "/study/listAll?page=${cri.page}&perPageNum=${cri.perPageNum}";
	});
	
	$(".delete").on("click", function(){
		formObj.attr("action", "/study/remove");
		formObj.submit();
	})
});
</script>


	<!--  댓글 -->

	<script>
    
    	var bno = $("#bno").val(); 
        
	//등록
        $("#addBtn").on("click", function(){
        	
        	var writer = $("#writer").val();
        	var content = $("#content").val();
        	
        	$.ajax({
        		type:"post",
        		url:"/study/replies/create",
        		headers:{
        			"Content-Type":"application/json",
        			"X-HTTP-Method-Override":"POST"
        		},
        		dataType:"text",
        		data:JSON.stringify({
        			bsBno:bno,
        			writer:writer,
        			content:content
        		}),
        		success:function(result){
        			if(result=='success'){
        				alert("등록");
        				getPageList(replyPage);
        			}
        		}
        	});
        });
        
        $("#seeBtn").on("click", function(){
        	getPageList(replyPage);
        });
	
	
	//상세 리플
        $("#replies").on("click",".replyLi .cmnt-clipboard button", function(){
        	
       // 	var reply = $(".replyLi").val();
       var rno = $(this).val();
       
       var retext = $(this).parent().next().children().children(".col-md-10").children(".contentre").text();

        	$(".modal-title").html(rno);
        	$("#recon").val(retext);
        	$("#modDiv").show("slow");
        	 
        });

        //삭제
        $("#redelege").on("click", function(){
        	
        	var rno = $(".modal-title").html();
        	var content = $("#recon").val();
        	
        	$.ajax({
        		type:"delete",
        		url:"/study/replies/"+rno,
        		headers : {
        			"Content-Type" : "application/json",
        			"X-HTTP-Method-Override" : "DELETE"
        		},
        		dataType:"text",
        		success:function(result) {
        			if(result=="success") {
        				alert("삭제욤");
        				$("#modDiv").hide("slow");
        				getPageList(replyPage);
        			}
        		}
        	});
        });
        
        //수정
         $("#remodify").on("click", function(){
        	
        	var rno = $(".modal-title").html();
        	var content = $("#recon").val();
        	
        	console.log(content)
        	
        	$.ajax({
        		type:"put",
        		url:"/study/replies/"+rno,
        		headers:{
        			"Content-Type" : "application/json",
        			"X-HTTP-Method-Override" : "PUT" 
        		},
        		data:JSON.stringify({content:content}),
        		dataType:"text",
        		success:function(result) {
        			if(result=="success"){
        				alert("수정입니다");
        				$("#modDiv").hide("slow");
        				getPageList(replyPage);
        			}
        		}
        	});
        });
        
        $("#reclose").on("click", function(){
        	$("#modDiv").hide("slow");
        })
        
        
        //댓글페이지
        function getPageList(page) {
        	
        	$.getJSON("/study/replies/" + bno + "/" + page, function(data){
        		
        		var str="";
        		
        		var regdate = '<fmt:formatDate pattern="yyyy-MM-dd" value="${studyVO.regdate}" />';
        		
        		$(data.list).each(function(){
        			
        			if(this.writer == '${login.email}'){
        			str += "<div class='replyLi' ><div class='cmnt-clipboard'>"
        			    +  "<button class='btn-clipboard' value='"+this.rno+"'>수정하기</button></div>"
        			    +  "<div class='well'><div class='row'><div class='col-md-2'>"
        			    +  "<img src="+"'/study/displayFile?fileName=${studyVO.photo}'"+"　class='img-responsive center-block' style='border-radius:50%;'></div>"
                        +  "<div class='col-md-10'><p class='comment-info'>"
                        +  "<strong>" + this.nickname + "</strong>" + "<span>" + regdate + "</span>"
                        + "</p><div class='contentre'>" + this.content + "</div></div></div></div></div>"
        			} else {
        				str += "<div class='replyLi' ><div class='cmnt-clipboard'>"
            			    +  "<div class='well'><div class='row'><div class='col-md-2'>"
            			    +  "<img src='assets/img/commenter2.jpg' class='img-responsive center-block' style='border-radius:50%;'></div>"
                            +  "<div class='col-md-10'><p class='comment-info'>"
                            +  "<strong>" + this.nickname + "</strong>" 
                            + "</p><div class='contentre'>" + this.content + "</div></div></div></div></div>"	
        			}
        			
        		});
        		$("#replies").html(str);
        		
        		printPaging(data.pageMaker);
        	});
        };
        
        //페이지
        function printPaging(pageMaker) {
        	
        	var str="";
        	
        	if(pageMaker.prev) {
        		str += "<li><a herf='"+(pageMaker.startPage-1)+"'> << </a></li>";
        	}
        	
        	for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len; i++) {
        		var strClass = pageMaker.cri.page == i?'class=active':'';
        		str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
        	}
        	
        	if(pageMaker.next) {
        		str += "<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
        	}
        	$(".replypage").html(str);
        }
               
        var replyPage = 1;
        
        $(".replypage").on("click", "li a", function(event){
        	
        	event.preventDefault();
        	
        	replyPage = $(this).attr("href");
        	
        	getPageList(replyPage);
        });
        
  
        </script>


	<script>
Handlebars.registerHelper("prettifyDate", function(timeValue){
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	var date = dateObj.getDate();
	return year+"/"+month+"/"+date;
});
var printData = function(replyArr, target, templateObject) {
	
	var template = Handlebars.compile(templateObject.html());
	
	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
}
</script>
	<!-- 수정버튼 -->


	<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	$(".preee").on("click", function(){
		self.location = "/study/listAll?page=${cri.page}&perPageNum=${cri.perPageNum}&pallType=a";
	});
	
	$(".delete").on("click", function(){
		formObj.attr("action", "/study/remove");
		formObj.submit();
	})
	
	$(".modifybo").on("click",function(){
		formObj.attr("action", "/study/update");
		formObj.attr("method", "get");
		formObj.submit();
	});
});
	
<%-- 	//=========SOHEE 댓글 수 추가=============
	$('#replies2').text("<%= replycnt %> Comments");
	 --%>
</script>
	<!--지도 크르깁트 -->
	<script>
	
   function initMap() {
   		var uluru = {lat:${studyVO.lat}, lng:${studyVO.lng}};
   	    var map = new google.maps.Map(document.getElementById('map'),{
   		zoom: 16,
   		center:uluru
   	});
   	var marker = new google.maps.Marker({
   		position:uluru,
   		map:map,
   	});
   }
   </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAiNU7soIIqpN1Jdu0tV1CWBb6u1jJAH5o&callback=initMap"
		async defer></script>
</body>
</html>
