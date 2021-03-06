
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE htm>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


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
	width: 50px;
	height: 100px;
}

.vct {
	border: 1px solid black;
	width: 40px;
	height: 40px;
}
</style>
</head>
<body>

	<!-- 검색은 나중에 하겠습니다 -->
   <!-- 검색에 필요한 화면 구현 -->
   	<div class="box-body">
     <select name="serchType">
       <option value="n"
         <c:out value="${cri.searchType == null?'selected':''}"/>>
         ---</option>
       <option value="t"
         <c:out value="${cri.searchType eq 't'?'selected':''}"/>>
         Title</option>
       <option value="c"
         <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
         Content</option>
       <option value="w"
         <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
         Writer</option>
       <option value="tc"
         <c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
         Title OR Content</option>
       <option value="cw"
         <c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
         Content OR Writer</option>
       <option value="tcw"
         <c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
         Title OR Content OR Writer</option>
     </select>
     
     <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
     <button id="searchBtn">SEARCH</button>
     <button id="newBtn">NEW BOARD</button>
	</div>
	
	<div id="studycard">

		<div id="innerdiv">
			<c:forEach items="${list}" var="studyVO">
				
				<div class="scard cborder" style="width: 20rem;">

					<!-- 파일등록 -->
                 <c:if test="${studyVO.name!=null}">
					<div class='uploadedList'>
						<span class="mailbox-attachment-icon has-img"><img
							src="/study/displayFile?fileName=${studyVO.name}"
							alt="Attachment"></span>
					</div>
				</c:if> 

					<div class="card-body">
						${studyVO.bno}
						<!-- 작성자 -->
						<p class="card-writer">${studyVO.nickname}</p>
						<!-- 스터디 제목 -->
						<h4 class="card-title">${studyVO.title}</h4>
						<!-- 현재인원/최대인원 -->
						<p class="nowandmax">${studyVO.now}/${studyVO.max}</p>
						<!-- 지역 -->
						<p class="regionDS">${studyVO.rDName}/${studyVO.rSName}</p>

						<!-- 시작일 -->
						<p class="st">${studyVO.sd}</p>

						<!-- 조회수 -->
						<p class="vct">${studyVO.vct}</p>
						<!-- 상세페이지로 링크 -->
					<!--	<a href="/study/board?bno=${studyVO.bno}" class="btn btn-primary">$99</a>  -->
						<a href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}&bno=${studyVO.bno}" class="btn btn-primary">$99</a>
					</div>
				</div>

			</c:forEach>
		</div>
	</div>
	
		<div class="text-center">
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

</body>
</html>