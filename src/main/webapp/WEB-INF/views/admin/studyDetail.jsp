<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>스터디 상세</title>
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
                <c:forEach items="${studyCategory}" var="studyVO">
                 	<c:if test="${studyVO.cSId eq 1 and studyVO.cDName eq '외국어'}">
                		# <a name="categoryD" value="${studyVO.cDId}">${studyVO.cDName}</a>
                	</c:if> 
                	<c:if test="${studyVO.cSId eq 1 and studyVO.cDName ne '외국어'}">
                		<br><a name="categoryD" value="${studyVO.cDId}"># ${studyVO.cDName}</a>
                	</c:if>
                	<label class="fancy-checkbox" style="display:inline-block;">
                		<input type="checkbox" name="categoryS" id="${studyVO.cDId}${studyVO.cSId}" value="${studyVO.cSId}"><span>${studyVO.cSName}</span>
                	</label>
                </c:forEach>
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
                    <select id="rDName" class="form-control">
                    	<c:forEach items="${region}" var="studyVO">
                    			<c:if test="${studyVO.rSId eq 1}">
                    				<option name='rDId' value="${studyVO.rDId}">${studyVO.rDName}</option>
                    			</c:if>
                    	</c:forEach>
                    </select>
                    <select id="rSName" class="form-control">
                    </select>
                </td>
            </tr>
            <tr>
                <th>등록일</th>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${studyVO.regdate}"/></td>
            </tr>
            <tr>
                <th>스터디 방장</th>
                <td>${studyVO.writer}</td>
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
                <label class="fancy-checkbox" style="display:inline-block;">
                	<input type="checkbox" name="age" value="10대"><span>10대</span>
                </label>
                <label class="fancy-checkbox" style="display:inline-block;">
                	<input type="checkbox" name="age" value="20대"><span>20대</span>
                </label>
                <label class="fancy-checkbox" style="display:inline-block;">
                	<input type="checkbox" name="age" value="30대"><span>30대</span>
                </label>
                <label class="fancy-checkbox" style="display:inline-block;">
                	<input type="checkbox" name="age" value="40대"><span>40대</span>
                </label>
                <label class="fancy-checkbox" style="display:inline-block;">
                	<input type="checkbox" name="age" value="50대"><span>50대</span>
                </label>
                <label class="fancy-checkbox" style="display:inline-block;">
                	<input type="checkbox" name="age" value="무관"><span>무관</span>
                </label>
                </td>
            </tr>
            <tr>
                <th>시작날짜</th>
                <td><input type="text" name="sd" value="${studyVO.sd}" class="form-control"></td>
            </tr>
            <tr>
                <th>시간</th>
                <td>
                	${studyVO.sc}  ${studyVO.st} ~ ${studyVO.et} <a>X</a><br>
                    <!-- <a href="studyTime">추가</a> -->
                    <button type="button" id="" class="btn btn-default btn-xs">추가</button>
                </td>
            </tr>
            <tr>
                <th>완료일</th>
                <td><input type="text" name="enddate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${studyVO.enddate}"/>"  class="form-control"></td>
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
		
		$("#rDName").on("change", function(){
			getRegion();
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
						option += "<option name='rSId' value="+result[i].rSId+">"+result[i].rSName+" </option>"; //option에 배열값 추가
					}
					$("#rSName").append(option); //html에 뿌려줌
				}
			}); //$.ajax 끝
		}
		
		function getStudy(){
			$("input:checkbox[id='${studyVO.categoryD}${studyVO.categoryS}']").attr("checked", "checked"); //카테고리 정보 불러옴
			console.log("${studyVO.categoryS}");
			$("input:checkbox[value='${studyVO.age}']").attr("checked", "checked"); //연령 정보 불러옴
			$("option[value='${studyVO.rDId}']").attr("selected", "selected"); //스터디 지역 정보 불러옴
			
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