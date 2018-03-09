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
                <td><input type="text" name="name" value="${adminVO.name}" class="form-control"></td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="pw" class="form-control"></td>
            </tr>
            <tr>
                <th>비밀번호 확인</th>
                <td><input type="password" class="form-control"></td>
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
		
		//수정 클릭 시 액션
		$("#modifyBtn").on("click", function(){
			//form 데이터 유효성 검사 추가 필요
			
			formObj.submit();
		});
		
		//목록 클릭 시 액션
		$("#listBtn").on("click", function(){
			self.location = "/admin/adminList?page=${cri.page}&perPageNum=${cri.perPageNum}"
							+"&statusType=${cri.statusType}&idKeyword=${cri.idKeyword}&nameKeyword=${cri.nameKeyword}";
		});
	});
</script>

</body>
</html>