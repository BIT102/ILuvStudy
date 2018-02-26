<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>계정 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
<%@ include file="nav.jsp" %>
    
    <!--상세메뉴-->
    <div id="topmenu2">
        <div class="border">
            <a href="adminList">계정관리</a>
        </div>
    </div>

    <!--내용-->
    <div id="container">
        <a>계정 관리</a>
	<form role="form" method="post">
        <table>
            <tr>
                <th>아이디</th>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="pw"></td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td><input type="password"></td>
            </tr>
            <tr>
                <th>사용여부</th>
                <td><input type="radio" name="status" value="V">사용  
                	<input type="radio" name="status" value="D">미사용
                </td>
            </tr>
        </table>
	</form>        
		<button type="submit" id="listBtn">목록</button>
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
			self.location = "/admin/adminList";
		});
	});
</script>
</body>
</html>