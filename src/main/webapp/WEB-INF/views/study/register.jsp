<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.awt.Graphics" %>
<%@ page import="java.awt.Image" %>
<%@ page import="java.awt.image.BufferedImage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/resources/js/upload.js"></script>

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script>
  var jb = jQuery.noConflict();

  </script>


  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
}
#btn-success:hover {
	background-color: #31b0d5;
	border-color: #269abc;
}
.btn {
	padding: 5px 20px;
	margin-left: 20px;
}
.btn-xs {
	margin-top: 5px;
}

#map {
	width: 100%;
	height: 300px;

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

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 300px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      .pac-container {
        font-family: Roboto;
      }

      #type-selector {
        color: #fff;
        background-color: #4d90fe;
        padding: 5px 11px 0px 11px;
      }

      #type-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }
      #target {
        width: 345px;
      }
</style>
</head>
<body>
		<%@include file="../nav.jsp"%>

	<div id="wrapper">


            <header class="page-head" style="background:url(/resources/assets/img/twitter-feed-bg.jpg);">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <ol class="breadcrumb">
                                    <li><a href="/study/main">Home</a></li>
                                    <li class="active">스터디 등록하기</li>
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
									<form id="registerForm" method="post" action="/study/register">
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
															<option>--</option>
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
															<option value="z">--</option>
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
												
												<td><div id="map"></div></td>
												</tr>
												
												<tr>
													<th>스터디 방장</th>
													<!--  세션으로 전송 -->
													<%-- <td><input name="writer" value="${studyVO.writer}"></td> --%>
													<td><input class="form-control" name="writer"
														value="${email}" style="width: 460px;"></td>
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
																min="0" style="width: 345px;" id="studymax">
														</div>
													</td>
												</tr>
												<tr>

													<th>시작날짜</th>
													<td>
														<div class="studysd">
															<input class="form-control" type="date" name="sd"
																style="width: 345px;" id="studysd">
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
															<option value="" selected>--</option>
															<option value="월요일">월요일</option>
															<option value="화요일">화요일</option>
															<option value="수요일">수요일</option>
															<option value="목요일">목요일</option>
															<option value="금요일">금요일</option>
															<option value="토요일">토요일</option>
															<option value="일요일">일요일</option>
													</select> <select id="st" name="st" class="form-control">
															<option value="" selected>--</option>
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
															<option value="" selected>--</option>
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
															style="height: 140px;">${studyVO.content}</textarea></td>
												</tr>
												<tr>
													<th>이미지</th>
													<td>
														<div class="studyfile">

															<h5>첫 사진은 메인 화면에 등록됩니다.</h5>
															<p> 드레그하여 사진의 순서를 변경할 수 있습니다.</p>
															<div class='fileDrop'></div>
																
															<ul class='uploadedList'></ul>
															
														</div>
													</td>
												</tr>
											</tbody>
										</table>
										<!-- 일등록 핸들러 -->

										<div class="text-right">
											<!-- <button type="submit" id="btn-success" class = "btn btn-success" style="background-color:#5bc0de; border:1px solid black;">등록</button> -->
											<button type="submit" id="btn-success"
												class="btn btn-success">등록</button>
											<!-- <input type="submit" id = "insertBtn" class = "btn btn-success" value = "등록" /> -->
										</div>
									</form>

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
	</div>
</script>
	<script>
	  jb( function() {
		    jb( ".uploadedList" ).sortable();
		    jb( ".uploadedList" ).disableSelection();
		  } );
	
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
		
		var count;

		//파일을 떨구는 장소 
		$(".fileDrop").on("drop", function(event) {
			
			count++;

			console.log("2*****************");
			event.preventDefault();
			var files = event.originalEvent.dataTransfer.files;
			var file = files[0];
			
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
					//파일 유효성 5장 이상시 등록x
					if(count > 5) {
						alert("사진은 5장까지 등록할 수 있습니다.")	
						count = 5;
					} else {
						$(".uploadedList").append(html);
					}
				}
			});
		});

		//취소버튼
		$(".uploadedList").on("click", "small", function(event) {
			--count;
			var that = $(this);
			$.ajax({
				url : "deleteFile",
				type : "post",
				data : {
					fileName : $(this).attr("data-src")
				},
				dataType : "text",
				success : function(result) {
						
						alert("deleted");
						that.parent("div").remove();
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
					that.append(str);
					that.get(0).submit();
				});

	</script>
	<script>
		
	var count=0;
	
		$(document).ready(function() {
							//카테고리 소분류 체크 시 대분류 체크 되도록
							var formObj = $("form[role='form']");
							console.log(formObj);
							//지역 정보 셀렉트 박스 변경 시 액션
							$("#rDName").on("change", function() {
								getRegion();
							});
							//카테고리 정보 셀렉트 박스 변경 시 액션
							$("#catD").on("change", function() {
								getCat();
							});
							
							var setd;
							var sets;
							
							//카테고리 추가 버튼 클릭 시 액션
							$("#addCat").on("click", function() {
								
								
								var catd = $('#catD option:selected').val();
								var cats = $('#catS option:selected').val();

								
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
							
							
							//시간영역 추가 버튼 클릭 시 액션
							$("#addTime")
									.on(
											"click",
											function() {
												var time = "<input type='text' name='sc' value='' style='width:30%; display: inline;' class='form-control'> <input type='text' name='st' value='' style='width:30%; display: inline;' class='form-control'> ~ <input type='text' name='et' value='' style='width:30%; display: inline;' class='form-control'><br>";
												$("#addTimeArea").append(time);
											});
						});
		//카테고리 삭제 버튼
		function btn_delete(x) {
			count--;
			
			if(count<0) {count=0;}
			
			$(x).parent("div").remove();
		}
		//지역정보 2단 콤보박스 메서드
		function getRegion() {
			//$("#rSName").children("option").remove(); //소분류의 option 삭제
			$.ajax({ //rdid값을 POST형식으로 region 컨트롤러에 전송
				type : 'POST',
				url : '/admin/region/' + $("#rDName option:selected").val(),
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'json',
				data : JSON.stringify({
					rDId : $("#rDName option:selected").val()
				//rdid의 값 전송
				}),
				success : function(result) { //반환받은 지역테이블 정보, list 배열
					
					var option = "";
					if (result.length < 2) {
						option = "<option>--</option>"
					} else {
						for (var i = 0; i < result.length; i++) {
							option += "<option value="+result[i].rSId+">"
									+ result[i].rSName + " </option>"; //option에 배열값 추가
						}
					}
					$("#rSName").html(option); //html에 뿌려줌
				}
			}); //$.ajax 끝
		}
		//카테고리 대분류 선택 시 소분류 변경
		function getCat() {
			//$("#catS").children("option").remove(); //소분류의 option 삭제, append()가 아닌 html() 사용으로 주석 처리
			$.ajax({ //categoryD값을 POST형식으로 category 컨트롤러에 전송
				type : 'POST',
				url : '/admin/category/' + $("#catD option:selected").val(),
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'json',
				data : JSON.stringify({
					cdid : $("#catD option:selected").val()
				//cdid의 값 전송
				}),
				success : function(result) { //반환받은 지역테이블 정보, list 배열
					var option = "";
					var str = $("#catD option:selected").val();
					if (result.length == 0) {
						option = "<option>--</option>";
					} else {
						for (var i = 0; i < result.length; i++) {
							option += "<option value="+result[i].cSId+">"
									+ result[i].cSName + " </option>"; //option에 배열값 추가
						}
					}
					$("#catS").html(option); //html에 뿌려줌
				}
			}); //$.ajax 끝
		}
		function getStudy() {
			$("#rDName").val("${studyVO.rDId}"); // 스터디 지역 정보 불러옴
			$
					.ajax({ //rdid값을 POST형식으로 region 컨트롤러에 전송
						type : 'POST',
						url : '/admin/region/'
								+ $("#rDName option:selected").val(),
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'json',
						data : JSON.stringify({
							rDId : $("#rDName option:selected").val()
						//rdid의 값 전송
						}),
						success : function(result) { //반환받은 지역테이블 정보, list 배열
							var option = "";
							for (var i = 0; i < result.length; i++) {
								option += "<option name='rSId' value="+result[i].rSId+">"
										+ result[i].rSName + " </option>"; //option에 배열값 추가
							}
							$("#rSName").append(option); //html에 뿌려줌
							$("option[value='${studyVO.rSId}']").attr(
									"selected", "selected"); //소분류 지역 정보 불러옴
						}
					}); //$.ajax 끝
		} //getStudy() 끝
	</script>

<!-- 
S3 수정 (파일 업로드 2개가 되어서 주석 처리)
파일업로드 핸들러 
	<script id="templateAttach" type="text/x-handlebars-template">
    <li data-src='{{name}}'>
		<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  		<div class="mailbox-attachment-info">
		</span>
		</div>
	</li>
    </script>
-->
    <!-- 유효성 검사 스크립트 -->
    <script>
    
    
  // 카테고리 대 소 , 스터디명, 지역 대, 연력, 최대인원, 시작날짜, 요일, 시간
    $("#btn-success").on("click", function(e){
    
    	
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
    	} else if($("#rDName option:selected").val()=="z") {
    		
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
		} else if($("#sc option:selected").val()==""){
		
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
		
		} else {
			alert("등록이 완료되었습니다")
		} 
    		
    		
    /* 	//연령
	    var chk = false;
 	   	
    	for(var i=0; document.myform.age.length; i++) {
    		if(document.myfrom.car[i].checked) {chk = ture} {
    		}
    		//체크가 안되었을 때
    		if(!chk){
    			alert("원하는 나이대를 입력하세요")
    		}
   
    
    	//시작날짜		
    	} else if($(".studysd").val()==""){
    		
    		alert("시작날짜를 입력하세요")
    		$(".studysd").focus();
    		return false;
    	//요일	
    	} else if($("#sc").is(':checked')==false){
    		
    		alert("요일을 입력하세요") 
    		$("#sc").focus();
    		return false;
    	//시작시간	
    	} else if($("#st").is(':checked')==false){
    		
    		alert("시작시간을 입력하세요")
    		$("#st").focus();
    		return false;
    	} else if($("#et").is(':checked')==false){
    		
    		alert("시작시간을 입력하세요")
    		$("#et").focus();
    		return false;
    		
    	} else {
    		alert("등록이 완료되었습니다")
    	} */
    	
    }) 
    </script>
    
 

 	<!--지도 크르깁트 -->
<script>
   var markers = [];
   var labels = 'A';
   var labelIndex = 1;
   var map;
   
   function initialize() {
	    var	uluru = {lat:37.5663797, lng:126.9777154};
   	    map = new google.maps.Map(document.getElementById('map'),{
   		zoom: 16,
   		center:uluru
	   	});
	   	    
	   	google.maps.event.addListener(map,'click', function(event){
	   		console.log(labelIndex)
	   		//처음 클릭했을때 등록
	   		if(labelIndex == 1){
	   			addMarker(event.latLng, map);
	   			alert("lat" + event.latLng.lat() + "lng" + event.latLng.lng())
	   			labelIndex = 2;
	   		//두번째부터 위치변경	
	   		} else {
	   		hide(); 
	   		addMarker(event.latLng, map);
	   		alert("lat" + event.latLng.lat() + "lng" + event.latLng.lng())
	   		}
	   		
	   	})    
   }
   
   
   function addMarker(location, map) {
		var marker = new google.maps.Marker({
	   		position:location,
	   		map:map,
	   		label:labels
	   	});
	   
		markers.push(marker);
   }
   
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
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAiNU7soIIqpN1Jdu0tV1CWBb6u1jJAH5o&callback=initialize"
		async defer></script>
    
    
    		<%@include file="../footer.jsp"%>
</body>
</html>