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
    .border{border:2px solid grey; }
    .basic{width:300px; height:50px; float:left; text-align: center;}
    
    .profile{width:150px; height:50px;}
   
    #div1{display:inline-block;}    
    #div2{text-align: center;}
    #div2 div{float:left; }
    body{height:800px; width:1000px;}
    body > div > p3 {text-align:left; font-size:30px; border-bottom:2px solid grey;  }

    #pfimage{  width:600px; height:50px; display:inline-block;
         }
    #acinfo{ width:600px; height:300px; display:inline-block;
        }
    
    #actable{font-size:20px; margin-top:10px;}

    .IT{
        visibility: hidden;
    }

    .ENGLISH{
        visibility: hidden;
    }

    .GONG{
        visibility: hidden;
    }

    #table1{
        width:100%;
        border-collapse:collapse;
        text-align:center;
    }
    tr,th,td{
        border:1px solid black;
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
                    <a href="bookmark">북마크</a></div>
            <div class="profile border">
                    <a href="recruit">모집</a></div>
            <div class="profile border">
                    <a href="application">신청</a></div>
            <div class="profile border">
                    <a href="completed">완료</a></div>
    
        </div>   
    <br>
    <br>
    <br>     
    
    <h4>북마크</h4>


 
    

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
						</div>
					</c:forEach>
    
    

    
</body>
 

</html>