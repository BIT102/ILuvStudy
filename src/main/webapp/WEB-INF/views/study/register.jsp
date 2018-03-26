<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
    <title>스터디 상세</title>
<style>
form th{
	width:30%;
}
#rDName, #rSName, #age, #sc, #st, #et, #catD, #catS{
	width:30%;
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
</style>
</head>
<body>
<div id="wrapper">
<%@ include file="../nav.jsp" %>

	 <!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">스터디 목록</h3>
					<div class="row">
						<div class="col-md-12">
    						<div class="panel">
        <div class="panel-heading">
			<h3 class="panel-title">스터디 상세</h3>
		</div>
    
    <div class="panel-body">    
	<form id = "registerForm" method="post" action = "/study/register">          
        <div>* 기본정보</div>
        <table class="table table-hover">
        	<tbody>
            
            <tr>
                <th>카테고리</th>
                <td>
              
                <!-- 스터디에 등록된 카테고리 체크 표시 -->
                <!-- 스터디 카테고리 데이터 -->
   <%--               <c:forEach items="${studyCategory}" var="studyVO" varStatus="status">
                 	<c:if test="${status.index eq 0 || status.index eq 9 || status.index eq 17 || status.index eq 23}">
                 		<label class="fancy-checkbox">
                 			<input type="checkbox" name="categoryD" class="${studyVO.cDName}" id="${studyVO.cDName}"><span><b>${studyVO.cDName}</b></span>
                 		</label>
                 	</c:if>
                 	<label class="fancy-checkbox" style="display:inline-block;">
                 		<input type="checkbox" name="categoryS" class="${studyVO.cDName}" id="${studyVO.cSName}"><span>${studyVO.cSName}</span>
                 	</label>
                 </c:forEach> --%>
                 
<!-- ======== 카테고리 =========== -->       
                 <select id="catD" class="form-control">
                 	<option>--</option>
                 	<c:forEach items="${studyCategory}" var="studyVO">
                 		<option value="${studyVO.cDId}">${studyVO.cDName}</option>
                 	</c:forEach>
                 </select>
                 <select id="catS" class="form-control">
                 	<option>--</option>
                 	<%-- <option value="${studyVO.cSName}">${studyVO.cSName}</option> --%>
                 </select>
                 <button type="button" id="addCat" class="btn btn-default btn-xs">추가</button>
                 <div id="addCatArea">
                 </div>
				</td>
            </tr>
            <tr>
                <th>스터디명</th>
                <td><input type="text" name="title" value="${studyVO.title}" class="form-control"></td>
            </tr>
            <tr>
                <th>지역</th>
                <td>
<!-- ======== 지 역 =========== -->    
                <!-- 스터디에 선택된 지역정보 셀렉트 표시 -->
                    <select id="rDName" name='rDId' class="form-control"> 
                    	<c:forEach items="${region}" var="studyVO">
                    			<c:if test="${studyVO.rSId eq 1}">
                    				<option  value="${studyVO.rDId}">${studyVO.rDName}</option>
                    			</c:if>
                    	</c:forEach>
                    </select>
                    <select id="rSName" name='rSId' class="form-control"> 
                    </select>
                </td>
            </tr>
            <tr>
                <th>스터디 방장</th>
                <!-- 아래 방장은 나중에 세션으로 전송 -->
                <%-- <td><input name="writer" value="${studyVO.writer}"></td> --%>
                <td><input class="form-control" name="writer" value="abc1@gmail.com"></td>
            </tr>
            
             </tbody>
        </table>
        
        <div>* 상세정보</div>
        <table class="table table-hover">
        <tbody>
            <tr>
                <th>연령</th>
                <td>
	                <label class="fancy-checkbox" style="display:inline-block;">
	                	<input type="checkbox" class="age" name="age" value="10대"><span>10대</span>
	                </label>
	                <label class="fancy-checkbox" style="display:inline-block;">
	                	<input type="checkbox" class="age" name="age" value="20대"><span>20대</span>
	                </label>
	                <label class="fancy-checkbox" style="display:inline-block;">
	                	<input type="checkbox" class="age" name="age" value="30대"><span>30대</span>
	                </label>
	                <label class="fancy-checkbox" style="display:inline-block;">
	                	<input type="checkbox" class="age" name="age" value="40대"><span>40대</span>
	                </label>
	                <label class="fancy-checkbox" style="display:inline-block;">
	                	<input type="checkbox" class="age" name="age" value="50대"><span>50대</span>
	                </label>
	                <label class="fancy-checkbox" style="display:inline-block;">
	                	<input type="checkbox" class="age" name="age" value="무관"><span>무관</span>
	                </label>
                </td>
            </tr>
            <tr>
            
                <th>시작날짜</th>
                <td>
                	<div class="studysd">
						<input class="form-control" type="date" name="sd">
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
					</select>
					<select id="st" name="st" class="form-control">
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
					<select id="et" name="et" class="form-control">
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
                <!-- 시간 추가 등록 가능 
                <div id="addTimeArea">
                </div>    
                    <button type="button" id="addTime" class="btn btn-default btn-xs">추가</button> -->
                </td>
            </tr>
            
            <tr>
                <th>최대인원</th>
                <td>
                	<div class="studymax">
						<input class="form-control" type="number" name="max"  min="0">
					</div>
                </td>
            </tr>
            
            </tbody>
        </table>

        <div>* 소개</div>
        <table class="table table-hover">
        <tbody>
            <tr>
                <th>스터디 소개</th>
                <td><textarea name="content" class="form-control">${studyVO.content}</textarea></td>
            </tr>
            <tr>
                <th>이미지</th>
                <td>
                	<div class="studyfile">

						<h3>첫 사진은 메인 화면에 등록됩니다.</h3>
						<div class='fileDrop'></div>
						<div class='uploadedList'></div>
					</div>
                </td>
            </tr>
        </tbody>
        </table>
        <!-- 일등록 핸들러 -->

		<div class="text-right">
			<button type="submit" class = "btn btn-success">등록</button>
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
			<img src="{{imgsrc}}" alt="Attachment">
		</span>
		<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
		<small class = "small" value = "{{name}}" data-src=data style="cursor:pointer">X</small>
		</span>
	</div>
</script>		
<script>
$(".st").change(function(){
var stval = $(".st option:selected").val();

var str="";

	for(var i = stval; i<=24; i++){
				
		str += "<option value'"+i+"'>"+i+"시</option>";
		$(".et").html(str);
		
	if(stval=24) {
		
	}	
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
   console.log("2*****************");
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
     console.log("3*****************"); 
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

	  console.log("ssssssssssss");
	  
   event.preventDefault();
   
   var that = $(this);

   var str = "";

   $(".uploadedList .small").each(function(index){
    str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("value")+"'>";
   });
   that.append(str);

   that.get(0).submit();

  });
  
</script>
<script>
	
	$(document).ready(function(){
		
		//카테고리 소분류 체크 시 대분류 체크 되도록
	
		
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
	});
		//카테고리 삭제 버튼
		function btn_delete(x){
			$(x).parent("div").remove();
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
			
			$("#rDName").val("${studyVO.rDId}"); // 스터디 지역 정보 불러옴
						
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

   <!-- 파일업로드 핸들러 -->
    <script id="templateAttach" type="text/x-handlebars-template">
    <li data-src='{{name}}'>
		<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  		<div class="mailbox-attachment-info">
		</span>
		</div>
	</li>
    </script>

</body>
</html>