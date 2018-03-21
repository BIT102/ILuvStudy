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

<html class="no-js"> <!--<![endif]-->
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
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Kaushan+Script" type="text/css">

        <!-- scripts -->
        <script type="text/javascript" src="/resources/assets/js/modernizr.custom.97074.js"></script>

	<style>
	#keywordInput {
		width:300px;
		height:40px;
		padding-left:8px;
		margin-right:30px;
		
		border:none;
		border-bottom:2px solid black;
		background-color:transparent;
	}
	
	
	</style>
	
    </head>

   <body onLoad="gogogo()">

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
                            <input type="text" name="keyword" id="keywordInput" placeholder="검색어를 입력하세요"> 
                            <button class="btn btn-white">Search</button>
                        </div><!-- /.intro -->
                        
                    </div><!-- /.container -->

                </div><!-- /.header-wrapper-inner -->
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
                                    <p class="section-sub-title">
                                    	    최근 등록된 스터디 입니다 &amp; 방문을 원하시면 이미지를 클릭해 주세요
                                    </p> <!-- /.section-sub-title -->
                                </div>
                            </div>
                        </div> <!-- /.headline -->

              <div id="client-speech" class="owl-carousel owl-theme">
             		<c:forEach items="${list}" var="studyVO" step="2" varStatus="status">
                            <div class="item">
                                <div class="row">
            		<c:if test="${staus.index%2==0}">
                                    <div class="col-md-6">
                                        <div class="client-box">
                                            <div class="about-client">
                                             <a href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}&bno=${studyVO.bno}">
                                                <img src="/study/displayFile?fileName=${studyVO.name}" alt="client1">
                                             </a>   
                                            </div> <!-- end of /.about-client -->
                                            <div class="main-speech">
                                                <p>
                                                  <strong> ${studyVO.title}</strong>${studyVO.bno}<br>
                                                   ${studyVO.nickname}<br>
                                                   ${studyVO.rDName} / ${studyVO.rSName}<br>
                                                   ${studyVO.cDName} / ${studyVO.cSName}<br>
                                                  <fmt:formatDate pattern="yyyy-MM-dd" value="${studyVO.regdate}" />
                                                   
                                                </p>
                                            </div> <!-- end of /.main-speech  -->                                  
                                        </div> <!-- end of /.client-box -->    
                                    </div>
                     </c:if>
                     <c:set var="test" value="${list[status.index+1]}"/>
						
								   <div class="col-md-6">
                                        <div class="client-box">
                                            <div class="about-client">
                                            <a href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}&bno=${test.bno}">
                                                <img src="/study/displayFile?fileName=${test.name}" alt="client2">
                                            </a>   
                                            </div> <!-- end of /.about-client -->
                                            <div class="main-speech">
                                                <p>
                                                  <strong> ${test.title}</strong>${test.bno}<br>
                                                   ${test.nickname}<br>
                                                   ${test.rDName} / ${test.rSName}<br>
                                                   ${test.cDName} / ${test.cSName}<br>
                                                   <fmt:formatDate pattern="yyyy-MM-dd" value="${test.regdate}" /><br>
                                                </p>
                                            </div> <!-- end of /.main-speech  -->
                                        </div> <!-- end of /.client-box -->
                                    </div>              
                                </div>
                            </div>
					</c:forEach>	
                        </div>
                    </div>
                            
                            
                        </div> <!-- end of /#client-speech  /.owl-carousel -->

                    </div> <!-- end of .container -->
                </section> 
                <!--  end of testimonial  section -->

            
            
            <!-- footer-navigation start -->  
            <nav class="hidden-xs hidden-sm navbar footer-nav" role="navigation">
                <div class="container">
                    
                    <div class="navbar-header">
                        
                        <!-- navbar logo -->
                        <div class="navbar-brand">
                            <span class="sr-only">&copy;I Luv Study</span>
                            <a href="index.html">
                                &copy;I Luv Study
                            </a>
                        </div>
                        <!-- navbar logo -->

                    </div><!-- /.navbar-header -->

                    <!-- nav links -->
					<%@include file="../footer.jsp"%>
					
					
			    </div><!-- /.container -->
            </nav>
            <!-- footer-navigation end -->
            
        </div> <!-- end of /#home-page -->

        <!--  Necessary scripts  -->

        <script type="text/javascript" src="/resources/assets/js/jquery-2.1.3.min.js"></script>
        <script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="/resources/assets/js/owl.carousel.js"></script>
        <script type="text/javascript" src="/resources/assets/js/jquery.hoverdir.js"></script>

    </body>
</html>