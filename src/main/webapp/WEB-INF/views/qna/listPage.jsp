
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
    	.table{border:1px solid grey; width:60%; margin:0 auto;}
    </style>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    
    <script>
    
    	var result = '${msg}';
    	
    	if(result == 'SUCCESS'){
    		alert("처리완료.");
    	}
    
    </script>
    
</head>
<body>
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
	<table class="table table-bordered">

		<tr>
			<th style="width:10px">BNO</th>
			<th>TITLE</th>
			<th>WRITER</th>
			<th>REGDATE</th>
			<th style="width:40px">REPLYCNT</th>
		</tr>
	
	<!-- 컨트롤러의 qnaList메소드의 model객체의 list키 -->
	<c:forEach items="${list}" var="QnaVO">
	
		<tr>
			<td>${QnaVO.bno}</td>
			<td><a href="/qna/qnaDetail${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${QnaVO.bno}">
			${QnaVO.title}</a>
			</td>
			<td>${QnaVO.writer}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${QnaVO.regdate}" /></td> <!-- VO의  regdate타입을 Date로 바꿔야함. -->
			<td><span>${QnaVO.type}</span></td>
		</tr>
		
	</c:forEach>
	
	</table>
	
	<div class="text-center">
		<ul class="pagination">
		
		<!-- 스프링 MVC를 이용하는 방식 -->
			<c:if test="${pageMaker.prev}">
				<li><a href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1)}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage}" var = "idx">
				<li 
					<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
					<a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage>0 }">
				<li><a href="listPage${pageMaker.makeQuery(pageMaker.endPage +1)}">&raquo;</a>
				</li>
			</c:if> 
			
		</ul>
	</div>
	
	<script>

// search버튼 동작  
$(document).ready(
		function(){
			
			$('#searchBtn').on(
					"click",
					function(event){
						
						self.location = "list"
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