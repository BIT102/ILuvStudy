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
					<h3 class="page-title">회원조회</h3>
					<div class="row">
						<div class="col-md-12">
    						<div class="panel">
        <div class="panel-heading">
			<h3 class="panel-title">회원 등록</h3>
		</div>

<div class="panel-body">
	<form role="form" method="post">
        <table class="table table-hover">
        <tbody>
            <tr>
                <th>아이디</th>
                <td>
                	<!-- 아이디 중복 체크 후 새로운 아이디 입력 했을 경우 중복체크 x로 처리 -->
                	<input type="text" name="email" placeholder="asdf@gmail.com" class="form-control">
                	<input type="button" class="btn btn-default btn-xs">중복확인
                	<!-- 중복체크 여부 확인 value:idUncheck 중복체크안함 -->
                	<input type="hidden" name="idDuplication" value="idUncheck"> 
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" name="name" class="form-control"></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="password" class="form-control"></td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td><input type="password" name="passwordcheck" class="form-control"></td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>
    	            <input type="text" name="nickName" class="form-control">
    	            <button class="btn btn-default btn-xs">중복확인</button>
                </td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                	<label class="fancy-radio" style="display:inline-block;">
                    	<input type="radio" name="gender" value="1"><span><i></i>남성&nbsp;</span>
                    </label>
                    <label class="fancy-radio" style="display:inline-block;">
                    	<input type="radio" name="gender" value="2" checked><span><i></i>여성</span>
                    </label>
                </td>
            </tr>
            <tr>
            	<th>핸드폰번호</th>
            	<td><input type="text" name="phoneNum" placeholder="01012345678" class="form-control"></td>
            </tr>
            <tr>
            	<th>생년월일</th>
            	<td><input type="text" name="birth" placeholder="900101" class="form-control"></td>
            </tr>
            </tbody>
        </table>
        <input type="hidden" name="registUser" value="${login.id}">
	</form>   
	     
		<button type="button" id="listBtn" class="btn btn-primary">목록</button>
		<button type="submit" id="registerBtn" class="btn btn-success" style="float:right">등록</button>
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

	$(document).ready(function(){
		$("#userListnav").attr("class", "active");
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