<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="http://code.jquery.com/jquery-1.7.js"></script>
    <script type="text/javascript" src="/resources/js/upload.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
    <title>Document</title>
    
<style>

.fileDrop{
width:200px;
height:200px;
border:1px dotted blue;
}

.fileList{
width:200px;
height:200px;
border:1px dotted blue;
}

small {
	margin-left:3px;
	font-weight:bold;
	color:gray;
}

small:hover {
	background-color:black;
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
                <input type="text" placeholder="쓴사람" name="writer" value="abc1@gmail.com">
            </div>

            <!--카테고리-->
            <div class="stucycategory">
                <!--대분류-->
                <div class="CD">
                    <p>대분류</p>
                    <input type="checkbox" name="categoryD" value="A">외국어
                    <input type="checkbox" name="categoryD" value="B">IT
                    <input type="checkbox" name="categoryD" value="C">라이프스타일
                    <input type="checkbox" name="categoryD" value="D">취업
                </div>
                <!--소분류 외국어-->
                <div class="CSA">
                    <p>소분류</p>
                    <input type="checkbox" name="categoryS" value="1">토익
                    <input type="checkbox" name="categoryS" value="2">토플
                    <input type="checkbox" name="categoryS" value="3">텝스
                    <input type="checkbox" name="categoryS" value="4">토스/오픽
                    <input type="checkbox" name="categoryS" value="5">회화
                    <input type="checkbox" name="categoryS" value="6">작문/독해
                    <input type="checkbox" name="categoryS" value="7">중국어
                    <input type="checkbox" name="categoryS" value="8">일본어
                    <input type="checkbox" name="categoryS" value="9">기타
                </div>
                
                <!-- 소분류IT -->
                <div class="CSB">
                    <p>소분류</p>
                    <input type="checkbox" name="categoryS" value="1">컴퓨터언어
                    <input type="checkbox" name="categoryS" value="2">웹프로그래밍
                    <input type="checkbox" name="categoryS" value="3">모바일프로그래밍
                    <input type="checkbox" name="categoryS" value="4">데이터베이스/서버
                    <input type="checkbox" name="categoryS" value="5">게임프로그래밍
                    <input type="checkbox" name="categoryS" value="6">문서작성
                    <input type="checkbox" name="categoryS" value="7">자격증
                    <input type="checkbox" name="categoryS" value="8">기타
                </div>
                
                <!-- 소분류라이프스타일 -->
                <div class="CSC">
                    <p>소분류</p>
                    <input type="checkbox" name="categoryS" value="1">미술/디자인
                    <input type="checkbox" name="categoryS" value="2">뷰티/미용
                    <input type="checkbox" name="categoryS" value="3">스포츠
                    <input type="checkbox" name="categoryS" value="4">음악/공연
                    <input type="checkbox" name="categoryS" value="5">게임
                    <input type="checkbox" name="categoryS" value="6">기타
                </div>
                
                <!-- 소분류취업 -->
                <div class="CSD">
                    <p>소분류</p>
                    <input type="checkbox" name="categoryS" value="1">면접
                    <input type="checkbox" name="categoryS" value="2">자소서
                    <input type="checkbox" name="categoryS" value="3">고시
                    <input type="checkbox" name="categoryS" value="4">기술
                    <input type="checkbox" name="categoryS" value="5">기타
                </div>
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
            <div class="studyRegion">
                <!--대분류-->

                    <p>지역대분류</p>
                    <select id="rDId" name="rDId">  
                 		<option value='' selected>--</option>

           <option value="A">서울</option>
                        <option value="B">경기도</option>
                        <option value="C">인천광역시</option>
                        <option value="D">세종틀별자치시</option>
                        <option value="E">강원도</option>
                        <option value="F">충청북도</option>
                        <option value="G">충청남도</option>
                        <option value="H">대전광역시</option>
                        <option value="I">대구광역시</option>
                        <option value="J">경상북도</option>
                        <option value="K">경상남도</option>
                        <option value="L">전라북도</option>
                        <option value="M">전라남도</option>
                        <option value="N">광주광역시</option>
                        <option value="O">부산광역시</option>
                        <option value="P" >울산광역시</option>
                        <option value="Q">제주특별시</option> 
                    </select>
                    
                <!--소분류//나중에추가하기-->
                    <p>지역소분류</p>
                    <select id="rSId" name="rSId">
                    
               		<option selected> -- </option>
                       <option value="1">남구</option>
                        <option value="2">동구</option>
                        <option value="3">북구</option>
                        <option value="4">울주군</option>
                        <option value="5">중구</option>  
	                </select>  
  <!--              <div class="RSQ"> 
                    <p>지역소분류</p>
                    <select class="rSId" name="rSId">
                   		<option selected> -- </option>
                        <option value="1">서귀포시</option>
                        <option value="2">제주시</option>
                    </select>    
                </div> -->

<script>

</script>				
				
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
                    <option selected> -- </option>
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
                	<option selected> -- </option>
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
                	<option selected> -- </option>
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
			
			<div class='uploaded'></div>
			
			
			<h3>나머지 떨구자</h3>
			<div class="fileList"></div>

			<div class='uploadedList'></div>
			
 		  </div>      
        </div>

        <button type="submit" >종료</button>
    </form>

 <iframe name="zeroFrame"></iframe>
 <!-- 파일등록 핸들러 -->
 <script id="template" type="text/x-handlebars-template">

	<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>

		<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
		<a href="{{name}}"></a><small data-src=data>X</small>
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
					
					$(".uploaded").append(html);
				}

				});
			});
		
		//나머지 떨구자
		$(".fileList").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		
	
		//파일을 떨구는 장소	
		$(".fileList").on("drop", function(event){
			
	
			event.preventDefault();

			var files = event.originalEvent.dataTransfer.files;
	
			for(var i=1; i<files.length; i++) {
			
			var file = files[i];
			
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
			}
			});
		
		
		//이미지삭제합니다
		$(".uploaded").on("click", "small", function(event){
			
			var that = $(this);
			
			$.ajax({
				url:"/study/deleteFile",
				type:"POST",
				data:{fileName:$(this).attr("data-src")},
				dataType:"text",
				success:function(result){
					if(result == 'deleted') {
						/*  alert("deleted");*/
						that.parent("div").remove();
					}
				}
			})
			
		});
		
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
					}
				}
			})
			
		});
		
		
		//스터디 보드 등록후 이미지 등록을 위해서
		$("#registerForm").submit(function(event){
			
			event.preventDefault();
			
			var that = $(this);
			
			var str = "";
			
			$(".uploaded hi").each(function(index){
				
				str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'>";
			});
			
			that.append(str);
			
			that.get(0).submit();
		});


	
	</script>


</body>
</html>