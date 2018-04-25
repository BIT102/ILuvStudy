<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>공지사항 등록</title>

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
			<h3 class="panel-title">공지사항 등록</h3>
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
                <td><textarea name="content" id="content" class="form-control"></textarea></td>
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
            <tr>
            	<th>프로필사진</th>
            	<td>
					<input type='file' name="photo" style="display:inline-block;" id="i_file"/> 
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
		$("#noticeListnav").attr("class", "active");
		$("#subPages2").attr("class", "in");
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		//등록 클릭 시 액션
		$("#registerBtn").on("click", function(){
			//form 유효성 검사 추가 필요
			
			if($("#title").val().length >= 5 && $("#content").val().length >= 5){
				formObj.submit();
			}else{
				alert("제목, 내용을 5자 이상 입력하세요");
			}
		});
		
		//목록 클릭 시 액션
		$("#listBtn").on("click", function(){
			self.location = "/admin/noticeList";
		});
		
	});
	
</script>
</body>
</html>