
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
        <div id="studycard">
        
               <div id="innerdiv">
        <c:forEach items="${list}" var="studyVO">
                <div class="scard cborder" style="width: 20rem;">
                        <img class="card-img-top" src="kazakhstan.jpg" alt="Card image cap">
                        <div class="card-body">
                        <h4 class="card-title">${studyVO.bsTitle}</h4>
                        <p class="card-text">EXCEL의 정석 저자의 엑셀 소규모 스터디</p>
                        <a href="boarder.html" class="btn btn-primary">$99</a>
                        </div>
                </div>
   <!--             <div class="scard cborder" style="width: 20rem;">
                        <img class="card-img-top" src="hq.jpg" alt="Card image cap">
                        <div class="card-body">
                        <h4 class="card-title">인싸정인</h4>
                        <p class="card-text">체대출신 조정인님의 인생 상담</p>
                        <a href="boarder.html" class="btn btn-primary">$12</a>
                        </div>
                </div>
                <div class="scard cborder" style="width: 20rem;">
                        <img class="card-img-top" src="보랏.jpg" alt="Card image cap">
                        <div class="card-body">
                        <h4 class="card-title">영원4ever</h4>
                        <p class="card-text">연륜의 영원님의 인생강의 <br> CHECK IT!</p>
                        <a href="boarder.html" class="btn btn-primary">$20</a>
                        </div>
                </div>  -->
                </c:forEach>
            </div>  
        </div>
</body>
</html>