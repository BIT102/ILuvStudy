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
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<!-- 파일업로드 -->	
<script type="text/javascript" src="/resources/js/upload.js"></script>

<style>
@import url('https://fonts.googleapis.com/css?family=Quicksand');

body {
	margin: 0;
	padding: 0;
	background-size: cover;
	font-family: 'Quicksand', sans-serif;
}
.prakash {
	position: absolute;
	top: 300px;
	left: 50%;
	transform:translate(-50%,-50%);
	margin: 0;
	padding: 0 20px;
	font-size: 6em;
	color: #fff;
	text-shadow: 0 0 20px #ff005b;
	border-bottom:3px solid #ff005b;
	padding:10px;
}
.prakash:after {
	content: attr(data-text);
	position: absolute;
	top: 0;
	left: 0;
	padding: 0 20px;
	z-index: -1;
	color: #ff005b;
	filter: blur(15px);
}
.prakash:before {
	content:'';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #fe3a80;
	z-index: -2;
	opacity: 0.5;
	filter: blur(40px);
}



/*Time to apply widths for accordian to work
Width of image = 640px
total images = 5
so width of hovered image = 640px
width of un-hovered image = 40px - you can set this to anything
so total container width = 640 + 40*4 = 800px;
default width = 800/5 = 160px;
*/

.accordian {
	overflow: hidden;
	
	/*Time for some styling*/
	margin: 100px;
	margin-top:400px;

}

.accordian .image_title {
	color:white;
	padding:10px;
	font-size:18px;
}

.accordian h2 {
	color:white;
	padding:30px;
	font-size:40px;
}

/*A small hack to prevent flickering on some browsers*/
.accordian ul {
	width: 1200px;
	/*This will give ample space to the last item to move
	instead of falling down/flickering during hovers.*/
}

.accordian li {
	position: relative;
	display: block;
	width: 160px;
	float: left;
	
	border-left: 1px solid #888;
	
	box-shadow: 0 0 25px 10px rgba(0, 0, 0, 0.5);
	-webkit-box-shadow: 0 0 25px 10px rgba(0, 0, 0, 0.5);
	-moz-box-shadow: 0 0 25px 10px rgba(0, 0, 0, 0.5);
	
	/*Transitions to give animation effect*/
	transition: all 0.5s;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	/*If you hover on the images now you should be able to 
	see the basic accordian*/
}

/*Reduce with of un-hovered elements*/
.accordian ul:hover li {width: 40px;}
/*Lets apply hover effects now*/
/*The LI hover style should override the UL hover style*/
.accordian ul li:hover {width: 640px;}


.accordian li img {
	display: block;
}

/*Image title styles*/
.image_title {
	background: rgba(0, 0, 0, 0.5);
	position: absolute;
	left: 0; bottom: 0;	
width: 640px;	

}
.image_title a {
	display: block;
	color: #fff;
	text-decoration: none;
	padding: 20px;
	font-size: 16px;
}

.search-wrapper {
                position: absolute;
                -webkit-transform: translate(-50%, -50%);
                -moz-transform: translate(-50%, -50%);
                transform: translate(-50%, -50%);
                top:550px;
                left:70%;
            }
            .search-wrapper.active {}

            .search-wrapper .input-holder {
                overflow: hidden;
                height: 70px;
                background: rgba(255,255,255,0);
                border-radius:6px;
                position: relative;
                width:70px;
                -webkit-transition: all 0.3s ease-in-out;
                -moz-transition: all 0.3s ease-in-out;
                transition: all 0.3s ease-in-out;
            }
            .search-wrapper.active .input-holder {
                border-radius: 50px;
                width:450px;
                background: rgba(0,0,0,0.5);
                -webkit-transition: all .5s cubic-bezier(0.000, 0.105, 0.035, 1.570);
                -moz-transition: all .5s cubic-bezier(0.000, 0.105, 0.035, 1.570);
                transition: all .5s cubic-bezier(0.000, 0.105, 0.035, 1.570);
            }

            .search-wrapper .input-holder .search-input {
                width:100%;
                height: 50px;
                padding:0px 70px 0 20px;
                opacity: 0;
                position: absolute;
                top:0px;
                left:0px;
                background: transparent;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
                border:none;
                outline:none;
                font-family:"Open Sans", Arial, Verdana;
                font-size: 16px;
                font-weight: 400;
                line-height: 20px;
                color:#FFF;
                -webkit-transform: translate(0, 60px);
                -moz-transform: translate(0, 60px);
                transform: translate(0, 60px);
                -webkit-transition: all .3s cubic-bezier(0.000, 0.105, 0.035, 1.570);
                -moz-transition: all .3s cubic-bezier(0.000, 0.105, 0.035, 1.570);
                transition: all .3s cubic-bezier(0.000, 0.105, 0.035, 1.570);

                -webkit-transition-delay: 0.3s;
                -moz-transition-delay: 0.3s;
                transition-delay: 0.3s;
            }
            .search-wrapper.active .input-holder .search-input {
                opacity: 1;
                -webkit-transform: translate(0, 10px);
                -moz-transform: translate(0, 10px);
                transform: translate(0, 10px);
            }

            .search-wrapper .input-holder .search-icon {

                width:70px;
                height:70px;
                border:none;
                border-radius:6px;
                background: #FFF;
                padding:0px;
                outline:none;
                position: relative;
                z-index: 2;
                float:right;
                cursor: pointer;
                -webkit-transition: all 0.3s ease-in-out;
                -moz-transition: all 0.3s ease-in-out;
                transition: all 0.3s ease-in-out;
            }
            .search-wrapper.active .input-holder .search-icon {
                width: 50px;
                height:50px;
                margin: 10px;
                border-radius: 30px;
            }
            .search-wrapper .input-holder .search-icon span {
                width:22px;
                height:22px;
                display: inline-block;
                vertical-align: middle;
                position:relative;
                -webkit-transform: rotate(45deg);
                -moz-transform: rotate(45deg);
                transform: rotate(45deg);
                -webkit-transition: all .4s cubic-bezier(0.650, -0.600, 0.240, 1.650);
                -moz-transition: all .4s cubic-bezier(0.650, -0.600, 0.240, 1.650);
                transition: all .4s cubic-bezier(0.650, -0.600, 0.240, 1.650);

            }
            .search-wrapper.active .input-holder .search-icon span {
                -webkit-transform: rotate(-45deg);
                -moz-transform: rotate(-45deg);
                transform: rotate(-45deg);
            }
            .search-wrapper .input-holder .search-icon span::before, .search-wrapper .input-holder .search-icon span::after {
                position: absolute;
                content:'';
            }
            .search-wrapper .input-holder .search-icon span::before {
                width: 4px;
                height: 11px;
                left: 9px;
                top: 18px;
                border-radius: 2px;
                background: #974BE0;
            }
            .search-wrapper .input-holder .search-icon span::after {
                width: 14px;
                height: 14px;
                left: 0px;
                top: 0px;
                border-radius: 16px;
                border: 4px solid #974BE0;
            }

            .search-wrapper .close {
                position: absolute;
                z-index: 1;
                top:24px;
                right:20px;
                width:25px;
                height:25px;
                cursor: pointer;
                -webkit-transform: rotate(-180deg);
                -moz-transform: rotate(-180deg);
                transform: rotate(-180deg);
                -webkit-transition: all .3s cubic-bezier(0.285, -0.450, 0.935, 0.110);
                -moz-transition: all .3s cubic-bezier(0.285, -0.450, 0.935, 0.110);
                transition: all .3s cubic-bezier(0.285, -0.450, 0.935, 0.110);
                -webkit-transition-delay: 0.2s;
                -moz-transition-delay: 0.2s;
                transition-delay: 0.2s;
            }
            .search-wrapper.active .close {
                right:-50px;
                -webkit-transform: rotate(45deg);
                -moz-transform: rotate(45deg);
                transform: rotate(45deg);
                -webkit-transition: all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570);
                -moz-transition: all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570);
                transition: all .6s cubic-bezier(0.000, 0.105, 0.035, 1.570);
                -webkit-transition-delay: 0.5s;
                -moz-transition-delay: 0.5s;
                transition-delay: 0.5s;
            }
            .search-wrapper .close::before, .search-wrapper .close::after {
                position:absolute;
                content:'';
                background: red;
                border-radius: 2px;
            }
            .search-wrapper .close::before {
                width: 5px;
                height: 25px;
                left: 10px;
                top: 0px;
            }
            .search-wrapper .close::after {
                width: 25px;
                height: 5px;
                left: 0px;
                top: 10px;
            }
            .search-wrapper .result-container {
                width: 100%;
                position: absolute;
                top:80px;
                left:0px;
                text-align: center;
                font-family: "Open Sans", Arial, Verdana;
                font-size: 14px;
                display:none;
                color:#B7B7B7;
            }


            @media screen and (max-width: 560px) {
                .search-wrapper.active .input-holder {width:200px;}
            }
</style>

</head>
<body style="background:#262626;" onLoad="gogogo()">

<!-- // Navigation -->
<%@include file="../nav.jsp"%>

<!-- 검색 -->
<form onsubmit="submitFn(this, event);">
            <div class="search-wrapper">
                <div class="input-holder">
                    <input type="text" class="search-input" placeholder="Type to search" />
                    <button class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
                </div>
                <span class="close" onclick="searchToggle(this, event);"></span>
                <div class="result-container">

                </div>
            </div>
</form>

<div class="container">
	<h1 class="prakash" data-text="[ I Luv Study ]">[ I Luv Study ] </h1><br>
	<p class="prakash" id="prakash" data-text="I Luv Study" style="font-size:20px; border:none; margin-top:80px;"> 여기는 I Luv Study 홈페이지 입니다. </p>
</div>

<!-- We will make a simple accordian with hover effects 
The markup will have a list with images and the titles-->
<div class="accordian">
	<h2>New Study</h2>
    <ul>
    <c:forEach items="${list}" var="studyVO">
		<li>
			<div class="image_title">
				${studyVO.title} / 지역 ${studyVO.rDName}(${studyVO.rSName})
			</div> 
			<a href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}&bno=${studyVO.bno}">
				<img src="/study/displayFile?fileName=${studyVO.name}" style="width:640px; height:320px;"/>
			</a>
		</li>
	</c:forEach>		
	</ul>
</div>

<!-- 타이핑 -->
<script language="javascript">
	
    var mess = "여기는 I Luv Study 홈페이지 입니다.";
    
	var count=0;
	var newsno=0;
	
	function gogogo() {
		document.all("prakash").innerText="_"+mess.substring(0,count++);
		if(count>=mess.length){
			count=0;
			newsno++;
			
			if(newsno>=mess.length)
				newsno--;
			
		}
		setTimeout("gogogo()", 200);
	}
	
	function searchToggle(obj, evt){
        var container = $(obj).closest('.search-wrapper');

        if(!container.hasClass('active')){
              container.addClass('active');
              evt.preventDefault();
        }
        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
              container.removeClass('active');
              // clear input
              container.find('.search-input').val('');
              // clear and hide result container when we press close
              container.find('.result-container').fadeOut(100, function(){$(this).empty();});
        }
    }

    function submitFn(obj, evt){
        value = $(obj).find('.search-input').val().trim();

        _html = "Yup yup! Your search text sounds like this: ";
        if(!value.length){
            _html = "Yup yup! Add some text friend :D";
        }
        else{
            _html += "<b>" + value + "</b>";
        }

        $(obj).find('.result-container').html('<span>' + _html + '</span>');
        $(obj).find('.result-container').fadeIn(100);

        evt.preventDefault();
    }	
</script>
</body>
</html>