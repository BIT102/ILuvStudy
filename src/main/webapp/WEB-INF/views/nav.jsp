<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE htm>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->

<html class="no-js">
<!--<![endif]-->
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>I Luv Study</title>

<!-- meta -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<!-- stylesheets -->
<link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/assets/css/animate.css">
<link rel="stylesheet" href="/resources/assets/css/owl.carousel.css">
<link rel="stylesheet" href="/resources/assets/css/owl.theme.css">
<link rel="stylesheet" href="/resources/assets/css/style.css">

<!-- fonts for this template -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Kaushan+Script"
	type="text/css">

<!-- scripts -->
<script type="text/javascript"
	src="/resources/assets/js/modernizr.custom.97074.js"></script>

<script type="text/javascript"
	src="/resources/assets/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript"
	src="/resources/assets/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/resources/assets/js/owl.carousel.js"></script>
<script type="text/javascript"
	src="/resources/assets/js/jquery.hoverdir.js"></script>

	
	
<style>
.container-fluid {
	background-color: #f9f9f9;
}
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

.login-container {
	position: relative;
	width: 300px;
	margin: 80px auto;
	padding: 20px 40px 40px;
	text-align: center;
	background: #fff;
	border: 1px solid #ccc;
}

#output {
	position: absolute;
	width: 300px;
	top: -75px;
	left: 0;
	color: #fff;
}

#output.alert-success {
	background: rgb(25, 204, 25);
}

#output.alert-danger {
	background: rgb(228, 105, 105);
}

.login-container::before, .login-container::after {
	content: "";
	position: absolute;
	width: 100%;
	height: 100%;
	top: 3.5px;
	left: 0;
	background: #fff;
	z-index: -1;
	-webkit-transform: rotateZ(4deg);
	-moz-transform: rotateZ(4deg);
	-ms-transform: rotateZ(4deg);
	border: 1px solid #ccc;
}

.login-container::after {
	top: 5px;
	z-index: -2;
	-webkit-transform: rotateZ(-2deg);
	-moz-transform: rotateZ(-2deg);
	-ms-transform: rotateZ(-2deg);
}

.avatar {
	width: 100px;
	height: 100px;
	margin: 10px auto 30px;
	border-radius: 100%;
	border: 2px solid #aaa;
	background-size: cover;
}

.form-box input {
	width: 100%;
	padding: 10px;
	text-align: center;
	height: 40px;
	border: 1px solid #ccc;;
	background: #fafafa;
	transition: 0.2s ease-in-out;
}

.form-box input:focus {
	outline: 0;
	background: #eee;
}

.form-box input[type="text"] {
	border-radius: 5px 5px 0 0;
	text-transform: lowercase;
}

.form-box input[type="password"] {
	border-radius: 0 0 5px 5px;
	border-top: 0;
}

.form-box button.login {
	margin-top: 15px;
	padding: 10px 20px;
}
/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 20px;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}
#googleimg{
	width:30px;
	float:left;
	padding-top:7px;
	margin-left:10px;
}


#chatClick{
	position:fixed;
	bottom:120;
	right:50;
	z-index:999;
	bottom:1.8%;
	right:8%;
    min-width: 56px;
    height: 56px;
    overflow: initial;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    box-sizing: border-box;
    background-color: #00beff;
    border-radius: 28px;
    animation: eLtMsx 0.2s cubic-bezier(0.1,0,0.6,1);
    cursor: pointer;
    width:120px;
}
#chatClick > span{
    display: block;
    font-size: 14px;
    max-width: 300px;
    line-height: normal;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    font-weight: 600;
    color: white;
    cursor: pointer;
}

#chatClick > span > i{
font-size:20px;
font-weight: 800;
}


/* chat */
#chat{
	position:fixed;
	bottom:120;
	right:50;
	z-index:999;
	bottom:1.8%;
	right:9%;
}

.col-md-2, .col-md-10{
    padding:0;
}
.panel{
    margin-bottom: 0px;
}
.chat-window{
    bottom:0;
    position:fixed;
    
    float:right;
    margin-left:10px;
}
.chat-window > div > .panel{
    border-radius: 5px 5px 0 0;
    width:350px;
}
.icon_minim{
    padding:2px 10px;
}
.msg_container_base{
  background: #e5e5e5;
  margin: 0;
  padding: 0 10px 10px;
  max-height:400px;
  overflow-x:hidden;
}
.top-bar {
  background: #666;
  color: white;
  padding: 10px;
  position: relative;
  overflow: hidden;
}
.msg_receive{
    padding-left:0;
    margin-left:0;
}
.msg_sent{
    padding-bottom:20px !important;
    margin-right:0;
}
.messages {
  background: white;
  padding: 10px;
  border-radius: 2px;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
  max-width:100%;
}
.messages {
    font-size: 13px;
  }
.messages > time {
    font-size: 11px;
    color: #ccc;
}
.msg_container {
    padding: 10px;
    overflow: hidden;
    display: flex;
}

.avatar {
    position: relative;
}
.base_receive > .avatar:after {
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    width: 0;
    height: 0;
    border: 5px solid #FFF;
    border-left-color: rgba(0, 0, 0, 0);
    border-bottom-color: rgba(0, 0, 0, 0);
}

.base_sent {
  justify-content: flex-end;
  align-items: flex-end;
}
.base_sent > .avatar:after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    width: 0;
    height: 0;
    border: 5px solid white;
    border-right-color: transparent;
    border-top-color: transparent;
    box-shadow: 1px 1px 2px rgba(black, 0.2); 
}

.msg_sent > time{
    float: right;
}

.msg_container_base::-webkit-scrollbar-track
{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
    background-color: #F5F5F5;
}

.msg_container_base::-webkit-scrollbar
{
    width: 12px;
    background-color: #F5F5F5;
}

.msg_container_base::-webkit-scrollbar-thumb
{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
    background-color: #555;
}

.btn-group.dropup{
    position:fixed;
    left:0px;
    bottom:0;
}
.input-group > textarea {
	padding:5px;
	resize:none;
	height:70px;
	background-color:white;
}   
.input-group > span {
	height:50px;
}   

/*---*CHAT*-----*/
#chat .panel-heading{
    background: #40b4e5;
    background-position: center 30%;
}
#chat .panel-heading, #chat .panel-heading a {
    color:#fff ;
}
#chat .messages{
    box-shadow:none;
    background: #f3f5f9;
    
}
#chat .base_sent .messages{
    background: #40b4e5;
    border-radius: 8px 8px 0px 8px;
    -webkit-border-radius: 8px 8px 0px 8px;
    color: #fff;
    border-bottom:1px solid #40b4e5;
}
#chat .base_sent::after{
    top:0px;
    width: 0;
    height: 0;
    border-top:10px solid transparent;
    border-left: 10px solid #40b4e5;
    
    border-bottom: 0px solid transparent;
    
}
#chat .base_receive .messages{
    background: #EEF1F4;
    border-radius: 0 8px 8px 8px;
    border-bottom:1px solid #EEF1F4;
    color:#516378;
    
}
.msg_receive > time{
	color:#516378;
	font-style: italic;
}
.msg_sent > time{
	color:#fff;
	font-style: italic;
}
#chat .base_receive::before{
    width: 0;
    height: 0;
    border-top: 0px solid transparent;
    border-right: 10px solid #EEF1F4;
    border-bottom: 10px solid transparent;
}

#chat .msg_container_base{
    background:#fff;
}

.chatBlock{
display:block;
}

.chatNone{
display:none;
}

#btn-chat{
	background: #40b4e5;
	border: none;
	height: 44px;
	margin-left: 5px;
}

.msg_container_base{
height:400px;
}

/* 비밀번호 찾기 모달 */
.form-box ul {
	padding: 0px;
}

.findHeader{
    margin: 0 auto;
    font-size: 18px;
    letter-spacing: 0;
    font-weight: 400;
    margin-bottom: 20px;
    border-bottom: 1px dashed #dfdfdf;
    padding-bottom: 14px;
}

.userText-header{
    font-size: 14px;
    font-weight: 500;
    color: #757575;
    letter-spacing: -1px;
}

.userPhone ul li,
.userEmail ul li{
    width: 83%;
    margin: 10px auto;
    text-align: left;
    font-size: 15px;
    letter-spacing: 0;
}

.userPhone li.userText-header::before{
    content: '\0b7';
}

.userPhone ul li.userText-header {
    font-size: 12px;
    font-weight: 400;
    color: #757575;
    letter-spacing: -1px;
    margin-bottom: 0 !important;
    margin-top: 0 !important;
}

#resetPasswordButton{
    border: none;
    font-size: 15px;
    padding: 9px 0;
    width: 60%;
    margin: 30px 0 0 0;
    font-weight: 400;
    background: #00beff;
    border-radius: 5px;
    color: white;
}    

#chatClose{
	float:right;
	cursor:pointer;
	margin-right:10px;
	font-weight: 600;
}
/* [Toast] 결과메시지 */
#toast {
  	visibility: hidden;
    position: fixed;
    width: 300px;
    top: 50px;
    left: 50%;
    margin-left: -150px;
    background-color: rgb(0, 183, 238);
    color: #fff;
    padding: 15px 25px;
    z-index: 100000;
    text-align: center;
    border-radius: 4px;

}
#toast.show {
    visibility: visible;
    -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
    animation: fadein 0.5s, fadeout 0.5s 2.5s;
}
@-webkit-keyframes fadein {
    from {top: 0; opacity: 0;} 
    to {top: 50px; opacity: 1;}
}

@keyframes fadein {
    from {top: 0; opacity: 0;}
    to {top: 50px; opacity: 1;}
}

@-webkit-keyframes fadeout {
    from {top: 50px; opacity: 1;} 
    to {top: 0; opacity: 0;}
}

@keyframes fadeout {
    from {top: 50px; opacity: 1;}
    to {top: 0; opacity: 0;}
}

/* top 버튼 */
#toTop { 
	position: fixed; /* 포지션 고정 */ 
	cursor:pointer;
	bottom: 50px; /* 밑에서 100px */ 
	display: none; /* 보여지지 없음 - 기본적으로 안보여지게 */ 
	z-index: 9999; /* 포지션을 먼저 지정후 z-좌표(레이어) : 9999입니다. */
	right:50px;
	bottom:2%;
	right:2%;
	background:#00beff;
	color:white;
	-webkit-border-radius: 50%;
    border-radius: 50%;
    width:50px;
    height:50px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
a#toTop{
	font-weight: 600;
    letter-spacing: 2px;
    font-size: 16px;
    text-transform: uppercase;
    text-align: center;
    line-height: 0.8;
    padding-left: 2px;
    padding-top: 7.5px;
    text-decoration:none;
}


</style>

</head>
<body>



	<!-- site-navigation start -->
	<nav id="mainNavigation" class="navbar navbar-dafault main-navigation"
		role="navigation">
		<div class="container" style="width:80%"> 

			<div class="navbar-header">

				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#main-nav-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<!-- navbar logo -->
				<div class="navbar-brand">
					<span class="sr-only">Avada Pro Agency</span> <a href="/study/main">
						<div class="img-responsive center-block"
							style="font-family: 'Kaushan Script', 'Helvetica Neue', Helvetica, Arial, cursive; font-size: 27px;">
							<strong>I luv<br> Study
							</strong>
						</div>
					</a>
				</div>
				<!-- navbar logo -->

			</div>
			<!-- /.navbar-header -->

<% request.setCharacterEncoding("euc-kr");%>
<% 
Cookie[] cookies = request.getCookies(); //쿠키 정보 가져온다

String name="";
String value="";
String useCookie="";
String loginSession = "";

if(cookies != null){
	for(int i=0; i < cookies.length; i++){
		Cookie c = cookies[i];
         
    	if(c.getName().equals("rememberId")){ //쿠키 이름이 rememberId인 경우
 		// 저장된 쿠키 이름을 가져온다
			name = c.getName();
    	// 쿠키값을 가져온다
			value = c.getValue();
    	}
    
    	if(c.getName().equals("loginCookie")){
    		useCookie = c.getName();
    	}
	}
}

if(session.getAttribute("login") != null){
	loginSession = "test";	
} 

%>
			<!-- 로그인 모달 -->
			<div id="id01" class="modal">
				<div class="container">
					<div class="login-container">
						<div id="output"></div>
						<span
							onclick="document.getElementById('id01').style.display='none'"
							class="close" title="Close Modal">&times;</span>
						<div class="avatar" style="background-image: url(/resources/assets/img/login.png);"></div>
						<div class="form-box">
							<form action="/loginPost" method="post" class="form login">
								<input name="id" type="text" placeholder="아이디" required value="<%=value %>">
								<input type="password" name="pw" placeholder="비밀번호" required>

								<!-- 3월 25일 머지 주석 처리 	-->
								<!-- <input name="email" type="text" placeholder="username"> 
								<input type="password" name="password" placeho2lder="password"> -->
								<div class="btttt">
								<button class="btn btn-info btn-block login" type="submit" style="margin-bottom:9px;">로그인</button>
							
			<!-- ======== 구글 로그인 api========== -->
								<img id="googleimg" src="/resources/img/google.png">
								<a class="btn btn-block login"  href="../googleLogin" style="background-color:white; color:black;">구글 로그인&nbsp;&nbsp;&nbsp;</a>
								<!-- ===========카카오톡 ================-->
			<!-- ======== end ================= -->
								</div>
								<div class="texttext" style="margin-top: 15px;">
									<input type="checkbox" name="rememberId" value="1" 
										style="width: 20px; vertical-align: middle; margin: 0;"
										id="ida" <%if(name != ""){ %> checked = "checked" <%} %> >
										<label for="idaa"tyle="vertical-align: middle; margin: 0;" >&nbsp;아이디 저장</label><br>
								</div>
								<div class="texttext">
									<input type="checkbox" name="useCookies"
										style="width: 20px; vertical-align: middle; margin: 0;"
										id="idb">
										<label for="idbb" style="vertical-align: middle; margin: 0;">&nbsp;자동 로그인</label>
								</div>
								<br>
								<span onclick="document.getElementById('searchpw').style.display='block'" style="cursor:pointer;" id="pw-model">비밀번호를 잊으셨나요?</span>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 비밀번호 재설정 모달 -->
			<div id="searchpw" class="modal">
				<div class="container">
					<div class="login-container" style="width:450px;">
						<div id="output"></div>
					<div class="modal-header" style="border:white">
                    	<span
							onclick="document.getElementById('searchpw').style.display='none'"
							class="close" title="Close Modal">&times;</span>
                    </div>	
                    <div class="findUser-modalBody form-box">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding:0px;">
                                <div class="findPassword-wrap">
                                    <div id="findUserForm">
                                        <div class="findPassword-head">

                                            <div class="findHeader">
                                                <span style="padding-bottom: 3px;">비밀번호 재설정</span>
                                            </div>

                                        </div>
                                        <div class="findPassword-body">
                                            <div class="userEmail">
                                                <ul>
                                                    <li class="userText-header">이메일</li>
                                                    <li class="userText">
                                                        <input id="find_Email" type="text" name="resetUserEmail" placeholder="example@domain.com" />
                                                    </li>
                                                </ul>
                                            </div>
                                            <div>
                                                <ul>
                                                    <li class="userText-header">가입 시 기재했던 이메일 주소를 입력해주세요.</li>
                                                    <li class="userText-header">헤당 이메일 주소로 비밀번호 재설정 메일이 전송됩니다.</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="findPassword-foot">
                                            <input type="hidden" name="senderType" value="passReset" />
                                            <input type="button" id="resetPasswordButton"  onclick="searchPW_click();" value="비밀번호 재설정">
                                            <!-- <button type="button" id="resetPasswordButton" class="btn btn-white" onclick="searchPW_click();">비밀번호 재설정</button> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
					</div>
				</div>
			</div>
			
			<!-- 비밀번호 재설정 이메일 전송완료 스낵바 -->
			<div id="toast"></div>

			<!-- nav links -->
			<div class="collapse navbar-collapse" id="main-nav-collapse">
				<ul class="nav navbar-nav navbar-right text-uppercase">

				 <%-- 	<c:choose>
						<c:when test="${login eq null}">
							<li><a><span
									onclick="document.getElementById('id01').style.display='block'"
									style="width: auto;">로그인</span></a></li>
							<li class="dropdown"><a href="/join"><span>회원가입</span></a></li>
						</c:when>
						<c:otherwise>
							<li class="dropdown"><a href="/profile"><span>마이페이지</span></a></li>
							<!-- end of /.dropdown -->
							<li class="dropdown"><a href="/logout"><span>로그아웃</span></a>
							</li>
							<li class="dropdown"><a href="/study/register">스터디 등록하기</a>
						</c:otherwise>
					</c:choose>  --%>
					
					<% if(useCookie == "" && loginSession == "" ){ %>
							<li style="cursor:pointer;"><a><span
									onclick="document.getElementById('id01').style.display='block'"
									style="width: auto; cursor:pointer;">로그인</span></a></li>
							<li class="dropdown"><a href="/join"><span>회원가입</span></a></li>
					<% }else{ %>
							<li class="dropdown"><a href="/profile"><span>마이페이지</span></a></li>
							<!-- end of /.dropdown -->
							<li class="dropdown"><a href="/logout"><span>로그아웃</span></a>
							</li>
							<li class="dropdown"><a href="/study/register">스터디 등록하기</a>
					<%} %> 
					
					<li class="dropdown"><a href="/study/listAll?page=1&perPageNum=9&pallType=a"><span>스터디 구경하기</span></a></li>
					<li class="dropdown"><a href="/sqna/list"><span>자주 묻는 질문</span></a>
					</li>
					<li class="dropdown"><a href="/study/notice"><span>공지사항</span></a>
					</li>
				</ul>
			</div>
			<!-- nav links -->

		 </div> 
		<!-- /.container -->
	</nav>
	<!-- site-navigation end -->


<c:if test="${login ne null}">
<!-- =============== 문의 채팅 시작 ====================== -->
<%-- <jsp:include page="/WEB-INF/views/chatting/chatAdmin22.jsp" flush="false" /> --%>
<div id="chatClick"><span><i class="fa fa-commenting-o"></i>  고객센터</span></div> 

<div class="chatNone" id="chat">      
    <div class="row chat-window col-xs-5 col-md-3" id="chat_window_1" style="margin-left:10px;padding:0px;">
        <div class="col-xs-12 col-md-12" style="padding:0px;">
         	<div class="panel panel-default" style="margin-bottom:0px;">
                <div class="panel-heading top-bar">
                	<div style="display:inline;">
                		<h4 class="panel-title" style="display:inline;"><span class="glyphicon glyphicon-comment"></span>&nbsp;고객센터</h4>
                		<span id="chatClose">x</span>
                	</div>
            	</div>
            	<!--조정인♥박영원  -->
            	
            	<!-- 내용이당 -->
            	<div class="panel-body msg_container_base">
          <!-- ===========예전 내용 가져온당 ============ -->  		
            	
          <!--========== 다 가져왓땅 =============-->  
                </div>
                <!-- 내용끝났땅 -->
                
                <!-- 메시지 작성부분이당=== -->
                <div class="panel-footer">
                    <div class="input-group">
<!--                         <input id="btn-input" type="text" class="form-control input-sm chat_input" /> -->
                        <textarea id="btn-input" class="form-control input-sm chat_input"></textarea>
                        <span class="input-group-btn">
                        <button class="btn btn-primary btn-sm" id="btn-chat">전송</button>
                        </span>
                    </div>
                </div>
			</div>
		</div>
	</div>
</div>

<!-- =============== 문의 채팅 끝 ======================  -->
</c:if>

<!-- top 버튼 -->
<a id="toTop" href="#"><i class="fa fa-sort-up"></i>TOP</a>

<script src="/resources/js/sockjs.js"></script>
<script src="/resources/js/sockjs.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script>


//Get the modal
var modal = document.getElementById('id01');
var pwmodal = document.getElementById('searchpw');
var snackbar = document.getElementById('toast');
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
    
    if (event.target == pwmodal) {
    	pwmodal.style.display = "none";
    }
}


var sock = null;
var message = {};

$(document).ready(function(){
	
	
	//웹 소켓을 지정한 url로 연결
	sock = new SockJS("/chat");
	
	//웹 소켓이 열리면 호출
	sock.onopen = function(){
		/* message = {};
		message.message = "접속하였습니다.";
		message.type="all";
		message.receiver = "all";
		message.email = "${login.email}";
		
		//메시지 전송
		sock.send(JSON.stringify(message)); */
	}
	
	//메시지가 도착하면 호출
	sock.onmessage = function(evt){
		$('.msg_container_base').append(evt.data + "<br/>");
		$('.msg_container_base').scrollTop(9999);
	}
	
	//웹 소켓이 닫히면 호출
	sock.onclose = function(){
		//메시지 전송
		sock.send('채팅을 종료합니다.');
	}
	
	$("#btn-input").keydown(function (key) {
        if (key.keyCode == 13) {
           $("#btn-chat").click();
        }
    });

	$('#btn-chat').click(function(){
		
		if($('#btn-input').val() != ""){
			
			message = {};
			message.message = $('#btn-input').val();
			message.type = "to";
			message.receiver = "admin";
			message.email = "${login.email}";
			
			var time = new Date();
			
			//메시지 전송
			sock.send(JSON.stringify(message));
			
			$('.msg_container_base').append(
					'<div class="row msg_container base_sent"> <div class="col-md-10 col-xs-10" style="padding:0;"><div class="messages msg_sent">'
					+  $('#btn-input').val() +'<br><time>' + time.getHours() + ":" + time.getMinutes() +'</time></div></div></div>');
			$('#btn-input').val("");
			$('.msg_container_base').scrollTop(9999);
		}
	});
	
	//채팅 아이콘 클릭 시 액션
	$('#chatClick').click(function(){
		//채팅창이 안보이는 경우
		if($('#chat').hasClass('chatNone')){
			$('.msg_container_base').html("");  //불러온 메시지 삭제
			$('#chat').removeClass('chatNone');  //채팅창 안보이도록 처리한 클래스 삭제
			$('#chat').addClass('chatBlock');	//채팅창 보이도록 처리한 클래스 추가
			
			//ajax로 채팅 내용 불러옴
			$.ajax({ 
				type:'POST',
				url:'/chatting/chatAdmin22',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"}, 
				dataType:'json',
				data:JSON.stringify({
					
				}),
				success:function(result){ 
					console.log("데려왔따");
					console.log(result);
					
					console.log(result[0].msgRegist);
					
					var message = "";
					
					//채팅창에 내용 추가
					for(var i=0;i<result.length;i++){
						if(result[i].email == "admin"){
							message = "<div class='row msg_container base_receive'><div class='col-md-10 col-xs-10' style='padding:0;'><div class='messages msg_receive'>"
								+ result[i].message + "<br><time>"
								+ result[i].msgRegist + "</time></div></div></div>";
							$('.msg_container_base').append(message);
						}else{
							message = "<div class='row msg_container base_sent'><div class='col-md-10 col-xs-10' style='padding:0;'><div class='messages msg_sent'>"
								+ result[i].message + "<br><time>"
								+ result[i].msgRegist + "</time></div></div></div>";
							$('.msg_container_base').append(message);
						}
						
						$('.msg_container_base').scrollTop(9999); //채팅창 스크롤 가장 아래로 내림
					}
				}
			}); //$.ajax 끝
		}else{
			$('#chat').removeClass('chatBlock');
			$('#chat').addClass('chatNone');	
		}
	});
	
	$('#chatClose').click(function(){
		$('#chat').removeClass('chatBlock');
		$('#chat').addClass('chatNone');	
	});
})

//비밀번호 찾기 클릭 시 로그인 모달 안보이도록 처리
$(document).on('click', '#pw-model', function(){
	modal.style.display = "none";
});

//비밀번호 재설정 클릭 시
function searchPW_click(){

	//ajax 통신
	$.ajax({ 
		url:'/forgotPassword',
		contentType: 'application/json',
		method: 'POST',
		data:JSON.stringify(
			$('#find_Email').val()
		),  
		success:function(result){ 
			console.log("데려왔따");
			console.log(result);
			pwmodal.style.display = "none";	//모달창 안보이도록 처리
			
			//결과값 1인 경우 정상 처리, 0인 경우 사용자가 입력한 이메일이 가입되어 있지 않을때
			if(result == 1){
				$('#toast').html('<em class="fa fa-check"></em> 전송완료!'); 
				$('#toast').css('background-color', 'rgb(0, 183, 238)');
				viewSnackbar(); //스낵바 띄움
			}else{
				$('#toast').html('<em class="fa fa-times"></em> 일치하는 이메일이 없습니다.'); 
				$('#toast').css('background-color', 'rgb(255, 110, 110)');
				viewSnackbar(); //스낵바 띄움
			}
		}
	}); //$.ajax 끝
}

//스낵바 띄우는 메서드
function viewSnackbar(){
	snackbar.className = "show"; //스낵바 띄움
	setTimeout(function(){ snackbar.className = snackbar.className.replace("show", ""); }, 3000);
}

$(document).on('focus', '.panel-footer input.chat_input', function (e) {
    var $this = $(this);
    if ($('#minim_chat_window').hasClass('panel-collapsed')) {
        $this.parents('.panel').find('.panel-body').slideDown();
        $('#minim_chat_window').removeClass('panel-collapsed');
        $('#minim_chat_window').removeClass('glyphicon-plus').addClass('glyphicon-minus');
    }
});
$(document).on('click', '#new_chat', function (e) {
    var size = $( ".chat-window:last-child" ).css("margin-left");
     size_total = parseInt(size) + 400;
    alert(size_total);
    var clone = $( "#chat_window_1" ).clone().appendTo( ".container" );
    clone.css("margin-left", size_total);
});

//top 버튼
$(function() { 
	// 보이기 | 숨기기
	$(window).scroll(function() { 
		if ($(this).scrollTop() > 250) { //250 넘으면 버튼이 보여짐니다. 
			$('#toTop').fadeIn(); 
			//$('#toTop').css('left', $('#sidebar').offset().left); // #sidebar left:0 죄표
		} else { 
			$('#toTop').fadeOut(); 
		} 
	}); // 버튼 클릭시
	
	$("#toTop").click(function() { 
		$('html, body').animate({ 
			scrollTop : 0 // 0 까지 animation 이동합니다. 
		}, 400); // 속도 400 
		
		return false; 
	}); 
});



</script>

</body>
</html>