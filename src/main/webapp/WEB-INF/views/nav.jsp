<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE htm>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>I Luv Study</title>
<!-- Bootstrap tag -->
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="/resources/bootstrap/css/font-awesom.css">


<!------ Include the above in your HEAD tag ---------->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<style>
/* 
Inspired by http://dribbble.com/shots/890759-Ui-Kit-Metro/attachments/97174
*/
*, *:before, *:after {
  /* Chrome 9-, Safari 5-, iOS 4.2-, Android 3-, Blackberry 7- */
  -webkit-box-sizing: border-box; 

  /* Firefox (desktop or Android) 28- */
  -moz-box-sizing: border-box;

  /* Firefox 29+, IE 8+, Chrome 10+, Safari 5.1+, Opera 9.5+, iOS 5+, Opera Mini Anything, Blackberry 10+, Android 4+ */
  box-sizing: border-box;
}
body {
    text-align: center;
    padding-top: 50px;
}

  
.btn-nav {
	color:white;
	background-color:transparent;
    border: none;
    -webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
    -moz-box-sizing: border-box;    /* Firefox, other Gecko */
    box-sizing: border-box;         /* Opera/IE 8+ */
}
.btn-nav:hover {
    color: #e92d00;
    cursor: pointer;
    -webkit-transition: color 1s; /* For Safari 3.1 to 6.0 */
    transition: color 1s;
    border-top: 6px solid #fc0c63;
	border-bottom: 6px solid #fc0c63;
}

.btn-nav.active {
    color: #e92d00;
    padding: 2px;
    border-left: 0;
    border-right: 0;
    box-sizing:border-box;
    -moz-box-sizing:border-box;
    -webkit-box-sizing:border-box;
    -webkit-transition: border 0.3s ease-out, color 0.3s ease 0.5s;
    -moz-transition: border 0.3s ease-out, color 0.3s ease 0.5s;
    -ms-transition: border 0.3s ease-out, color 0.3s ease 0.5s; /* IE10 is actually unprefixed */
    -o-transition: border 0.3s ease-out, color 0.3s ease 0.5s;
    transition: border 0.3s ease-out, color 0.3s ease 0.5s;
    -webkit-animation: pulsate 1.2s linear infinite;
    animation: pulsate 1.2s linear infinite;
}
 .btn-nav.active:before {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 6px 6px 0;
	border-color: #e92d00 transparent;
	display: block;
	width: 0;
	z-index: 1;
	margin-left: -6px;
	top: 0;
	left: 50%;
} 

.btn-nav .glyphicon {
    padding-top: 16px;
	font-size: 40px;
}
.btn-nav.active p {
    margin-bottom: 8px;
}
@-webkit-keyframes pulsate {
 50% { color: #000; }
}
@keyframes pulsate {
 50% { color: #000; }
}
@media (max-width: 480px) {
    .btn-group {
        display: block !important;
        float: none !important;
        width: 100% !important;
        max-width: 100% !important;
    }
}
@media (max-width: 600px) {
    .btn-nav .glyphicon {
        padding-top: 12px;
        font-size: 26px;
    }
}


.align {
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  -webkit-box-pack: center;
 -ms-flex-pack: center;
  justify-content: center;
}

/* helpers/grid.css */

.grid {
  margin-top: 200px;
  margin-left: auto;
  margin-right: auto;
  max-width: 320px;
  max-width: 20rem;
  width: 90%;
  border:2px solid #262626;
  padding: 30px;
}

/* helpers/hidden.css */

.hidden {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;
}

/* helpers/icon.css */

.icons {
  display: none;
}

.icon {
  display: inline-block;
  fill: #606468;
  font-size: 16px;
  font-size: 1rem;
  height: 1em;
  vertical-align: middle;
  width: 1em;
}

/* layout/base.css */

* {
  box-sizing: inherit;
}

html {
  box-sizing: border-box;
  font-size: 100%;
  height: 100%;
}

.grid a {
  color: #eee;
  outline: 0;
  text-decoration: none;
}

.gird a:focus,
.grid a:hover {
  text-decoration: underline;
}

/* modules/form.css */

.grid input {
  background-image: none;
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: background-color 0.3s;
          transition: background-color 0.3s;
}

.grid input[type='submit'] {
  cursor: pointer;
}

.form {
  margin: -14px;
  margin: -0.875rem;
}

.form input[type='password'],
.form input[type='text'],
.form input[type='submit'] {
  width: 100%;
}

.form__field {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  margin: 14px;
  margin: 0.875rem;
}

.form__input {
  -webkit-box-flex: 1;
      -ms-flex: 1;
          flex: 1;
}

/* modules/login.css */

.login {
  color: #eee;
}

.login label,
.login input[type='text'],
.login input[type='password'],
.login input[type='submit'] {
  border-radius: 0.25rem;
  padding: 16px;
  padding: 1rem;
}

.login label {
  background-color: #363b41;
  border-bottom-right-radius: 0;
  border-top-right-radius: 0;
  padding-left: 20px;
  padding-left: 1.25rem;
  padding-right: 20px;
  padding-right: 1.25rem;
}

.login input[type='password'],
.login input[type='text'] {
  background-color: #3b4148;
  border-bottom-left-radius: 0;
  border-top-left-radius: 0;
}

.login input[type='password']:focus,
.login input[type='password']:hover,
.login input[type='text']:focus,
.login input[type='text']:hover {
  background-color: #434a52;
}

.login input[type='submit'] {
  background-color: #ea4c88;
  color: #eee;
  font-weight: 700;
  text-transform: uppercase;
}

.login input[type='submit']:focus,
.login input[type='submit']:hover {
  background-color: #d44179;
}

/* modules/text.css */



.text--center {
  text-align: center;
    margin-bottom: 24px;
  margin-bottom: 1.5rem;
  margin-top: 24px;
  margin-top: 1.5rem;
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
    background-color: #efefef; /* Fallback color */
    background-color: rgba(192,192,192,0.5); /* Black w/ opacity */
    padding-top: 60px;
}


</style>

</head>
<body>


<div class="container">
    <div class="row">
    
		<div class="btn-group btn-group-justified">
            <div class="btn-group">
            <a href="/study/main">
                <button type="button" class="btn btn-nav">
                    <span class="glyphicon glyphicon-home"></span>
    			    <p>HOME</p>
                </button>
             </a> 
            </div>
            
            <div class="btn-group">
                <button type="button" class="btn btn-nav" onclick="document.getElementById('id01').style.display='block'">
                    <span class="glyphicon glyphicon-log-in"></span>
    			    <p>로그인</p>
                </button>
            </div>
            <div class="btn-group">
            <a href="/join">
                <button type="button" class="btn btn-nav">
                    <span class="glyphicon glyphicon-user"></span>
    			    <p>회원가입</p>
                </button>
            </a>    
            </div>
            <div class="btn-group">
            <a href="/study/listAll">
                <button type="button" class="btn btn-nav">
                    <span class="glyphicon glyphicon-eye-open"></span>
    			    <p>스터디 구경하기</p>
                </button>
            </a> 
            </div>
            <div class="btn-group">
            <a href="/study/register1">
                <button type="button" class="btn btn-nav">
                    <span class="glyphicon glyphicon-shopping-cart"></span>
    			    <p>스터디등록</p>
                </button>
            </a>    
            </div>
            <div class="btn-group">
            <a href="/sqna/list">
                <button type="button" class="btn btn-nav">
                    <span class="glyphicon glyphicon-comment"></span>
    			    <p>FAQ</p>
                </button>
            </a>    
            </div>
            <div class="btn-group">
            <a href="/study/notice">
                <button type="button" class="btn btn-nav">
                    <span class="glyphicon glyphicon-bell"></span>
    			    <p>공지사항</p>
                </button>
             </a> 
            </div>
        </div>
	</div>
</div>

<div id="id01" class="modal">

    <div class="grid">

      <form action="https://httpbin.org/post" method="POST" class="form login">

    <div class="imgcontainer">
      <img src="img_avatar2.png" alt="Avatar" class="avatar">
    </div>
    
        <div class="form__field">
          <label for="login__username" style="height:53px;"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user"></use></svg><span class="hidden">Username</span></label>
          <input id="login__username" type="text" name="username" class="form__input" placeholder="Username" style="height:53px;" required>
        </div>

        <div class="form__field">
          <label for="login__password" style="height:53px;"><svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#lock"></use></svg><span class="hidden">Password</span></label>
          <input id="login__password" type="password" name="password" class="form__input" placeholder="Password" style="height:53px;" required >
        </div>

        <div class="form__field">
          <input type="submit" value="Sign In">
        </div>

      </form>

      <p class="text--center">Not a member? <a href="#" style="color:black;">Sign up now</a> <svg class="icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="assets/images/icons.svg#arrow-right"></use></svg></p>

    </div>
    
<svg xmlns="http://www.w3.org/2000/svg" class="icons"><symbol id="arrow-right" viewBox="0 0 1792 1792"><path d="M1600 960q0 54-37 91l-651 651q-39 37-91 37-51 0-90-37l-75-75q-38-38-38-91t38-91l293-293H245q-52 0-84.5-37.5T128 1024V896q0-53 32.5-90.5T245 768h704L656 474q-38-36-38-90t38-90l75-75q38-38 90-38 53 0 91 38l651 651q37 35 37 90z"/></symbol><symbol id="lock" viewBox="0 0 1792 1792"><path d="M640 768h512V576q0-106-75-181t-181-75-181 75-75 181v192zm832 96v576q0 40-28 68t-68 28H416q-40 0-68-28t-28-68V864q0-40 28-68t68-28h32V576q0-184 132-316t316-132 316 132 132 316v192h32q40 0 68 28t28 68z"/></symbol><symbol id="user" viewBox="0 0 1792 1792"><path d="M1600 1405q0 120-73 189.5t-194 69.5H459q-121 0-194-69.5T192 1405q0-53 3.5-103.5t14-109T236 1084t43-97.5 62-81 85.5-53.5T538 832q9 0 42 21.5t74.5 48 108 48T896 971t133.5-21.5 108-48 74.5-48 42-21.5q61 0 111.5 20t85.5 53.5 62 81 43 97.5 26.5 108.5 14 109 3.5 103.5zm-320-893q0 159-112.5 271.5T896 896 624.5 783.5 512 512t112.5-271.5T896 128t271.5 112.5T1280 512z"/></symbol></svg>

</div>

<script>
var activeEl = 2;
$(function() {
    var items = $('.btn-nav');
    $( items[activeEl] ).addClass('active');
    $( ".btn-nav" ).click(function() {
        $( items[activeEl] ).removeClass('active');
        $( this ).addClass('active');
        activeEl = $( ".btn-nav" ).index( this );
    });
});

//Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

</script>

</body>
</html>