<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>계정 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
<%@ include file="nav.jsp" %>

    <!--상세메뉴-->
    <div id="topmenu2">
        <div class="border">
            <a href="adminList">계정관리</a>
        </div>
    </div>

    <!--내용-->
    <div id="container">
        <a>계정 관리</a>
        
	<form role="form" method="post">
        <table>
            <tr>
                <th>번호</th>
                <td>${adminVO.bno}</td>
            </tr>
            <tr>
                <th>아이디</th>
                <td>${adminVO.adminId}</td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" name="name" value="${adminVO.name}"></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="adminPw"></td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td><input type="password"></td>
            </tr>
            <tr>
                <th>사용여부</th>
                <td>
                  	<c:if test="${adminVO.status eq 'V'}">
                		<input type="radio" name="status" value="V" checked="checked" >사용
                		<input type="radio" name="status" value="D">미사용
                	</c:if>
                	<c:if test="${adminVO.status eq 'D'}">
                		<input type="radio" name="status" value="V">사용
                		<input type="radio" name="status" value="D" checked="checked">미사용
                	</c:if>
                </td>
            </tr>
            <tr>
                <th>최근 접속일</th>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${adminVO.lastLoginDate}"/></td>
            </tr>
        </table>
        
        <!-- 페이징 정보 저장 -->
        <input type="hidden" name="page" value="${cri.page}">
        <input type="hidden" name="perPageNum" value="${cri.perPageNum}">
        
        <!-- 검색 정보 저장 -->
<%--    <input type="hidden" name="idKeyword" value="${cri.idKeyword}">
        <input type="hidden" name="nameKeyword" value="${cri.nameKeyword}"> --%>
        
	</form>
		<button type="submit" id="listBtn">목록</button>
		<button type="submit" id="modifyBtn">수정</button>
		
    </div>

<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		//수정 클릭 시 액션
		$("#modifyBtn").on("click", function(){
			//form 데이터 유효성 검사 추가 필요
			
			formObj.submit();
		});
		
		//목록 클릭 시 액션
		$("#listBtn").on("click", function(){
			self.location = "/admin/adminList?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+"&idKeyword=${cri.idKeyword}&nameKeyword=${cri.nameKeyword}";

			//formObj.attr("method", "get");
			//formObj.attr("action", "/admin/adminList");
			//formObj.submit();
			//self.location = "/admin/adminList";
		});
	});
</script>

</body>
</html>