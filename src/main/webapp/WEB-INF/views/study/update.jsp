<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	
	
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script>
  var jb = jQuery.noConflict();
  </script>


  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
	
<title>스터디 상세</title>

<style>
form th {
	width: 176px !important;
}
#rDName, #rSName, #age, #sc, #st, #et, #catD, #catS {
	width: 30%;
	display: inline;
}
.fileDrop {
	border:none;
	width: 100%;
	height:100%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	padding-left:10px;
	padding-top:10px;
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

#pac-input {
    background-color: #fff;
    font-family: Roboto;
    font-size: 15px;
    font-weight: 300;
    margin-bottom: 15px;
    padding: 0 11px 0 13px;
    text-overflow: ellipsis;
    width: 300px;
}

.controls {
    margin-top: 10px;
    border: 1px solid transparent;
    border-radius: 2px 0 0 2px;
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    height: 32px;
    outline: none;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

/* input{
	line-height: inherit;
	 margin: 0;
    font: inherit;
    color: inherit;
    -webkit-appearance: textfield;
    -webkit-rtl-ordering: logical;
    cursor: text;
} */

input[type=checkbox] {
  -ms-transform: scale(2); /* IE */
  -moz-transform: scale(2); /* FF */
  -webkit-transform: scale(2); /* Safari and Chrome */
  -o-transform: scale(2); /* Opera */
  margin-right: 8px !important;
  padding:30px !important;
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
					<h3 class="page-title">스터디 수정하기</h3>
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
															<option value="">대분류</option>
															<c:forEach items="${studyCategory}" var="studyVO">
																<option value="${studyVO.cDId}">${studyVO.cDName}</option>
															</c:forEach>
													</select> <select id="catS" class="form-control">
															<option value="">소분류</option>
															<%-- <option value="${studyVO.cSName}">${studyVO.cSName}</option> --%>
													</select>
														<button type="button" id="addCat"
															class="btn btn-default btn-xs" style="width:76px; height:40px;">추가</button>
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
															<option value="">대지역</option>
															<c:forEach items="${region}" var="studyVO">
																<c:if test="${studyVO.rSId eq 1}">
																	<option value="${studyVO.rDId}">${studyVO.rDName}</option>
																</c:if>
															</c:forEach>
													</select> <select id="rSName" name='rSId' class="form-control">
															<option value="">--</option>
													</select>
													</td>
												</tr>
												
												<tr>
												<th>상세지역</th>
												
													<td>
													<!-- 검색기능 -->
													<input id="pac-input" class="controls" type="text" placeholder="상세지역을 검색해 주세요">
													<div id="map"></div> 
													<!-- 경도와 위도 값을 넘깁니다. -->
															<input type="hidden" id="lat" name="lat">
															<input type="hidden" id="lng" name="lng">
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
														style="display: inline-block; margin-right:8px; font-size:16px;"> <input
															type="checkbox" class="age" name="age" value="10대"><span>10대
														</span>
													</label> <label class="fancy-checkbox"
														style="display: inline-block; margin-right:8px; font-size:16px;"> <input
															type="checkbox" class="age" name="age" value="20대"><span>20대
														</span>
													</label> <label class="fancy-checkbox"
														style="display: inline-block; margin-right:8px; font-size:16px;"> <input
															type="checkbox" class="age" name="age" value="30대"><span>30대
														</span>
													</label> <label class="fancy-checkbox"
														style="display: inline-block; margin-right:8px; font-size:16px;"> <input
															type="checkbox" class="age" name="age" value="40대"><span>40대
														</span>
													</label> <label class="fancy-checkbox"
														style="display: inline-block; margin-right:8px; font-size:16px;"> <input
															type="checkbox" class="age" name="age" value="50대"><span>50대
														</span>
													</label> <label class="fancy-checkbox"
														style="display: inline-block; margin-right:8px; font-size:16px;"> <input
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
															<option value="" selected>요일</option>
															<option value="월요일">월요일</option>
															<option value="화요일">화요일</option>
															<option value="수요일">수요일</option>
															<option value="목요일">목요일</option>
															<option value="금요일">금요일</option>
															<option value="토요일">토요일</option>
															<option value="일요일">일요일</option>
													</select> 
													<select id="st" name="st" class="form-control">
															<option value="" selected>시작시간</option>
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
													 <select id="et" name="et" class="form-control">
															<option value="" selected>종료시간</option>
													</select> 
													
													<div id="addTimeArea"></div>    
													
													<script>
														/* 		$("#st").change(function(){
														 console.log($(this).val());
														 var tval = $(this).val();
														 $("#et option").remove(val="tval")
														 }); //시작시간 끝나는시간  */
														$("#st").change(function() {
																			var stval = $("#st option:selected").val();
																			console.log("str="+ stval);
																			var str = "";
																			
																			if(stval == ""){
								
																				str = "<option>종료시간</option>";
																				$("#et").html(str);
																			} else {	
																			for (var i = stval; i <= 24; i++) {
																				str += "<option value'"+i+"'>"
																						+ i
																						+ "시</option>";
																				$("#et").html(str);
																				}
																			}
																		});
													</script> 
													</td>
													<td>
														<button type="button" id="addTime" class="btn btn-default btn-xs" style="width:76px; height:40px;">추가</button> 
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
														
													<div class='fileDrop'>
														<h5>첫 사진은 메인 화면에 등록됩니다.</h5>
														<p>  첫 사진은 메인 화면에 등록됩니다 &amp; 드래그하여 사진의 순서를 변경할 수 있습니다</p>
															

														<ul class='uploadedList' style="height:154px;">
														</ul>
															
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
												class="btn btn-success"  style="width:80px; height:42px;">수정</button>

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
			<img src="{{imgsrc}}" alt="Attachment" style="width:150px; height:150px;">
		</span>
		<a href="{{getLink}}" class="mailbox-attachment-name"></a>
		<small class = "small" value = "{{name}}" data-src=data style="cursor:pointer">X</small>
		</span>
	</div>
</script>
	<script>
	  jb( function() {
		    jb( ".uploadedList" ).sortable();
		    jb( ".uploadedList" ).disableSelection();
		  } );
	
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
	
	var count=0;
	
	$(document).ready(function(){
				
		$("#studyListsuv").attr("class", "active");
		$("#studyListnav").attr("class", "active");
		$("#subPages").attr("class", "in");
		
		getStudy(); //스터디 정보 불러옴
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		//지역 정보 셀렉트 박스 변경 시 액션
		$("#rDName").on("change", function(){
			getRegion();
		});
		
		//카테고리 정보 셀렉트 박스 변경 시 액션
		$("#catD").on("change", function(){
			getCat();
		});
		
		var setd;
		var sets;
		
		//카테고리 추가 버튼 클릭 시 액션
		$("#addCat").on("click", function() {
			
			var catd = $('#catD option:selected').val();
			var cats = $('#catS option:selected').val();
			
			if($('#catD option:selected').val()=="") {
				alert("항목을 모두 입력하세요")
				return false;
			}
			
			if(count==0){
				
				count++;
				
				var catd2 = $('#catD option:selected').text();
				var cats2 = $('#catS option:selected').text();
				var cat = "<span><input type='hidden' name='categoryD' value="+catd+">"
						+ "<input type='hidden' name='categoryS' value="+cats+">"
						+ "<div>"
						+ catd2
						+ " > "
						+ cats2
						+ "</span><button type='button' onclick = 'btn_delete(this)' class='btn btn-default btn-xs'>삭제</button></div>";
				$("#addCatArea").append(cat);
				setd = catd;
				sets = cats;
				
			} else {
				
				//2번째꺼들어와
				//대분류다르면
				if(catd != setd) {
					alert("다른 카테고리를 선택할 수 없습니다.")
				//대분류같은데
				//소분류가 같으면
				} else if(cats == sets) {
					alert("이미 선택하셨습니다.")
				} else {
					
					var catd2 = $('#catD option:selected').text();
					var cats2 = $('#catS option:selected').text();
					var cat = "<span><input type='hidden' name='categoryD' value="+catd+">"
							+ "<input type='hidden' name='categoryS' value="+cats+">"
							+ "<div>"
							+ catd2
							+ " > "
							+ cats2
							+ "</span><button type='button' onclick = 'btn_delete(this)' class='btn btn-default btn-xs'>삭제</button></div>";
					$("#addCatArea").append(cat);
				}
			}//count esle 끝
}); //addcat끝
		
		

var setsc;

var starval = new Array();

//시간영역 추가 버튼 클릭 시 액션
$("#addTime").on("click",function() {
	
	var scval = $("#sc option:selected").val();
	var stval = $("#st option:selected").val();
	var etval = $("#et option:selected").val();

	//입력항목이 없으면 리턴한다
	if(scval==""||stval==""||etval==""){
		alert("항목을 모두 입력하세요");
		$("#st").focus();
		return false;
	} 

	// 있는 항목의 리스트를 배열에 담는다
	$("#addTimeArea input[name='startSc']").each(function(){
		starval.push($(this).val());
	})
		
	
	// 만약 항목에 있으면 리턴
	var no = "";
	
	for(var i=0; i<starval.length; i++) {
		if(starval[i]==scval) {
			no = "no";
		}
	}

	if(no=="no") {
		alert("이미 추가하신 요일입니다.")
		return false;
		
	} else {
		
		var time = "<span><input type='hidden' name='startSc' value="+scval+">"
		+ "<input type='hidden' name='stEt' value="+stval+"시~"+etval+">"
		+ "<div>"
		+ scval
		+ " > "
		+ stval
		+ "시~" + etval
		+ "</span><button type='button' onclick = 'btn_delete(this)' class='btn btn-default btn-xs'>삭제</button></div>";
						
					     $("#addTimeArea").append(time);
	}
});
		
/* 		//시간영역 추가 버튼 클릭 시 액션
		$("#addTime").on("click", function(){
       		
       		var time="<input type='text' name='sc' value='' style='width:30%; display: inline;' class='form-control'> <input type='text' name='st' value='' style='width:30%; display: inline;' class='form-control'> ~ <input type='text' name='et' value='' style='width:30%; display: inline;' class='form-control'><br>";
       	
       		$("#addTimeArea").append(time);
		}); */
		
		
		
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
			count--;
			
			if(count<0) {count=0;}
			
			$(x).parent("div").parent("span").remove();
			
		}
		
		//지역정보 2단 콤보박스 메서드
		function getRegion(){
			//$("#rSName").children("option").remove(); //소분류의 option 삭제
			if($("#rDName option:selected").val()==""){

				var option="<option>소지역</option>";
				$("#rSName").html(option); 
			} else {
			
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
		}
		//카테고리 대분류 선택 시 소분류 변경
		function getCat(){
			//$("#catS").children("option").remove(); //소분류의 option 삭제, append()가 아닌 html() 사용으로 주석 처리
			if($("#catD option:selected").val()==""){
				var option="<option>소분류</option>";
				$("#catS").html(option);
			} else {
				
				
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
			
			var scset;
			var stset;
			
			//시간정보 불러옵니다
			var sclist = new Array();
			var stetlist = new Array();
			//요일
			<c:forEach items="${sc}" var="sc" varStatus="status">
				scset = "${sc}"
				sclist.push(scset);
			</c:forEach>
			//날짜
			<c:forEach items="${stet}" var="stet" varStatus="status">
				stset = "${stet}"
				stetlist.push(stset);
			</c:forEach>
				
				console.log("length"+sclist.length);
				console.log(sclist)
				console.log(stetlist)
				
			for(var i=0; i<sclist.length; i++) {
				console.log(i);

				var time = "<span><input type='hidden' name='startSc' value="+sclist[i]+">"
					     + "<input type='hidden' name='stEt' value="+stetlist[i]+">"
					     + "<div>"
				         + sclist[i]
						 + " > "
						 + stetlist[i]
						 +"</span><button type='button' onclick = 'btn_delete(this)' class='btn btn-default btn-xs'>삭제</button></div>";
				
				$("#addTimeArea").append(time);			 
			}	
				

			// 연령 정보 불러옴
			var check_value="${studyVO.age}";  //연령 DB 데이터 변수에 저장
			var check_value2=check_value.split(',');   //콤마를 구분자로 배열에 담음 
			
			for(var i=0;i<check_value2.length;i++){ //배열 길이만큼 반복문 처리, 연령 체크 속성 부여
				$("input:checkbox[value="+ check_value2[i] +"]").attr("checked", "checked");
			}
			
			$("#rDName").val("${studyVO.rDId}"); // 스터디 지역 정보 불러옴
	/* 		$("#sc").val("${studyVO.sc}"); // 시간 정보 불러옴 */
			
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
   var markers = [];
   var labelIndex = 1;
   var map;
   var lat;
   var lng;
   
   function initAutocomplete() {
	   
	   var latset = ${studyVO.lat};
	   var lngset = ${studyVO.lng};
	   
	    var	uluru = {lat:latset, lng:lngset};
   	    map = new google.maps.Map(document.getElementById('map'),{
	   	zoom: 16,
	   	center:uluru
	   	});
   	    
   	    if(labelIndex == 1) {
			hide();
			
   			var marker = new google.maps.Marker({
   		   		position:uluru,
   		   		map:map,
   		   	});
   			
   			$('#lat').attr('value', latset);
			$('#lng').attr('value', lngset);
			
			markers.push(marker);
			
   			labelIndex = 2;
   	    }
	   	//마커를 클릭하면 등록   
	   	google.maps.event.addListener(map,'click', function(event){
	   		console.log(labelIndex)
	   		//처음 클릭했을때 등록
	   		if(labelIndex == 1){
	   			hide(); 
				alert("1");
				alert("2");
	   			addMarker(event.latLng, map);
	   			
				$('#lat').attr('value', lat);
				$('#lng').attr('value', lng);
	   			//경도 위도 변수에 저장
				lat = event.latLng.lat();
				lng = event.latLng.lng();
				alert("3");
	   			labelIndex = 2;
	   		//두번째부터 위치변경	
	   		} else {
		   		hide(); 
				//value 변경후 다시 추가
				$('#lat').removeAttr('value');
				$('#lng').removeAttr('value');
				addMarker(event.latLng, map);
		   		
				lat = event.latLng.lat();
				lng = event.latLng.lng();
				
				//value 추가 
				$('#lat').attr('value', lat);
				$('#lng').attr('value', lng);
	   		}
	   	})
	   	
	   	//검색기능 추가해보자
	    // 지도안에 검색상자를 넣는다
        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        // 검색결과가 viewpoint로 넘긴다
        map.addListener('bounds_changed', function() {
          searchBox.setBounds(map.getBounds());
        });

        //장소 출력 마커표시도
        searchBox.addListener('places_changed', function() {
          var places = searchBox.getPlaces();

          if (places.length == 0) {
            return;
          }

          // 장소없으면 안됨
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }
            
    		var marker = new google.maps.Marker({
    	   		position:location,
    	   		map:map,
    	   	});

            // 배열에담아.
            markers.push(new google.maps.Marker({
                  map: map,
                  marker: marker,
            	  position: place.geometry.location
            }));
            	
           
     //       alert("search"+place.geometry.location.lat())


            if (place.geometry.viewport) {   
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          
          alert(markers[0].getPosition().lat())
          
          if(labelIndex == 1){
          		lat = markers[0].getPosition().lat();
				lng = markers[0].getPosition().lng();
				
				$('#lat').attr('value', lat);
				$('#lng').attr('value', lng);
          }
          map.fitBounds(bounds);

        });
   }
   
 	//마커를 추가하는 함수
   function addMarker(location, map) {
	   alert("4");
		var marker = new google.maps.Marker({
	   		position:location,
	   		map:map,
	   	});
	   
		markers.push(marker);
   }
 	
   //마커를 지우는 함수
   function setMarkers(map) {
	   for(var i=0; i<markers.length; i++){
		   markers[i].setMap(map);
	   }
   }
   
   function hide() {
	   setMarkers(null);
   }

</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAiNU7soIIqpN1Jdu0tV1CWBb6u1jJAH5o&callback=initAutocomplete&libraries=places"
		async defer></script>

<!-- 우효성 검사 -->
    <!-- 유효성 검사 스크립트 -->
    <script>
    
    
    
  // 카테고리 대 소 , 스터디명, 지역 대, 연력, 최대인원, 시작날짜, 요일, 시간
    $("#btn-success").on("click", function(e){
		
    	console.log("등록등록등록등록등록등록등록등록등록등록등록등록등록등록등록등록");
    	 var formObj = $("form[role='form']");
	   
    	 var age = "";	
    	
    	$("input[name=age]:checked").each(function(e){
    		age += $(this).val();
    	})
    	//카테고리 대소
    	if($("#addCatArea").html() == "") {
    		
    		alert("카테고리를 입력하세요");
    		$("#catD").focus();
    		return false;
    		//스터디명		
    	} else if($("#studyTitle").val() == "") {
    		
    		alert("스터디명을 입력하세요");
    		$("#studyTitle").focus();
    		return false;
    		//지역 대 
    	} else if($("#rDName option:selected").val()=="") {
    		
       		alert("지역을 입력하세요")
    		$("#rDName").focus();
    		return false;
    		
    		//나이대
    	} else if(age == ""){
    		
			alert("원하는 나이대를 입력하세요");
			$("#age").focus();
			return false;
    		//최대인원	
    	} else if($("#studymax").val()=="") {
    		
    		alert("최대인원을 입력하세요")
    		$(".studymax").focus();
    		return false;
    		
    		//시작날짜
    	} else if($("#studysd").val()=="") {
    		
    		alert("시작날짜를 입력하세요")
    		$(".studysd").focus();
    		return false;
    	//요일	
		} else if($("#addTimeArea").html() == "") { 

			alert("시간을 입력하세요");
			$("#sc").focus();
			return false;
			
		}  else {
			alert("수정이 완료되었습니다");
			   formObj.submit();
		} 
    }) 	
    	
    	/* else if($("#sc option:selected").val()==""){
		
			alert("요일을 입력하세요")
			$("#sc").focus();
			return false;
	//시작시간	
		} else if($("#st option:selected").val()==""){
		
			alert("시작시간을 입력하세요")
			$("#st").focus();
			return false;
	//끝시간		
		} else if($("#et option:selected").val()==""){
		
			alert("시작시간을 입력하세요")
			$("#et").focus();
			return false;
		
		} */
	

    </script>

   
</body>
</html>