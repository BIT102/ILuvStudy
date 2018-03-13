
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>

        <!-- // Navigation -->
<%@include file="../header.jsp"%>
<body data-spy="scroll" data-target="#navbar" data-offset="30">


<!-- 검색구현하기  -->
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
         <c:out value="${cri.searchType eq 'n'?'selected':''}"/>>
         NickName</option>
       <option value="tc"
         <c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
         Title OR Content</option>
       <option value="cw"
         <c:out value="${cri.searchType eq 'cn'?'selected':''}"/>>
         Content OR NickName</option>
       <option value="tcw"
         <c:out value="${cri.searchType eq 'tcn'?'selected':''}"/>>
         Title OR Content OR NickName</option>
     </select>
     
     <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
     <button id="searchBtn">SEARCH</button>
     <button id="newBtn">NEW BOARD</button>
	</div>
	
	  <!-- Portfolio Grid -->
    <section class="bg-light" id="portfolio">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">스터디를 구경하세요</h2>
            <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal1">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fa fa-plus fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" src="/resources/dist/img/portfolio/01-thumbnail.jpg" alt="">
            </a>
          </div>
 </div>
 </div>
 
    </section>
		<!-- 페이징처리 -->
		<div class="text-center">
		<ul class="pagination">
		
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
	 <!-- Contact -->
	<%@include file="../footer.jsp"%>
	
		<script>
	<!-- 검색을 위한 스크립트 -->
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