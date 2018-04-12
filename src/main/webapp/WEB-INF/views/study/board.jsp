<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<link href="/resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Document</title>
<style>
h1 {
	float: left;
}

#nav1 {
	float: left;
	height: 40px;
}

#nav1>a {
	text-decoration-line: none;
}

#nav2 {
	float: right;
}

#nav2>a {
	text-decoration-line: none;
}

#header {
	height: 150px;
}

body {
	margin-left: 50px;
}

#repliesDiv {
	font-size: 40px;
	border: 2px dotted black;
}

.textcenter1 {
	text-align: center;
}

.btn-black:hover {
	background-color: gray !important;
}

/*지도스타일입니다*/
#map {
	width: 60%;
	height: 442px;
	display: inline-block;
	margin-left: 30px;
	float: right;
}

.gallery {
	margin-top: 25px;
	margin-bottom: 25px;
}

.gallery li {
	display: inline-block;
	margin-left: 15px;
}

.imgstyle {
	margin-top: 25px;
}

.app {
	margin-top: 25px;
}

.applyList {
	margin: 15px 25px;
}

.replypage li{
	border:1px solid black;
	width:20px;
	text-align:center;
	background-color:black;
	margin-left:10px;
}

.replypage a {
	color:white;
}

.btn {
	background-color:black;
	color:white;

}

.aplist {
	float:right;
}
.reglist{
	float:right;
}


#modDiv{
	width:450px;
	height:200px;
	background-color:gray;
	position:absolute;
	top:50%;
	left:50%;
	margin-top:-50px;
	margin-left:-150px;
	paddiong:10px;
	z-index:1000;
}

#amodDiv {
	width:450px;
	height:200px;
	background-color:gray;
	position:absolute;
	top:200%;
	left:50%;
	margin-top:-50px;
	margin-left:-150px;
	paddiong:10px;
	z-index:1000;
}
</style>
</head>

<body>

	<%@include file="../nav.jsp"%>
	<div id="multiple-blog-page">
		<!-- header begin -->
		<header class="page-head">
			<div class="header-wrapper">
				<div class="container">
					<div class="row">
						<div class="col-md-12">

							<ol class="breadcrumb">
								<li><a href="index.html">Home</a></li>
								<li class="active">Board</li>
							</ol>
							<!-- end of /.breadcrumb -->

						</div>
					</div>
				</div>
				<!-- /.container -->
			</div>
			<!-- /.header-wrapper -->
		</header>
		<!-- /.page-head (header end) -->

		<!-- bno값 유지하자 -->
		<form role="form" method="post">
			<input type="hidden" name="bno" id="bno" value="${studyVO.bno}">
		</form>


		<div class="container">
			<div class="row">

				<article class="blog-item">

					<c:choose>
						<c:when test="${studyVO.name ne 'a'}">
							<img src="/study/displayFile?fileName=${studyVO.name}"
								class="img-responsive center-block"
								style="width: 1170px; height: 380px;">
						</c:when>
						<c:otherwise>
							<img src="/resources/assets/img/ha.jpg"
								class="img-responsive center-block"
								style="width: 1170px; height: 380px;">
						</c:otherwise>
					</c:choose>

					<div class="author">
						<div class="row">
							<div class="col-md-12">
								<div class="about-author" style="margin-top: 20px;">
									<div class="row">
										<div class="col-md-3">
											<img src="/study/displayFile?fileName=${studyVO.photo}"
												class="img-responsive center-block img-circle" style="width:150px; height:150px;">
										</div>
										<div class="col-md-9" style="margin-top:50px;">
											<p >
												<strong>주인 :</strong> <span
													class="author-name text-uppercase">${studyVO.nickname}</span>
											</p>
											<p>${studyVO.content}</p>
										</div>
									</div>
								</div>

								<div class="author-contact">
									<div class="row">
										<div class="col-md-6">
											<p class="pull-left">


												<!-- 북마크등록 // 로그인한 사람만 -->
												<span><c:if test="${not empty login}">
														<!-- 등록 안되어있을때 -->
														<c:if test="${bolist.checked == 0}">
															<i class="fa fa-heart-o" id="heart"
																onclick="myFunction1(this)" style="font-size: 20px;"></i>
														</c:if>
														<!-- 북마크 등록되어있을때 -->
														<c:if test="${bolist.checked == 1}">
															<span id="delete"> <i class="fa fa-heartbeat"
																id="heart" onclick="myFunction1(this)"
																style="font-size: 20px;"></i>
															</span>
														</c:if>
														<strong> 즐겨찾기에 추가해 주세요 </strong>
													</c:if> </span> <span class="like"> <i class="fa fa-eercast"></i>${studyVO.vct}</span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="blog-heading">
						<h2 class="text-capitalize">
							<strong>${studyVO.title}</strong>
						</h2>
						<span class="date"><fmt:formatDate pattern="yyyy-MM-dd"
								value="${studyVO.regdate}" /></span>

					</div>
					<div class="bodycontent">
						<div class="nicecontent" style="float: top; margin-top: 25px;">
							<p
								style="display: inline-block; vertical-align: top; font-size: 20px;">
								종류 : ${studyVO.cDName} / ${studyVO.cSName}<br> <br> 지역
								:${studyVO.rDName} / ${studyVO.rSName}<br> <br> 참여인원 :
								${studyVO.now} / ${studyVO.max}<br> <br> 선호나이 :
								${studyVO.age}<br> <br> 요일 : ${studyVO.sc}<br> <br>
								날짜 : ${studyVO.sd}<br> <br> 시간 : ${studyVO.st} /
								${studyVO.et}
							</p>
							<div id="map"></div>
						</div>
						<!-- 지도입니다. -->

					</div>
					<!-- 콘덴트바디바디 -->


					<div class="imgstyle">
						<p>스터디 이미지</p>
						<div class="gallery"></div>
					</div>


					<!-- 신청한 사람 목록 -->
					<div class="app">
						<p>신청자목록</p>
						<div class="applyList"></div>
					</div>
			</div>
			<!-- end grycontainer -->



         <c:if test="${not empty login}">
			<div class="comments">
				<div class="row">
					<div class="col-md-12">

			<div class="comment-post">
				<h3>댓글을 달아주세요</h3>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<input name="writer" id="writer" type="text" class="form-control"
								value="${login.email}" readonly>
						</div>
					</div>

					<div class="col-md-12">
						<textarea name="content" type="text" class="form-control"
							id="content" rows="8" required="required"
							placeholder="댓글을 입력해 주세요"></textarea>
					</div>
				</div>

				<button type="button" id="addBtn" class="btn btn-black"
					style="color: white;">댓글 추가하기</button>
				<button type="button" id="seeBtn" class="btn btn-black"
					style="color: white;">댓글 보기</button>
			</div>
			</article>



			<div id="replies" style="margin-top:15px;"></div>
							<!-- 댓글 수정 삭제 부분 -->
						<div id="modDiv" style="display: none ">
				<div class="modal-title"></div>
				
							<div style="text-align:center; margin-bottom:30px; margin-top:30px;">
							
								<input type="text" id="recon" style="width:350px; height:70px; padding-left:15px;">
							</div>
							<div style="text-align:center;">
								<button type="button" id="remodify" class="btn">수정하기</button>
								<button type="button" id="redelege" class="btn">지우기</button>
								<button type="button" id="reclose" class="btn">닫기</button>
							</div>
						</div>
			<ul class="replypage"></ul>
		</div>
	</div>
	</div>
</c:if>










		<br> <br>
		<!-- 로그인했는데 로그인아이디가 글작성자와 같지않을때. -->

<div>
		<!-- 신청하면 이미지와 닉네임 만들기 -->
		<div class="aplist">
<c:if test="${empty login}">
 <input type="submit" class="btn preee" value="목록으로" style="float:right;">
</c:if>

		<c:if test="${not empty login}">
		 <c:if test="${login.email != studyVO.writer}">
		 
			<c:if test="${ap.checked == 0 }">
				<input type="submit" class="btn apply" id="apap" value="신청하기">
				<input type="submit" class="btn deapply" id="apap" value="신청취소" style="display:none;">
			</c:if>
			
			<c:if test="${ap.checked == 1 }">
				<input type="submit" class="btn apply" id="apap" value="신청하기" style="display:none;">
				<input type="submit" class="btn deapply" id="apap" value="신청취소">
			</c:if>
				<input type="submit" class="btn preee" value="목록으로">
		</c:if>		
		<!-- 로그인시 -->
		<br> <br>

		<!-- 로그인한아이디가 글쓴이일때. -->
		
		<c:if test="${login.email == studyVO.writer}">
		<br> <input type="submit" class="btn aList" value="신청자목록"
			onclick="wait();">
		<div id='amodDiv' style="display: none;">
			<div class='modal-applyList'></div>
			<button type="button" id="applyclose" class="btn" style="position:absolute; right:5px; bottom:5px;">닫기</button>

		</div>
		<input type="submit" class="btn preee" value="목록으로"> 
		<input type="submit" class="btn modifybo" value="스터디 수정"> 
		<input type="submit" class="btn delete" value="스터디 지우기">
	</c:if>
	</c:if>
	</div>
	
	
</div>


	<script>
//북마크를 등록합니다	

function myFunction1(x) {

	var bno = $("#bno").val();
	var writer = $("#writer").val();
	
	//클래스이름으로 구별
	var heart = $("#heart").attr('class');
	
	//만약에 등록이 안되어 있으면
	if(heart==="fa fa-heart-o") {
		//데이터등록
		$.ajax({
			type:"post",
			url:"/study/bookmark/a",
			headers : {
				"Content-type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType:'text',
			data : JSON.stringify({
				bsBno : bno,
				userEmail : writer
			}),
			success : function(result) {
				if(result=='success') {
					alert("등록되었습니다");
					//클래스 변경하면서 이미지 변경
					$("#heart").removeClass('fa fa-heart-o');
					$("#heart").addClass('fa fa-heartbeat');
				}
			}
		});
	//북마크가 등록되어있으면
	} else if(heart==="fa fa-heartbeat") {
		//삭제
		$.ajax({
			type:"post",
			url:"/study/bookmark/dee",
			dataType:'text',
			data : {
				bsBno : bno,
				userEmail : writer
			},
			success : function(result) {
				if(result=='success') {
					alert("삭제되었습니다 ");
					//클래스 변경하면서 이미지 변경
					$("#heart").removeClass('fa fa-heartbeat');
					$("#heart").addClass('fa fa-heart-o');
				}
			}
		});
	} else {
		alert("이미 처리되었습니다");
	}
}
</script>

	<!-- 파일업로드 핸들러 -->
	<script id="templateAttach" type="text/x-handlebars-template">
    <li data-src='{{name}}'>
		<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment" style="width:150px; height:150px;"></span>
  		<div class="mailbox-attachment-info">
		</span>
		</div>
	</li>
    </script>

	<script>
    
    //파일불러오기
    var bno = ${studyVO.bno};
    var template = Handlebars.compile($("#templateAttach").html());
    
    $.getJSON("/study/getFile/"+bno, function(list){
    	$(list).each(function(){
    		
    		var fileInfo = getFileInfo(this);
    		var html = template(fileInfo);
    		
    		$(".gallery").append(html)
    	})
    })
    
    </script>
	<script>
var applyEmail = $("#writer").val();
var applybsBno = $("#bno").val();
var now = ${studyVO.now};
var max = ${studyVO.max}
var bno = ${studyVO.bno};
//스터디 등록
$(".apply").on("click", function(){
	if(now == max){
		
		console.log(now);
		console.log(max);
		
	alert("참석하실수 없습니다");
	
	} else {
	
	$.ajax({
		type:"post",
		url:"/study/apply/create/",
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType:"text",
		data:JSON.stringify({
			bsBno : applybsBno,
			usEmail : applyEmail
		}),
		success : function(result){
		wait();
		alert("완전등록됨");
		$(".apply").hide();
		$(".deapply").show();
		}
	
	})
	}
});

//스터디 취소하기
$(".deapply").on("click", function(){
$.ajax({
	type:'post',
	url:'/study/apply/de',
	headers:{
		"Content-Type" : "application/json",
		"X-HTTP-Method-Override" : "DELETE"
	},
	dataType : "text",
	data:JSON.stringify({
		bsBno : applybsBno,
		usEmail : applyEmail
	}),
 	success : function(result) {
 		if(result=='success'){
 			apply();
			wait();
 			alert("삭제되었네");
 			$(".deapply").hide();
 			$(".apply").show();
 		}
 	}
})
})
//신청자목록
$(".aList").on("click", function(){
	$("#amodDiv").show("slow");
})
//신청자 목록 닫기
$("#applyclose").on("click", function(){
	$("#amodDiv").hide("slow")
})
//신청자 수락 거절 status 바꾸자
//수락지 o
//거절시 x


function okstudy(event) {
	
	var applyEmail = $(".applyLi").attr("data-usemail"); //잘못됬음
	
	console.log(applyEmail)
	
	var applybsBno = $("#bno").val();
	
	var kk = event.parentElement;
	
	$.ajax({
		type:"put",
		url:"/study/apply/update",
		headers: {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "PUT"},
		data:JSON.stringify({
			bsBno : applybsBno,
			usEmail : applyEmail,
			status:"O" }),
		dataType:"text",
		success:function(result){
			if(result=="success"){
				kk.remove();
				apply();
				alert("수락했승ㅁ");

			}
		 }
	});
}
//거절시
function nostudy(event) {
	
	var kk = event.parentElement;
	
	$.ajax({
		type:"put",
		url:"/study/apply/update",
		headers: {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "PUT"},
		data:JSON.stringify({
			bsBno : applybsBno,
			usEmail : applyEmail,
			status:"X" }),
		dataType:"text",
		success:function(result){
			if(result=="success"){
				kk.remove();
				apply();
				alert("거절했습니다");
			}
		 }
	});
}
//신청자 대기상태
function wait(){
$.getJSON("/study/apply/"+bno, function(data){
	
	var str="";
	$(data).each(function(){
		
		if(this.status=='D'){
		
		str +="<div class='applyLi' data-usEmail='"+this.usEmail+"'>"
			+ "<span class='mailbox-attachment-icon has-img'><img src='/study/displayFile?fileName=${studyVO.photo}'"
			+ "alt=Attachment style='width:50px; height:50px;'></span>"
		    + this.usEmail
		    + "<button type='button' onclick='okstudy(this);' class='btn' style='margin:0 10px;'>수락</button>"
		    + "<button type='button' onclick='nostudy(this);' class='btn'>거절</button>"
		    +"</div>";   
		}
	});
	$(".modal-applyList").html(str);
});
}
//스터디 등록자 불러오기
function apply(){
 $.getJSON("/study/apply/"+bno, function(data){
	var str="";
	
	$(data).each(function(){
		
		if(this.status=='O'){
		
		str += "<div class='applyLi' data-usEmail='"+this.usEmail+"'>"
			+ "<span class='mailbox-attachment-icon has-img'><img src='/study/displayFile?fileName=/study/displayFile?fileName=${studyVO.photo}'"
			+ "alt=Attachment style='width:50px; height:50px;'></span>"
		    + this.usEmail
		    +"</div>";
		    
	$(".applyList").html(str);
		    
		}		    
	});
});
}
//신청자 화면에 고정시키기
$("document").ready(function apply() {
$.getJSON("/study/apply/"+bno, function(data){
	var str="";
	
	$(data).each(function(){
		
		if(this.status=='O'){
		
		str += "<div class='applyLi' data-usEmail='"+this.usEmail+"'>"
			+ "<span class='mailbox-attachment-icon has-img'><img src='/study/displayFile?fileName=/study/displayFile?fileName=${studyVO.photo}'"
			+ "alt=Attachment style='width:50px; height:50px;'></span>"
		    + this.usEmail
		    +"</div>";
		    
	$(".app .applyList").html(str);
		}
	})
})
})
</script>


	<!-- 상세페이지 -->
	<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	$(".preee").on("click", function(){
		self.location = "/study/listAll?page=${cri.page}&perPageNum=${cri.perPageNum}";
	});
	
	$(".delete").on("click", function(){
		formObj.attr("action", "/study/remove");
		formObj.submit();
	})
});
</script>


	<!--  댓글 -->

	<script>
    
    	var bno = $("#bno").val(); 
        
	//등록
        $("#addBtn").on("click", function(){
        	
        	var writer = $("#writer").val();
        	var content = $("#content").val();
        	
        	$.ajax({
        		type:"post",
        		url:"/study/replies/create",
        		headers:{
        			"Content-Type":"application/json",
        			"X-HTTP-Method-Override":"POST"
        		},
        		dataType:"text",
        		data:JSON.stringify({
        			bsBno:bno,
        			writer:writer,
        			content:content
        		}),
        		success:function(result){
        			if(result=='success'){
        				alert("등록");
        				getPageList(replyPage);
        			}
        		}
        	});
        });
        
        $("#seeBtn").on("click", function(){
        	getPageList(replyPage);
        });
	
	
	//상세 리플
        $("#replies").on("click",".replyLi .cmnt-clipboard button", function(){
        	
       // 	var reply = $(".replyLi").val();
       var rno = $(this).val();
       
       var retext = $(this).parent().next().children().children(".col-md-10").children(".contentre").text();

        	$(".modal-title").html(rno);
        	$("#recon").val(retext);
        	$("#modDiv").show("slow");
        	 
        });

        //삭제
        $("#redelege").on("click", function(){
        	
        	var rno = $(".modal-title").html();
        	var content = $("#recon").val();
        	
        	$.ajax({
        		type:"delete",
        		url:"/study/replies/"+rno,
        		headers : {
        			"Content-Type" : "application/json",
        			"X-HTTP-Method-Override" : "DELETE"
        		},
        		dataType:"text",
        		success:function(result) {
        			if(result=="success") {
        				alert("삭제욤");
        				$("#modDiv").hide("slow");
        				getPageList(replyPage);
        			}
        		}
        	});
        });
        
        //수정
         $("#remodify").on("click", function(){
        	
        	var rno = $(".modal-title").html();
        	var content = $("#recon").val();
        	
        	console.log(content)
        	
        	$.ajax({
        		type:"put",
        		url:"/study/replies/"+rno,
        		headers:{
        			"Content-Type" : "application/json",
        			"X-HTTP-Method-Override" : "PUT" 
        		},
        		data:JSON.stringify({content:content}),
        		dataType:"text",
        		success:function(result) {
        			if(result=="success"){
        				alert("수정입니다");
        				$("#modDiv").hide("slow");
        				getPageList(replyPage);
        			}
        		}
        	});
        });
        
        $("#reclose").on("click", function(){
        	$("#modDiv").hide("slow");
        })
        
        
        //댓글페이지
        function getPageList(page) {
        	
        	$.getJSON("/study/replies/" + bno + "/" + page, function(data){
        		
        		var str="";
        		
        		$(data.list).each(function(){
        			
        			if(this.writer == '${login.email}'){
        			str += "<div class='replyLi' ><div class='cmnt-clipboard'>"
        			    +  "<button class='btn-clipboard' value='"+this.rno+"'>수정하기</button></div>"
        			    +  "<div class='well'><div class='row'><div class='col-md-2'>"
        			    +  "<img src='assets/img/commenter2.jpg' class='img-responsive center-block'></div>"
                        +  "<div class='col-md-10'><p class='comment-info'>"
                        +  "<strong>" + this.writer + "</strong>" + "<span>" + this.regdate + "</span>"
                        + "</p><div class='contentre'>" + this.content + "</div></div></div></div></div>"
        			} else {
        				str += "<div class='replyLi' ><div class='cmnt-clipboard'>"
            			    +  "<div class='well'><div class='row'><div class='col-md-2'>"
            			    +  "<img src='assets/img/commenter2.jpg' class='img-responsive center-block'></div>"
                            +  "<div class='col-md-10'><p class='comment-info'>"
                            +  "<strong>" + this.writer + "</strong>" 
                            + "</p><div class='contentre'>" + this.content + "</div></div></div></div></div>"	
        			}
        			
        		});
        		$("#replies").html(str);
        		
        		printPaging(data.pageMaker);
        	});
        };
        
        //페이지
        function printPaging(pageMaker) {
        	
        	var str="";
        	
        	if(pageMaker.prev) {
        		str += "<li><a herf='"+(pageMaker.startPage-1)+"'> << </a></li>";
        	}
        	
        	for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len; i++) {
        		var strClass = pageMaker.cri.page == i?'class=active':'';
        		str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
        	}
        	
        	if(pageMaker.next) {
        		str += "<li><a href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
        	}
        	$(".replypage").html(str);
        }
               
        var replyPage = 1;
        
        $(".replypage").on("click", "li a", function(event){
        	
        	event.preventDefault();
        	
        	replyPage = $(this).attr("href");
        	
        	getPageList(replyPage);
        });
        
  
        </script>


	<script>
Handlebars.registerHelper("prettifyDate", function(timeValue){
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	var date = dateObj.getDate();
	return year+"/"+month+"/"+date;
});
var printData = function(replyArr, target, templateObject) {
	
	var template = Handlebars.compile(templateObject.html());
	
	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
}
</script>
	<!-- 수정버튼 -->


	<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	$(".preee").on("click", function(){
		self.location = "/study/listAll?page=${cri.page}&perPageNum=${cri.perPageNum}";
	});
	
	$(".delete").on("click", function(){
		formObj.attr("action", "/study/remove");
		formObj.submit();
	})
	
	$(".modifybo").on("click",function(){
		formObj.attr("action", "/study/update");
		formObj.attr("method", "get");
		formObj.submit();
	});
});
	
<%-- 	//=========SOHEE 댓글 수 추가=============
	$('#replies2').text("<%= replycnt %> Comments");
	 --%>
</script>
	<!--지도 크르깁트 -->
	<script>
	
   function initMap() {
	   
   		var uluru = {lat:${studyVO.lat}, lng:${studyVO.lng}};
   	    var map = new google.maps.Map(document.getElementById('map'),{
   		zoom: 16,
   		center:uluru
   	});
   	var marker = new google.maps.Marker({
   		position:uluru,
   		map:map,
   	});
   }
   </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAiNU7soIIqpN1Jdu0tV1CWBb6u1jJAH5o&callback=initMap"
		async defer></script>
</body>
</html>