<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청 스터디</title>
<style>
	.border{border:2px solid grey; }
    .basic{width:300px; height:50px; float:left; text-align: center;}
    
    .profile{width:150px; height:50px;}
   
    #div1{display:inline-block;}    
    #div2{text-align: center;}
    #div2 div{float:left; }
    body{height:800px; width:700px;}
    body > div > p3 {text-align:left; font-size:30px; border-bottom:2px solid grey;  }

    #pfimage{  width:600px; height:50px; display:inline-block;
         }
    #acinfo{ width:600px; height:300px; display:inline-block;
        }
    
    #actable{font-size:20px; margin-top:10px;}
    
    
    .fileDrop{
	width: 150px;
	height: 100px;
	border: 1px dotted blue;
	}

	small{
	margin-left: 3px;
	font-weight: bold;
	color: gray;
	}
    
</style> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>프로필</title>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> --> 
<link rel="stylesheet" href="/resources/css/join.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
	$(document).ready(function(){
		alert("${result}");
	})
</script>
</head>


<body> 	


	<!-- <form name="profileForm" action="/profile" method="post" enctype="multipart/form-data"> -->

	<!-- 상단 메뉴바 -->
     <div id="div1"> 
        <div class="basic border"/>
            <a href="profile">기본정보 관리</a>
        </div>
    
        <div class="basic border"/>
            <a href="bookmark">스터디 관리</a>
        </div>
       </div>

   <div id="div2">
    <div class="profile border">
            <a href="profile">프로필</a></div>
    <div class="profile border">
            <a href="addInfo">부가 정보</a></div>
    <div class="profile border">
            <a href="changePw">비밀번호 변경</a></div>
    <div class="profile border">
            <a href="quit">회원탈퇴</a></div>
   </div>


	
<!-- 개인 프로필 정보 보기 &수정 -->
<div class="container">
	<div class="row">
    <div class="col-md-8">
      <section>      
        <h1 class="entry-title"><span>계정 정보</span> </h1>
        <hr>
            <form class="form-horizontal" role="form" action="/profile" method="post" name="profileForm" id="profileForm" enctype="multipart/form-data" >
                 
       <div class="form-group">
          <label class="control-label col-sm-3">프로필 사진<br>
          <small>(optional)</small></label>
          <div class="col-md-5 col-sm-8">
            <div class="input-group"> <span class="input-group-addon" id="file_upload"><i class="glyphicon glyphicon-upload"></i></span>
              <input type="file" name="file_nm" id="file_nm" class="form-control upload" style="width:100%" placeholder="" aria-describedby="file_upload">
            </div>
          </div>
       </div>             
       <div class="form-group">
          <label class="control-label col-sm-3">이메일 ID <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
              <div class="input-group idgroup">
              <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
              <input type="email" class="form-control col" name=email id="email" placeholder="아이디를 입력하세요." value="${login.email}" style="width: 100%" required readonly>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">이름 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <input type="text" class="form-control" name="name" id="name" placeholder="실명을 입력하세요." value="${vo.name}" required>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">닉네임 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <input type="text" class="form-control" name="nickName" id="nickName" placeholder="닉네임을 입력하세요." value="${vo.nickName}" required>
            <input type="button" value="중복 확인" id="nickCheck" class="btn btn-primary">
          </div>
        </div>
        <script>
		    $(document).ready(function(){
		        $("#nickCheck").click(function(){

		        	$.ajax({
		        		url : "/nickCheck",
		        		type : "post",
		        		headers : {
		        			"X-HTTP-Method-Override" : "POST"
		        		},
		        		data:{
		        			nickName : document.getElementById("nickName").value // id가 nickCheck인 value값(중복확인)을 가지고 오겠다.
		        		},
		        		success:function(result){
		        		alert(result);
		        	}
		        	
		        	})	 
		        	 
		        });
		    });
	    </script>
        <div class="form-group">
          <label class="control-label col-sm-3">생년월일 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <input type="text" class="form-control" name="birth" id="birth" pattern="[0-9]{6}" title="생년월일 6자리를 입력해주세요." placeholder="생년월일을 입력해주세요. ex) 850401" value="${vo.birth}" required>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">성별 <span class="text-danger">*</span></label>
          <div class="col-md-8 col-sm-9">
            <label>
            <input type="radio" id="userWoman" name="gender" value="1"  <c:if test="${vo.gender eq '1'}">checked</c:if>> 남성 </label>   
            <label>
            <input type="radio" id="userWoman" name="gender" value="2"  <c:if test="${vo.gender eq '2'}">checked</c:if>> 여성  </label>
          </div>
        </div>
        <div class="form-group">
          <label class="control-label col-sm-3">핸드폰 번호 <span class="text-danger">*</span></label>
          <div class="col-md-5 col-sm-8">
          	<div class="input-group">
              <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
            <!-- <input type="text" class="form-control" name="phoneNum1" id="phoneNum1" placeholder="010" value="" pattern="[0-9]{3}" title="숫자 3자리를 입력해주세요." required>
            <input type="text" class="form-control" name="phoneNum2" id="phoneNum2" placeholder="1234" value="" pattern="[0-9]{3,4}" title="숫자 3~4자리를 입력해주세요." required>
            <input type="text" class="form-control" name="phoneNum3" id="phoneNum3" placeholder="5678" value="" pattern="[0-9]{4}" title="숫자 4자리를 입력해주세요." required>
            <input type="text" class="form-control" name="phoneNum" style="position: absolute; visibility: hidden;" id="phoneNum" placeholder="Enter your Primary contact no." value=""> -->
            <input type="text" class="form-control" name="phoneNum" id="phone" placeholder="전화번호를 입력해주세요." value="${vo.phoneNum}" pattern="[0-9]{10,11}" title="핸드폰 번호를 입력해주세요." style="width: 100%" required>
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="col-xs-offset-3 col-xs-10">
            <input name="Submit" type="submit" value="저장하기" class="btn btn-primary">
          </div>
        </div>
      </form>
    </div>
</div>
</div>
</body>


</html>