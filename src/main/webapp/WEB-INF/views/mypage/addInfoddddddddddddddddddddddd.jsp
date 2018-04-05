<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>



<!-- 마이페이지-부가정보 수정 -->

<title>부가 정보</title>
<style>
.border {
	border: 2px solid grey;
}

.basic {
	width: 300px;
	height: 50px;
	float: left;
	text-align: center;
}

.profile {
	width: 150px;
	height: 50px;
}

#div1 {
	display: inline-block;
}

#div2 {
	text-align: center;
}

#div2 div {
	float: left;
}

body {
	height: 800px;
	width: 700px;
}

body>div>p3 {
	text-align: left;
	font-size: 30px;
	border-bottom: 2px solid grey;
}

#pfimage {
	width: 600px;
	height: 50px;
	display: inline-block;
}

#acinfo {
	width: 600px;
	height: 300px;
	display: inline-block;
}

#actable {
	font-size: 20px;
	margin-top: 10px;
}

.IT {
	visibility: hidden;
}

.ENGLISH {
	visibility: hidden;
}

.GONG {
	visibility: hidden;
}
</style>
</head>


<body>


	<form name="addInfoForm" action="/addInfo" method="post">

		<!-- 부가정보  -->
		<h4>부가정보 입력</h4>


		<p>관심 카테고리</p>

		<!-- 카테고리 대/소분류 메소드 -->
		<span><button onclick="show()">#IT</button></span> <span><button
				onclick="show2()">#영어</button></span> <span><button
				onclick="show3()">#공무원</button></span> <br>



		<script>
			function show() {
				document.getElementById("IT").style.visibility = "visible";
			}

			function show2() {
				document.getElementById("ENGLISH").style.visibility = "visible";
			}

			function show3() {
				document.getElementById("GONG").style.visibility = "visible";
			}

			// // class명으로 보이기/사라지기
			// function show(){
			//     var kk = document.getElementsByClassName("IT");
			//     kk[0].style.visibility = "visible"
			// }
		</script>

		<div class="IT" id="IT">
			<input type="checkbox" name="IT" value="JAVA" id="01"> JAVA <input
				type="checkbox" name="IT" value="spring" id="02"> SPING <input
				type="checkbox" name="IT" value="html" id="03"> HTML/CSS
		</div>

		<div class="ENGLISH" id="ENGLISH">
			<input type="checkbox" name="english" value="toeic" id="04">
			TOEIC <input type="checkbox" name="english" value="speaking" id="05">
			SPEAKING <input type="checkbox" name="english" value="opic" id="06">
			OPIC
		</div>

		<div class="GONG" id="GONG">
			<input type="checkbox" name="civil" value="administration" id="07">
			행정 <input type="checkbox" name="civil" value="police" id="08">
			경찰 <input type="checkbox" name="civil" value="fireman" id="09">
			소방
		</div>

		<br> <br>

		<p>관심 지역</p>
				<div class="register2">
			<!--지역분류-->
			<div id="studyRegion">

				<!-- 대분류 -->
				<p>지역대분류</p>
				<select name="rDId" id="rDId">

					<option value='' selected>--</option>

					<% int cataNum2 = 64; %>
					<c:forEach items="${rglist}" var="StudyVO">
						<% cataNum2++; %>
						<option value="<%=(char)cataNum2%>">${StudyVO.rDName}</option>
					</c:forEach>
				</select>

				<!-- 소분류 -->
				<p>지역소분류</p>
				<select name="rSId" id="rSId">
					<option selected>--</option>
				</select>
			</div>
		
			<!-- select지역 이벤트       -->
		 	<script>
				$("#rDId").change(function(){
				
					var bigNum2 = $(this).val()
					
					console.log(bigNum2);
					smallCat2(bigNum2);
				})
	
				function smallCat2(bigNum2){
					$.getJSON(
						"register1/region/"+bigNum2,
						function(data){
							var str = "";

							$(data).each(function(){
								str += "<option value="+this.rSId+">"+this.rSName+"</option>";							
							});
							
							$("#rSId").html(str);
						}
					)
				}			
			</script> 


		<h3>자기소개</h3>
		<%-- <textarea row="5" cols="50" name="introduction">${vo.introduction}</textarea> --%>
		<textarea id="summernote" name="introduction">${vo.introduction}</textarea>

		<script>
		$(document).ready(function() {
			  $('#summernote').summernote();
			});
		</script>


		<h3>홈페이지</h3>
		<input type="url" name="homepage" value="${vo.homepage}"> <br>


		<input type="hidden" value="${login.email}" name="email" readonly>

		<div>
			<input type="submit" value="저장하기">
		</div>

	</form>

	<script>
		$(document).ready(function() {
			alert("${result}");
		})
	</script>

</body>


</html>