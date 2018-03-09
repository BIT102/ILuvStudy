<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로필</title>

</head>


<body>

	<input type="text" id="nowPw1" name="nowPw1" placeholder="비밀번호 입력해주세요">
	<input type="text" id="nowPw2" name="nowPw2" placeholder="다시 입력해주세요.">

	<input class="ajaxEx" type="button" value="변경하기">

	<script>
	
	$(".ajaxEx").on("click", function(){
		
		var nowPw1 = $('#nowPw1').val();
		var nowPw2 = $('#nowPw2').val();
	
	
		console.log(nowPw1);
		console.log(nowPw2);
	
		$.ajax({
			url : '/ajaxTest',
			type : 'POST',
			header : {
				"X-HTTP-Method-Override" : "post"
			},
			data : {
				nnowPw1 : nowPw1, // 앞에는 컨트롤러에서 가져다 쓸 이름이고, 뒤에는 값값 // key-value
				nnowPw2 : nowPw2  // 
			},
			success : function(result) { //alert으로 result값을 하면 컨트롤러에서 " " 안에 쓴 값임 뜸
				alert(result);

				}
			})
		})
	</script>


</body>


</html>