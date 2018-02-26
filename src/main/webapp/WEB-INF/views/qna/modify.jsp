<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!-- Main content -->
<section class="content">

<form role="form" action="modifyPage" method="post">

	<div class="box-body">
	  <div class="form-group">
	  	<label for="exampleInputEmail1">BNO</label>
	  	<input type="text" name='bno' class="form-control" value="${qnaVO.qnaBno}" readonly="readonly">
	  </div>
	  
      <div class="form-group">
       <label for="exampleInputEmail1">Title</label> <input type="text"
        name='title' class="form-control" value="${qnaVO.qnaTitle}">
      </div>
      <div class="form-group">
       <label for="exampleInputPassword1">Content</label>
       <textarea class="form-control" name="content" rows="3">${qnaVO.qnaContent}</textarea>
      </div>
      <div class="form-group">
       <label for="exampleInputEmail1">Writer</label> <input
        type="text" name="writer" class="form-control"
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

 $(".btn-warning")
  .on("click", function() {
    self.location = "qna/qnaList";
   });

 $(".btn-primary").on("click",
   function() {
    formObj.submit();
   });
});
</script>




  
</section>
<!-- /.content -->

