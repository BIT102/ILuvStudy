
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
      <script src="http://code.jquery.com/jquery-1.7.js"></script>

    <style>
    	.table-bordered{border:1px solid grey; width:60%; margin:0 auto;}
    	
    </style>
    
</head>
<body>
<!-- 공지사항 페이지11111111 -->
<h1>공지사항이다 확인좀</h1>

<!-- 나중에 수정 삭제 작업에 값을 넘겨주기 위해서 사용
<form role="form" method="post">
	<input type="hidden" name="bno" value="${NoticeVO.bno}">
</form>-->


<%@include file="../header.jsp"%>

	<div class="box-body">
    
    <!-- 검색에 필요한 화면 구현 -->
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





<!-- 공지사항 내용들111111111 -->
	<table class="table-bordered">

		<tr>
			<th style="width:10px">BNO</th>
			<th>TITLE</th>
			<th>WRITER</th>
			<th>REGDATE</th>
		</tr>

<c:forEach items="${list}" var="noticeVO">


	<!-- 처음보일 부분1 -->
		<tr>
			<td>${noticeVO.bno}</td>
			<td><a href="/study/noticeDetail${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${noticeVO.bno}">
			${noticeVO.title}</a>
			</td>
			<td>${noticeVO.writer}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${noticeVO.regdate}" /></td> <!-- VO의  regdate타입을 Date로 바꿔야함. -->
		</tr>
		
</c:forEach>
</table>
		
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
	
	
	<script>
	<!-- search버튼 동작  -->
	$(document).ready(
			function(){
				
				$('#searchBtn').on(
						"click",
						function(event){
							
							self.location = "notice"
								+ '${pageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("select option:selected").val()
								+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
						});
				
				$('#newBtn').on("click", function(evt){
					
					self.location = "register";
				});
				
			});
	</script>
</body>
</html>