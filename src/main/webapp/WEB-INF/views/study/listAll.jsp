
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE htm>
<html>

<head>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>I Luv Study</title>
    <!-- jquery -->
    <script src="http://code.jquery.com/jquery-1.7.js"></script>
	<script type="text/javascript" src="/resources/js/upload.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
    <!-- Required meta tags -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Mobland - Mobile App Landing Page Template">
    <meta name="keywords" content="HTML5, bootstrap, mobile, app, landing, ios, android, responsive">
    <meta name="author" content="">

    <!-- Font -->
    <link rel="dns-prefetch" href="//fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/dist/css/bootstrap.min.css">
    <link href="/resources/dist/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Themify Icons -->
    <link rel="stylesheet" href="/resources/dist/css/themify-icons.css">
    <!-- Owl carousel -->
    <link rel="stylesheet" href="/resources/dist/css/owl.carousel.min.css">
    <!-- Main css -->
    <link href="/resources/dist/css/style.css" rel="stylesheet">
    
    <!-- Bootstrap CSS -->
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    

    <!-- Custom fonts for this template -->
    <link href="/resources/dist/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

<style>
/* card css */
.cborder {
	border: 1px solid red;
}

.scard {
	margin-top: 20px;
	margin-left: 10px;
	float: left;
}

#studycard {
	margin: 0 auto;
	width: 80%;
	height: 800px;
}

#innerdiv {
	margin: 0 auto;
	width: 1000px;
	height: 600px;
}

.uploadedList {
	border: 1px solid black;
	width: 340px;
	height: 120px;
}

.vct {
	border: 1px solid black;
	width: 40px;
	height: 40px;
}
</style>
</head>
<body data-spy="scroll" data-target="#navbar" data-offset="30">
    
<%@include file="../header.jsp"%>


    <!-- Portfolio Grid -->
    <section class="bg-light" id="portfolio" >
      <div class="container" style="background-color:white;">
 
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">스터디 구경하세요</h2>

        </div>
        
        <div class="row">
   <c:forEach items="${list}" var="studyVO">
          <div class="col-md-4 col-sm-6 portfolio-item" style="margin-top:120px;">
          
            <div class="portfolio-link" data-toggle="modal">
              <div class="portfolio-hover">
              <a href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}&bno=${studyVO.bno}">
                <div class="portfolio-hover-content">
                  <i class="fa fa-plus fa-3x"></i>
                </div>
               </a> 
              </div>
            </div>
             <div class="mainimgbox">        
              <c:if test="${studyVO.name!=null}">
            <div class='uploadedList' style="background-image:url(/study/displayFile?fileName=${studyVO.name});" >
			</div>
			</c:if>
				</div>
            <div class="portfolio-caption">
              <h4>${studyVO.title}</h4>
						<!-- 작성자 -->
						<p class="card-writer">${studyVO.nickname}</p>
						<!-- 현재인원/최대인원 -->
						<p class="nowandmax">${studyVO.now}/${studyVO.max}</p>
						<!-- 지역 -->
						<p class="regionDS">${studyVO.rDName}/${studyVO.rSName}</p>

						<!-- 시작일 -->
						<p class="st">${studyVO.sd}</p>

						<!-- 조회수 -->
						<p class="vct"><i class="fa fa-eye"></i>${studyVO.vct}</p>
						김상욱은 ㅗ
            </div>
 
          </div>
    </c:forEach>
          </div>
        </div> <!-- container -->
    </section>

	<div class="text-center1">
		<ul class="pagination">
		
		<!-- 스프링 MVC를 이용하는 방식 -->
			<c:if test="${pageMakerStudy.prev}">
				<li><a href="listAll${pageMakerStudy.makeSearch(pageMakerStudy.startPage - 1)}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMakerStudy.startPage }"
				end="${pageMakerStudy.endPage}" var = "idx">
				<li 
					<c:out value="${pageMakerStudy.cri.page == idx?'class=active':''}"/>>
					<a href="listAll${pageMakerStudy.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMakerStudy.next && pageMakerStudy.endPage>0}">
				<li><a href="listAll${pageMakerStudy.makeSearch(pageMakerStudy.endPage +1)}">&raquo;</a>
				</li>
			</c:if> 
			
		</ul>
	</div>
	
		<script>
	<!-- search버튼 동작  -->
	$(document).ready(
			function(){
				
				$('#searchBtn').on(
						"click",
						function(event){
							
							self.location = "listAll"
								+ '${pageMakerStudy.makeQuery(1)}'
								+ "&searchType="
								+ $("select option:selected").val()
								+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
						});

			});
	</script>
	
	   <!-- Bootstrap core JavaScript -->
    <script src="/resources/dist/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/dist/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <!-- jQuery and Bootstrap -->
    <script src="/resources/dist/js/jquery-3.2.1.min.js"></script>
    <script src="/resources/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Plugins JS -->
    <script src="/resources/dist/js/owl.carousel.min.js"></script>
    <script src="/resources/dist/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom JS -->
    <script src="/resources/dist/js/script.js"></script>
    <!-- Contact form JavaScript -->
    <script src="/resources/dist/js/jqBootstrapValidation.js"></script>
    <script src="/resources/dist/js/contact_me.js"></script>
  

</body>
</html>