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

        <div>* 기본정보</div>
        <table>
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
                <td>${qnaVO.title}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td>${qnaVO.content}</td>
            </tr>
            <tr>
                <th>작성일</th>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${qnaVO.regdate}"/></td>
            </tr>
            <tr>
                <th>댓글수</th>
                <td>${qnaVO.rct}</td>
            </tr>
            <tr>
                <th>FAQ 여부</th>
                <!-- 0: 미등록  1: 등록 -->
                <td>
                	<c:if test="${qnaVO.type eq 0}">미등록 </c:if>
                	<c:if test="${qnaVO.type eq 1}">등록</c:if>
                </td>
            </tr>
        </table>
        
<form role="form" method="post">
        <div>* 관리자 답변</div>
        <table>
			<input type="hidden" name="bqBno" value="${qnaVO.bno}">
            <tr>
                <th>답변내용</th>
                <td>
                <!-- replyVO에서 작성자와 관리자 아이디가 일치할 경우 break할 설정값 -->
                <c:set var="doneLoop" value="false"/>
                <c:forEach items="${list}" var="replyVO" varStatus="status">
                	<c:if test="${not doneLoop}">
                		<!-- 댓글 작성자와 관리자 아이디가 일치할 경우 -->
                		<c:if test="${replyVO.replyer eq login.id}">
                			<textarea name="content" readonly>${replyVO.content}</textarea>
                			<c:set var="doneLoop" value="true"/>
                		</c:if>
                		<!-- c:foreach 반복 마지막일때, 아이디가 일치하지 않는 경우 -->
                		<c:if test="${status.last and !(replyVO.replyer eq login.id)}">
                			<textarea name="content"></textarea>
                		</c:if>
                	</c:if>
                </c:forEach>
                <!-- replyVO에 데이터가 없을 경우 -->
                <c:if test="${list.size() == 0}">
               		<textarea name="content"></textarea>
                </c:if>
                </td>
            </tr>
            <tr>
                <th>관리자 아이디</th>
                <!-- 세션에 저장되어 있는 관리자 아이디 가져옴 -->
                <td><input type="hidden" name="replyer" value="${login.id}">${login.id}</td>
            </tr>
        </table>
</form>
	<button type="submit" id="registerBtn">등록</button>   
	
		<div>* 사용자 답변</div>
		<table>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>내용</th>
				<th>작성일</th>
			</tr>
<c:forEach items="${list}" var="replyVO">	     
			<tr>
				<td>${replyVO.rno}</td>
				<td>${replyVO.replyer}</td>
				<td>${replyVO.content}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${replyVO.regdate}"/></td>				
			</tr>
</c:forEach>
		</table>

        <button type="submit" id="listBtn">목록</button>
    </div>
    
<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		//등록 클릭 시 액션
		$("#registerBtn").on("click", function(){
			//form 데이터 유효성 검사 추가 필요
			
			formObj.submit();
		});
		
		//목록 클릭 시 액션
		$("#listBtn").on("click", function(){
			self.location = "/admin/qnaList?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+"&faqType=${cri.faqType}&emailKeyword=${cri.emailKeyword}";
		});
		
	});
</script>
</body>
</html>