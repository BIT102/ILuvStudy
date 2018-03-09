
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="http://code.jquery.com/jquery-1.7.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
    <script type="text/javascript" src="/resources/js/upload.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Document</title>
    <style>
    h1 {float:left;}
    #nav1{float:left; height:40px;}
    #nav1 > a {text-decoration-line: none;}
    #nav2{float:right;}    
    #nav2 > a {text-decoration-line: none;}
    
    #header{height: 150px;}

    #brdimg{background-color:pink;}
    .ctbutton{float:right;}

    .brdtext{float:left; margin-right:8px;}

    #grycontainer{border:2px solid red; height:300px; width:800px;}

    div.gallery {
    margin: 5px;
    border: 1px solid #ccc;
    float: left;
    width: 180px;
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    height: auto;
}

div.desc {
    padding: 15px;
    text-align: center;
}

.fa {
	font-size: 36px;
	cursor: pointer;
	user-SELECT: none;
}

.fa:hover {
 color: darkblue;
}

#modDiv {
	width:300px;
	height:100px;
	background-color:gray;
	position: absolute;
	top:50%;
	left:50%;
	margin-top:5px;
	margin-left:-150px;
	padding:10px;
	z-index:1000;

}

.applyList{
	border : 1px solid black;
	height:100px; 
	width:800px;
} 


#amodDiv {
	width:300px;
	height:200px;
	background-color:yellow;
	position: absolute;
	top:50%;
	left:50%;
	margin-top:5px;
	margin-left:-150px;
	padding:10px;
	z-index:1000;

}


    </style>    
</head>

<body>

<!-- bno값 유지하자 -->
<form role="form" method="post">
	<input type="hidden" name="bno" id="bno" value="${studyVO.bno}">
	<input type="hidden" name="writer" id="writer" value="${studyVO.writer}">
	<input type="hidden" name="now" id="studyNow" value="${studyVO.now}">
	<input type="hidden" name="max" id="studyMax" value="${studyVO.max}">
</form>

        <header id="header">       
            <nav id="nav1">
                <a href="listAll.html">전체</a>
                <a href="boarder.html">외국어</a>
                <a href="boarder.html">IT</a>
                <a href="boarder.html">교양</a>
                <a href="boarder.html">공무원</a>
            </nav>
        
            <nav id="nav2">
                <a href="profile.html">마이페이지</a>
                <a href="">로그아웃</a>
                <a href="register1.html">스터디등록</a>
                <a href="qna.html">QNA</a>
                <a href="notice.html">공지사항</a>
            </nav>
        
        </header>

        <div style="height:700px;">
            <div id="brdimg">
                <c:if test="${studyVO.name!=null}">
					<div class='uploadedList'>
						<span class="mailbox-attachment-icon has-img"><img
						
							src="/study/displayFile?fileName=${studyVO.name}"
							alt="Attachment"></span>
					</div>
				</c:if>
				
				
                <!-- 스터디 제목 -->
                <h2>${studyVO.title}</h2>
                <!-- 작성자 -->
                <p>${studyVO.nickname}</p>   
   
                <!-- 북마크 -->
                	좋아용/나빠용
                <i class="fa fa-heart-o" onclick="myFunction(this)"></i>

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
                    <td>${studyVO.cDName}, ${studyVO.cSName}</td>
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
        
    </br></br>
    
    	신청하는 사람
    	<!-- 신청하면 이미지와 닉네임 만들기 -->
        <input type="submit" class="apply" value="신청하기">
        <input type="submit" class="deapply" value="신청취소">
        <input type="submit" class="preee" value="목록으로">
        <!-- 로그인시 --> </br></br>
        
                     등록한 사람
        <input type="submit" class="aList" value="신청자목록" onclick="wait();">
        <div id='amodDiv' style="display:none;">
        	<div class='modal-applyList'>
        	</div>
        <button type="button" id="applyclose">없어져요</button>	
        	
        </div>
        <input type="submit" class="preee" value="목록">
        <input type="submit" value="수정">
        <input type="submit" class="delete" value="스터디완료">

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
        
    	//댓클불러오기화면에    
/*        $("document").ready(function getPageList(page) {       	
        	
    	   console.log(page);
    	   
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
    	});	 */
        </script>    
</body>
</html>
