
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
    

    <!-- Custom fonts for this template -->
    <link href="/resources/dist/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

</head>

<body data-spy="scroll" data-target="#navbar" data-offset="30" onLoad="gogogo(), printClock()">
    
    <!-- // Navigation -->
<%@include file="../nav.jsp"%>


    <!-- Header -->
    <header class="masthead">
        <div class="container">
          <div class="intro-text">
          <!-- 시계넣었어요 -->
 
              <div id="clock" >
              </div>
            
            <div class="intro-lead-in" >Welcome To I Luv Study!</div>
            <span id="intro-heading" style="font-size:50px;"></span>
            <input type="text" name="keyword" id="keywordInput" placeholder="검색해보지?">
            <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" id="searchBtn" value="${cri.keyword}">Search</a>
          </div>
        </div>
      </header>

<!-- end. Header-->

<!-- 스터디 리스트 -->
    <div class="section light-bg" id="gallery">
        <div class="container">
            <div class="section-title">
                <h3>New Study</h3>
            </div>

            <div class="img-gallery owl-carousel owl-theme">
            <!-- 최신 리스트만 뽑았어요 -->	
	           <c:forEach items="${list}" var="studyVO">
           		<div class="cborder">
           			<a href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}&bno=${studyVO.bno}">
					<div class="mainimgbox">
					<!-- 메인사진 -->           			
           		<c:if test="${studyVO.name!=null}">
           			<div class='uploadedList' style="background-image:url(/study/displayFile?fileName=${studyVO.name});">
				</div>
				</c:if>
				</div>
				</a>
           			<div class="card-body">
           			<!-- 닉네임 -->
           				${studyVO.nickname}<br>
           				<!-- 제목 -->
           				<strong>${studyVO.title}</strong><br>	
           				<!-- 인원 -->
           				${studyVO.now}/${studyVO.max}<br>
           				<!-- 지역 -->
           				${studyVO.rDName}/${studyVO.rSName}<br>
           				<!-- 시작날짜 -->
           				${studyVO.sd}<br>
           				<!-- 방문자수 -->
           				<i class="fa fa-eye"></i>${studyVO.vct}
           			</div>
           			
           		</div>
           	    </c:forEach>	      

            </div>
        </div>
    </div>

    <!-- // end .section -->

 <!-- Contact -->
<%@include file="../footer.jsp"%>

    <!-- 시계구현하기 -->
    <script>
     function printClock() {

       var clock = document.getElementById("clock");
       var currentDate = new Date();
       var amPm = 'AM';
       var currentHours = addZeros(currentDate.getHours(),2);
       var currentMinute = addZeros(currentDate.getMinutes(),2);
       var currentSeconds = addZeros(currentDate.getSeconds(),2);

       if(currentHours >= 12) {
         amPm = 'PM';
         currentHours = addZeros(currentHours -12,2);
       }

       if(currentSeconds >= 50) {
        currentSeconds = '<span style="color:white;">'+currentSeconds+'</span>'
       }
       clock.innerHTML = currentHours+" : "+currentMinute+" : "+currentSeconds+"<span style='font-size:50px;'>"+" "+amPm+"</span>";

       setTimeout("printClock()", 1000);
     } 

     function addZeros(num, digit) {
      var zero ='';
      num = num.toString();

      if(num.length < digit) {
        for(i=0; i<digit-num.length;i++){
          zero+='0';
        }
      }
      return zero+num;
     }
    </script>
    <!-- 타이핑 -->
   
    <script language="javascript">
	
    var mess = "조정인은 바보 멍청이 똥개 말미잘 이었다.";
    
	var count=0;
	var newsno=0;
	
	function gogogo() {
		document.all("intro-heading").innerText="_"+mess.substring(0,count++);
		if(count>=mess.length){
			count=0;
			newsno++;
			
			if(newsno>=mess.length)
				newsno--;
			
		}
		setTimeout("gogogo()", 200);
	}
	
	
    
    </script>
    <!-- 검색을 위한 스크립트 -->
    <script>
	$(document).ready(
			function(){
				$('#searchBtn').on(
						"click",
						function(event){
							
							self.location = "/study/listAll"
								+ '${pageMakerStudy.makeQuery(1)}'
								+ "&searchType="
								+ "tcn"
								/* + $("select option:selected").val() */
								+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
						});

			}); 
    
    </script> 

<!-- end.contact-->

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
