
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE htm>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	  <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
    
    <style>
        /* card css */
        .cborder{border:1px solid red;}
        .scard{margin-top:20px; margin-left:10px; float:left;}
        #studycard {margin:0 auto;width:80%;height:800px;}    
        #innerdiv {margin:0 auto; width:1000px; height:600px; }
        
    	li{
    		border : 1px solid red;
    		width :3px;
    		height : 3px;
    	}
    </style>
</head>
<body>

<!-- 검색은 나중에 하겠습니다 -->


<!-- 	<span>전체</span>
    <div>검색어를 입력해주세요. <button>검색</button></div>

    <div class="regiont">
        지역 대분류
        <select>
            <option value="서울">서울</option>
            <option value="부산">부산</option>
        </select>
        지역 소분류
        <select>
            <option value="서울">강남구</option>
            <option value="부산">해운대구</option>
        </select>
    </div>
    <div class="regiont">
            카테고리 대분류
            <select>
                <option value="IT">IT</option>
                <option value="라이프스타일">라이프스타일</option>
            </select>
            카테고리 소분류
            <select>
                <option value="IT">java</option>
                <option value="라이프스타일">미용</option>
            </select>
        </div>
 -->
<!-- 스터디 등록된 목록 -->
<!-- 공지사항 내용들111111111 -->
<div class="header">

<c:forEach items="${list}" var="noticeVO">
	<!-- 처음보일 부분1 -->
	<div class="ntTitle">
		<p>공지사항 제목</p>
		<input type="text" name="ntTitle" value="${noticeVO.ntTitle}">
		<p>올린날짜</p>
		<fmt:formatDate pattern="yyyy-MM-dd HH:mm" 
		value="${noticeVO.ntRegdate}" />
	</div>
	
	<!-- 클릭하면 내용, 쓴사람 (관리자)-->
	<div class="ntContentt">
		<p>글쓴이</p>
		<input type="text" name="ntWriter" value="${noticeVO.ntWriter}">
		<p>내용</p>
		<textarea name="ntContent" row="10">${noticeVO.ntContent}</textarea>
	</div>
	
</c:forEach>	
	
	
<div class="text-center">
	<ul class="pagination">
		
		<c:if test="${pageMaker.prev}">
			<li><a href="listCri?page=${pageMaker.startPage=1}">&laquo;</a></li>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		<li 
			<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
			<a href="listCri?page=${idx}">${idx}</a>
		</li>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
		<li><a href="listCri?page=${pageMaker.endPage+1}">&raquo;</a></li>
		</c:if>
	</ul>
</div>	
	
</div>
	
        
        
        
       