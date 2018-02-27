<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>댓글 관리</title>
</head>
<body>
<%@ include file="nav.jsp" %>

    <!--상세메뉴-->
    <div id="topmenu2">
        <div class="border">
            <a href="studyList">스터디 목록</a>
        </div>
        <div class="border">
            <a href="replyList">댓글 관리</a>
        </div>
    </div>

    <!--내용-->
    <div id="container">
        <a>댓글 관리</a>
        
        <!--검색-->
        <table>
            <tr>
                <th>스터디 번호</th>
                <td><input type="text" name="bsBnoKeyword" id="bsBnoKeywordInput" value="${cri.bsBnoKeyword}"></td>
                <th>작성자</th>
                <td><input type="text" name="writerKeyword" id="writerKeywordInput" value="${cri.writerKeyword}"></td>
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
                <th>스터디 번호</th>
                <th>작성자</th>
                <th>댓글 내용</th>
                <th>작성일</th>
            </tr>
<!-- DB데이터 가져옴 -->
<c:forEach items="${list}" var="replyStudyVO">
            <tr>
                <td>${replyStudyVO.rno}</td>
                <td>${replyStudyVO.bsBno}</td>
                <td>${replyStudyVO.writer}</td>
                <td>${replyStudyVO.content}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${replyStudyVO.regdate}"/></td>
            </tr>
</c:forEach>
        </table>
        
		<!-- 페이징 처리 -->
        <!-- 페이징 정보 저장 -->
        <ul>
        	<c:if test="${pageMaker.prev}">
        		<li><a href="replyList${pageMaker.replySearch(pageMaker.startPage - 1)}">&laquo;</a></li>
        	</c:if>
        
        	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
        	<li
        		<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
        		<a href="replyList${pageMaker.replySearch(idx)}">${idx}</a>
        	</li>
        	</c:forEach>
        
        	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
        		<li><a href="replyList${pageMaker.replySearch(pageMaker.endPage + 1)}">&raquo;</a></li>
        	</c:if>
        </ul>
    </div>
    
<script>	
	$(document).ready(function(){		
		
		//검색 클릭 시 액션
		$("#searchBtn").on("click", function(event){
			self.location = "replyList" + "${pageMaker.makeQuery(1)}"
				+"&bsBnoKeyword="+encodeURIComponent($("#bsBnoKeywordInput").val())
				+"&writerKeyword="+encodeURIComponent($("#writerKeywordInput").val());
		});
		
	});
</script>
</body>
</html>