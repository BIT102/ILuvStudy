<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>QNA 관리</title>
</head>
<body>
<%@ include file="nav.jsp" %>
    
    <!--상세메뉴-->
    <div id="topmenu2">
        <div class="border">
            <a href="qnaList">QNA 관리</a>
        </div>
        <div class="border">
            <a href="noticeList">공지사항 등록</a>
        </div>
    </div>

    <!--내용-->
    <div id="container">
        <a>QNA 관리</a>
        
        <!--검색-->
        <table>
            <tr>
                <th>FAQ</th>
                <td>
                    <select name="faqType">
                		<!-- 0: 미등록  1: 등록 -->
                        <option value="n"
                        	<c:out value="${cri.faqType == null?'selected':''}"/>>전체</option>
                        <option value="v"
                        	<c:out value="${cri.faqType eq 'v'?'selected':''}"/>>등록</option>
                        <option value="d"
                        	<c:out value="${cri.faqType eq 'd'?'selected':''}"/>>미등록</option>
                    </select>
                </td>
                <th>아이디</th>
                <td><input type="text" name="emailKeyword" id="emailKeywordInput" value="${cri.emailKeyword}"></td>
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
                <th>제목</th>
                <th>FAQ</th>
                <th>댓글수</th>
                <th>작성일</th>
            </tr>
<!-- DB데이터 가져옴 -->
<c:forEach items="${list}" var="qnaVO">
            <tr>
                <td>${qnaVO.bno}</td>
                <td>${qnaVO.writer}</td>
                <td><a href="/admin/qnaDetail${pageMaker.qnaSearch(pageMaker.cri.page)}&bno=${qnaVO.bno}">${qnaVO.title}</a></td>
                <!-- 0: 미등록  1: 등록 -->
                <td>
                	<c:if test="${qnaVO.type eq 0}">미등록 </c:if>
                	<c:if test="${qnaVO.type eq 1}">등록</c:if>
                </td>
                <td>${qnaVO.rct}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${qnaVO.regdate}"/></td>
            </tr>
</c:forEach>
        </table>
        
        <!-- 페이징 처리 -->
        <!-- 페이징 정보 저장 -->
        <ul>
        	<c:if test="${pageMaker.prev}">
        		<li><a href="qnaList${pageMaker.qnaSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
        	</c:if>
        
        	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
        	<li
        		<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
        		<a href="qnaList${pageMaker.qnaSearch(idx)}">${idx}</a>
        	</li>
        	</c:forEach>
        
        	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
        		<li><a href="qnaList${pageMaker.qnaSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
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
			self.location = "qnaList" + "${pageMaker.makeQuery(1)}"
				+"&faqType="
				+$("select option:selected").val()
				+"&emailKeyword="+encodeURIComponent($("#emailKeywordInput").val());
		}); 
		
	});
</script>
</body>
</html>