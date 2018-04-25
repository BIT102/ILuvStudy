<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>스터디 목록</title>
<style>
.text-cut{
	display: block;
	white-space: nowrap;
	overflow: hidden; 
	text-overflow: ellipsis;
}
</style>
</head>
<body>
<div id="wrapper">
<%@ include file="nav.jsp" %>

	 <!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">스터디 목록</h3>
					<div class="row">
						<div class="col-md-12">
    						<div class="panel">
        <div class="panel-heading">
			<h3 class="panel-title">스터디 목록</h3>
		</div>
        
        <!--검색-->
        <div class="panel-body col-xs-12 col-md-12">
        <table class="table">
        <thead>
			<tr>
				<th>스터디상태</th>
				<th>스터디명</th>
				<th>스터디방장</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
            <tr>
                <td>
                    <select name="stStatusType" id="stStatusTypeSelect" class="form-control">
                        <option value="n"
                        	<c:out value="${cri.stStatusType == null?'selected':''}"/>>전체</option>
 	 	     			<option value="v"
                        	<c:out value="${cri.stStatusType eq 'v'?'selected':''}"/>>진행중</option>
                        <option value="d"
                        	<c:out value="${cri.stStatusType eq 'd'?'selected':''}"/>>마감</option>             
                    </select>
                </td>
                <td><input type="text" name="titleKeyword" id="titleKeywordInput" value="${cri.titleKeyword}" class="form-control"></td>
                <td><input type="text" name="writerKeyword" id="writerKeywordInput" value="${cri.writerKeyword}" class="form-control"></td>
            	<td>
            		<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
        			<button type="button" id="removeBtn" class="btn btn-primary">초기화</button>
            	</td>
            </tr>
		</tbody>
        </table>
		</div>

        <!--리스트-->
        <!--페이징 처리 -->
        <div class="panel-body">
        <div style="float:right">총 ${pageMaker.totalCount}건 ${cri.page}/${pageMaker.endPage}페이지</div>
        
        <table class="table table-hover">
            <tr>
                <th>스터디 번호</th>
                <th>스터디명</th>
                <th>스터디방장</th>
                <th>지역</th>
                <th>스터디 상태</th>
                <th>스터디 시작일</th>
                <th>스터디 마감일</th>
                <th>조회 수</th>
            </tr>
<!-- DB데이터 가져옴 -->
<c:forEach items="${list}" var="studyVO">
            <tr>
                <td>${studyVO.bno}</td>
                <td class="text-cut"><a href="/admin/studyDetail${pageMaker.studySearch(pageMaker.cri.page)}&bno=${studyVO.bno}">${studyVO.title}</a></td>
                <td>${studyVO.writer}</td>
                <td>${studyVO.rDName} ${studyVO.rSName}</td>
                <td>
                	<!-- 시작일, 마감일과 now 비교  -->
                	<jsp:useBean id="now" class="java.util.Date" />
                	<c:if test="${studyVO.sd > now}">모집중</c:if>
                	<c:if test="${studyVO.sd <= now && studyVO.enddate >= now}">진행중</c:if>
                	<c:if test="${studyVO.enddate < now}">마감</c:if>
                </td>
                <td>${studyVO.sd}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${studyVO.enddate}"/></td>
                <td>${studyVO.vct}</td>
            </tr>
</c:forEach>
        </table>
        
        <!-- 페이징 처리 -->
        <!-- 페이징 정보 저장 -->
        <div class="text-center">
        <ul class="pagination">
        	<c:if test="${pageMaker.prev}">
        		<li><a href="studyList${pageMaker.studySearch(pageMaker.startPage - 1)}">&laquo;</a></li>
        	</c:if>
        
        	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
        	<li
        		<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
        		<a href="studyList${pageMaker.studySearch(idx)}">${idx}</a>
        	</li>
        	</c:forEach>
        
        	<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
        		<li><a href="studyList${pageMaker.studySearch(pageMaker.endPage + 1)}">&raquo;</a></li>
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
	var result='${msg}';
	
	if(result=='SUCCESS'){
		alert("처리가 완료되었습니다.");
	}
	
	$(document).ready(function(){		
		$("#studyListsuv").attr("class", "active");
		$("#studyListnav").attr("class", "active");
		$("#subPages").attr("class", "in");
		
		//검색 클릭 시 액션
		$("#searchBtn").on("click", function(event){
			self.location = "studyList" + "${pageMaker.makeQuery(1)}"
				+"&stStatusType="
				+$("select option:selected").val()
				+"&titleKeyword="+encodeURIComponent($("#titleKeywordInput").val())
				+"&writerKeyword="+encodeURIComponent($("#writerKeywordInput").val());
		});
		
		//초기화 클릭 시 액션
		$("#removeBtn").on("click", function(){
			$("#stStatusTypeSelect").val('n');
			$("#titleKeywordInput").val('');
			$("#writerKeywordInput").val('');
		});
		
	});
</script>

</body>
</html>