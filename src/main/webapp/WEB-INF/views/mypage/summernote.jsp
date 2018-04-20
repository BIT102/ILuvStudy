<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Summernote test</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


<script>

	
$(document).ready(function() {
	
	$('#summernote').summernote({
		  toolbar: [
		    // [groupName, [list of button]]
		    ['style', ['bold', 'italic', 'underline', 'clear']],
		    ['font', ['strikethrough', 'superscript', 'subscript']],
		    ['fontsize', ['fontsize']],
		    ['color', ['color']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']]
		  ]
		});
	
	
    $('#summernote').summernote({
            height: 300,                 // set editor height
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true                  // set focus to editable area after initializing summernote
            
    });
});

$(document).ready(function() {
	  $('#summernote').summernote();
	});
	

</script>

</head>
<body>

                     <form name="addInfoForm" action="/addInfo" method="post">   
                        				<div>* 부가정보</div>
											<table class="table table-hover">
												<tbody>
												 <tr>
													<th>자기소개</th>
														<td>
														<textarea id="summernote" name="introduction">${vo.introduction}</textarea>
														</td>
												</tr>
											
																																															
												</tbody>	
											</table>
											
													<input type="hidden" value="${login.email}" name="email" readonly>
											
													<div>
														<input type="submit" id="btn-success" value="저장하기" style="width:80px; height:42px;">
													</div>
  </form>	 
</body>
</html>