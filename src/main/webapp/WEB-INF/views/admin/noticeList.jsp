<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>공지사항 등록</title>
</head>
<body>
<div id="wrapper">
<%@ include file="nav.jsp" %>

	 <!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">공지사항 등록</h3>
					<div class="row">
						<div class="col-md-12">
    						<div class="panel">
        <div class="panel-heading">
			<h3 class="panel-title">공지사항 등록</h3>
		</div>

        <!--검색-->
        <div class="panel-body col-xs-12 col-md-12">
        <table class="table">
        <thead>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
            <tr>
                <td><input type="text" name="titleKeyword" id="titleKeywordInput" value="${cri.titleKeyword}" class="form-control"></td>
                <td><input type="text" name="idKeyword" id="idKeywordInput" value="${cri.idKeyword}" class="form-control"></td>
            	<td>
            		<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
        			<button type="button" id="removeBtn" class="btn btn-primary">초기화</button>
            	</td>
            </tr>            
		</tbody>
        </table>
        
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
                <th>제목</th>
                <th>공개여부</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
<!-- DB데이터 가져옴 -->
<c:forEach items="${list}" var="noticeVO">
            <tr>
                <td>${noticeVO.bno}</td>
                <td><a href="/admin/noticeDetail${pageMaker.noticeSearch(pageMaker.cri.page)}&bno=${noticeVO.bno}">${noticeVO.title}</a></td>
                <td>
                	<!-- 0: 사용 / 1: 미사용 -->
                	<c:if test="${noticeVO.type == 0}">공개</c:if>
                	<c:if test="${noticeVO.type == 1}">비공개</c:if>
                </td>
                <td>${noticeVO.writer}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${noticeVO.regdate}"/></td>
            </tr>
</c:forEach>
		</tbody>
        </table>
		
		<!-- 페이징 처리 -->
        <!-- 페이징 정보 저장 -->
        <div class="text-center">
        <ul class="pagination">
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
		$("#noticeListnav").attr("class", "active");
		$("#subPages2").attr("class", "in");
		
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
		
		//초기화 클릭 시 액션
		$("#removeBtn").on("click", function(){
			$("#titleKeywordInput").val('');
			$("#idKeywordInput").val('');
		});
		
	});
</script>
</body>
</html>