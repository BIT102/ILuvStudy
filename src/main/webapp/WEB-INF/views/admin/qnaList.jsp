<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>QNA 관리</title>
</head>
<body>
<div id="wrapper">
<%@ include file="nav.jsp" %>

	 <!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">FAQ 관리</h3>
					<div class="row">
						<div class="col-md-12">
    						<div class="panel">
        <div class="panel-heading">
			<h3 class="panel-title">FAQ 관리</h3>
		</div>
        
        <!--검색-->
        <div class="panel-body">
        <table class="table">
        <thead>
			<tr>
				<!-- <th>FAQ</th> -->
				<th>아이디</th>
			</tr>
		</thead>
		<tbody>
            <tr>
                <%-- <td>
                    <select name="faqType" id="faqTypeSelect" class="form-control">
                		<!-- 0: 미등록  1: 등록 -->
                        <option value="n"
                        	<c:out value="${cri.faqType == null?'selected':''}"/>>전체</option>
                        <option value="v"
                        	<c:out value="${cri.faqType eq 'v'?'selected':''}"/>>등록</option>
                        <option value="d"
                        	<c:out value="${cri.faqType eq 'd'?'selected':''}"/>>미등록</option>
                    </select>
                </td> --%>
                <td><input type="text" name="emailKeyword" id="emailKeywordInput" value="${cri.emailKeyword}" class="form-control"></td>
            </tr>
		</tbody>
        </table>
        <div class="text-center">
        	<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
        	<button type="button" id="removeBtn" class="btn btn-primary">초기화</button>
        </div>
        </div>
        <!-- panel-body end -->

        <!--리스트-->
        <!--페이징 처리 -->
        <div class="panel-body">
        <div style="float:right">총 ${pageMaker.totalCount}건 ${cri.page}/${pageMaker.endPage}페이지</div>
        
        <table class="table table-hover">
        <thead>
            <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>제목</th>
                <!-- <th>FAQ</th> -->
                <!-- <th>댓글수</th> -->
                <th>공개여부</th>
                <th>작성일</th>
            </tr>
		</thead>
		<tbody>
<!-- DB데이터 가져옴 -->
<c:forEach items="${list}" var="qnaVO">
            <tr>
                <td>${qnaVO.bno}</td>
                <td>${qnaVO.writer}</td>
                <td><a href="/admin/qnaDetail${pageMaker.qnaSearch(pageMaker.cri.page)}&bno=${qnaVO.bno}">${qnaVO.title}</a></td>
                <!-- 0: 미등록  1: 등록 -->
               <%--  <td>
                	<c:if test="${qnaVO.type eq 0}">미등록 </c:if>
                	<c:if test="${qnaVO.type eq 1}">등록</c:if>
                </td> --%>
                <%-- <td>${qnaVO.rct}</td> --%>
                <td>
                	<!-- 0: 사용 / 1: 미사용 -->
                	<c:if test="${qnaVO.type == 0}">공개</c:if>
                	<c:if test="${qnaVO.type == 1}">비공개</c:if>
                </td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${qnaVO.regdate}"/></td>
            </tr>
</c:forEach>
		</tbody>
        </table>
        
        <!-- 페이징 처리 -->
        <!-- 페이징 정보 저장 -->
        <div class="text-center">
        <ul class="pagination">
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
        
        <div class="text-right">
        <button type="button" id="registerBtn" class="btn btn-primary">등록</button>
        </div>
        
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
	var result='${msg}';

	if(result=='SUCCESS'){
		alert("처리가 완료되었습니다.");
	}

	$(document).ready(function(){		
		$("#qnaListsuv").attr("class", "active");
		$("#qnaListnav").attr("class", "active");
		$("#subPages2").attr("class", "in");
		
		//등록 클릭 시 액션
		$("#registerBtn").on("click", function(){
			self.location = "/admin/qnaRegister";
		});
		
		//검색 클릭 시 액션
 		$("#searchBtn").on("click", function(event){
			self.location = "qnaList" + "${pageMaker.makeQuery(1)}"
				+"&faqType="
				+$("select option:selected").val()
				+"&emailKeyword="+encodeURIComponent($("#emailKeywordInput").val());
		});
		
 		//초기화 클릭 시 액션
		$("#removeBtn").on("click", function(){
			$("#faqTypeSelect").val('n');
			$("#emailKeywordInput").val('');
		});
		
	});
</script>
</body>
</html>