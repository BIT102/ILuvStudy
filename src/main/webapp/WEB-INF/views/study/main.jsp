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

/*메인 글씨*/
body {
	margin: 0;
	padding: 0;
	background-size: cover;
	font-family: 'Quicksand', sans-serif;
}
.prakash {
	position: absolute;
	top: 370px;
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

.row1{
margin-top:500px;
margin-bottom:100px;
}
/*최근 스터디 불러오기*/
#wrapper {
	width: 960px;
	margin: 0 auto;
}

#wrapper p {
	color:white;
	font-size:40px;
	margin-bottom:40px;
}

#wrapper {
  perspective: 2500;
	-webkit-perspective: 2500;
	width: 800px;
	margin: 200px auto 0 auto;
  perspective-origin: 50% 150px;
	-webkit-perspective-origin: 50% 150px;
  transition: perspective, 1s;
  -o-transition: -o-perspective, 1s;
  -moz-transition: -moz-perspective, 1s;
	-webkit-transition: -webkit-perspective, 1s;
}

#img{
height:
}

#image:hover {
  animation-play-state:paused;
  -o-animation-play-state:paused;
  -moz-animation-play-state:paused;
	-webkit-animation-play-state:paused;
}


@-webkit-keyframes spin {
	from {
    transform: rotateY(0);
    -o-transform: rotateY(0);
    -ms-transform: rotateY(0);
    -moz-transform: rotateY(0);
		-webkit-transform: rotateY(0);
	}
	to {
    transform: rotateY(-360deg);
    -o-transform: rotateY(-360deg);
    -ms-transform: rotateY(-360deg);
    -moz-transform: rotateY(-360deg);
		-webkit-transform: rotateY(-360deg);
	}
}

#image {
	margin: 0 auto;
	height: 300px;
	width: 400px;
  transform-style: preserve-3d;
	-webkit-transform-style: preserve-3d;
  animation: spin 24s infinite linear;
  -moz-animation: spin 24s infinite linear;
  -o-animation: spin 24s infinite linear;
	-webkit-animation: spin 24s infinite linear;
}

.image {
	position: absolute;
	height: 100%;
	width: 100%;
	text-align: center;
	font-size: 20em;
	color: #fff;
}

#image a> .i1 {
  transform: translateZ(485px);
  -moz-transform: translateZ(485px);
  -o-transform: translateZ(485px);
  -ms-transform: translateZ(485px);
  -webkit-transform: translateZ(485px);
  background-repeat:no-repeat;
  background-size:100% 100%;
}

  #image a> .i2 {
  transform: rotateY(45deg) translateZ(485px);
  -moz-transform: rotateY(45deg) translateZ(485px);
  -o-transform: rotateY(45deg) translateZ(485px);
  -ms-transform: rotateY(45deg) translateZ(485px);
  -webkit-transform: rotateY(45deg) translateZ(485px);
    background-repeat:no-repeat;
  background-size:100% 100%;
}
#image a> .i3 {
  transform: rotateY(90deg) translateZ(485px);
  -moz-transform: rotateY(90deg) translateZ(485px);
  -o-transform: rotateY(90deg) translateZ(485px);
  -ms-transform: rotateY(90deg) translateZ(485px);
  -webkit-transform: rotateY(90deg) translateZ(485px);
    background-repeat:no-repeat;
  background-size:100% 100%;
}
#image a> .i4 {
  transform: rotateY(135deg) translateZ(485px);
  -moz-transform: rotateY(135deg) translateZ(485px);
  -o-transform: rotateY(135deg) translateZ(485px);
  -ms-transform: rotateY(135deg) translateZ(485px);
  -webkit-transform: rotateY(135deg) translateZ(485px);
    background-repeat:no-repeat;
  background-size:100% 100%;
}
#image a> .i5 {
  transform: rotateY(180deg) translateZ(485px);
  -moz-transform: rotateY(180deg) translateZ(485px);
  -o-transform: rotateY(180deg) translateZ(485px);
  -ms-transform: rotateY(180deg) translateZ(485px);
  -webkit-transform: rotateY(180deg) translateZ(485px);
    background-repeat:no-repeat;
  background-size:100% 100%;
}
#image a> .i6 {
  transform: rotateY(225deg) translateZ(485px);
  -moz-transform: rotateY(225deg) translateZ(485px);
  -o-transform: rotateY(225deg) translateZ(485px);
  -ms-transform: rotateY(225deg) translateZ(485px);
  -webkit-transform: rotateY(225deg) translateZ(485px);
    background-repeat:no-repeat;
  background-size:100% 100%;
}
#image a> .i7 {
  transform: rotateY(270deg) translateZ(485px);
  -moz-transform: rotateY(270deg) translateZ(485px);
  -o-transform: rotateY(270deg) translateZ(485px);
  -ms-transform: rotateY(270deg) translateZ(485px);
  -webkit-transform: rotateY(270deg) translateZ(485px);
    background-repeat:no-repeat;
  background-size:100% 100%;
}
#image a> .i8 {
  transform: rotateY(315deg) translateZ(485px);
  -moz-transform: rotateY(315deg) translateZ(485px);
  -o-transform: rotateY(315deg) translateZ(485px);
  -ms-transform: rotateY(315deg) translateZ(485px);
  -webkit-transform: rotateY(315deg) translateZ(485px);
    background-repeat:no-repeat;
 	 background-size:100% 100%;
} 


/*검색 이미지 구현*/
.search-wrapper {
                position: absolute;
                -webkit-transform: translate(-50%, -50%);
                -moz-transform: translate(-50%, -50%);
                transform: translate(-50%, -50%);
                margin-top:65px;
                right:21.5%;
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
				
				color:white;
                width:70px;
                height:70px;
                border:none;
                border-radius:6px;
                background: #262626;
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
            
            .search p{
            	color:white;
            	font-size:15px;
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
                 	<button class="search-icon" onclick="searchToggle(this, event);" ><span></span></button>
                </div>
                <span class="close" onclick="searchToggle(this, event);"></span>
                <div class="result-container">

                </div>
            </div>
</form>

<!-- 메인글씨 -->
<div class="container">
	<h1 class="prakash" data-text="[ I Luv Study ]">[ I Luv Study ] </h1><br>
	<p class="prakash" id="prakash" data-text="I Luv Study" style="font-size:20px; border:none; margin-top:80px;"> 여기는 I Luv Study 홈페이지 입니다. </p>
</div>


	<!-- for more info please get touch with me by droping a email to me   akj114912@gmail.com -->
	<div class="row1">
<div id="wrapper">
	<p>최신 스터디</p>

	

    <div id="image">
  	  <% int car = 0; %>
  	  <c:forEach items="${list}" var="studyVO">
  	  <% car++; %>
  	  <a href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}&bno=${studyVO.bno}">
    
      <div class="image i<%= car %>" style="background-image:url(/study/displayFile?fileName=${studyVO.name});" >
      <div class="image-content<%= car %>" style="font-size:30px; background:gray; opacity: 0.6;">
      ${studyVO.nickname}<br>
      ${studyVO.rDName}/${studyVO.rSName}<br>
      </div>
      </div>   
      </a>
      
   	 </c:forEach>
    </div>

  </div>
  </div>


<script>

var activeEl = 0;
$(function() {
    var items = $('.btn-nav');
    $( items[activeEl] ).addClass('active');
    $( ".btn-nav" ).click(function() {
        $( items[activeEl] ).removeClass('active');
        $( this ).addClass('active');
        activeEl = $( ".btn-nav" ).index( this );
    });
});
	
//타이핑 효과
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
	
// 검색 효과
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
        	self.location = "/study/listAll"
				+ '${pageMakerStudy.makeQuery(1)}'
				+ "&searchType="
				+ "tcn"
				/* + $("select option:selected").val() */
				+ "&keyword=" + encodeURIComponent($('.search-input').val());
        }

        $(obj).find('.result-container').html('<span>' + _html + '</span>');
        $(obj).find('.result-container').fadeIn(100);

        evt.preventDefault();
    }

</script>

</body>
</html>