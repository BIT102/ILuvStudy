<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>스터디 상세</title>
<style>
form th{
	width:30%;
}
#rDName, #rSName, #age, #sc, #st, #et, #catD, #catS{
	width:30%;
	display: inline;
}

</style>
</head>
<body>
<div id="wrapper">
<%@ include file="nav.jsp" %>

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
	<form role="form" method="post">          
        <div>* 기본정보</div>
        <table class="table table-hover">
        	<tbody>
            <tr>
                <th>스터디 번호</th>
                <td>${studyVO.bno}</td>
            </tr>
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
                 
                 <select id="catD" class="form-control">
                 	<c:forEach items="${studyCategory}" var="studyVO" varStatus="status">
                 		<c:if test="${status.index eq 0 || status.index eq 9 || status.index eq 17 || status.index eq 23}">
                 			<option value="${studyVO.cDId}">${studyVO.cDName}</option>
                 		</c:if>
                 	</c:forEach>
                 </select>
                 <select id="catS" class="form-control">
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
                <th>등록일</th>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${studyVO.regdate}"/></td>
            </tr>
            <tr>
                <th>스터디 방장</th>
                <td><input type="hidden" name="writer" value="${studyVO.writer}">${studyVO.writer}</td>
            </tr>
            <tr>
                <th>스터디 상태</th>
                <td>
                    <jsp:useBean id="now1" class="java.util.Date" />
                	<c:if test="${studyVO.sd > now1}">모집중</c:if>
                	<c:if test="${studyVO.sd <= now1 && studyVO.enddate >= now1}">진행중</c:if>
                	<c:if test="${studyVO.enddate < now1}">마감</c:if>
                </td>
            </tr>
             </tbody>
        </table>
        
        <div>* 상세정보</div>
        <table class="table table-hover">
        <tbody>
            <tr>
                <th>연령</th>
                <td>
                <select name="age" id="age" class="form-control">
                	<option value="10대">10대</option>
                	<option value="20대">20대</option>
                	<option value="30대">30대</option>
                	<option value="40대">40대</option>
                	<option value="50대">50대</option>
                	<option value="무관">무관</option>
                </select>
                </td>
            </tr>
            <tr>
                <th>시작날짜</th>
                <td><input type="text" name="sd" value="${studyVO.sd}" class="form-control"></td>
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
                <!-- <div id="addTimeArea">
                </div>    
                    <button type="button" id="addTime" class="btn btn-default btn-xs">추가</button> -->
                </td>
            </tr>
            <tr>
                <th>완료일</th>
                <td>
                 <fmt:formatDate pattern="yyyy-MM-dd" value="${studyVO.enddate}"/>
                </td>
            </tr>
            <tr>
            	<th>현재인원</th>
            	<td>${studyVO.now}</td>
            </tr>
            <tr>
                <th>최대인원</th>
                <td><input type="text" name="max" value="${studyVO.max}"  class="form-control"></td>
            </tr>
            <tr>
            	<th>조회수</th>
            	<td>${studyVO.vct}</td>
            </tr>
            <tr>	
            	<th>댓글수</th>
            	<td>${studyVO.rct}</td>
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
                <td>${studyVO.name}</td>
            </tr>
        </tbody>
        </table>
	</form>
		<div class="text-right">
		<button type="submit" id="modifyBtn" class="btn btn-success">수정</button>
		</div>
	</div>
	<!-- panel-body end -->
	
	<div class="panel-body">   
        <div>* 신청자</div>
        <table class="table table-hover">
            <thead>
            <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>신청일</th>
                <th>승인여부</th>
            </tr>
            </thead>
            <tbody>
<c:forEach items="${applyStudy}" var="studyVO">
            <tr>
                <td>${studyVO.bno}</td>
                <td>${studyVO.email}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${studyVO.regdate}"/></td>
                <td>${studyVO.status}</td>
            </tr>
</c:forEach>
            </tbody>
        </table>

        <button type="button" id="listBtn" class="btn btn-primary">목록</button>
    
  </div>
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
		
<script>
	
	$(document).ready(function(){
		
		//카테고리 소분류 체크 시 대분류 체크 되도록
		<c:forEach items="${studyCategory}" var="studyVO" varStatus="status">
			<c:if test="${status.index eq 0 || status.index eq 9 || status.index eq 17 || status.index eq 23}">
				$(".${studyVO.cDName}").on("click", function(){
					if($(this).prop("checked")){
						$("#${studyVO.cDName}").attr("checked",true);
					}
				});
			</c:if>
        </c:forEach>
		
		$("#studyListsuv").attr("class", "active");
		$("#studyListnav").attr("class", "active");
		$("#subPages").attr("class", "in");
		
		getStudy(); //스터디 정보 불러옴
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		//수정 클릭 시 액션
		$("#modifyBtn").on("click", function(){
			//form 데이터 유효성 검사 추가 필요
			//formObj.attr("action", "/admin/studyDetail");
			formObj.submit();
		});
		
		//목록 클릭 시 액션
		$("#listBtn").on("click", function(){
			self.location = "/admin/studyList?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+"&stStatusType=${cri.stStatusType}&titleKeyword=${cri.titleKeyword}&writerKeyword=${cri.writerKeyword}";
		});
		
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
			
			var cat="<input type='hidden' name='categoryD' value="+catd+">"
			+"<input type='hidden' name='categoryS' value="+cats+">"
			+"<div>"+catd2 +" > "+cats2+"</div>";
			
       		$("#addCatArea").append(cat);
		});
		
		//시간영역 추가 버튼 클릭 시 액션
		$("#addTime").on("click", function(){
       		
       		var time="<input type='text' name='sc' value='' style='width:30%; display: inline;' class='form-control'> <input type='text' name='st' value='' style='width:30%; display: inline;' class='form-control'> ~ <input type='text' name='et' value='' style='width:30%; display: inline;' class='form-control'><br>";
       	
       		$("#addTimeArea").append(time);
		});
		
	});
	
		//지역정보 2단 콤보박스 메서드
		function getRegion(){
			$("#rSName").children("option").remove(); //소분류의 option 삭제
			
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
					$("#rSName").append(option); //html에 뿌려줌
				}
			}); //$.ajax 끝
		}
		
		//카테고리 대분류 선택 시 소분류 변경
		function getCat(){
			$("#catS").children("option").remove(); //소분류의 option 삭제
			
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
					$("#catS").append(option); //html에 뿌려줌
				}
			}); //$.ajax 끝
		}
		
		function getStudy(){
			//카테고리 정보 불러옴
			<c:forEach items="${studyDC}" var="studyVO">
				var recatd = ${studyVO.cDId}; 
				var recats = ${studyVO.cSId}; 
				var recatd2 = ${studyVO.cDName};
				var recats2 = ${studyVO.cSName};
				
				var recat="<input type='hidden' name='categoryD' value="+catd+">"
				+"<input type='hidden' name='categoryS' value="+cats+">"
				+"<div>"+catd2 +" > "+cats2+"</div>";
				
				$("#addCatArea").append(recat);
			</c:forEach>

			$("option[value='${studyVO.age}']").attr("selected", "selected"); //연령 정보 불러옴
			$("option[value='${studyVO.rDId}']").attr("selected", "selected"); //스터디 지역 정보 불러옴
			$("option[value='${studyVO.sc}']").attr("selected", "selected"); // 시간 정보 불러옴
			$("option[value='${studyVO.st}']").attr("selected", "selected"); // 시작 시간 정보 불러옴
			$("option[value='${studyVO.et}']").attr("selected", "selected"); // 끝나는 시간 정보 불러옴
			
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

</body>
</html>