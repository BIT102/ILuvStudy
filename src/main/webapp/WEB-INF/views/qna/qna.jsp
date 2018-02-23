<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
	<!-- qna등록 -->
	<form role="form" method="post">
	
	 <!--첫번째 페이지-->
        <div class="register1">
            <!--제목입력-->
            <div class="studytitle"></div>
                <p>qna제목</p>
                <input type="text" placeholder="질문제목" name="qnaTitle">
            </div>

              <!--쓴사람//value값수정-->
            <div class="studywriter">
                <p>쓴사람</p>
                <input type="text" placeholder="쓴사람" name="qnaWriter" value="abc1@gmail.com">
            </div>
            
            <div class="studywriter">
                <p>내용</p>
                <textarea name="qnaContent" rows="12">내용</textarea>
            </div>
            
            <div class="studywriter">
                <p>타입</p>
                <select name="qnaType">
                <option value="0">FAQ등록</option>
                <option value="1">미등록</option>
                </select>
            </div>
            <div>
				<button type="submit">Submit</button>
            </div>
            
	</form>
</body>
</html>