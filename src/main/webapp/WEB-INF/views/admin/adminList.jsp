<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>계정 관리</title>
</head>
<body>
<div id="wrapper">
<%@ include file="nav.jsp" %>
	 <!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">계정관리</h3>
					<div class="row">
						<div class="col-md-12">
    						<div class="panel">
        <div class="panel-heading">
			<h3 class="panel-title">계정관리</h3>
		</div>
        
        <!--검색-->
        <div class="panel-body col-xs-12 col-md-12">
        <table class="table">
        <thead>
			<tr>
				<th>사용여부</th>
				<th>아이디</th>
				<th>이름</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
            <tr>
            	<td>
                    <select name="statusType" id="statusTypeSelect" class="form-control">
                        <option value="n"
                        	<c:out value="${cri.statusType == null?'selected':''}"/>>전체</option>
 	 	     			<option value="v"
                        	<c:out value="${cri.statusType eq 'v'?'selected':''}"/>>사용</option>
                        <option value="d"
                        	<c:out value="${cri.statusType eq 'd'?'selected':''}"/>>미사용</option>             
                    </select>
                </td>
                <td><input type="text" name="idKeyword" id="idKeywordInput" value="${cri.idKeyword}" class="form-control"></td>
                <td><input type="text" name="nameKeyword" id="nameKeywordInput" value="${cri.nameKeyword}" class="form-control"></td>
            	<td>
            		<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
        			<button type="button" id="removeBtn" class="btn btn-primary">초기화</button>
            	</td>
            </tr>
		</tbody>
        </table>
        
		</div>
		<!-- panel-body end -->
	
        <!--리스트 -->
        <!--페이징 처리 -->
        <div class="panel-body">
        <div style="float:right">총 ${pageMaker.totalCount}건 ${cri.page}/${pageMaker.endPage}페이지</div>
        
        <table class="table table-hover">
        <thead>
            <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>사용여부</th>
                <th>최근 접속정보</th>
            </tr>
      	</thead>
      	<tbody>
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
</tbody>
        </table>
        
        <!-- 페이징 처리 -->
        <!-- 페이징 정보 저장 -->
        <div class="text-center">
        <ul class="pagination">
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
        </div>
        
		<!-- 계정 등록 -->
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
		$("#adminListnav").attr("class", "active");
		
		//등록 클릭 시 액션
		$("#registerBtn").on("click", function(){
			self.location = "/admin/adminRegister";
		});
		
		//검색 클릭 시 액션
		$("#searchBtn").on("click", function(event){
			self.location = "adminList" + "${pageMaker.makeQuery(1)}"
				+"&statusType="
				+$("select option:selected").val()
				+"&idKeyword="+encodeURIComponent($("#idKeywordInput").val())
				+"&nameKeyword="+encodeURIComponent($("#nameKeywordInput").val());
		});
		
		//초기화 클릭 시 액션
		$("#removeBtn").on("click", function(){
			$("#statusTypeSelect").val('n');
			$("#idKeywordInput").val('');
			$("#nameKeywordInput").val('');
		});
		
	});
</script>
</body>
</html>