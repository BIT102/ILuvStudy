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
        <a>공지사항</a>
        
	<form role="form" method="post">
        <table>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" value="${noticeVO.title}"></td>
            </tr>
            <tr>
                <th>작성자</th>
                <td><input type="hidden" name="writer" value="${login.id}">${noticeVO.writer}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content">${noticeVO.content}</textarea>
                </td>
            </tr>
            <tr>
                <th>등록일</th>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${noticeVO.regdate}"/></td>
            </tr>
            <tr>
                <th>최종 수정일</th>
                <td>
                	<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${noticeVO.lastModifyDate}"/>
                </td>
            </tr>
        </table>
	</form>
		<button type="submit" id="listBtn">목록</button>
		<button type="submit" id="modifyBtn">수정</button>
    </div>

<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		//수정 클릭 시 액션
		$("#modifyBtn").on("click", function(){
			//form 데이터 유효성 검사 추가 필요
			
			formObj.submit();
		});
		
		//목록 클릭 시 액션
		$("#listBtn").on("click", function(){
			self.location = "/admin/noticeList?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+"&titleKeyword=${cri.titleKeyword}"
							+"&idKeyword=${cri.idKeyword}";

		});
	});
</script>

</body>
</html>