<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- 파일업로드 -->	
<script type="text/javascript" src="/resources/js/upload.js"></script>

<style>
@import url('https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css');


.btn-primary:hover,
.btn-primary:focus {
    background-color: #108d6f;
    border-color: #108d6f;
    box-shadow: none;
    outline: none;
}

.btn-primary {
    color: #fff;
    background-color: #007b5e;
    border-color: #007b5e;
}

section {
    padding: 60px 0;
}

section .section-title {
    text-align: center;
    color: #007b5e;
    margin-bottom: 50px;
    text-transform: uppercase;
}

#team .card {
    border: none;

}

.card{
opacity:0.5;
}
.image-flip:hover .backside,
.image-flip.hover .backside {
    -webkit-transform: rotateY(0deg);
    -moz-transform: rotateY(0deg);
    -o-transform: rotateY(0deg);
    -ms-transform: rotateY(0deg);
    transform: rotateY(0deg);
    border-radius: .25rem;
}

.image-flip:hover .frontside,
.image-flip.hover .frontside {
    -webkit-transform: rotateY(180deg);
    -moz-transform: rotateY(180deg);
    -o-transform: rotateY(180deg);
    transform: rotateY(180deg);
}

.mainflip {
    -webkit-transition: 1s;
    -webkit-transform-style: preserve-3d;
    -ms-transition: 1s;
    -moz-transition: 1s;
    -moz-transform: perspective(1000px);
    -moz-transform-style: preserve-3d;
    -ms-transform-style: preserve-3d;
    transition: 1s;
    transform-style: preserve-3d;
    position: relative;
}

.frontside {
    position: relative;
    -webkit-transform: rotateY(0deg);
    -ms-transform: rotateY(0deg);
    z-index: 2;
    margin-bottom: 30px;
}

.backside {
    position: absolute;
    top: 0;
    left: 0;
    background: white;
    -webkit-transform: rotateY(-180deg);
    -moz-transform: rotateY(-180deg);
    -o-transform: rotateY(-180deg);
    -ms-transform: rotateY(-180deg);
    transform: rotateY(-180deg);
    -webkit-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
    -moz-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
    box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
}

.frontside,
.backside {
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    -ms-backface-visibility: hidden;
    backface-visibility: hidden;
    -webkit-transition: 1s;
    -webkit-transform-style: preserve-3d;
    -moz-transition: 1s;
    -moz-transform-style: preserve-3d;
    -o-transition: 1s;
    -o-transform-style: preserve-3d;
    -ms-transition: 1s;
    -ms-transform-style: preserve-3d;
    transition: 1s;
    transform-style: preserve-3d;
}

.frontside .card,
.backside .card {
    min-height: 312px;
}

.backside .card a {
    font-size: 18px;
    color: #007b5e !important;
     text-decoration: none;
}

.frontside .card .card-title,
.backside .card .card-title {
    color: #007b5e !important;
}

.frontside .card .card-body img {
    width: 120px;
    height: 120px;
    border-radius: 50%;
}

.text-center{
	margin-top:0;
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
            
            /*페이지 처리*/
.pagination>li>a, .pagination>li>span { 
margin: 8px;
color:#6b456a !important;
}

.pagination>.active>a {
	z-index: 2;
    color: white !important;
    background-color: #6b456a !important;
    border-color: #6b456a !important;
    cursor: default;
}


            

</style>
</head>
<body style="background:#262626;">
    
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

<!-- Team -->
<section id="team" class="pb-5">
    <div class="container" style="margin-top:60px;">
        <h5 class="section-title h1">스터디 구경하세요</h5>
        <div class="row">
        
 <c:forEach items="${list}" var="studyVO">
            <!-- Team member -->
            <div class="col-xs-12 col-sm-6 col-md-4">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card" style="background-image:url(/study/displayFile?fileName=${studyVO.name});" >
                                <div class="card-body text-center" style="filter:none;">
                                    <p><img class=" img-fluid" src="https://sunlimetech.com/portfolio/boot4menu/assets/imgs/team/img_01.png" alt="card image"></p>
                                    <h4 class="card-title">${studyVO.title}</h4>
                                    <p class="card-text">${studyVO.nickname}<br>${studyVO.rDName} / ${studyVO.rSName}<br>${studyVO.categoryD} / ${studyVO.categoryS}<br></p>
                                </div>
                            </div>
                        </div>
                        
                        
                        
   <a href="/study/board${pageMakerStudy.makeSearch(pageMakerStudy.cri.page)}&bno=${studyVO.bno}">
                        <div class="backside" style="width:350px; height:312px;">
                            <div class="card">
                                <div class="card-body text-center mt-4">
                                    <h4 class="card-title">${studyVO.title}</h4>
                                    <p class="card-text">${studyVO.content}</p>
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fa fa-facebook"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fa fa-twitter"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fa fa-skype"></i>
                                            </a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="#">
                                                <i class="fa fa-google"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
       </a>
                    </div>
                </div>
            </div>
         
</c:forEach>
        </div>
    </div>
</section>
<!-- Team -->






		<!-- 페이징처리 -->

		<ul class="pagination">
		
		<!-- 스프링 MVC를 이용하는 방식 -->
			<c:if test="${pageMakerStudy.prev}">
				<li><a href="listAll${pageMakerStudy.makeQuery(pageMakerStudy.startPage - 1)}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMakerStudy.startPage}"
				end="${pageMakerStudy.endPage}" var = "idx">
				<li 
					<c:out value="${pageMakerStudy.cri.page == idx?'class=active':''}"/>>
					<a href="listAll${pageMakerStudy.makeQuery(idx)}">${idx}</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMakerStudy.next && pageMakerStudy.endPage>0 }">
				<li><a href="listAll${pageMakerStudy.makeQuery(pageMakerStudy.endPage +1)}">&raquo;</a>
				</li>
			</c:if> 
			
		</ul>


<script>


var activeEl = 3;
$(function() {
    var items = $('.btn-nav');
    $( items[activeEl] ).addClass('active');
    $( ".btn-nav" ).click(function() {
        $( items[activeEl] ).removeClass('active');
        $( this ).addClass('active');
        activeEl = $( ".btn-nav" ).index( this );
    });
});

//검색 효과
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
    	self.location = "listAll"
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
    
<%@include file="../footer.jsp"%>
</body>
</html>