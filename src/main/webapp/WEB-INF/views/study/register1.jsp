﻿<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


        <!-- // Navigation -->
<%@include file="../nav.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>

<script src="http://code/jquery.com/jquery-1.7.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<title>Document</title>

<style>

body{margin:30px 20px; color:pink;}

.fileDrop {
	width: 200px;
	height: 200px;
	border: 1px dotted blue;
	background-color:white;
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
#SmallCat1{display:none;}
#SmallCat2{display:none;}
#SmallCat3{display:none;}
#SmallCat4{display:none;}

/*#rSId{display:none;}*/

#registerForm{margin:0 150px; }
.form-control{width:300px; margin:0 auto;}
.input-lg{width:120px;}
.st{width:120px;}
.et{width:120px;}
.sc{width:100px;}

.register1{width;400px;}
.titleP{width:400px;}
</style>
</head>

<body>


	<!--스터디등록-->

	<form id="registerForm" role="form" method="post" class="form-group">

		<!--첫번째 페이지-->
		<div class="register1 ">

			<!--제목입력-->
			<div class="studytitle" >
				<p>스터디명</p>
				<input type="text" placeholder="스터디명" name="title" onclick="CheckForm();" class="form-control titleP input-sm" required>
			</div>

			<!--쓴사람//value값수정-->
			<div class="studywriter">
				<p>쓴사람</p>
				<input type="email" placeholder="쓴사람" name="writer" class="form-control titleP input-sm"
					value="abc1@gmail.com" required pattern="+.com" title="이메일 형식으로 적어주세요">
			</div>

		<!--카테고리-->
			<tr>
                <th>카테고리</th>
                <td>
              
                <!-- 스터디에 등록된 카테고리 체크 표시 -->
                <!-- 스터디 카테고리 데이터 -->
  
                 
<!-- ======== 카테고리 =========== -->       
                 <select id="catD" class="form-control">
                 	<option>--</option>
                 	<c:forEach items="${studyCategory}" var="studyVO">
                 		<option value="${studyVO.cDId}">${studyVO.cDName}</option>
                 	</c:forEach>
                 </select>
                 <select id="catS" class="form-control">
                 	<option>--</option>
              
                 </select>
                 <button type="button" id="addCat" class="btn btn-default btn-xs">추가</button>
                 <div id="addCatArea">
                 </div>
				</td>
            </tr>
		
		<br>
			

			<button type="button" id="catplus" class="btn btn-outline-black">+추가</button>
			<div id="catarea">
				
		</div>

		<!--두번째 페이지-->
		<div class="register2">

			<!--최대인원-->
			<div class="studymax">
				<p>최대인원</p>
				<input type="number" name="max"  min="0" max="200" class="input-lg" required>
			</div>

			<!--지역분류-->
			<div id="studyRegion">



				<!-- 대분류 -->
				<p>지역대분류</p>
				<select name="rDId" id="rDId" class="form-control">

					<option value='' selected>--</option>

					<% int cataNum2 = 64; %>
					<c:forEach items="${rglist}" var="StudyVO">
					<% cataNum2++; %>
						<option value="<%=(char)cataNum2%>">${StudyVO.rDName}</option>
					</c:forEach>

				</select>

				<!-- 소분류 -->
				<p>지역소분류</p>
				<select name="rSId" id="rSId" class="form-control">

					<option selected>--</option>

				</select>
			</div>
			
			
			<!-- 유효성검사 -->
			<script>
			/*	function checkForm(){
					var max = document.register2.max;
					
					if(max.value)
					
					if(user) 
				}
				                      
				console.log(max.value);*/
			</script>
			
			
			<!-- select지역 이벤트       -->
		 	<script>
				$("#rDId").change(function(){
					
					var bigNum2 = $(this).val()

				});
	
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
				<select class="sc form-control" name="sc">
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
				<input type="date" name="sd" class="form-control">
			</div>

			<!--시작시간//나중에추가하기-->
			<div class="studyst">
				<p>시작시간</p>
				<select class="st form-control" name="st">
					<option selected>--</option>
					<option value="6">6시</option>
					<option value="7">7시</option>
					<option value="8">8시</option>
					<option value="9">9시</option>
					<option value="10">10시</option>
					<option value="11">11시</option>
					<option value="12">12시</option>
		 			<option value="13">13시</option>
					<option value="14">14시</option>
					<option value="15">15시</option>
					<option value="16">16시</option>
					<option value="17">17시</option>
					<option value="18">18시</option>
					<option value="19">19시</option>
					<option value="20">20시</option>
					<option value="21">21시</option>
					<option value="22">22시</option>
					<option value="23">23시</option>
					<option value="24">24시</option> 
				</select>
			</div>

			<!--끝나는시간//나중에추가하기-->
			<div class="studyet">
				<p>끝나는시간</p>
				<select class="et form-control" name="et">
				<option selected>--</option>
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
				<textarea name="content" class="form-control"></textarea>
			</div>

			<!-- 파일업로드부분 -->
			<div class="studyfile">

				<h3>Ajax File upload</h3>
				<div class='fileDrop'></div>
				
				<div class='uploadedList'></div>
			</div>
		</div>


		<button type="submit">등록</button>

	</form>

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

<!-- 시간지정 -->
	
<script>
$(".st").change(function(){
var stval = $(".st option:selected").val();

var str="";

	for(var i = stval; i<=24; i++){
				
		str += "<option value'"+i+"'>"+i+"시</option>";
		$(".et").html(str);
}

});

var str = "";

</script>

	<script>

		var template = Handlebars.compile($("#template").html());

		$(".fileDrop").on("dragenter dragover", function(event){
			console.log("1*****************");
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
	<!-- 대분류 셀렉트박스 선택시 소분류 셀렉트 표시 후 추가 하기 -->
		<script>
			$(document).ready(function(){
				
				
				$("#catplus").on("click", function(){
					$('#SmallCat select[style="display: inline-block;"] option:selected').clone().appendTo("#catarea")
					
				});  // small카테고리 셀렉트 태그중 style이 visible인것중 선택된 옵션태그를 #catarea에 클론 한다.
						
				$("#BigCat").change("change", function(){
					
					var bigNum = $(this).val()
					
					$("#catarea").empty();
					smallCat(bigNum);
				});
				function smallCat(bigNum){
					console.log(bigNum);
					/*var bgArr = ['A','B','C','D'];
					for(var i=0; i<4; i++){
						if(bigNum == bgArr[i]){
							var sm = '"#SmallCat'+(i+1)+'"';
							console.log(sm);
							$(sm).show('slow');
						}else{
							$('"#SmallCat'+(i+1)+'"').hide('slow');
						}
					}*/
		
					if(bigNum == 'A'){
						$("#SmallCat1").show('slow');
						$("#SmallCat2").hide('slow');
						$("#SmallCat3").hide('slow');
						$("#SmallCat4").hide('slow');
					}else if(bigNum == 'B'){
						$("#SmallCat1").hide('slow');
						$("#SmallCat2").show('slow');
						$("#SmallCat3").hide('slow');
						$("#SmallCat4").hide('slow');
					}else if(bigNum == 'C'){
						$("#SmallCat1").hide('slow');
						$("#SmallCat2").hide('slow');
						$("#SmallCat3").show('slow');
						$("#SmallCat4").hide('slow');
					}else if(bigNum == 'D'){
						$("#SmallCat1").hide('slow');
						$("#SmallCat2").hide('slow');
						$("#SmallCat3").hide('slow');
						$("#SmallCat4").show('slow');
					}
				}
				//무식코드 .... 리팩토링*******
				});
				


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

<%@include file="../footer.jsp"%>


</body>

</html>