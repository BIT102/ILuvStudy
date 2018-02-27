<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원조회 상세</title>
</head>
<body>
<%@ include file="nav.jsp" %>

    <!--상세메뉴-->
    <div id="topmenu2">
        <div class="border">
            <a href="userList">회원조회</a>
        </div>
    </div>

    <!--내용-->
    <div id="container">
        <a>회원조회 상세</a>
        
    <form role="form" method="post">    
        <div>* 기본정보</div>
            <table>
            	<tr>
            		<th>번호</th>
            		<td>${userVO.bno}</td>
            	</tr>
                <tr>
                    <th>이메일 주소</th>
                    <td>${userVO.email}</td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td><input type="text" name="name" value="${userVO.name}"></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" name="password"></td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td><input type="text" name="nickName" value="${userVO.nickName}"></td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td><input type="text" name="birth" value="${userVO.birth}"></td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>
                    	<!-- 1:남성  2:여성 -->
                    	<c:if test="${userVO.gender eq 1}">
                    		<input type="radio" name="gender" value="1" checked="checked">남성  
                    		<input type="radio" name="gender" value="2">여성
                    	</c:if>
                    	<c:if test="${userVO.gender eq 2}">
                    		<input type="radio" name="gender" value="1">남성  
                    		<input type="radio" name="gender" value="2" checked="checked">여성
                    	</c:if>
                    </td>
                </tr>
                <tr>
                    <th>핸드폰 번호</th>
                    <td><input type="text" name="phoneNum" value="${userVO.phoneNum}"></td>
                </tr>
                <tr>
                    <th>가입 상태</th>
                    <td>
                    	<!-- 0:회원  1:탈퇴 -->
                		<c:if test="${userVO.isDel eq 0}">회원 </c:if>
                		<c:if test="${userVO.isDel eq 1}">탈퇴</c:if>
                	</td>
                </tr>
                <tr>
                    <th>가입일</th>
                    <td>${userVO.registDate}</td>
                </tr>
                <tr>
                    <th>이미지</th>
                    <td>${userVO.photo}</td>
                </tr>
            </table>
        <div>* 부가정보</div>
            <table>
                <tr>
                    <th>관심 카테고리</th>
                    <td>#IT <input type="checkbox">컴퓨터 언어<input type="checkbox">웹프로그래밍</td>
                </tr>
                <tr>
                    <th>관심 지역</th>
                    <td>
                        <select>
                            <option>전체</option>
                            <option>서울</option>
                        </select>
                        <select>
                            <option>전체</option>
                            <option>강남구</option>
                        </select>
                    </td>
                </tr>
                <tr>
                	<th>홈페이지</th>
                	<td><input type="text" name="homepage" value="${userVO.homepage}"></td>
                <tr>
                    <th>자기소개</th>
                    <td><textarea name="introduction">${userVO.introduction}</textarea></td>
                </tr>
            </table>
	</form>
        <button type="submit" id="modifyBtn">수정</button>
        <button type="submit" id="stopBtn">비활성</button>

        <div>* 북마크</div>
            <table>
                <tr>
                    <th>번호</th>
                    <th>스터디명</th>
                    <th>스터디방장</th>
                    <th>지역</th>
                    <th>스터디 시작일</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>자바 프로그래밍 스터디 모집합니다.</td>
                    <td>테스터123</td>
                    <td>서울 강남구</td>
                    <td>2018-02-25</td>
                </tr>
            </table>

        <div>* 모집</div>
            <table>
                <tr>
                    <th>번호</th>
                    <th>스터디명</th>
                    <th>스터디방장</th>
                    <th>지역</th>
                    <th>스터디 시작일</th>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        
        <div>* 신청</div>
            <table>
                <tr>
                    <th>번호</th>
                    <th>스터디명</th>
                    <th>스터디방장</th>
                    <th>지역</th>
                    <th>신청일</th>
                    <th>승인여부</th>
                </tr>
                <tr>
                    <td>1</td>
                    <td>자바 프로그래밍 스터디 모집합니다.</td>
                    <td>테스터123</td>
                    <td>서울 강남구</td>
                    <td>2018-02-17</td>
                    <td>미승인</td>
                </tr>
            </table>

        <div>* 완료</div>
            <table>
                <tr>
                    <th>번호</th>
                    <th>스터디명</th>
                    <th>스터디방장</th>
                    <th>지역</th>
                    <th>스터디 시작일</th>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>

<!--         <a type="button" href="userList">목록</a> -->
        <button type="submit" id="listBtn">목록</button>
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
			self.location = "/admin/userList?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+"&isDelType=${cri.isDelType}&emailKeyword=${cri.emailKeyword}&nickNameKeyword=${cri.nickNameKeyword}";
		});
		
		//비활성 클릭 시 액션
		$("#stopBtn").on("click", function(){
			//isdel 1로 변경 처리 필요
		});
	});
</script>

</body>
</html>