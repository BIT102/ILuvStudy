<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<form role="form" action="modifyPage" method="post">
	
		<input type="hidden" name="page" value="${cri.page}" >
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}" >
		
	<div class="form-group">
		<label for="exampleInputEmail1">BNO</label>
		<input type="text" name="bno" class="form-control" value="${studyVO.bno}" readonly="readonly">
 	</div>
	</form>
	
	<script>
	$(document).ready(function(){
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$(".btn-warning").on("click", function(){
			self.location = "/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
		});
		
		$(".btn-primary").on("click", function(){
			forObj.submit();
		});
	});
	</script>
</body>
</html>