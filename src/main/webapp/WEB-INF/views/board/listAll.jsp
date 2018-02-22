<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   <%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        .scard{margin-top:20px; margin-left:10px; float:left; }
        #studycard {margin:0 auto;}    
        #innerdiv {margin:0 auto; width:1000px; }
        
    
    </style>
</head>
<body>
	<span>전체</span>
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



        <div id="studycard">
        
        
            <div id="innerdiv">
            <c:forEach items="${list}" var="boardVO">
                <div class="scard cborder" style="width: 20rem;">
                        <img class="card-img-top" src="kazakhstan.jpg" alt="Card image cap">
                        <div class="card-body">
                        <h4 class="card-title">${boardVO.BSTITLE}</h4>
                        <p class="card-text">EXCEL의 정석 저자의 엑셀 소규모 스터디</p>
                        <a href="boarder.html" class="btn btn-primary">$99</a>
                        </div>
                </div>
                </c:forEach>
            </div>
        
            
        </div>
        

</body>
</html>