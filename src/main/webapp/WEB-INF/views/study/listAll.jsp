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
.select, .download-target {
	width: 20em;
}
.select {
	position: relative;
	display: block;
	height: 3em;
	width: 200px;
	line-height: 3;
	background: white;
	overflow: hidden;
	border-radius: .25em;
	display: inline-block;
	display: -webkit-inline-box;
	border: 1px solid #667780;
	line-height: 3;
	background: white;
	overflow: hidden;
	border-radius: .25em;
	display: inline-block;
	display: -webkit-inline-box;
	border: 1px solid #667780;
	margin: 1em 5px;
}
select {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0 0 0 .5em;
	color: #fff;
	cursor: pointer;
}
select::-ms-expand {
	display: none;
}
.select::after {
	content: '\25BC';
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	padding: 0 1em;
	background: #34495e;
	pointer-events: none;
}
.select:hover::after {
	color: #f39c12;
}
.select::after {
	-webkit-transition: .25s all ease;
	-o-transition: .25s all ease;
	transition: .25s all ease;
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
#select2 {
	display: none;
}
#select3 {
	display: none;
}
.contentB {
	border: 1px solid #dadada;
}
.text-center1 {
	text-align: center;
}
/*페이지 처리*/
.pagination>li>a, .pagination>li>span {
	margin: 8px;
	color: #6b456a !important;
}
.pagination>.active>a {
	z-index: 2;
	color: white !important;
	background-color: black !important;
	border-color: white !important;
	cursor: default;
}
.page-head {
    background: url(/resources/assets/img/multiple_blog-bg.jpg) !important;
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
	<%@include file="../nav.jsp"%>
	
	
            <header class="page-head">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <ol class="breadcrumb">
                                    <li><a href="/study/main">Home</a></li>
                                    <li class="active">스터디 구경하기</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->



	<!--  begin portfolio section  -->
	<section class="bg-light-gray">
		<div class="container" style="width:1200px;">
			<div class="row">
				<form>
					<div class="dropdown">
						<select class="dropdown-select-version select" id="select1"
							name="options" style="float: right; margin-top:19px;">
							<option value="x">전체</option>
							<option value="t"
								<c:out value="${cri.searchType eq 't'? 'selected' : ''}"/>>제목</option>
							<option value="n"
								<c:out value="${cri.searchType eq 'n'? 'selected' : ''}"/>>닉네임</option>
							<option value="g"
								<c:out value="${cri.searchType eq 'g'? 'selected' : ''}"/>>카테고리</option>
							<option value="r"
								<c:out value="${cri.searchType eq 'r'? 'selected' : ''}"/>>지역</option>
							<option value="c"
								<c:out value="${cri.searchType eq 'c'? 'selected' : ''}"/>>내용</option>
						</select>
					</div>
				</form>
				<div class="welcome-speech"
					style="float: right; margin-bottom: 30px;">
					<input type="text" onKeyDown="onKeyDown();" name="keyword"
						id="keywordInput" placeholder="검색어를 입력하세요" value="${cri.keyword}">
					<button class="btn btn-white">Search</button>
				</div>
				<!-- /.intro -->
			</div>
			



			<div class="headline text-center" style="position:relative;">
			
			<div class="pall" style="position:absolute; width:150px;">
				<form>
					<div class="dropdown">
						<select class="dropdown-select-version select" id="pallsel"
							name="pallType" style="float: left; width:100%; height:30px;">
							<option value="a"
							 <c:out value="${cri.pallType eq 'a'? 'selected':''}"/>>최신순</option>
							<option value="b"
							 <c:out value="${cri.pallType eq 'b'? 'selected':''}"/>>스크랩순</option>
							<option value="q"
							 <c:out value="${cri.pallType eq 'q'? 'selected':''}"/>>조회순</option>
							<option value="w"
							 <c:out value="${cri.pallType eq 'w'? 'selected':''}"/>>댓글순</option>
						</select>
					</div>
				</form>
			</div> 
			
				<div class="row">
					<div class="col-md-6 col-md-offset-3">
						<h2 class="section-title">스터디를 구경하세요</h2>
						<p class="section-sub-title">검색을 통해 원하시는 스터디를 찾아주세요 &amp; 방문을
							원하시면 이미지를 클릭해 주세요</p>
						<!-- /.section-sub-title -->
					</div>
				</div>
			</div>
			<!-- /.headline -->
			<div class="portfolio-item-list" style="background-color:#f9f9f9;">
				
				<div class="row">
					
					<c:forEach items="${list}" var="studyVO">
						<div class="col-md-4 col-sm-6">
						
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
			<!-- end of portfolio-item-list -->

		</div>
	</section>
	<!--   end of portfolio section  -->

	<!-- paging -->
	<div class="text-center1" style="margin-top:35px;">
		<ul class="pagination">
			<c:if test="${pageMakerStudy.prev}">
				<li><a
					href="listAll${pageMakerStudy.makeSearch(pageMakerStudy.startPage - 1)}">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMakerStudy.startPage}"
				end="${pageMakerStudy.endPage}" var="idx">
				<li
					<c:out value="${pageMakerStudy.cri.page == idx?'class=active':''}"/>>
					<a href="listAll${pageMakerStudy.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMakerStudy.next && pageMakerStudy.endPage>0 }">
				<li><a
					href="listAll${pageMakerStudy.makeSearch(pageMakerStudy.endPage +1)}">&raquo;</a>
				</li>
			</c:if>
		</ul>
	</div>


	<%@include file="../footer.jsp"%>


	<script type="text/javascript"
		src="/resources/assets/js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript"
		src="/resources/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="/resources/assets/js/owl.carousel.js"></script>
	<script type="text/javascript"
		src="/resources/assets/js/jquery.hoverdir.js"></script>

	<script>
	$(".img-text").mouseover(function(){
		$("")
	})
	
	</script>
	<!-- script for portfolio section using hoverdirection -->
	<script type="text/javascript">
		$(function() {
			$('.portfolio-item > .item-image').each(function() {
				$(this).hoverdir({
					hoverDelay : 75
				});
			});
		});
	</script>


	<!-- search  -->
	<script>
		$(document).ready(function() {
			$(".btn-select").each(function(e) {
				var value = $(this).find("ul li.selected").html();
				if (value != undefined) {
					$(this).find(".btn-select-input").val(value);
					$(this).find(".btn-select-value").html(value);
				}
			});
		});
		$(document).on(
				'click',
				'.btn-select',
				function(e) {
					e.preventDefault();
					var ul = $(this).find("ul");
					if ($(this).hasClass("active")) {
						if (ul.find("li").is(e.target)) {
							var target = $(e.target);
							target.addClass("selected").siblings().removeClass(
									"selected");
							var value = target.html();
							$(this).find(".btn-select-input").val(value);
							$(this).find(".btn-select-value").html(value);
						}
						ul.hide();
						$(this).removeClass("active");
					} else {
						$('.btn-select').not(this).each(function() {
							$(this).removeClass("active").find("ul").hide();
						});
						ul.slideDown(300);
						$(this).addClass("active");
					}
				});
		$(document).on('click', function(e) {
			var target = $(e.target).closest(".btn-select");
			if (!target.length) {
				$(".btn-select").removeClass("active").find("ul").hide();
			}
		});
	</script>

	<!-- 검색을 위한 스크립트 -->
	<!-- 정렬조건을 주는 스크립트 -->
	<script>

	//정렬합니다
	var pallsel="";
	//클릭할때마다 변경
 			$("#pallsel").on("change", function(){
				//선택조건 바꿨을때 
				pallsel = $("#pallsel option:selected").val()
				
				self.location="listAll"
					+ '${pageMakerStudy.makeQuery(1)}'
					+ "&pallType="
					+ pallsel
			});	
			
		  	//정렬조건 최신순, 북마크순, 조회순, 댓글순

			$(".btn-white").on("click", function(event){
				
				self.location = "listAll"
					+ '${pageMakerStudy.makeQuery(1)}'
					+ "&searchType="
					+ $("#select1 option:selected").val()
					+ "&keyword=" + encodeURIComponent($('#keywordInput').val())
					+ "&pallType="+ $("#pallsel option:selected").val();
		})  					 
	//타자누르면 검색됨
	function onKeyDown() {
		  			  		
	  if(event.keyCode==13){
    	 
		  self.location = "listAll"
				+ '${pageMakerStudy.makeQuery(1)}'
				+ "&searchType="
				+ $("#select1 option:selected").val()
				+ "&keyword=" + encodeURIComponent($('#keywordInput').val())
				+ "&pallType="+ $("#pallsel option:selected").val();
		  }
	  }	
	
</script>


</body>
</html>