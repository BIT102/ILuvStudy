<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원조회</title>
</head>
<body>
<%@ include file="nav.jsp" %>

    <!--상세메뉴-->
    <div id="topmenu2">
        <div class="border">
            <a href="userList">회원조회</a>
        </div>
    </div>

    <!--내용-->
    <div id="container">
        <a>회원조회</a>

        <!--검색-->
        <table>
            <tr>
                <th>가입 상태</th>
                <td colspan="3">
                    <select name="isDelType">
                        <option value="n"
                        	<c:out value="${cri.isDelType == null?'selected':''}"/>>전체</option>
                        <option value="v"
                        	<c:out value="${cri.isDelType eq 'v'?'selected':''}"/>>회원</option>
                        <!-- <option>비활성</option> -->
                        <option value="d"
                        	<c:out value="${cri.isDelType eq 'd'?'selected':''}"/>>탈퇴</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>아이디</th>
                <td><input type="text" name="emailKeyword" id="emailKeywordInput" value="${cri.emailKeyword}"></td>
                <th>닉네임</th>
                <td><input type="text" name="nickNameKeyword" id="nickNameKeywordInput" value="${cri.nickNameKeyword}"></td>
            </tr>
        </table>

        <button type="submit" id="searchBtn">검색</button>
        <button>초기화</button>

		<!--리스트 -->
        <!--페이징 처리 -->
        <div>총 ${pageMaker.totalCount}건 ${cri.page}/${pageMaker.endPage}페이지</div>
        
        <table>
            <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>닉네임</th>
                <th>핸드폰번호</th>
                <th>가입 상태</th>
                <th>가입일</th>
            </tr>
<!-- DB데이터 가져옴 -->
<c:forEach items="${list}" var="userVO">
            <tr>
                <td>${userVO.bno}</td>
                <td><a href="/admin/userDetail${pageMaker.userSearch(pageMaker.cri.page)}&bno=${userVO.bno}">${userVO.email}</a></td>
                <td>${userVO.name}</td>
                <td>${userVO.nickName}</td>
                <td>${userVO.phoneNum}</td>
                <td>
                	<!-- 0:회원  1:탈퇴 -->
                	<c:if test="${userVO.isDel eq 0}">회원 </c:if>
                	<c:if test="${userVO.isDel eq 1}">탈퇴</c:if>
                </td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${userVO.registDate}"/></td>
            </tr>
</c:forEach>
        </table>
        
        <!-- 페이징 처리 -->
        <!-- 페이징 정보 저장 -->
        <ul>
        	<c:if test="${pageMaker.prev}">
        		<li><a href="userList${pageMaker.userSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
        	</c:if>
        
        	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
        	<li
        		<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
        		<a href="userList${pageMaker.userSearch(idx)}">${idx}</a>
        	</li>
        	</c:forEach>
        
        	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
        		<li><a href="userList${pageMaker.userSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
        	</c:if>
        </ul>
    </div>

<script>
	var result='${msg}';
	
	if(result=='SUCCESS'){
		alert("처리가 완료되었습니다.");
	}
	
	$(document).ready(function(){		
		
		//검색 클릭 시 액션
		$("#searchBtn").on("click", function(event){
			self.location = "userList" + "${pageMaker.makeQuery(1)}"
				+"&isDelType="
				+$("select option:selected").val()
				+"&emailKeyword="+encodeURIComponent($("#emailKeywordInput").val())
				+"&nickNameKeyword="+encodeURIComponent($("#nickNameKeywordInput").val());
		});
		
	});
</script>

</body>
</html>