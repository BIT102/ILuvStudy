<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>계정 관리</title>
    
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
        <a>회원 등록</a>
	<form role="form" method="post">
        <table>
            <tr>
                <th>아이디</th>
                <td>
                	<input type="text" name="email">
                	<button>중복확인</button>
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td><input type="password"></td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>
    	            <input type="text" name="nickName">
    	            <button>중복확인</button>
                </td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                	<input type="radio" name="gender" value="1" checked>남성
                	<input type="radio" name="gender" value="2">여성
                </td>
            </tr>
            <tr>
            	<th>핸드폰번호</th>
            	<td><input type="text" name="phoneNum"></td>
            </tr>
            <tr>
            	<th>생년월일</th>
            	<td><input type="text" name="birth"></td>
            </tr>
        </table>
        <input type="hidden" name="registUser" value="${login.id}">
	</form>   
	     
		<button type="button" id="listBtn">목록</button>
		<button type="submit" id="registerBtn">등록</button>
        
    </div>
    
<script>

	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		//등록 클릭 시 액션
		$("#registerBtn").on("click", function(){
			//form 유효성 검사 추가 필요
			
			formObj.submit();
		});
		
		//목록 클릭 시 액션
		$("#listBtn").on("click", function(){
			self.location = "/admin/userList";
		});
	});
</script>
</body>
</html>