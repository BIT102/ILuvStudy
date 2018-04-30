<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>공지사항 등록</title>
    
    
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
					<h3 class="page-title">공지사항 등록</h3>
					<div class="row">
						<div class="col-md-12">
    						<div class="panel">
        <div class="panel-heading">
			<h3 class="panel-title">공지사항 상세</h3>
		</div>
    
    <div class="panel-body">    
	<form role="form" method="post">
        <table class="table table-hover">
            <tr>
                <th>제목</th>
                <td><input type="text" id="title" name="title" value="${noticeVO.title}" class="form-control"></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><input type="hidden" name="writer" value="${login.id}" class="form-control">${noticeVO.writer}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" id="summernote" class="form-control" style="height:100%; resize: none;">${noticeVO.content}</textarea>
                </td>
            </tr>
            <tr>
                <th>공개여부</th>
                <td>
                	<label class="fancy-radio" style="display:inline-block;">
                    	<input type="radio" name="type" value="0"><span><i></i>공개&nbsp;</span>
                    </label>
                    <label class="fancy-radio" style="display:inline-block;">
                    	<input type="radio" name="type" value="1"><span><i></i>비공개</span>
                    </label>
                </td>
            </tr>
            <tr>
                <th>등록일</th>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${noticeVO.regdate}"/></td>
            </tr>
            <tr>
                <th>최종 수정일</th>
                <td>
                	<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${noticeVO.lastModifyDate}"/>
                </td>
            </tr>
            <tr>
            	<th>프로필사진</th>
            	<td>
            	 <%-- 	<div class='uploadedList'>
						<div class="mailbox-attachment-info">
							<span class="mailbox-attachment-icon has-img">
								<img src="/study/displayFile?fileName=${noticeVO.photo}" alt="Attachment" style="width:150px; height:150px;" id="proimg">
							</span>
						</div>
					</div> --%>
					<input type='file' name="photo" style="display:inline-block;" id="i_file"/> 
            	</td>
            </tr>
        </table>
	</form>
		<button type="button" id="listBtn" class="btn btn-primary">목록</button>
		<button type="submit" id="modifyBtn" class="btn btn-success" style="float:right">수정</button>
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

var count=1;
var sel_file; 

$(document).ready(function(){
		$("#qnaListsuv").attr("class", "active");
		$("#noticeListnav").attr("class", "active");
		$("#subPages2").attr("class", "in");
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		var type = ${noticeVO.type}; //공개여부 db값 체크
		if(type==0){
			$("input:radio[value='0']").attr("checked", "checked");
		}else{
			$("input:radio[value='1']").attr("checked", "checked");
		}
		
		
		//수정 클릭 시 액션
		$("#modifyBtn").on("click", function(){
			//form 데이터 유효성 검사 추가 필요
			
			if($("#title").val().length >= 5 && $("#summernote").val().length >= 5){
				formObj.submit();
			}else{
				alert("제목, 내용을 5자 이상 입력하세요");
			}
		});
		
		//목록 클릭 시 액션
		$("#listBtn").on("click", function(){
			self.location = "/admin/noticeList?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+"&titleKeyword=${cri.titleKeyword}"
							+"&idKeyword=${cri.idKeyword}";

		});
		
		$("#i_file").on("change", handleImgFileSelect);
	});
	
function handleImgFileSelect(e) {

	var files = e.target.files;
	var file = files[0]
	
	/* var filesArr = Array.prototype.slice.call(files); */
	
	var formData = new FormData();
	formData.append("file", file);
	
	console.log(files[0]);
	console.log("check");
	
	$.ajax({
		url : '/pUploadForm',
		data : formData,
		dataType : 'text',
		processData : false,
		contentType : false,
		type : 'POST',
		//파일을 드롭했을때 성공시
		success : function(data) {

			console.log("3*****************");
			var fileInfo = getFileInfo(data);
			var html = template(fileInfo);
			if(count>=1){
				/* alert("프로필사진은 한 장만 등록됩니다.") */
				
				console.log($(".uploadedList img").parent().parent());
				
				$(".uploadedList img").parent().parent().remove();
				
				$(".uploadedList").append(html);
				
				count = 1;
			} else {
			$(".uploadedList").append(html);
			count++;
			
			}
		}
	});
}	

//취소버튼
$(".uploadedList").on("click", "small", function(event) {
	--count;
	var that = $(this);
	$.ajax({
		url : "/study/deleteFile",
		type : "post",
		data : {
			fileName : $(this).attr("data-src")
		},
		dataType : "text",
		success : function(result) {
				
				alert("deleted");
				$(this).parent("div").remove();
				$(".uploadedList img").parent().parent().remove();
		}
	});
});
</script>

</body>
</html>