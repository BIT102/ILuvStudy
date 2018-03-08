<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원조회 상세</title>
</head>
<body>
<div id="wrapper">
<%@ include file="nav.jsp" %>
        <!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">회원조회</h3>
					<div class="row">
						<div class="col-md-12">
    						<div class="panel">
        <div class="panel-heading">
			<h3 class="panel-title">회원조회 상세</h3>
		</div>
        
        <div class="panel-body">
    <form role="form" method="post">    
        <div>* 기본정보</div>
            <table class="table table-hover">
            <tbody>
            	<tr>
            		<th>번호</th>
            		<td><input type="hidden" name="bno" value="${userVO.bno}" class="form-control">${userVO.bno}</td>
            	</tr>
                <tr>
                    <th>이메일 주소</th>
                    <td>${userVO.email}</td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td><input type="text" name="name" value="${userVO.name}" class="form-control"></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" name="password" class="form-control"></td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td><input type="text" name="nickName" value="${userVO.nickName}" class="form-control"></td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td><input type="text" name="birth" value="${userVO.birth}" class="form-control"></td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>
                    <label class="fancy-radio" style="display:inline-block;">
                    	<input type="radio" name="gender" value="1"><span><i></i>남성&nbsp;</span>
                    </label>
                    <label class="fancy-radio" style="display:inline-block;">
                    	<input type="radio" name="gender" value="2"><span><i></i>여성</span>
                    </label>
                    </td>
                </tr>
                <tr>
                    <th>핸드폰 번호</th>
                    <td><input type="text" name="phoneNum" value="${userVO.phoneNum}" class="form-control"></td>
                </tr>
                <tr>
                    <th>가입 상태</th>
                    <td>
                    	<!-- 0:회원  1:탈퇴 -->
                		<c:if test="${userVO.isDel eq 0}">회원&nbsp;
                			<button type="submit" id="updateBtn" class="btn btn-danger btn-xs">탈퇴</button>
                		</c:if>
                		<c:if test="${userVO.isDel eq 1}">탈퇴</c:if>
                	</td>
                </tr>
                <tr>
                    <th>가입일</th>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${userVO.registDate}"/></td>
                </tr>
                <tr>
                    <th>최종수정일</th>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${userVO.modifyDate}"/></td>
                </tr>
                <!-- 탈퇴회원인 경우 탈퇴일자 노출 -->
                <c:if test="${userVO.isDel eq 1}">
               		<tr>
                		<th>탈퇴일</th>
                		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${userVO.quitDate}"/></td>
                	</tr>
                </c:if>
                </tbody>
            </table>
        <div>* 부가정보</div>
            <table class="table table-hover">
            	<tbody>
                <tr>
                	<th>홈페이지</th>
                	<td><input type="text" name="homepage" value="${userVO.homepage}" class="form-control"></td>
                <tr>
                    <th>자기소개</th>
                    <td><textarea name="introduction" class="form-control">${userVO.introduction}</textarea></td>
                </tr>
                <tr>
                    <th>이미지</th>
                    <td>${userVO.photo}</td>
                </tr>
                </tbody>
            </table>
	</form>
        
        <!-- 0:회원  1:탈퇴 -->
        <c:if test="${userVO.isDel eq 0}">
        <div class="text-right">
        	<button type="submit" id="modifyBtn" class="btn btn-success">수정</button>
        </div>
        </c:if>
	</div>
	<!-- panel-body end -->

        
           <div class="panel-body">
        <div>* 북마크</div>
            <table class="table table-hover">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>스터디명</th>
                    <th>스터디방장</th>
                    <th>지역</th>
                    <th>스터디 시작일</th>
                </tr>
             </thead>
             <tbody>
<c:forEach items="${userBookMark}" var="studyVO">
                <tr>
                    <td>${studyVO.bno}</td>
                    <td>${studyVO.title}</td>
                    <td>${studyVO.writer}</td>
                    <td>${studyVO.rDName} ${studyVO.rSName}</td>
                    <td>${studyVO.sd}</td>
                </tr>
</c:forEach>
			</tbody>
            </table>

        <div>* 모집</div>
            <table class="table table-hover">
            <thead>
                <tr>
                    <th>스터디 번호</th>
                    <th>스터디명</th>
                    <th>스터디 방장</th>
                    <th>지역</th>
                    <th>스터디 시작일</th>
                </tr>
        	</thead>
        	<tbody>
<c:forEach items="${userStudy}" var="studyVO">
                <tr>
                    <td>${studyVO.bno}</td>
                    <td>${studyVO.title}</td>
                    <td>${studyVO.writer}</td>
                    <td>${studyVO.rDName} ${studyVO.rSName}</td>
                    <td>${studyVO.sd}</td>
                </tr>
</c:forEach>
            </tbody>
            </table>
        
        <div>* 신청</div>
            <table class="table table-hover">
           	<thead>
                <tr>
                    <th>스터디 번호</th>
                    <th>스터디명</th>
                    <th>스터디 방장</th>
                    <th>지역</th>
                    <th>신청일</th>
                    <th>승인여부</th>
                </tr>
            </thead>
            <tbody>
<c:forEach items="${userApply}" var="studyVO">        
                <tr>
                    <td>${studyVO.bno}</td>
                    <td>${studyVO.title}</td>
                    <td>${studyVO.writer}</td>
                    <td>${studyVO.rDName} ${studyVO.rSName}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${studyVO.regdate}"/></td>
                    <td>${studyVO.status}</td>
                </tr>
</c:forEach>
			</tbody>
            </table>
		<div class="text-left">
        <button type="button" id="listBtn" class="btn btn-primary">목록</button>
		</div>
        </div>
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
		$("#userListnav").attr("class", "active");
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		var gender = ${userVO.gender}; //성별 db에 있는 값으로 체크
		if(gender==1){
			$("input:radio[value=1]").attr("checked", "checked");
		}else{
			$("input:radio[value=2]").attr("checked", "checked");
		}
		
		//수정 클릭 시 액션
		$("#modifyBtn").on("click", function(){
			//form 데이터 유효성 검사 추가 필요
			
			formObj.submit();
		});
		
		//목록 클릭 시 액션
		$("#listBtn").on("click", function(){
			self.location = "/admin/userList?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+"&isDelType=${cri.isDelType}&emailKeyword=${cri.emailKeyword}&nickNameKeyword=${cri.nickNameKeyword}";
		});
		
		//비활성 클릭 시 액션
		$("#updateBtn").on("click", function(){
			//isdel 1로 변경 처리 필요
 			formObj.attr("action", "/admin/isDelUpdate");
			formObj.submit();
		});
	});
</script>

</body>
</html>