<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>공지사항 등록</title>
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
        <a>공지사항 등록</a>
        
        <!--검색-->
        <table>
            <tr>
                <th>제목</th>
                <td><input type="text" name="titleKeyword" id="titleKeywordInput" value="${cri.titleKeyword}"></td>
                <th>작성자</th>
                <td><input type="text" name="idKeyword" id="idKeywordInput" value="${cri.idKeyword}"></td>
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
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
<!-- DB데이터 가져옴 -->
<c:forEach items="${list}" var="noticeVO">
            <tr>
                <td>${noticeVO.bno}</td>
                <td><a href="/admin/noticeDetail${pageMaker.noticeSearch(pageMaker.cri.page)}&bno=${noticeVO.bno}">${noticeVO.title}</a></td>
                <td>${noticeVO.writer}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${noticeVO.regdate}"/></td>
            </tr>
</c:forEach>
        </table>
		
		<!-- 페이징 처리 -->
        <!-- 페이징 정보 저장 -->
        <ul>
        	<c:if test="${pageMaker.prev}">
        		<li><a href="noticeList${pageMaker.noticeSearch(pageMaker.startPage - 1)}">&laquo;</a></li>
        	</c:if>
        
        	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
        	<li
        		<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
        		<a href="noticeList${pageMaker.noticeSearch(idx)}">${idx}</a>
        	</li>
        	</c:forEach>
        
        	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
        		<li><a href="noticeList${pageMaker.noticeSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
        	</c:if>
        </ul>

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
			self.location = "/admin/noticeRegister";
		});
		
		//검색 클릭 시 액션
		$("#searchBtn").on("click", function(event){
			self.location = "noticeList" + "${pageMaker.makeQuery(1)}"
				+"&titleKeyword="+encodeURIComponent($("#titleKeywordInput").val())
				+"&idKeyword="+encodeURIComponent($("#idKeywordInput").val());
		});
		
	});
</script>
</body>
</html>