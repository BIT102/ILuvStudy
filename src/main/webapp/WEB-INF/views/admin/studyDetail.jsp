<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>스터디 상세</title>
</head>
<body>
<%@ include file="nav.jsp" %>

    <!--상세메뉴-->
    <div id="topmenu2">
        <div class="border">
            <a href="studyList">스터디 목록</a>
        </div>
        <div class="border">
            <a href="replyList">댓글 관리</a>
        </div>
    </div>

    <!--내용-->
    <div id="container">
        <a>스터디 상세</a>
        
	<form role="form" method="post">          
        <div>* 기본정보</div>
        <table>
            <tr>
                <th>스터디 번호</th>
                <td>${studyVO.bno}</td>
            </tr>
            <tr>
                <th>카테고리</th>
                <td>
                <!-- 스터디에 등록된 카테고리 체크 표시 -->
                <!-- 대분류, 소분류 엮어라 -->
                <c:forEach items="${studyDCategory}" var="studyVO">
                		# ${studyVO.cDName}
                		
                </c:forEach>
                <c:forEach items="${studySCategory}" var="studyVO">
                	<input type="checkbox">${studyVO.cSName}
                </c:forEach>
                </td>
            </tr>
            <tr>
                <th>스터디명</th>
                <td><input type="text" name="title" value="${studyVO.title}"></td>
            </tr>
            <tr>
                <th>지역</th>
                <td>
                <!-- 대분류 선택 시 소분류 값 변경되도록 자바스크립트 처리 필요 -->
                <!-- 스터디에 선택된 지역정보 셀렉트 표시 -->
                    <select>
                    	<c:forEach items="${region}" var="studyVO">
                        	<option>${studyVO.rDName}</option>
						</c:forEach>
                    </select>
                    <select>
                    	<c:forEach items="${region}" var="studyVO">
                        	<option>${studyVO.rSName}</option>
                    	</c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>등록일</th>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${studyVO.regdate}"/></td>
            </tr>
            <tr>
                <th>스터디 방장</th>
                <td>${studyVO.writer}</td>
            </tr>
            <tr>
                <th>스터디 상태</th>
                <td>
                    <jsp:useBean id="now1" class="java.util.Date" />
                	<c:if test="${studyVO.sd > now1}">모집중</c:if>
                	<c:if test="${studyVO.sd <= now1 && studyVO.enddate >= now1}">진행중</c:if>
                	<c:if test="${studyVO.enddate < now1}">마감</c:if>
                </td>
            </tr>
        </table>

        <div>* 상세정보</div>
        <table>
            <tr>
                <th>연령</th>
                <td><input type="checkbox">10대 <input type="checkbox">20대 <input type="checkbox">무관</td>
            </tr>
            <tr>
                <th>시작날짜</th>
                <td><input type="text" name="sd" value="${studyVO.sd}"></td>
            </tr>
            <tr>
                <th>시간</th>
                <td>
					월요일 1시 00분 ~ 2시 00분  <a>X</a><br>
					수요일 1시 00분 ~ 2시 00분  <a>X</a><br>
                    <a href="studyTime">추가</a>
                </td>
            </tr>
            <tr>
                <th>완료일</th>
                <td><input type="text" name="enddate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${studyVO.enddate}"/>"></td>
            </tr>
            <tr>
            	<th>현재인원</th>
            	<td>${studyVO.now}</td>
            </tr>
            <tr>
                <th>최대인원</th>
                <td><input type="text" name="max" value="${studyVO.max}"></td>
            </tr>
            <tr>
            	<th>조회수</th>
            	<td>${studyVO.vct}</td>
            </tr>
            <tr>	
            	<th>댓글수</th>
            	<td>${studyVO.rct}</td>
            </tr>
        </table>

        <div>* 소개</div>
        <table>
            <tr>
                <th>스터디 소개</th>
                <td><textarea name="content">${studyVO.content}</textarea></td>
            </tr>
            <tr>
                <th>이미지</th>
                <td>${studyVO.name}</td>
            </tr>
        </table>
	</form>
		<button type="submit" id="modifyBtn">수정</button>

        <div>* 신청자</div>
        <table>
            <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>닉네임</th>
                <th>신청일</th>
                <th>승인여부</th>
            </tr>
            <tr>
                <td>1</td>
                <td>asdf@naver.com</td>
                <td>홍길동</td>
                <td>2018-02-17</td>
                <td>미승인</td>
            </tr>
        </table>

        <button type="button" id="listBtn">목록</button>
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
			self.location = "/admin/studyList?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+"&stStatusType=${cri.stStatusType}&titleKeyword=${cri.titleKeyword}&writerKeyword=${cri.writerKeyword}";
		});
		
	});
</script>

<!--조정인이 한 분류 권한길도 바보 -->

</body>
</html>