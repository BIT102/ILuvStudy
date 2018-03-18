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
			<h3 class="panel-title">계정 상세</h3>
		</div>
    
    <div class="panel-body">      
	<form role="form" method="post">
        <table class="table table-hover">
        <tbody>
            <tr>
                <th>번호</th>
                <td>${adminVO.bno}</td>
            </tr>
            <tr>
                <th>아이디</th>
                <td>${adminVO.id}</td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input id="name" type="text" name="name" value="${adminVO.name}" class="form-control"></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                	<input id="pw" type="password" name="pw" class="form-control" placeholder="8자 이상 입력하세요">
                	<p id = "pwck" style = "color:red">비밀번호를 입력하세요</p>
                </td>
            </tr>
            <tr>
                <th>사용여부</th>
                <td>
                	<label class="fancy-radio" style="display:inline-block;">
                    	<input type="radio" name="status" value="V"><span><i></i>사용&nbsp;</span>
                    </label>
                    <label class="fancy-radio" style="display:inline-block;">
                    	<input type="radio" name="status" value="D"><span><i></i>미사용</span>
                    </label>
                </td>
            </tr>
            <tr>
            	<th>생성일</th>
            	<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${adminVO.registDate}"/></td>
            </tr>
            <tr>
            	<th>생성자</th>
            	<td>${adminVO.registUser}</td>
            </tr>
            <tr>
            	<th>최종수정일</th>
            	<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${adminVO.lastModifyDate}"/></td>
            </tr>
            <tr>
                <th>최근 접속일</th>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${adminVO.lastLoginDate}"/></td>
            </tr>
        </tbody>
        </table>
        
	</form>
		<button type="button" id="listBtn" class="btn btn-primary">목록</button>
		<button type="submit" id="modifyBtn" class="btn btn-success" style="float:right">수정</button>
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
		$("#adminListnav").attr("class", "active");
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		var status = "${adminVO.status}"; //사용여부 db값 체크
		if(status=="V"){
			$("input:radio[value='V']").attr("checked", "checked");
		}else{
			$("input:radio[value='D']").attr("checked", "checked");
		}
		
		// 완료 유효성 검사
		var nameV = false;
		var pwV = false;
		
		//수정 클릭 시 액션
		$("#modifyBtn").on("click", function(){
			//form 데이터 유효성 검사 추가 필요
			
			// name 유효성
			if($("#name").val() != ""){
				nameV = true;
			}
			
			// password 유효성
			if(document.getElementById("pwck").style.color == 'blue'){
				pwV = true;
			}
			
			
			console.log("nameV : " + nameV + " pwV : " + pwV);
			
			if(nameV && pwV){
				formObj.submit();
			}else{
				alert("내용을 확인하세요");	
			}
		});
		
		//목록 클릭 시 액션
		$("#listBtn").on("click", function(){
			self.location = "/admin/adminList?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+"&statusType=${cri.statusType}&idKeyword=${cri.idKeyword}&nameKeyword=${cri.nameKeyword}";
		});
		
		//========= Password 부분 ============
		// 비밀번호 유효성검사 비밀번호의 경우에는 버튼을 누를때마다 변화가 생기도록 하여 keyup event를 활용함.
		$('#pw').keyup(function(){
			var password = document.getElementById("pw").value;
			
			// 길이, 알파벳 
			if(password.length >= 8 && password.length <= 16 
						&& containsCharOnly(password, charPw)){
					
				$('#pwck').html("사용가능한 비밀번호입니다.");
				document.getElementById("pwck").style.color = 'blue';
			}else{
				$('#pwck').html("사용불가능한 비밀번호입니다.");
				document.getElementById("pwck").style.color = 'red';
			}
		});
	});
	
	var charPw = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"; // 비밀번호는 대소문자 구분
	
	// 알파벳 소문자, 숫자로만 이루어졌는지 체크
	function containsCharOnly(input, chars){ // input값이 chars에 있는 값인지를 체크
		console.log(input)
		console.log((input.charAt(2)));
		for(var i=0; i<input.length ; i++)
			if(chars.indexOf(input.charAt(i))==-1)
				return false;
				
		return true;
	}
	
</script>

</body>
</html>