<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>QNA 관리</title>
<style>
form th{
	width:30%;
}
.default th{
	width:30%;
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
					<h3 class="page-title">QNA 관리</h3>
					<div class="row">
						<div class="col-md-12">
    						<div class="panel">
        <div class="panel-heading">
			<h3 class="panel-title">QNA 상세</h3>
		</div>

	<div class="panel-body default">
        <div>* 기본정보</div>
        <table class="table table-hover">
        <tbody>
       		<tr>
                <th>번호</th>
                <td>${qnaVO.bno}</td>
            </tr>
            <tr>
                <th>아이디</th>
                <td>${qnaVO.writer}</td>
            </tr>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" class="form-control" value="${qnaVO.title}"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="content" class="form-control">${qnaVO.content}</textarea></td>
            </tr>
            <tr>
                <th>작성일</th>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${qnaVO.regdate}"/></td>
            </tr>
        <%--     <tr>
                <th>댓글수</th>
                <td>${qnaVO.rct}</td>
            </tr>
            <tr>
                <th>FAQ 여부</th>
                <!-- 0: 미등록  1: 등록 -->
                <td>
                	<c:if test="${qnaVO.type eq 0}">미등록&nbsp;
            			<button type="submit" id="updateBtn" class="btn btn-default btn-xs">등록</button>    	
                	</c:if>
                	<c:if test="${qnaVO.type eq 1}">등록&nbsp;
            			<button type="submit" id="updateRBtn" class="btn btn-default btn-xs">등록취소</button>    	
                	</c:if>
                </td>
            </tr> --%>
            </tbody>
        </table>
        
       		<button type="button" id="listBtn" class="btn btn-primary">목록</button>
        
       </div>
       <!-- panel-body end --> 
        
<%--   <div class="panel-body">      
<form role="form" method="post">
        <div>* 관리자 답변</div>
        <table class="table table-hover">
        <tbody>
			<input type="hidden" name="bqBno" value="${qnaVO.bno}">
			<input type="hidden" name="bno" value="${qnaVO.bno}">
            <tr>
                <th>답변내용</th>
                <td>
                <!-- replyVO에서 작성자와 관리자 아이디가 일치할 경우 break할 설정값 -->
                <c:set var="doneLoop" value="false"/>
                <c:forEach items="${list}" var="replyVO" varStatus="status">
                	<c:if test="${not doneLoop}">
                		<!-- 댓글 작성자와 관리자 아이디가 일치할 경우 -->
                		<c:if test="${replyVO.replyer eq login.id}">
                			<textarea id="content" name="content" class="form-control">${replyVO.content}</textarea>
                			<c:set var="doneLoop" value="true"/>
                		</c:if>
                		<!-- c:foreach 반복 마지막일때, 아이디가 일치하지 않는 경우 -->
                		<c:if test="${status.last and !(replyVO.replyer eq login.id)}">
                			<textarea id="content" name="content" class="form-control"></textarea>
                		</c:if>
                	</c:if>
                </c:forEach>
                <!-- replyVO에 데이터가 없을 경우 -->
                <c:if test="${list.size() == 0}">
               		<textarea name="content" id="content" class="form-control"></textarea>
                </c:if>
                </td>
            </tr>
            <tr>
                <th>관리자 아이디</th>
                <!-- 세션에 저장되어 있는 관리자 아이디 가져옴 -->
                <td><input type="hidden" name="replyer" value="${login.id}">${login.id}</td>
            </tr>
        </tbody>
        </table>
</form>
        <div class="text-right">
        	<button type="submit" id="registerBtn" class="btn btn-success">등록</button>
        </div>
	</div>
	<!-- panel-body end -->
	
	<div class="panel-body">
		<div>* 사용자 답변</div>
		<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>내용</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
<c:forEach items="${list}" var="replyVO">	     
			<tr>
				<td>${replyVO.rno}</td>
				<td>${replyVO.replyer}</td>
				<td>${replyVO.content}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${replyVO.regdate}"/></td>				
			</tr>
</c:forEach>
		</tbody>
		</table>

        </div> --%>
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
	$(document).ready(function(){
		$("#qnaListsuv").attr("class", "active");
		$("#qnaListnav").attr("class", "active");
		$("#subPages2").attr("class", "in");

		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		//등록 클릭 시 액션
		$("#registerBtn").on("click", function(){
			//form 데이터 유효성 검사 추가 필요
			if(document.getElementById("content").value.length >= 5){
				formObj.submit();
			}else{
				alert("내용을 5자 이상 입력하세요");
			}
		});
		
		//목록 클릭 시 액션
		$("#listBtn").on("click", function(){
			self.location = "/admin/qnaList?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+"&faqType=${cri.faqType}&emailKeyword=${cri.emailKeyword}";
		});
		
		//등록 클릭 시 액션
		$("#updateBtn").on("click", function(){
			//type 1로 변경 처리 필요
 			formObj.attr("action", "/admin/typeUpdate");
			formObj.submit();
		});
		
		//등록취소 클릭 시 액션
		$("#updateRBtn").on("click", function(){
			//type 0으로 변경 처리 필요
 			formObj.attr("action", "/admin/typeRUpdate");
			formObj.submit();
		});
		
	});
</script>
</body>
</html>