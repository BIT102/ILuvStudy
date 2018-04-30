<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>FAQ 등록</title>

	<!-- 섬머노트 시작 -->
	
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<script>
var sn = jQuery.noConflict();
</script>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    

<script>
sn(document).ready(function() {
	
	
	sn('#summernote').summernote({

		height: 140,                 // set editor height
		minHeight: null,             // set minimum height of editor
		maxHeight: null,             // set maximum height of editor
		focus: true,                  // set focus to editable area after initializing summernote
		
		// 편집도구 툴팁 종류 선택   
		toolbar: [
		   ['style', ['bold', 'italic', 'underline', 'clear']],
		   ['font', ['strikethrough']], 
		   ['fontsize', ['fontsize']],
		   ['color', ['color']],
		   ['para', ['ul', 'ol', 'paragraph']]
		 ]
           
	});   
 
});
</script>  
  
<style>

/* 썸머노트 버튼 스타일 시작 */
.panel-heading button[type="button"] {

	width:5px !important;
	height:35px !important;
	/* margin:5px; */
	border-radius:10% !important;
	border: 1px solid gray !important;
	/* style="padding-right : 30px; */
	padding-right : 30px !important;
	padding-left:10px !important;
}

.note-toolbar .note-fontsize .note-btn-group button,
.note-toolbar .note-para .note-btn-group button {
    line-height: 12px !important;

}

.panel .panel-heading {
	padding-top:0 !important;
	padding-bottom:0 !important;
}
/* 썸머노트 버튼 스타일 끝 */

</style>

</head>
<body>
<div id="wrapper">
<%@ include file="nav.jsp" %>

	 <!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">FAQ 등록</h3>
					<div class="row">
						<div class="col-md-12">
    						<div class="panel">
        <div class="panel-heading">
			<h3 class="panel-title">FAQ 등록</h3>
		</div>
		
    <div class="panel-body">    
    <form role="form" method="post">    
        <table class="table table-hover">
            <tr>
                <th>제목</th>
                <td><input type="text" id="title" name="title" class="form-control"></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><input type="hidden" name="writer" value="${login.id}">${login.id}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="content" id="summernote" class="form-control"  style="height:100%; resize: none;"></textarea></td>
            </tr>
            <tr>
                <th>공개여부</th>
                <td>
                	<label class="fancy-radio" style="display:inline-block;">
                    	<input type="radio" name="type" value="0"><span><i></i>공개&nbsp;</span>
                    </label>
                    <label class="fancy-radio" style="display:inline-block;">
                    	<input type="radio" name="type" value="1" checked><span><i></i>비공개</span>
                    </label>
                </td>
            </tr>
        </table>
	</form>
	
		<button type="button" id="listBtn" class="btn btn-primary">목록</button>
		<button type="submit" id="registerBtn" class="btn btn-success" style="float:right">등록</button>
		
		</div>
		<!-- panel-body end -->
		
							</div>
						</div>
					</div>
					</div>
				</div>
			<!-- END MAIN CONTENT -->
			</div>
		<!-- END MAIN -->
		</div>    
<script>

	$(document).ready(function(){
		$("#qnaListsuv").attr("class", "active");
		$("#qnaListnav").attr("class", "active");
		$("#subPages2").attr("class", "in");
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		//등록 클릭 시 액션
		$("#registerBtn").on("click", function(){
			//form 유효성 검사 추가 필요
			
			if($("#title").val().length >= 5 && $("#summernote").val().length >= 5){
				formObj.submit();
			}else{
				alert("제목, 내용을 5자 이상 입력하세요");
			}
		});
		
		//목록 클릭 시 액션
		$("#listBtn").on("click", function(){
			self.location = "/admin/qnaList";
		});
	});
</script>
</body>
</html>