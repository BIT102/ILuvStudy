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

<html class="no-js"> <!--<![endif]-->
    <head>

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
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Kaushan+Script" type="text/css">

        <!-- scripts -->
        <script type="text/javascript" src="/resources/assets/js/modernizr.custom.97074.js"></script>

        <script type="text/javascript" src="/resources/assets/js/jquery-2.1.3.min.js"></script>
        <script type="text/javascript" src="/resources/assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="/resources/assets/js/owl.carousel.js"></script>
        <script type="text/javascript" src="/resources/assets/js/jquery.hoverdir.js"></script>
        
        
<style>
        
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
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}


.login-container{
    position: relative;
    width: 300px;
    margin: 80px auto;
    padding: 20px 40px 40px;
    text-align: center;
    background: #fff;
    border: 1px solid #ccc;
}

#output{
    position: absolute;
    width: 300px;
    top: -75px;
    left: 0;
    color: #fff;
}

#output.alert-success{
    background: rgb(25, 204, 25);
}

#output.alert-danger{
    background: rgb(228, 105, 105);
}


.login-container::before,.login-container::after{
    content: "";
    position: absolute;
    width: 100%;height: 100%;
    top: 3.5px;left: 0;
    background: #fff;
    z-index: -1;
    -webkit-transform: rotateZ(4deg);
    -moz-transform: rotateZ(4deg);
    -ms-transform: rotateZ(4deg);
    border: 1px solid #ccc;

}

.login-container::after{
    top: 5px;
    z-index: -2;
    -webkit-transform: rotateZ(-2deg);
     -moz-transform: rotateZ(-2deg);
      -ms-transform: rotateZ(-2deg);

}

.avatar{
    width: 100px;height: 100px;
    margin: 10px auto 30px;
    border-radius: 100%;
    border: 2px solid #aaa;
    background-size: cover;
}

.form-box input{
    width: 100%;
    padding: 10px;
    text-align: center;
    height:40px;
    border: 1px solid #ccc;;
    background: #fafafa;
    transition:0.2s ease-in-out;

}

.form-box input:focus{
    outline: 0;
    background: #eee;
}

.form-box input[type="text"]{
    border-radius: 5px 5px 0 0;
    text-transform: lowercase;
}

.form-box input[type="password"]{
    border-radius: 0 0 5px 5px;
    border-top: 0;
}

.form-box button.login{
    margin-top:15px;
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

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}


/* .texttext{
	vertical-align:middle;
} */
</style>

</head>
<body>

          <!-- site-navigation start -->  
            <nav id="mainNavigation" class="navbar navbar-dafault main-navigation" role="navigation">
                <div class="container">
                    
                    <div class="navbar-header">
                        
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-nav-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        
                        <!-- navbar logo -->
                        <div class="navbar-brand">
                            <span class="sr-only">Avada Pro Agency</span>
                            <a href="/study/main">
                                <div class="img-responsive center-block" style="font-family: 'Kaushan Script', 'Helvetica Neue', Helvetica, Arial, cursive; font-size:27px;"><strong>I luv<br> Study</strong> </div>
                            </a>
                        </div>
                        <!-- navbar logo -->

                    </div><!-- /.navbar-header -->
                    
                    
					<!-- 로그인 모달 -->
			<div id="id01" class="modal">
				<div class="container">
					<div class="login-container">
						<div id="output"></div>
						<span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
						<div class="avatar" style="background-image:url(/resources/assets/img/login.png);"></div>
						<div class="form-box">
							<form action="/loginPost" method="post" class="form login">
								<input name="email" type="text" placeholder="username"> 
								<input type="password" name="password" placeholder="password">
								<button class="btn btn-info btn-block login" type="submit">Login</button>
								<div class="texttext" style="margin-top:15px;">
								<input type="checkbox" style="width:20px; vertical-align:middle; margin:0;" id="ida" ><label for="idaa" style="vertical-align:middle; margin:0;">　아이디저장</label><br>
								</div>
								<div class="texttext">
								<input type="checkbox" name="useCookies" style="width:20px; vertical-align:middle; margin:0;" id="idb"><label for="idbb" style="vertical-align:middle; margin:0;">　자동로그인</label>
								</div><br>
								아이디/비밀번호를 잊으셨나요?<br> 
								<a href="">아이디찾기　 /　</a><a href="">비밀번호찾기</a>
							</form>
						</div>
					</div>

				</div>

			</div>


			<!-- nav links -->
                    <div class="collapse navbar-collapse" id="main-nav-collapse">
                        <ul class="nav navbar-nav navbar-right text-uppercase">
                        
                        <c:choose>
                        <c:when test="${login eq null}">
                            <li>
                                <a><span onclick="document.getElementById('id01').style.display='block'" style="width:auto;">로그인</span></a>
                            </li>
                            <li class="dropdown">
                                <a href="#"><span>회원가입</span></a>
                            </li>
                        </c:when>
                        <c:otherwise>    
                            <li class="dropdown">
                                <a href="#"><span>My page</span></a>
                            </li> <!-- end of /.dropdown -->
                            <li class="dropdown">
                            	<a href="/logout"><span>로그아웃</span></a>
                        </c:otherwise>    
                        </c:choose>    
                            <li class="dropdown">
                                <a href="/study/listAll"><span>스터디 구경하기</span></a>
                            </li>
                            <li class="dropdown">
                                <a href="contact.html"><span>FAQ</span></a>
                            </li>
                            <li class="dropdown">
                                <a href="contact.html"><span>공지사항</span></a>
                            </li>
                        </ul>
                    </div><!-- nav links -->
                    
                </div><!-- /.container -->
            </nav>
            <!-- site-navigation end -->
            
<script>
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