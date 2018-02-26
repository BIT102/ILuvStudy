<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>

<!-- Main content -->
<section class="content">

<form role="form" method="post" action="modify">

	<input type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum}">

	<div class="box-body">
	  <div class="form-group">
	  	<label for="exampleInputEmail1">BNO</label>
	  	<input type="text" name='qnaBno' class="form-control" value="${qnaVO.qnaBno}" readonly="readonly">
	  </div>
	  
      <div class="form-group">
       <label for="exampleInputEmail1">Title</label> <input type="text"
        name='qnaTitle' class="form-control" value="${qnaVO.qnaTitle}">
      </div>
      <div class="form-group">
       <label for="exampleInputPassword1">Content</label>
       <textarea class="form-control" name="qnaContent" rows="3">${qnaVO.qnaContent}</textarea>
      </div>
      <div class="form-group">
       <label for="exampleInputEmail1">Writer</label> <input
        type="text" name="qnaWriter" class="form-control"
        value="${qnaVO.qnaWriter}">
      </div>
     </div>
 </form>
 
     <!-- /.box-body -->
 
    <div class="box-footer">
     <button type="submit" class="btn btn-primary">SAVE</button>
     <button type="submit" class="btn btn-warning">CANCEL</button>
    </div>

<script>
$(document).ready(function() {
 var formObj = $("form[role='form']");

 console.log(formObj);

 //qna/listPage링크처리
 $(".btn-warning")
  .on("click", function() {
    self.location = "/qna/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
   });

 $(".btn-primary").on("click",
   function() {
    formObj.submit();
   });
});
</script>




  
</section>
<!-- /.content -->

