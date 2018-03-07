<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원조회</title>
</head>
<body>
	<div id="wrapper">
	<%@ include file="nav.jsp" %>

    <!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">회원조회</h3>
					<div class="row">
						<div class="col-md-12">
							<!-- TABLE HOVER -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">회원조회</h3>
								</div>
								
		<!--검색-->
		<div class="panel-body">
		<table class="table">
		<thead>
			<tr>
				<th>가입상태</th>
				<th>아이디</th>
				<th>닉네임</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
                    <select name="isDelType" id="isDelTypeSelect" class="form-control">
                        <option value="n"
                        	<c:out value="${cri.isDelType == null?'selected':''}"/>>전체</option>
                        <option value="v"
                        	<c:out value="${cri.isDelType eq 'v'?'selected':''}"/>>회원</option>
                        <!-- <option>비활성</option> -->
                        <option value="d"
                        	<c:out value="${cri.isDelType eq 'd'?'selected':''}"/>>탈퇴</option>
                    </select>
				</td>
				<td>
                	<input type="text" name="emailKeyword" id="emailKeywordInput" value="${cri.emailKeyword}" class="form-control">
				</td>
				<td>
                	<input type="text" name="nickNameKeyword" id="nickNameKeywordInput" value="${cri.nickNameKeyword}" class="form-control">
				</td>
			</tr>
		</tbody>
        </table>
        	<div class="text-center">
        		<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
        		<button type="button" id="removeBtn" class="btn btn-primary">초기화</button>
        	</div>
        </div>

								
								
								<div class="panel-body">
								<!--리스트 -->
        						<!--페이징 처리 -->
        						<div>총 ${pageMaker.totalCount}건 ${cri.page}/${pageMaker.endPage}페이지</div>
									<table class="table table-hover">
										<thead>
											<tr>
												<th>번호</th>
                								<th>아이디</th>
                								<th>이름</th>
                								<th>닉네임</th>
                								<th>핸드폰번호</th>
                								<th>가입 상태</th>
                								<th>가입일</th>
											</tr>
										</thead>
										<tbody>
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
										</tbody>
									</table>
									
		<!-- 페이징 처리 -->
        <!-- 페이징 정보 저장 -->
        <div class="text-center">
        <ul class="pagination">
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
        
        <div class="text-right">
        <button type="button" id="registerBtn" class="btn btn-primary">등록</button>
        </div>
        
								</div>
							</div>
							<!-- END TABLE HOVER -->
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
		
		$("#userListnav").attr("class", "active");
		
		//등록 클릭 시 액션
		$("#registerBtn").on("click", function(){
			self.location = "/admin/userRegister";
		});
		
		//검색 클릭 시 액션
		$("#searchBtn").on("click", function(event){
			self.location = "userList" + "${pageMaker.makeQuery(1)}"
				+"&isDelType="
				+$("select option:selected").val()
				+"&emailKeyword="+encodeURIComponent($("#emailKeywordInput").val())
				+"&nickNameKeyword="+encodeURIComponent($("#nickNameKeywordInput").val());
		});
		
		//초기화 클릭 시 액션
		$("#removeBtn").on("click", function(){
			$("#isDelTypeSelect").val('n');
			$("#emailKeywordInput").val('');
			$("#nickNameKeywordInput").val('');
		});
	});
</script>

</body>
</html>