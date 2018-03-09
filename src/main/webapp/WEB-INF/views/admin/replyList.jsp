<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>댓글 관리</title>
</head>
<body>
<div id="wrapper">
<%@ include file="nav.jsp" %>

	 <!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">댓글 관리</h3>
					<div class="row">
						<div class="col-md-12">
    						<div class="panel">
        <div class="panel-heading">
			<h3 class="panel-title">댓글 관리</h3>
		</div>
		
        <!--검색-->
        <div class="panel-body">
        <table class="table">
        <thead>
			<tr>
				<th>스터디 번호</th>
				<th>작성자</th>
			</tr>
		</thead>
		<tbody>
            <tr>
                <td><input type="text" name="bsBnoKeyword" id="bsBnoKeywordInput" value="${cri.bsBnoKeyword}" class="form-control"></td>
                <td><input type="text" name="writerKeyword" id="writerKeywordInput" value="${cri.writerKeyword}" class="form-control"></td>
            </tr>
		</tbody>
        </table>
		<div class="text-center">
        	<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
        	<button type="button" id="removeBtn" class="btn btn-primary">초기화</button>
		</div>
		</div>

        <!--리스트 -->
        <!--페이징 처리 -->
        <div class="panel-body">
        <div>총 ${pageMaker.totalCount}건 ${cri.page}/${pageMaker.endPage}페이지</div>
        
        <table class="table table-hover">
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
        <div class="text-center">
        <ul class="pagination">
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
		$("#studyListsuv").attr("class", "active");
		$("#replyListnav").attr("class", "active");
		$("#subPages").attr("class", "in");
		
		//검색 클릭 시 액션
		$("#searchBtn").on("click", function(event){
			self.location = "replyList" + "${pageMaker.makeQuery(1)}"
				+"&bsBnoKeyword="+encodeURIComponent($("#bsBnoKeywordInput").val())
				+"&writerKeyword="+encodeURIComponent($("#writerKeywordInput").val());
		});
		
		//초기화 클릭 시 액션
		$("#removeBtn").on("click", function(){
			$("#bsBnoKeywordInput").val('');
			$("#writerKeywordInput").val('');
		});
		
	});
</script>
</body>
</html>