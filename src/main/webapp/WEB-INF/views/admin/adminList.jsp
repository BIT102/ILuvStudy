<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>계정 관리</title>

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
        
        <!--검색-->
        <table>
            <tr>
                <th>아이디</th>
                <td><input type="text" name="idKeyword" id="idKeywordInput" value="${cri.idKeyword}"></td>
                <th>이름</th>
                <td><input type="text" name="nameKeyword" id="nameKeywordInput" value="${cri.nameKeyword}"></td>
            </tr>

        </table>
        
        <button id="searchBtn">검색</button>
        <button>초기화</button>

        <!--리스트 -->
        <!--페이징 처리 -->
        <div>총 ${pageMaker.totalCount}건 ${cri.page}/${pageMaker.endPage}페이지</div>

        <table>
            <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>사용여부</th>
                <th>최근 접속정보</th>
            </tr>
<!-- DB데이터 가져옴 -->
<c:forEach items="${list}" var="adminVO">
            <tr>
                <td>${adminVO.bno}</td>
                <!-- 페이징 정보 유지 -->
                <td>
                <a href="/admin/adminDetail${pageMaker.adminSearch(pageMaker.cri.page)}&bno=${adminVO.bno}">${adminVO.id}</a>
                </td>
                <td>${adminVO.name}</td>
                <td>
                	<!-- jstl로 eq 사용 시 char형 데이터는 형변환 오류, string형 데이터 비교 필요 -->
                	<!-- V: 사용 / D: 미사용 -->
                	<c:if test="${adminVO.status eq 'V'}">사용 </c:if>
                	<c:if test="${adminVO.status eq 'D'}">미사용</c:if>
                </td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${adminVO.lastLoginDate}"/></td>
            </tr>
</c:forEach>
        </table>
        
        <!-- 페이징 처리 -->
        <!-- 페이징 정보 저장 -->
        <ul>
        	<c:if test="${pageMaker.prev}">
        		<li><a href="adminList${pageMaker.adminSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
        	</c:if>
        
        	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
        	<li
        		<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
        		<a href="adminList${pageMaker.adminSearch(idx)}">${idx}</a>
        	</li>
        	</c:forEach>
        
        	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
        		<li><a href="adminList${pageMaker.adminSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
        	</c:if>
        </ul>
        
		<!-- 계정 등록 -->
        <!-- <a href="adminRegister">등록</a> -->
        <button type="submit" id="registerBtn">등록</button>
    </div>

<script>
	var result='${msg}';
	
	if(result=='SUCCESS'){
		alert("처리가 완료되었습니다.");
	}
	
	$(document).ready(function(){		
		
		//등록 클릭 시 액션
		$("#registerBtn").on("click", function(){
			self.location = "/admin/adminRegister";
		});
		
		//검색 클릭 시 액션
		$("#searchBtn").on("click", function(event){
			self.location = "adminList" + "${pageMaker.makeQuery(1)}"
				+"&idKeyword="+encodeURIComponent($("#idKeywordInput").val())
				+"&nameKeyword="+encodeURIComponent($("#nameKeywordInput").val());
		});
		
	});
</script>
</body>
</html>