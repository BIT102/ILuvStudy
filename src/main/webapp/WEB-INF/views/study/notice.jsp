<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE htm>
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
	
	.contentB{border: 1px solid #dadada;}
	.text-center1{text-align:center;}
/*페이지 처리*/
.pagination>li>a, .pagination>li>span { 
margin: 8px;
color:#6b456a !important;
}

.pagination>.active>a {
	    z-index: 2;
    color: white !important;
    background-color: black !important;
    border-color: white !important;
    cursor: default;
}


.faqbtn{float:right;}
.sectionbox{border:2px solid black;
			border-radius:8px;
			margin-bottom:5px;}
</style>

</head>
<body>

<%@include file="../nav.jsp"%>
<div id="single-blog-page">
 <!-- header begin -->
            <header class="page-head">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <ol class="breadcrumb">
                                    <li><a href="index.html">Home</a></li>
                                    <li class="active">NOTICE</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->

<!-- 검색 -->
<form onsubmit="submitFn(this, event);">
            <div class="search-wrapper">
                 <div class="input-holder">
                 	
                 	
                    <input type="text" class="search-input" placeholder="Type to search" />

                 	<button class="search-icon" onclick="searchToggle(this, event);" ><span>검색</span></button>
                </div>
                <span class="close" onclick="searchToggle(this, event);"></span>
                <div class="result-container">

                </div>
            </div>
            
            <br>
          
            <div>
            	
            </div>
</form>

<br>
<section class="row-section">
    <div class="container contentB">
	    <div class="row">
		    <h2 class="text-center"><span>공 지 사 항</span></h2>
	    </div>
	    <div class="col-md-10 offset-md-1 row-block">
	        <ul id="sortable">
	        
	    <c:forEach items="${list}" var="noticeVO">    
	            <li class="sectionbox"><div class="media">
	            <div class="media-left align-self-center">
	               ${noticeVO.bno}
	            </div>
	            <div class="media-body">
	                <h4>${noticeVO.title}         ${noticeVO.writer}</h4><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${noticeVO.regdate}" />
	                <p>${noticeVO.content}</p>
	            </div>
	            <div class="media-right align-self-center">
	                <a href="/study/noticeDetail${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${noticeVO.bno}" class="btn btn-default">수정하기</a>
	            </div>
	        </div></li>
	        
	     </c:forEach>
	        
	        </ul>
	    </div>
</div>
</section>

		<!-- 페이징처리 -->
	<div class="text-center1">
		<ul class="pagination">
		
		<!-- 스프링 MVC를 이용하는 방식 -->
			<c:if test="${pageMaker.prev}">
				<li><a href="notice${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage}" var = "idx">
				<li 
					<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
					<a href="notice${pageMaker.makeQuery(idx)}">${idx}</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage>0 }">
				<li><a href="notice${pageMaker.makeQuery(pageMaker.endPage +1)}">&raquo;</a>
				</li>
			</c:if> 
			
		</ul>
	</div>
	

	</div>
</body>
</html>