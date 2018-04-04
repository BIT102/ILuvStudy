<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<title>프로필</title>
<style>
.border {
	border: 2px solid grey;
}

.basic {
	width: 300px;
	height: 50px;
	float: left;
	text-align: center;
}

.profile {
	width: 150px;
	height: 50px;
}

#div1 {
	display: inline-block;
}

#div2 {
	text-align: center;
}

#div2 div {
	float: left;
}

body {
	height: 800px;
	width: 1000px;
}

body>div>p3 {
	text-align: left;
	font-size: 30px;
	border-bottom: 2px solid grey;
}

#pfimage {
	width: 600px;
	height: 50px;
	display: inline-block;
}

#acinfo {
	width: 600px;
	height: 300px;
	display: inline-block;
}

#actable {
	font-size: 20px;
	margin-top: 10px;
}

.IT {
	visibility: hidden;
}

.ENGLISH {
	visibility: hidden;
}

.GONG {
	visibility: hidden;
}

#table1 {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
}

tr, th, td {
	border: 1px solid black;
}
</style>
</head>


<body>
	<div id="div1">
		<div class="basic border">
			<a href="profile">기본정보 관리</a>
		</div>

		<div class="basic border">
			<a href="bookmark">스터디 관리</a>
		</div>
	</div>

	<div id="div2">
		<div class="profile border">
			<a href="bookmark">북마크</a>
		</div>
		<div class="profile border">
			<a href="recruit">모집</a>
		</div>
		<div class="profile border">
			<a href="application">신청</a>
		</div>
		<div class="profile border">
			<a href="completed">완료</a>
		</div>

	</div>
	<br>
	<br>
	<br>

	<h4>신청</h4>


	<c:forEach items="${list}" var="studyVO">
		<div class="col-md-4 col-sm-6">
			<div class="portfolio-item">
				<div class="item-image">
					<a
						href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}&bno=${studyVO.bno}">


						<c:choose>
							<c:when test="${studyVO.name ne 'a'}">
								<img src="/study/displayFile?fileName=${studyVO.name}"
									class="img-responsive center-block"
									style="width: 370px; height: 216px;">
							</c:when>
							<c:otherwise>
								<img src="/resources/assets/img/ha.jpg"
									class="img-responsive center-block"
									style="width: 370px; height: 216px;">
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
							<span class="item-name" style="width: 230px;">제목 :
								${studyVO.title} </span> <span style="width: 280px;">작성자 :
								${studyVO.nickname}<br> 종류 : ${studyVO.cDName} /
								${studyVO.cSName}<br> 지역 : ${studyVO.rDName} /
								${studyVO.rSName}<br> 상태 : ${studyVO.apStatus} <br>
								시작일 : ${studyVO.sd}
								<input id="apStatus" type="hidden" value=${studyVO.apStatus}></input>
								<input type=button id="apStatus" value="승인 여부" > </input>
								<script>
									/* $(document).ready(function(){
										if("${studyVO.apStatus}"=="O"){
											alert("승인 되었습니다.")}
										else if("${studyVO.apStatus}"=="D"){
											alert("승인 대기중입니다.")
										}else{
											alert("승인 거절되었습니다.")
										}
									}) */
									
									$(document).ready(function(){
									    $(#apStatus).click(function(){
									    	if("${studyVO.apStatus}"=="O"){
												alert("승인 되었습니다.")}
											else if("${studyVO.apStatus}"=="X"){
												alert("승인 거절되입니다.")
											}else{
												alert("승인 대기중입니다.")
									    });
									});
								</script>
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
		</div>
	</c:forEach>



</body>


</html>