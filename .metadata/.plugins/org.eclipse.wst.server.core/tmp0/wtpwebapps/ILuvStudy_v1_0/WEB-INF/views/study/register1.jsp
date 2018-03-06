﻿<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>Document</title>

<style>
.fileDrop {
	width: 200px;
	height: 200px;
	border: 1px dotted blue;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}

small:hover {
	background-color: black;
}
</style>


</head>
<body>

	<!--스터디등록-->
	<form id="registerForm" role="form" method="post">

		<!--첫번째 페이지-->
		<div class="register1">
			<!--제목입력-->
			<div class="studytitle">
				<p>스터디명</p>
				<input type="text" placeholder="스터디명" name="title">
			</div>

			<!--쓴사람//value값수정-->
			<div class="studywriter">
				<p>쓴사람</p>
				<input type="text" placeholder="쓴사람" name="writer"
					value="abc1@gmail.com">
			</div>

			<!--카테고리-->
			<div class="stucycategory">
				<!--대분류-->
				<div id="BigCat">
					<p>대분류</p>
					<% int cataNum = 64; %>
					<c:forEach items="${catlist}" var="StudyVO">
						<% cataNum++; %>
						<input type="checkbox" value="<%=(char)cataNum%>">${StudyVO.cDName}</input>
					</c:forEach>
				</div>
				<!--소분류 외국어-->
				<p>소분류</p>
				<div id="SmallCat"></div>
			</div>
		</div>

		<!-- 체크박스이벤트 -->
		<script>
			$("#BigCat>input").change(function(){
				var bigNum = $(this).val()
				console.log(bigNum);
				smallCat(bigNum);
			});
	
			function smallCat(bigNum){
				$.getJSON(
					"register1/category/"+bigNum,
					function(data){
						var str = "";
						$(data).each(function(){
							str += "<input type="+'radio'+" value="+this.csId+">"+this.cSName+"</input>";						
						});
						$("#SmallCat").html(str);
					}
				)
			}
		</script>


		<!--두번째 페이지-->
		<div class="register2">
			<!--최대인원-->
			<div class="studymax">
				<p>최대인원</p>
				<input type="number" name="max">
			</div>

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
			
			<!--연령-->
			<div class="studyage">
				<p>연령</p>
				<input type="checkbox" name="age" value="10대">10대 <input
					type="checkbox" name="age" value="20대">20대 <input
					type="checkbox" name="age" value="30대">30대 <input
					type="checkbox" name="age" value="40대">40대 <input
					type="checkbox" name="age" value="50대">50대 <input
					type="checkbox" name="age" value="무관">무관
			</div>

			<!--요일별-->
			<div class="studysc">
				<p>요일</p>
				<select class="sc" name="sc">
					<option selected>--</option>
					<option>월요일</option>
					<option value="화요일">화요일</option>
					<option value="수요일">수요일</option>
					<option value="목요일">목요일</option>
					<option value="금요일">금요일</option>
					<option value="토요일">토요일</option>
					<option value="일요일">일요일</option>
				</select>
			</div>

			<!-- 시작날짜 -->
			<div class="studysd">
				<p>시작날짜</p>
				<input type="date" name="sd">
			</div>
			<!--시작시간//나중에추가하기-->
			<div class="studyst">
				<p>시작시간</p>
				<select class="st" name="st">
					<option selected>--</option>
					<option value="1시">1시</option>
					<option value="2시">2시</option>
					<option value="3시">3시</option>
					<option value="4시">4시</option>
					<option value="5시">5시</option>
					<option value="6시">6시</option>
					<option value="7시">7시</option>
					<option value="8시">8시</option>
					<option value="9시">9시</option>
					<option value="10시">10시</option>
					<option value="11시">11시</option>
					<option value="12시">12시</option>
					<option value="13시">13시</option>
					<option value="14시">14시</option>
					<option value="15시">15시</option>
					<option value="16시">16시</option>
					<option value="17시">17시</option>
					<option value="18시">18시</option>
					<option value="19시">19시</option>
					<option value="20시">20시</option>
					<option value="21시">21시</option>
					<option value="22시">22시</option>
					<option value="23시">23시</option>
					<option value="24시">24시</option>
				</select>
			</div>

			<!--끝나는시간//나중에추가하기-->
			<div class="studyet">
				<p>끝나는시간</p>
				<select class="et" name="et">
					<option selected>--</option>
					<option value="1시">1시</option>
					<option value="2시">2시</option>
					<option value="3시">3시</option>
					<option value="4시">4시</option>
					<option value="5시">5시</option>
					<option value="6시">6시</option>
					<option value="7시">7시</option>
					<option value="8시">8시</option>
					<option value="9시">9시</option>
					<option value="10시">10시</option>
					<option value="11시">11시</option>
					<option value="12시">12시</option>
					<option value="13시">13시</option>
					<option value="14시">14시</option>
					<option value="15시">15시</option>
					<option value="16시">16시</option>
					<option value="17시">17시</option>
					<option value="18시">18시</option>
					<option value="19시">19시</option>
					<option value="20시">20시</option>
					<option value="21시">21시</option>
					<option value="22시">22시</option>
					<option value="23시">23시</option>
					<option value="24시">24시</option>
				</select>
			</div>
		</div>

		<!--3번째 페이지-->
		<div class="register3">
			<!--내용-->
			<div class=studycontent>
				<p>추가글</p>
				<textarea name="content" row="10"></textarea>
			</div>

			<!-- 파일업로드부분 -->
			<div class="studyfile">
				<P>파일업로드</P>

				<h3>Ajax File upload</h3>
				<div class='fileDrop'></div>

				<div class='uploadedList'></div>


			</div>
		</div>

		<button type="submit">종료</button>
	</form>

	<iframe name="zeroFrame"></iframe>
	<!-- 파일등록 핸들러 -->
	<script id="template" type="text/x-handlebars-template">

	<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment">

		<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
		<a href="{{name}}" class="big">zzzz</big></a> <small data-src=data>X</small>

</div>

</script>

	<script>
	
		var template = Handlebars.compile($("#template").html());
		
		$(".fileDrop").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		
		//파일을 떨구는 장소	
		$(".fileDrop").on("drop", function(event){
			
			event.preventDefault();
	
			var files = event.originalEvent.dataTransfer.files;

			var file = files[0];
			
			var formData = new FormData();
			
			formData.append("file", file);
			
			$.ajax({
				url: '/study/uploadAjax',
				data: formData,
				dataType: 'text',
				processData: false,
				contentType: false,
				type: 'POST',
				//파일을 드롭했을때 성공시
				success: function(data){
				
					var fileInfo = getFileInfo(data);
					
					var html = template(fileInfo);
					
					$(".uploadedList").append(html);
					
					
				}

				});
			});

		//이미지삭제합니다
	$(".uploadedList").on("click", "small", function(event){
			
			var that = $(this);
			
			$.ajax({
				url:"/study/deleteFile",
				type:"POST",
				data:{fileName:$(this).attr("data-src")},
				dataType:"text",
				success:function(result){
					if(result == 'deleted') {
						alert("deleted");
						that.parent("div").remove();
					}
				}
			})
			
		});
		
		
		//스터디 보드 등록후 이미지 등록을 위해서
		$("#registerForm").submit(function(event){
			
			event.preventDefault();
			
			var that = $(this);
			
			
			var str = "";
			
			$("uploadedList .big").each(function(index){
				
				str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'>";
			});
			
			that.append(str);
			
			that.get(0).submit();
		});

	</script>


</body>
</html>