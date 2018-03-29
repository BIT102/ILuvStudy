<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신청 스터디</title>
<style>

 .column1{float:left; width:50%;}
 .column2{float:none; width:auto; overflow:hidden;}
 .profile{min-height:185px; padding-left: 5px; margin:25px;}
 .border{border:1px solid grey; border-radius:5px;}
 .border h3{margin-top:5px;}
 

</style>

</head>


<body>
	<!-- // Navigation -->
<%@include file="../nav.jsp"%>
<!-- header begin -->
<div id="about-page">
            <header class="page-head">
                <div class="header-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">


                                <ol class="breadcrumb">
                                    <li><a href="/study/main">Home</a></li>
                                    <li class="active">Profile</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->
</div>


		<!-- 상단 메뉴바 -->
		<div id="div1">
			<div class="basic border">
				<a href="profile">기본정보 관리</a>
			</div>

			<div class="basic border">
				<a href="bookmark">스터디 관리</a>
			</div>
		</div>

			<div class="container">
				<div id="content">
					
	<form name="profileForm" method="post">
					<div class="column1">
						<div class="profile border">
							<!-- 프로필 사진 -->
							<h3><a href="profile">프로필 사진</a></h3>
							
							<div id="pfimage">
								
								<p>
									회원님의 정면 사진을 올려주세요! <br> 상대방이 신뢰를 갖고 연락 할 확률이 높아져요!
								</p>
								<input type='file' name='file' value=${login.photo } /> <input
								type="submit" value="사진업로드">
							</div>
							
						</div>
						<div class="profile border">
							<h3><a href="profile">계정 정보</a></h3>
							<!-- 개인 프로필 정보 보기 &수정 -->
							<div id="acinfo">
								
								<table id="actable">
									<tr>
										<td><label for="email">이메일</label></td>
										<td><input id="email" type="email" value="${login.email}"
											readonly name="email"></td>
									</tr>
									<tr>
										<td><label for="name">이름</label></td>
										<td><input id="name" type="text" value="${vo.name}"
											name="name"></td>
									</tr>
									<tr>
										<td><label for="nickname">닉네임</label></td>
										<td><input id="nickname" type="text" value="${vo.nickName}"
											name="nickName"></td>
										<td><input type="button" value="중복확인"></input></td>
									</tr>
									<tr>
										<td><label for="birth">생년월일</label></td>
										<td><input id="birth" type="text" value="${vo.birth}"
											name="birth"></td>
									</tr>
									<tr>
										<td>성별</td>
										<td><input type="radio" id="userMan" name="gender" value="1"
											<%if("1".equals(request.getParameter("gender"))){System.out.println("sss");}else{System.out.println(request.getParameter("gender"));} %>>
											남성</td>
										<script>
					                	console.log("sss")
					                	console.log(<% request.getParameter("gender"); %>);
					                	console.log("${gender}");
					                </script>
										<td><input type="radio" id="userWoman" name="gender" value="2"
											<c:if test="${vo.gender eq '2'}">checked</c:if>> 여성</td>
									</tr>
									<tr>
										<td><label for="phone">전화번호</label></td>
										<td><input id="phone" type="text" value="${vo.phoneNum}"
											name="phoneNum"></td>
										<td><input type="button" value="인증하기"></input></td>
									</tr>
								</table>
							</div>
							<div>
								<input type="submit" value="저장하기">
							</div>
						</div>
					</div>
				</form>
					<div class="column2">
						<div class="profile border">
							<h3><a href="addInfo">부가정보</a></h3>
							
							<form name="addInfoForm" action="/addInfo" method="post">

								<!-- 부가정보  -->
								<p>관심 카테고리</p>
						
								<!-- 카테고리 대/소분류 메소드 -->
							
						
								<br> <br>
						
								<p>관심 지역</p>
								<!--대분류  -->
								<select name="RGD">
									<option value="서울">서울</option>
									<option value="경기">경기</option>
									<option value="강원">강원</option>
								</select>
						
								<!--소분류  -->
								<select name="RGS">
									<option value="강남구">강남구</option>
									<option value="서초구">서초구</option>
									<option value="광진구">광진구</option>
								</select>
						
						
								<h3>자기소개</h3>
								<textarea row="5" cols="50" name="introduction">${vo.introduction}</textarea>
						
								<h3>홈페이지</h3>
								<input type="url" name="homepage" value="${vo.homepage}"> <br>
						
						
								<input type="hidden" value="${login.email}" name="email" readonly>
						
								<div>
									<a class="btn-black" href="addInfo">수정하기</a>
								</div>
						
							</form>
							
						</div>
						<div class="profile border">
							<h3><a href="changePw">회원탈퇴&비밀번호 변경</a></h3>
							
							<div id="acinfo">
						        
						        <table id="actable">
						            <tr>
						                <td><label for="nowPw">기존 비밀번호</label></td>
						                <td><input id="nowPw" type="password" name="nowPw"></td>
						              
						                	
						            </tr>
						            <tr>
						                <td><label for="newPw1">새 비밀번호</label></td>
						                <td><input id="newPw1" type="password" name="newPw1" placeholder="8자리에서 20자리 이하 영문, 숫자로만 설정해 주세요."></td>
						            </tr>
						            <tr>
						                <td><label for="newPw2">비밀번호 확인</label></td>
						                <td><input id="newPw2" type="password" name="newPw2" placeholder="비밀번호를 한번 더 입력해주세요." ></td>
						             
						        </table>
						        <input type="hidden" value="${login.email}" name="email" readonly> 
						   </div>
						<div>
						   <input class="changePw" type="button" value="변경하기">
						</div>
						
						<!-- 탈퇴하기  -->
						 <form name="quitForm" action="/quit" method="post">
						
						<input type="submit" value="탈퇴하기">
						<input type="hidden" value="${login.email}" name="email" readonly> 
					
						</form>
							
							<script>
							
							$(".changePw").on("click", function(){
								
								var nowPw = $('#nowPw').val();			//화면에서 입력된 내용은 변수 처리
								var newPw1 = $('#newPw1').val();
								var newPw2 = $('#newPw2').val();
								
								
								console.log(nowPw);
								console.log(newPw1);
								console.log(newPw2);
								
								$.ajax({
									url: '/changePw',
									type: 'POST',
									header:{
										"X-HTTP-Method-Override" : "POST"
									},
									data:{ 	nowPw : nowPw,
											newPw1 : newPw1, // 앞에는 컨트롤러에서 가져다 쓸 이름이고 뒤에는 값임!!
											newPw2 : newPw2		
									},
									success : function(result){ //alert으로 result값을 하면 컨트롤에서 ""안에 쓴 값이 뜸
									alert(result);
									}
								})
							})
							
							</script>
						</div>
					</div>
					
				</div>
			</div>


<%@include file="../footer.jsp"%>



</body>


</html>