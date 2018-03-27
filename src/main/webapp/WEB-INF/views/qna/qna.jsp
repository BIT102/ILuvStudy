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
    
    <style>
    .textcenter1{text-align:center;}
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
                                    <li><a href="index.html">Home</a></li>
                                    <li class="active">FAQ</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->
            
	
	<!-- qna등록 -->
	<form role="form" method="post" class="form-group">
	
	 <!--첫번째 페이지-->
        <div class="register1 col-md-8 col-sm-9">
            <!--제목입력-->
            <div class="studytitle">
                <p>qna제목</p>
                <input type="text" class="form-control" placeholder="질문제목" name="title" required>
            </div>

              <!--쓴사람//value값수정-->
            <div class="studywriter">
                <p>쓴사람</p>
                <input type="text" class="form-control" placeholder="쓴사람" name="writer" value="abc1@gmail.com" required>
            </div>
            
            <div class="studywriter">
                <p>내용</p>
                <textarea name="content" class="form-control" rows="12" required>내용</textarea>
            </div>
            
            <div class="studywriter">
                <p>타입</p>
                <select name="type">
                <option value="0">FAQ등록</option>
                <option value="1">미등록</option>
                </select>
            </div>
            <div>
				<button type="submit">Submit</button>
            </div>
          </div>  
	</form>
	
	
</div>	
</body>
</html>