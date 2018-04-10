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
			
.time{float:right;}
.page-head {
 background:url(../img/services-bg.jpg);
}
</style>

</head>
<body>

<%@include file="../nav.jsp"%>

<div id="contact-page">
 <!-- header begin -->
            <header class="page-head">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <ol class="breadcrumb">
                                    <li><a href="/study/main">Home</a></li>
                                    <li class="active">자주 묻는 질문</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->

  

<!-- 검색 -->


<div class="container" style="margin-top:30px;">
				<div class="welcome-speech"
					style="float: right; margin-bottom:30px;">
					<input type="text" onKeyDown="onKeyDown();" name="keyword"
						id="keywordInput" placeholder="검색어를 입력하세요" value="${cri.keyword}">
					<button class="btn btn-white">Search</button>
				</div>
				<!-- /.intro -->
			</div>


<section class="bg-light-gray" style="padding-top:50px;">
<section class="row-section">
    <div class="container contentB">
	    <div class="row">
		    <h2 class="text-center"><span>자주 묻는 질문</span></h2>
	    </div>
	    <div class="col-md-12 offset-md-1 row-block">
	        <div class="panel-group" id="accordion">
	        
	    <c:forEach items="${list}" var="QnaVO">    
	    
	    		<div class="panel panel-default">
	      			<div class="panel-heading">
	      			  <h4 class="panel-title">
	        		  <a data-toggle="collapse" data-parent="#accordion" href="#collapse${QnaVO.bno}">${QnaVO.title}</a>
	        		  <small>(admin)</small>
	        		  <span class="time"><fmt:formatDate pattern="yyyy.MM.dd" value="${QnaVO.regdate}"/></span>
	       			 </h4>
	      			</div>
				      <div id="collapse${QnaVO.bno}" class="panel-collapse collapse">
				        <div class="panel-body">${QnaVO.content}</div>
				      </div>
			    </div>
			    
	     </c:forEach>
	     
	    </div>
	</div>

</div>
</section>
</section>
</div>
		<!-- 페이징처리 -->
	<div class="text-center1" style="margin-top:35px;">
		<ul class="pagination">
		
		<!-- 스프링 MVC를 이용하는 방식 -->
			<c:if test="${pageMaker.prev}">
				<li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage}" var = "idx">
				<li 
					<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
					<a href="list${pageMaker.makeQuery(idx)}">${idx}</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage>0 }">
				<li><a href="list${pageMaker.makeQuery(pageMaker.endPage +1)}">&raquo;</a>
				</li>
			</c:if> 
			
		</ul>
	</div>
	


	
</body>
	<script>
	  $(document).ready(function(){
		  
			$(".btn-white").on("click", function(event){
						
				self.location = "list"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ "tcw"
					+ "&keyword=" + encodeURIComponent($('#keywordInput').val());            
			})  
	  })		 
	
	//타자누르면 검색됨
	function onKeyDown() {
	  if(event.keyCode==13){
    	 
			
		  self.location = "list"
				+ '${pageMaker.makeQuery(1)}'
				+ "&searchType="
				+ "tcw"
				+ "&keyword=" + encodeURIComponent($('#keywordInput').val());  
	  }
  }
			
	</script>
	<%@include file="../footer.jsp"%>
</html>