
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
    <script>
    
    	var result = '${msg}';
    	
    	if(result == 'SUCCESS'){
    		alert("처리완료.");
    	}
    
    </script>
</head>
<body>

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
	
</body>
</html>