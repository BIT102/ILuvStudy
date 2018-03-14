﻿<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

        <!-- // Navigation -->
<%@include file="../header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>

<title>Document</title>

<style>

body{margin:30px 20px;}

.fileDrop {
	width: 200px;
	height: 200px;
	border: 1px dotted blue;
}

.small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}

.small:hover {
	background-color: black;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}

.bigcatB{background-color:red; border-radius:8px; width:120px; height:30px;}
#SmallCat1{visibility:hidden;}
#SmallCat2{visibility:hidden;}
#SmallCat3{visibility:hidden;}
#SmallCat4{visibility:hidden;}
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
				<input type="text" placeholder="스터디명" name="title" onclick="CheckForm();">
			</div>

			<!--쓴사람//value값수정-->
			<div class="studywriter">
				<p>쓴사람</p>
				<input type="text" placeholder="쓴사람" name="writer"
					value="abc1@gmail.com">
			</div>

			<!--카테고리-->
			<div class="stucycategory">
				<!--대분류--><p>대분류 </p>
				
				<select id="BigCat"  name="categoryD">
					<option> --- </option>
					<% int cataNum = 64; %>
					<c:forEach items="${catlist}" var="StudyVO">
						<% cataNum++; %>
						<option class="bigcatB" value="<%=(char)cataNum%>" id="<%=(char)cataNum%>">${StudyVO.cDName}</option>
					</c:forEach>
					
				</select>
				<!--소분류 외국어-->
				<p>소분류</p>
				
				<select id="SmallCat1" name="categoryS">
				<option type=radio value="1">	토익</option>	<option type=radio value="2">	토플 </option>	<option type=radio value="3">	텝스 </option> 	<option type=radio value="4">	토스/오픽 </option>	<option type=radio value="5">	회화 </option>	<option type=radio value="6">	작문/독해 </option>	<option type=radio value="7">	중국어	 </option><option type=radio value="8">	일본어	 </option><option type=radio value="9">	기타 </option>	
				</select>
				
				<select id="SmallCat2" name="categoryS">
				<option type=radio value="1">	컴퓨터언어	<option type=radio value="2">	웹프로그래밍	<option type=radio value="3">	모바일프로그래밍	<option type=radio value="4">	데이터베이스/서버	<option type=radio value="5">	게임프로그래밍	<option type=radio value="6">	문서작정	<option type=radio value="7">	자격증<option type=radio value="8">	기타	
				</select>
				
				<select id="SmallCat3" name="categoryS">
				<option type=radio value="1">	미술/디자인	<option type=radio value="2">	뷰티/미용	<option type=radio value="3">	스포츠	<option type=radio value="4">	음악/공연	<option type=radio value="5">	게임	<option type=radio value="6">	기타	
				</select>
				
				<select id="SmallCat4" name="categoryS">
				<option type=radio value="1">	면접	<option type=radio value="2">	자소서	<option type=radio value="3">	고시	<option type=radio value="4">	기술	<option type=radio value="5">	기타	
				</select>
				
				
			</div>

		</div>

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

			<!--연령-->
			<div class="studyage">
				<p>연령</p>
				<input type="checkbox" name="age" value="10대">10대
				 <input type="checkbox" name="age" value="20대">20대 
				 <input type="checkbox" name="age" value="30대">30대 
				 <input type="checkbox" name="age" value="40대">40대
				 <input type="checkbox" name="age" value="50대">50대 
				<input type="checkbox" name="age" value="무관">무관
			</div>

			<!--요일별-->
			<div class="studysc">
				<p>요일</p>
				<select class="sc" name="sc">
					<option selected>--</option>
					<option value="월요일">월요일</option>
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
		
		<script>
		$(".st").change(function(){
			console.log($(this).val());
			tval = $(this).val();
			$(".et option").remove(val="tval")
		}); //시작시간 끝나는시간 
		</script>

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
				<input type="file" name="file">파일을 골라주세용

				<h3>Ajax File upload</h3>
				<div class='fileDrop'></div>
				
				<div class='uploadedList'></div>
			</div>
		</div>

		<button type="submit">등록</button>
	</form>

	<iframe name="zeroFrame"></iframe>
	
	<!-- 일등록 핸들러 -->
	<script id="template" type="text/x-handlebars-template">
		<div class="mailbox-attachment-info">
		<span class="mailbox-attachment-icon has-img">
			<img src="{{imgsrc}}" alt="Attachment">
		</span>
		<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
		<small class = "small" value = "{{name}}" data-src=data style="cursor:pointer">X</small>
		</span>
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

			console.log(file);

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

		//취소버튼
		$(".uploadedList").on("click", "small", function(event){

			var that = $(this);

			$.ajax({
				url:"deleteFile",
				type:"post",
				data:{fileName:$(this).attr("data-src")},
				dataType:"text",
				success:function(result){
					if(result == 'deleted') {
						alert("deleted");
						that.parent("div").remove();
					}
				}
			});
		});

		//스터디 보드 등록후 이미지 등록을 위해서
		$("#registerForm").submit(function(event){

			event.preventDefault();
			
			var that = $(this);

			var str = "";

			$(".uploadedList .small").each(function(index){
				str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("value")+"'>";
			});
			that.append(str);

			that.get(0).submit();

		});
		
		//등록 버튼 클릭 후 유효성 검사
		$("#registerForm").submit(function(event){
			
			event.preventDefault();
			
			if(title === null) {
				alert("제목을 입력해 주세요!")
			}
		})
	</script>
		<script>
			$(document).ready(function(){
				
			
				$("#BigCat").change("change", function(){
					
					var bigNum = $(this).val()
					
					smallCat(bigNum);
				});
				function smallCat(bigNum){
					console.log(bigNum);
					if(bigNum == 'A'){
						$("#SmallCat1").css('visibility', 'visible')
						$("#SmallCat2").css('visibility', 'hidden')
						$("#SmallCat3").css('visibility', 'hidden')
						$("#SmallCat4").css('visibility', 'hidden')
					}else if(bigNum == 'B'){
						$("#SmallCat1").css('visibility', 'hidden')
						$("#SmallCat2").css('visibility', 'visible')
						$("#SmallCat3").css('visibility', 'hidden')
						$("#SmallCat4").css('visibility', 'hidden')
					}else if(bigNum == 'C'){
						$("#SmallCat1").css('visibility', 'hidden')
						$("#SmallCat2").css('visibility', 'hidden')
						$("#SmallCat3").css('visibility', 'visible')
						$("#SmallCat4").css('visibility', 'hidden')
					}else if(bigNum == 'D'){
						$("#SmallCat1").css('visibility', 'hidden')
						$("#SmallCat2").css('visibility', 'hidden')
						$("#SmallCat3").css('visibility', 'hidden')
						$("#SmallCat4").css('visibility', 'visible')
					}
				}
				//무식코드 .... 리팩토링*******
				});
				
	/*function smallCat1(big)
				
				console.log("gigi")
				var bigNum1 = $(this).val()
				
				smallCat1(bigNum1);
				
				$("#B").change(function(){
					$("#SmallCat2").css('visibility', 'visible');
				});
				$("#C").change(function(){
					$("#SmallCat3").css('visibility', 'visible');
				});
				$("#D").change(function(){
					$("#SmallCat4").css('visibility', 'visible');
				});
			});
			*/
	</script>
	
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

</body>

</html>