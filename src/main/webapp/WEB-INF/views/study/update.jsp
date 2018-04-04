<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>스터디 상세</title>

<style>
form th {
	width: 30%;
}
#rDName, #rSName, #age, #sc, #st, #et, #catD, #catS {
	width: 30%;
	display: inline;
}
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
.fileDrop {
	border: none;
	width: 800px;
	background-color: gray;
}
.mailbox-attachment-info {
	display: inline
}
#btn-success {
	background-color: #5bc0de;
	border: 1px solid black;
	margin-right: 10px;
	float:right;
}
#btn-success:hover {
	background-color: #31b0d5;
	border-color: #269abc;
}
.btn {
	padding: 5px 20px !important;
	margin-left: 20px !important;
}
.btn-xs {
	margin-top: 5px;
}
/*지도스타일입니다*/
#map {
	height: 300px;
	margin-top:15px;
}
</style>
</head>
<body>
	<div id="wrapper">

		<%@include file="../nav.jsp"%>

            <header class="page-head" style="background:url(/resources/assets/img/twitter-feed-bg.jpg);">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <ol class="breadcrumb">
                                    <li><a href="/study/main">Home</a></li>
                                    <li class="active">Regist</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->



		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content" style="background-color: #f9f9f9">
				<div class="container">
					<h3 class="page-title">스터디 등록하기</h3>
					<div class="row">
						<div class="col-md-12">
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">스터디 상세</h3>
								</div>

								<div class="panel-body">
									<form role="form" method="post" id="registerForm">
										<div>* 기본정보</div>
										<table class="table table-hover">
											<tbody>

												<tr>
													<th>카테고리</th>
													<td>
														<!-- 스터디에 등록된 카테고리 체크 표시 --> <!-- 스터디 카테고리 데이터 --> <%--               <c:forEach items="${studyCategory}" var="studyVO" varStatus="status">
                 	<c:if test="${status.index eq 0 || status.index eq 9 || status.index eq 17 || status.index eq 23}">
                 		<label class="fancy-checkbox">
                 			<input type="checkbox" name="categoryD" class="${studyVO.cDName}" id="${studyVO.cDName}"><span><b>${studyVO.cDName}</b></span>
                 		</label>
                 	</c:if>
                 	<label class="fancy-checkbox" style="display:inline-block;">
                 		<input type="checkbox" name="categoryS" class="${studyVO.cDName}" id="${studyVO.cSName}"><span>${studyVO.cSName}</span>
                 	</label>
                 </c:forEach> --%> <!-- ======== 카테고리 =========== --> <select
														id="catD" class="form-control">
															<option>--</option>
															<c:forEach items="${studyCategory}" var="studyVO">
																<option value="${studyVO.cDId}">${studyVO.cDName}</option>
															</c:forEach>
													</select> <select id="catS" class="form-control">
															<option value="">--</option>
															<%-- <option value="${studyVO.cSName}">${studyVO.cSName}</option> --%>
													</select>
														<button type="button" id="addCat"
															class="btn btn-default btn-xs">추가</button>
														<div id="addCatArea"></div>
													</td>
												</tr>
												<tr>
													<th>스터디명</th>
													<td><input type="text" name="title"
														value="${studyVO.title}" class="form-control" id="studyTitle"
														style="width: 550px;"></td>
												</tr>
												<tr>
													<th>지역</th>
													<td>
														<!-- ======== 지 역 =========== --> <!-- 스터디에 선택된 지역정보 셀렉트 표시 -->
														<select id="rDName" name='rDId' class="form-control">
															<option>--</option>
															<c:forEach items="${region}" var="studyVO">
																<c:if test="${studyVO.rSId eq 1}">
																	<option value="${studyVO.rDId}">${studyVO.rDName}</option>
																</c:if>
															</c:forEach>
													</select> <select id="rSName" name='rSId' class="form-control">
															<option value="">--</option>
													</select>
													<!-- 지도입니다. -->
													 <div id="map"></div>
													</td>
												</tr>
												<tr>
													<th>스터디 방장</th>
													<!--  세션으로 전송 -->
													<%-- <td><input name="writer" value="${studyVO.writer}"></td> --%>
													<td><input class="form-control" name="writer"
														value="${studyVO.writer}" style="width: 460px;" readonly></td>
												</tr>

											</tbody>
										</table>

										<div>* 상세정보</div>
										<table class="table table-hover">
											<tbody>
												<tr>
													<th>연령</th>
													<td>
													<label class="fancy-checkbox"
														style="display: inline-block;"> <input
															type="checkbox" class="age" name="age" value="10대"><span>10대
														</span>
													</label> <label class="fancy-checkbox"
														style="display: inline-block;"> <input
															type="checkbox" class="age" name="age" value="20대"><span>20대
														</span>
													</label> <label class="fancy-checkbox"
														style="display: inline-block;"> <input
															type="checkbox" class="age" name="age" value="30대"><span>30대
														</span>
													</label> <label class="fancy-checkbox"
														style="display: inline-block;"> <input
															type="checkbox" class="age" name="age" value="40대"><span>40대
														</span>
													</label> <label class="fancy-checkbox"
														style="display: inline-block;"> <input
															type="checkbox" class="age" name="age" value="50대"><span>50대
														</span>
													</label> <label class="fancy-checkbox"
														style="display: inline-block;"> <input
															type="checkbox" class="age" name="age" value="무관"><span>무관
														</span>
													</label>
													</td>
												</tr>
												<tr>
													<th>최대인원</th>
													<td>
														<div class="studymax">
															<input class="form-control" type="number" name="max"
																min="0" style="width: 345px;" value="${studyVO.max}">
														</div>
													</td>
												</tr>
												<tr>

													<th>시작날짜</th>
													<td>
														<div class="studysd">
															<input class="form-control" type="date" name="sd"
																style="width: 345px;" value="${studyVO.sd}">
														</div>
													</td>
												</tr>
												<tr>
													<th>시간</th>
													<td>
														<%-- <input type="text" name="sc" value="${studyVO.sc}" style="width:30%; display: inline;" class="form-control">
                	<input type="text" name="st" value="${studyVO.st}" style="width:30%; display: inline;" class="form-control"> ~
                	<input type="text" name="et" value="${studyVO.et}" style="width:30%; display: inline;" class="form-control"><br> --%>
														<select id="sc" name="sc" class="form-control">
															<option selected>--</option>
															<option value="월요일">월요일</option>
															<option value="화요일">화요일</option>
															<option value="수요일">수요일</option>
															<option value="목요일">목요일</option>
															<option value="금요일">금요일</option>
															<option value="토요일">토요일</option>
															<option value="일요일">일요일</option>
													</select> <select id="st" name="st" class="form-control">
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
													</select> <select id="et" name="et" class="form-control">
															<option selected>--</option>
													</select> <script>
														/* 		$("#st").change(function(){
														 console.log($(this).val());
														 var tval = $(this).val();
														 $("#et option").remove(val="tval")
														 }); //시작시간 끝나는시간  */
														$("#st")
																.change(
																		function() {
																			var stval = $(
																					"#st option:selected")
																					.val();
																			console
																					.log("str="
																							+ stval);
																			var str = "";
																			for (var i = stval; i <= 24; i++) {
																				str += "<option value'"+i+"'>"
																						+ i
																						+ "시</option>";
																				$(
																						"#et")
																						.html(
																								str);
																			}
																		});
													</script> <!-- 시간 추가 등록 가능 
                <div id="addTimeArea">
                </div>    
                    <button type="button" id="addTime" class="btn btn-default btn-xs">추가</button> -->
													</td>
												</tr>

											</tbody>
										</table>

										<div>* 소개</div>
										<table class="table table-hover">
											<tbody>
												<tr>
													<th>스터디 소개</th>
													<td><textarea name="content" class="form-control"
															style="height:140px;">${studyVO.content}</textarea></td>
												</tr>
												<tr>
													<th>이미지</th>
													<td>
														<div class="studyfile">

															<h3>첫 사진은 메인 화면에 등록됩니다.</h3>
															<div class='fileDrop'></div>
																				<div class="imgstyle">
													<p>스터디 이미지</p>
															<div class='uploadedList'></div>
														</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
										<!-- 일등록 핸들러 -->

										<div class="text-right">
											<!-- <button type="submit" id="btn-success" class = "btn btn-success" style="background-color:#5bc0de; border:1px solid black;">등록</button> -->
											<!-- <input type="submit" id = "insertBtn" class = "btn btn-success" value = "등록" /> -->
										</div>
									</form>
											<button type="submit" id="btn-success"
												class="btn btn-success">등록</button>

								</div>
								<!-- panel-body end -->


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
	<!-- 파일업로드 핸들러 -->
	<script id="templateAttach" type="text/x-handlebars-template">
    <li data-src='{{name}}'>
		<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  		<div class="mailbox-attachment-info">
		</span>
		</div>
	</li>
    </script>
	<script>
    
    //파일불러오기
    var bno = ${studyVO.bno};
    var template = Handlebars.compile($("#templateAttach").html());
    
    $.getJSON("/study/getFileup/"+bno, function(list){
    	$(list).each(function(){
    		
    		var fileInfo = getFileInfo(this);
    		var html = template(fileInfo);
    		
    		$(".uploadedList").append(html)
    	})
    })
    </script>
	<script>
		$(".st").change(function() {
			var stval = $(".st option:selected").val();
			var str = "";
			for (var i = stval; i <= 24; i++) {
				str += "<option value'"+i+"'>" + i + "시</option>";
				$(".et").html(str);
				if (stval = 24) {
				}
			}
		});
		var str = "";
	</script>
	<script>
		var template = Handlebars.compile($("#template").html());
		$(".fileDrop").on("dragenter dragover", function(event) {
			console.log("1*****************");
			event.preventDefault();
		});
		//파일을 떨구는 장소 
		$(".fileDrop").on("drop", function(event) {
			console.log("2*****************");
			event.preventDefault();
			var files = event.originalEvent.dataTransfer.files;
			var file = files[0];
			console.log(file);
			var formData = new FormData();
			formData.append("file", file);
			$.ajax({
				url : '/study/uploadAjax',
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
					$(".uploadedList").append(html);
				}
			});
		});
		
		var bno = ${studyVO.bno};
		//취소버튼
		$(".uploadedList").on("click", "small", function(event) {
			var that = $(this);
			$.ajax({
				url : "deleteFile",
				type : "post",
				data : {
					fileName : $(this).attr("value"),
					bsBno : bno
				},
				dataType : "text",
				success : function(result) {
					if (result == 'deleted') {
						alert("deleted");
						that.parent("div").remove();
					}
				}
			});
		});
		//스터디 보드 등록후 이미지 등록을 위해서
	 	$("#registerForm").submit(
				function(event) {
					console.log("ssssssssssss");
					event.preventDefault();
					var that = $(this);
					var str = "";
					$(".uploadedList .small").each(
							function(index) {
								str += "<input type='hidden' name='files["
										+ index + "]' value='"
										+ $(this).attr("value") + "'>";
							});
					console.log(str)
					that.append(str);
					that.get(0).submit();
				}); 
	</script>
	
	<script>
	
	$(document).ready(function(){
		
		$("select option[value='${studyVO.st}']").attr("selected", true);
		
		var stval = $("#st option:selected").val();
		
		console.log("str="+stval);
		var str = "";
		
		for (var i = stval; i <= 24; i++) {
			
			if(i == '${studyVO.et}'){
			str += "<option value'"+i+"' selected>"
					+ i
					+ "시</option>";
			$("#et").html(str);
			} else {
				str += "<option value'"+i+"'>"
				+ i
				+ "시</option>";
		$("#et").html(str);
			}
		}
		
		
		$("#studyListsuv").attr("class", "active");
		$("#studyListnav").attr("class", "active");
		$("#subPages").attr("class", "in");
		
		getStudy(); //스터디 정보 불러옴
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		//유효성 검사 변수
		categoryV = false;
		titleV = false;
		ageV = false;
		maxV = false;
		
		//수정 클릭 시 액션
	/* 	$("#modifyBtn").on("click", function(){
			//form 데이터 유효성 검사 추가 필요
			
 			//카테고리 유효성
  			if($("#addCatArea").find("div").length){
				categoryV = true;
			}
			
			// title 유효성
			if($("#title").val() != ""){
				titleV = true;
			}
			
			//age 유효성
			if($(".age").val() != ""){
				ageV = true;
			}
			
			//max 유효성
			if($("#max").val() != ""){
				maxV = true;
			}
			
			console.log("categoryV : "+categoryV+" titleV : "+titleV+" ageV : "+ageV+" maxV : "+maxV);
			
			if(categoryV && titleV && ageV && maxV){
				formObj.submit();
			}else{
				alert("내용을 확인하세요");
			}   
			
		}); */
		
		//목록 클릭 시 액션
/* 		$("#listBtn").on("click", function(){
			self.location = "/admin/studyList?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+"&stStatusType=${cri.stStatusType}&titleKeyword=${cri.titleKeyword}&writerKeyword=${cri.writerKeyword}";
		});
		 */
		//지역 정보 셀렉트 박스 변경 시 액션
		$("#rDName").on("change", function(){
			getRegion();
		});
		
		//카테고리 정보 셀렉트 박스 변경 시 액션
		$("#catD").on("change", function(){
			getCat();
		});
		
		//카테고리 추가 버튼 클릭 시 액션
		$("#addCat").on("click", function(){
       		
			var catd=$('#catD option:selected').val();
			var cats=$('#catS option:selected').val();
			
			var catd2=$('#catD option:selected').text();
			var cats2=$('#catS option:selected').text();
			
			var cat="<span><input type='hidden' name='categoryD' value="+catd+">"
			+"<input type='hidden' name='categoryS' value="+cats+">"
			+"<div>"+catd2 +" > "+cats2+"</span><button type='button' onclick = 'btn_delete(this)' class='btn btn-default btn-xs'>삭제</button></div>";
			
       		$("#addCatArea").append(cat);
		});
		
		//시간영역 추가 버튼 클릭 시 액션
		$("#addTime").on("click", function(){
       		
       		var time="<input type='text' name='sc' value='' style='width:30%; display: inline;' class='form-control'> <input type='text' name='st' value='' style='width:30%; display: inline;' class='form-control'> ~ <input type='text' name='et' value='' style='width:30%; display: inline;' class='form-control'><br>";
       	
       		$("#addTimeArea").append(time);
		});
		
		//연령 체크박스 2개 초과하여 선택 시 알럿 처리
		$(".age").on("click", function(){
			console.log($("input:checkbox[class=age]:checked").length)
			if($("input:checkbox[class=age]:checked").length > 2 ){
				alert("연령은 최대 2개까지 선택가능합니다.")
				$(this).attr("checked",false);
			}
		});
		
	});
		//카테고리 삭제 버튼
		function btn_delete(x){
			$(x).parent("div").parent("span").remove();
			
		}
		
		//지역정보 2단 콤보박스 메서드
		function getRegion(){
			//$("#rSName").children("option").remove(); //소분류의 option 삭제
			
			$.ajax({ //rdid값을 POST형식으로 region 컨트롤러에 전송
				type:'POST',
				url:'/admin/region/'+ $("#rDName option:selected").val(),
 				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"}, 
				dataType:'json',
				data:JSON.stringify({
					rDId : $("#rDName option:selected").val()  //rdid의 값 전송
				}),
				success:function(result){ //반환받은 지역테이블 정보, list 배열
					var option="";
					for(var i=0; i<result.length;i++){
						option += "<option value="+result[i].rSId+">"+result[i].rSName+" </option>"; //option에 배열값 추가
					}
					$("#rSName").html(option); //html에 뿌려줌
				}
			}); //$.ajax 끝
		}
		
		//카테고리 대분류 선택 시 소분류 변경
		function getCat(){
			//$("#catS").children("option").remove(); //소분류의 option 삭제, append()가 아닌 html() 사용으로 주석 처리
			
			$.ajax({ //categoryD값을 POST형식으로 category 컨트롤러에 전송
				type:'POST',
				url:'/admin/category/'+ $("#catD option:selected").val(),
 				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"}, 
				dataType:'json',
				data:JSON.stringify({
					cdid : $("#catD option:selected").val()  //cdid의 값 전송
				}),
				success:function(result){ //반환받은 지역테이블 정보, list 배열
					var option="";
					for(var i=0; i<result.length;i++){
						option += "<option value="+result[i].cSId+">"+result[i].cSName+" </option>"; //option에 배열값 추가
					}
					$("#catS").html(option); //html에 뿌려줌
				}
			}); //$.ajax 끝
		}
		
		function getStudy(){
			//카테고리 정보 불러옴 			
			<c:forEach items="${studyDC}" var="studyVO">
				var recatd = "${studyVO.cDId}"; 
				var recats = ${studyVO.cSId}; 
				var recatd2 = "${studyVO.cDName}";
				var recats2 = "${studyVO.cSName}";
				
				var recat="<span><input type='hidden' name='categoryD' value="+recatd+">"
				+"<input type='hidden' name='categoryS' value="+recats+">"
				+"<div>"+recatd2 +" > "+recats2+"</span><button type='button' onclick = 'btn_delete(this)' class='btn btn-default btn-xs'>삭제</button></div>";
				
				$("#addCatArea").append(recat);
			</c:forEach>
			 
			 
			//카테고리 정보 불러오기 테스트
/* 			var recatd = "${studyVO.categoryD}";
			var recats = "${studyVO.categoryS}";
			var recats2 = recats.split(',');
			
			<c:forEach items="${studyCategory}" var="studyVO">
     			if(recatd == "${studyVO.cDId}"){
     				var recatd2 = "${studyVO.cDName}";
     			}
     			for(var i=0;i<recats2.length;i++){
     				if(${studyVO.cSId} == recats2[i]){
     					var recats3 = "${studyVO.cSName}";
     					
						var recat="<span><input type='hidden' name='categoryD' value="+recatd+">"
						+"<input type='hidden' name='categoryS' value="+recats+">"
						+"<div>"+recatd2 +" > "+recats3+"</span><button type='button' onclick = 'btn_delete(this)' class='btn btn-default btn-xs'>삭제</button></div>";
				
						$("#addCatArea").append(recat);
     				}
     			}
     			
     		</c:forEach>
			
			 */
			//테스트 끝
			
			// 연령 정보 불러옴
			var check_value="${studyVO.age}";  //연령 DB 데이터 변수에 저장
			var check_value2=check_value.split(',');   //콤마를 구분자로 배열에 담음 
			
			for(var i=0;i<check_value2.length;i++){ //배열 길이만큼 반복문 처리, 연령 체크 속성 부여
				$("input:checkbox[value="+ check_value2[i] +"]").attr("checked", "checked");
			}
			
			$("#rDName").val("${studyVO.rDId}"); // 스터디 지역 정보 불러옴
			$("#sc").val("${studyVO.sc}"); // 시간 정보 불러옴
			
			$.ajax({ //rdid값을 POST형식으로 region 컨트롤러에 전송
				type:'POST',
				url:'/admin/region/'+ $("#rDName option:selected").val(),
 				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"}, 
				dataType:'json',
				data:JSON.stringify({
					rDId : $("#rDName option:selected").val()  //rdid의 값 전송
				}),
				success:function(result){ //반환받은 지역테이블 정보, list 배열
					var option="";
					for(var i=0; i<result.length;i++){
						option += "<option name='rSId' value="+result[i].rSId+">"+result[i].rSName+" </option>"; //option에 배열값 추가
					}
					$("#rSName").append(option); //html에 뿌려줌
					$("option[value='${studyVO.rSId}']").attr("selected", "selected"); //소분류 지역 정보 불러옴
				}
			}); //$.ajax 끝
		} //getStudy() 끝
</script>
	
	

   <!--지도 크르깁트 -->
   <script>
   function initMap() {
   		var uluru = {lat:37.5663797, lng:126.9777154};
   	    var map = new google.maps.Map(document.getElementById('map'),{
   		zoom: 16,
   		center:uluru
   	});
   	var marker = new google.maps.Marker({
   		position:uluru,
   		map:map
   	});
   }
   </script>
   <script>
   $(document).ready(function(){
	   
	   var formObj = $("form[role='form']");
	   
	   $("#btn-success").on("click", function(){
	
		   formObj.submit();
	   })
	   
   })
   </script>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAiNU7soIIqpN1Jdu0tV1CWBb6u1jJAH5o&callback=initMap"
    async defer></script>
    
</body>
</html>