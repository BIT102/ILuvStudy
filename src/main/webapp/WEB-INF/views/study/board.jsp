<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="http://code.jquery.com/jquery-1.7.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
    <script type="text/javascript" src="/resources/js/upload.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

<link href="/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Document</title>
    <style>
    h1 {float:left;}
    #nav1{float:left; height:40px;}
    #nav1 > a {text-decoration-line: none;}
    #nav2{float:right;}    
    #nav2 > a {text-decoration-line: none;}
    
    #header{height: 150px;}
	body {margin-left:50px;}
	#repliesDiv{font-size:40px; border:2px dotted black;}
	.textcenter1{text-align:center;}
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
                                    <li class="active">FAQ</li>
                                </ol> <!-- end of /.breadcrumb -->

                            </div>
                        </div>
                    </div> <!-- /.container -->
                </div> <!-- /.header-wrapper -->
            </header> <!-- /.page-head (header end) -->

<!-- bno값 유지하자 -->
<form role="form" method="post">
 	<input type="hidden" name="bno" id="bno" value="${studyVO.bno}">
	<%-- <input type="hidden" name="writer" id="writer" value="${studyVO.writer}" --%>>
	<input type="hidden" name="now" id="studyNow" value="${studyVO.now}">
	<input type="hidden" name="max" id="studyMax" value="${studyVO.max}">
</form>
		
		<section class="blog-content">
                <div class="container">
                    <div class="row">
                        <main class="col-md-8 col-md-offset-2" style="display: block;">
                            <article class="blog-item">
                              

                                <div class="author">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="about-author">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <img src="../../resources/assets/img/IMG_9772.JPG" class="img-responsive center-block img-circle" alt="author" style="width:130px; height:170px;">
                                                    </div>
                                                    <div class="col-md-9">
                                                        <p>
                                                            <strong>${studyVO.title}</strong>
                                                            <span class="author-name text-uppercase">${studyVO.nickname}</span>
                                                        </p>
                                                        <p>
                                                            ${studyVO.content}<br>
                                                            Vestibulum varius fermentum risus vitae lacinia neque auctor nec. Nunc ac rutrum nulla. Nul maximus dolor in quam euismod ac viverra libero aliquet. Nunc sed nunc malesuada aliquet turpis eu dictum lectus. Cras eget sollicitudin lorem. Etiam commodo ultricies luctus.
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="author-contact">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <p class="pull-left">
                                                            <span><i class="fa fa-picture-o"></i></span>
                                                            <strong>25 Total Posts</strong>
                                                            <i class="fa fa-heart-o" onclick="myFunction(this)"></i>
                                                        </p>
                                                        
                                                    </div>
                                                    <div class="col-md-6">
                                                        <ul class="author-contact-button pull-right">
                                                            <li><a href="https://iluvstd.slack.com"><i class="fa fa-slack"></i></a></li>
                                                            <li><a href="https://www.facebook.com/I-luv-study-2067683313502302/"><i class="fa fa-facebook"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                                            <li><a href="https://www.youtube.com/channel/UCNBQowU3R1wQYQ0zz8Gt7Lw/videos?view_as=subscriber"><i class="fa fa-youtube"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
								
								<div>
										 <p>현재 인원:${studyVO.now}</p>
										 <p>최대 인원:${studyVO.max}</p>
										 <p>${studyVO.rDName}/${studyVO.rSName}</p>
										 <p>시작날짜 : ${studyVO.sd}</p>
										 <p>시작시간 : ${studyVO.st}</p>
										 <p>끝나는시간 : ${studyVO.et}</p>
										 <p>요일 : ${studyVO.sc}</p>
								</div>
								<!-- 로그인했는데 로그인아이디가 글작성자와 같지않을때. -->
						  	<c:if test="${login.email ne studyVO.writer }">
						   	<c:if test="${not empty login}"> 
								<button type="submit" id="submit" name="submit" class="btn btn-black apply">신청하기</button>
								<button type="submit" id="submit" name="submit" class="btn btn-black deapply">신청취소</button>
								<button type="submit" id="submit" name="submit" class="btn btn-black preee">목록으로</button>
							</c:if>
							</c:if>	
							
							<!-- 로그인한아이디가 글쓴이일때. -->
        					<c:if test="${login.email eq studyVO.writer}">
							<br>
							<br>
						        <input type="submit" class="aList btn btn-black" value="신청자목록" onclick="wait();">
						        <div id='amodDiv' style="display:none;">
						        	<div class='modal-applyList'>
						        	</div>
						        <button type="button" id="applyclose">없어져요</button>	
						        </div>
						    <br>
						    <br>    
						        <input type="submit" class="preee btn btn-black" value="목록">
						        <input type="submit" class="btn btn-black" value="수정">
						        <input type="submit" class="delete btn btn-black" value="스터디완료">
							</c:if>
							
                                 <div class="comments">
                                    <div class="row">
                                        <div class="col-md-12">
                                             <h3 id="replies2"></h3>
                                       
                             <% int replycnt=0; %>               
                 <!-- ===================SOHEE 댓글 정보 추가==================== -->                     
                                 <c:forEach items="${list}" var="replyStudyVO">
                                            <!-- <div class="cmnt-clipboard"><span class="btn-clipboard">Reply</span></div> -->
                                            <div class="well">
                                                <div class="row">
                                                   <!--  <div class="col-md-2">
                                                        <img src="assets/img/commenter1.jpg" class="img-responsive center-block" alt="first-comment">
                                                    </div> -->
                                                    <div class="col-md-10">
                                                        <p class="comment-info">
                                                            <strong>${replyStudyVO.writer}</strong> <span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${replyStudyVO.regdate}"/></span>
                                                        </p>
                                                        <p>${replyStudyVO.content}</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <% replycnt++; %>
                                  </c:forEach>
                    <!-- ===================댓글 정보 추가 끝==================== -->
                                            
                                            
                                            <!-- handlebar template 문법-->
											<script id="template" type="text/x-handlebars-template">
                                            	{{#each .}}   
                                            <div class="well">
                                                <div class="row">
                                               
                                                    <div class="col-md-2">
                                                        <img src="assets/img/commenter2.jpg" class="img-responsive center-block" alt="second-comment">
                                                    </div>
                                                    <div class="col-md-10">
                                                        <p class="comment-info">
                                                            <strong>David Martin</strong> <span>22 april 2015</span>
                                                        </p>
                                                        <p>
                                                            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since they 1500s.
                                                        </p>
                                                    </div>

                                                </div>
                                            </div>
												{{/each}}
											</script>
                                        </div>
                                    </div>
                                </div>

                                <div class="comment-post">
                                    <h3>Post A Comment</h3>
                                    <form method="post">
                                        <div class="row">
                                          
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <input name="email" type="email" class="form-control" id="email" required="required" placeholder="Email Address" value="${studyVO.writer}">
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <textarea name="message" class="form-control" id="message" rows="8" required="required" placeholder="Type here message"></textarea>
                                            </div>
                                        </div>
                                        
                                        <button type="submit" id="submit" name="submit" class="btn btn-black">post comment</button>
                                    </form>
                                </div>
                            </article>
                        </main>
                    </div>
                </div>
            </section>
		
		<!-- section -->
		
        <div style="height:700px;">
            <div id="brdimg">
                <c:if test="${studyVO.name!=null}">
					<div class='uploadedList'>
						<span class="mailbox-attachment-icon has-img"><img
						
							src="/study/displayFile?fileName=${studyVO.name}"
							alt="Attachment"></span>
					</div>
				</c:if>
				
				<p>${studyVO.cDName}</p>
			
                <!-- 스터디 제목 -->
                <h2>${studyVO.title}</h2>
                <!-- 작성자 -->
                <p>${studyVO.nickname}</p>   
   				
                <!-- 북마크 -->
				
                	좋아용/나빠용
               <!-- 로그인 했을때 -->
 
           		<c:forEach items="${bolist}" var="book" varStatus="status">
           		<c:if test="${not empty login}">
					<script>
					${book}
					${studyVO.bno}
					${book.bsBno}
					${book.userEmail}
					${login.email}
					</script>
	
				<c:if test="${(studyVO.bno eq book.bsBno) and (book.userEmail eq login.email)}">
				<i class="fa fa-heartbeat" onclick="myFunction(this)"></i>
				</c:if>
				<c:if test="${(studyVO.bno ne book.bsBno) and (book.userEmail ne login.email) and (status.first)}">
				 
				<i class="fa fa-heart-o" onclick="myFunction(this)"></i>
				</c:if>
				</c:if>
				</c:forEach>
		
           			
  		
           		
           		
        <%--    		<c:choose>
   				<c:when test="${empty login}">
   					<c:if test="${login.email ne book.userEmail}">
               	 <i class="fa fa-heart-o" onclick="myFunction(this)"></i>
                	</c:if>
                	</c:when>
                <c:otherwise>
        
                	<c:if test="${login.email eq book.userEmail}">
               		<i class="fa fa-heartbeat" onclick="myFunction(this)"></i>	
                 	</c:if>
                 	<i class="fa fa-heart-o" onclick="myFunction(this)"></i>
                </c:otherwise>
                </c:choose> --%>
<%-- 
				<c:if test="${login.email eq book.userEmail}">
				<i class="fa fa-heartbeat" onclick="myFunction(this)"></i>
				</c:if>   	
    --%>
   		
 <%--          		<c:choose>
           		
            		
           		<c:when test="${login.email ne book.userEmail}">
				</c:when>
				<c:otherwise>				
                <i class="fa fa-heartbeat" onclick="myFunction(this)"></i>
                </c:otherwise>
                </c:choose>
           		</c:forEach> --%>
 <script>
	//북마크
	//홀수이면 등록 짝수이면 삭제
	var count = 0;
	
function myFunction(x) {
	
	x.classList.toggle("fa-heartbeat");
		
	++count;
	
		var bno = $("#bno").val();
		
		var writer = $("#writer").val();
	if(count%2!=0) {
		//등록
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
					alert("등록됨");
				}
			}
		});
	// 취소
		}  else {
			
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
						alert("삭제욤 ");
					}
				}
			});
		}	
}	
	
</script>               

            </div>

            <table>
                <tr>
                <!-- 카테고리 -->
                    <td>카테고리</td>
                   <c:forEach items="${list}" var="studyVO">

                   ${studyVO.cDName}${studyVO.cSName}

                    </c:forEach>
                </tr>
                <tr>
                <!-- 현재인원 -->
                    <td>현재인원</td>
                    <td>${studyVO.now}</td>
                </tr>
                <tr>
                <!-- 최대인원 -->
                    <td>최대인원</td>
                    <td>${studyVO.max}</td>
                </tr>
                <tr>
                <!-- 지역 -->
                    <td>지역</td>
                    <td>${studyVO.rDName}/${studyVO.rSName}</td>
                </tr>
                <tr>
                <!-- 시작날짜 -->
                    <td>시작날짜</td>
                    <td>${studyVO.sd}</td>
                    <!-- 시작시간 -->
                    <td>시작시간</td>
                    <td>${studyVO.st}</td>
                    <!-- 끝나는시간 -->
                    <td>끝나는시간</td>
                    <td>${studyVO.et}</td>
                </tr>
            </table>
            <!-- 요일별 -->
            <div>요일별 스터디 시간 <p>${studyVO.sc}</p></div>
            <!-- 스터디내용 -->
            <div class="brdtext"><p>소개글</p></div>
            <div class="brdtext"><p>${studyVO.content}</p></div>


        </div>
        
		<!-- 신청한 사람 목록 -->
			<div class ="applyList">
			</div>
        
        
        
        
        
        <!-- 첨부파일 나중에 합시다 -->
    <div id="grycontainer">  
    	
    	<!-- 이미지 상태가 x인 이미지 -->

        <div class="gallery">
        </div>
	
    </div><!-- end grycontainer -->
    
    <!-- 파일업로드 핸들러 -->
    <script id="templateAttach" type="text/x-handlebars-template">
    <li data-src='{{name}}'>
		<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
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

    <div>

        <span>작성자</span>
        <input type="text" name="writer" id="writer" value="${studyVO.writer}">
        <span><input type="text" name="content" id="content" value="댓글을 입력해 주세요."></span>
        <input type="checkbox" >비밀글 <input type="button" id="addBtn" value="댓글작성"><br>
        
                      댓글 테스트
        <ul id="replies"></ul>
        <ul class="replypage"></ul>
        
        <!-- 댓글 수정 삭제 부분 -->
       <div id="modDiv" style="display:none">
         	<div class="modal-title"></div>
         	<div>
        		<input type="text" id="recon">
			</div>
        	<div>
        	<button type="button" id="remodify">Modify</button>
        	<button type="button" id="redelege">Delete</button>
        	<button type="button" id="reclose">Close</button>
        	</div>
        </div>  
        
    <br><br>
    	<!-- 로그인했는데 로그인아이디가 글작성자와 같지않을때. -->
    	<c:if test="${login.email ne studyVO.writer }">
    	<c:if test="${not empty login}"> 
    
    	신청하는 사람
    	<!-- 신청하면 이미지와 닉네임 만들기 -->
        <input type="submit" class="apply" value="신청하기">
        <input type="submit" class="deapply" value="신청취소">
        <input type="submit" class="preee" value="목록으로">
        <!-- 로그인시 --> <br><br>
        </c:if>
        </c:if>
        
        <!-- 로그인한아이디가 글쓴이일때. -->
        <c:if test="${login.email eq studyVO.writer}">
                     등록한 사람  
        <br>
        <input type="submit" class="aList" value="신청자목록" onclick="wait();">
        <div id='amodDiv' style="display:none;">
        	<div class='modal-applyList'>
        	</div>
        <button type="button" id="applyclose">없어져요</button>	
        	
        </div>
        <input type="submit" class="preee" value="목록">
        <input type="submit" value="수정">
        <input type="submit" class="delete" value="스터디완료">
        </c:if>
		
    </div>

</div>
<!-- 신청자목록 모달 -->
<script>
var applyEmail = $("#writer").val();
var applybsBno = $("#bno").val();
var now = $("#studyNow").val();
var max = $("#studyMax").val();
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
		}
	
	})
	}
})
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
		str +="<div class='applyLi' data-usEmail='"+this.usEmail+"'>"
			+ "<span class='mailbox-attachment-icon has-img'><img src='/study/displayFile?fileName="+this.photo+"'"
			+ "alt=Attachment></span>"
		    + this.usEmail
		    + "<button type='button' onclick='okstudy(this);'>수락</button>"
		    + "<button type='button' onclick='nostudy(this);'>거절</button>"
		    +"</div>";   
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
			+ "<span class='mailbox-attachment-icon has-img'><img src='/study/displayFile?fileName="+this.photo+"'"
			+ "alt=Attachment></span>"
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
			+ "<span class='mailbox-attachment-icon has-img'><img src='/study/displayFile?fileName="+this.photo+"'"
			+ "alt=Attachment></span>"
		    + this.usEmail
		    +"</div>";
		    
	$(".applyList").html(str);
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
        
	//상세 리플
        $("#replies").on("click", ".replyLi button", function(){
        	
        	var reply = $(this).parent();
        	
        	var rno = reply.attr("data-rno");
        	var retext = reply.text();
        	alert(rno +":" + retext)
        	
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
        
        //댓글페이지
        function getPageList(page) {
        	
        	$.getJSON("/study/replies/" + bno + "/" + page, function(data){
        		
        		var str="";
        		
        		$(data.list).each(function(){
        			
        			str += "<li data-rno='" + this.rno + "' class='replyLi'>"
        			    + this.rno + ":" + this.content
        			    + "<button>MOD</button></li>";
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
	
	$(".fa fa-heart-o").on("click", function(){
		<i class="fa fa-heart" style="font-size:36px;"></i>
	})
	
	$(".modifyBtn").on("click",function(){
		formObj.attr("action", "/study/modifyPage");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	
	//=========SOHEE 댓글 수 추가=============
	$('#replies2').text("<%=replycnt%> Comments");
	
});
</script>   
 
</body>
</html>