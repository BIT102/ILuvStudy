
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
    </style>    
</head>
<body>

<!-- bno값 유지하자 -->
<form role="form" method="post">
	<input type="hidden" name="bno" value="${studyVO.bno}">
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
                <p>${studyVO.nickname}</p>   <i class="fa fa-heart-o" style="font-size:36px;"></i>
                
                <!-- 이건뭐죠 >? -->
                <select class="ctbutton">
                    <option>IT</option>
                    <option>교양</option>
                    <option>라이프스타일</option>
                    
                </select>
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
        
        <!-- 첨부파일 나중에 합시다 -->
    <div id="grycontainer">  
        <div class="gallery">
     <!--            <a target="_blank" href="sohee.jpg">
                  <img src="sohee.jpg" alt="Trolltunga Norway" width="150" height="200">
                </a>
                <div class="desc">귀요미</div>
        </div>
            
        <div class="gallery">
                <a target="_blank" href="assa.gif">
                  <img src="assa.gif" alt="Forest" width="600" height="400">
                </a>
                <div class="desc">귀요미</div>
        </div>
              
        <div class="gallery">
                <a target="_blank" href="sh.jpg">
                  <img src="sh.jpg" alt="Northern Lights" width="600" height="400">
                </a>
                <div class="desc">귀요미</div>
        </div>
              
        <div class="gallery">
                <a target="_blank" href="shh.jpg">
                  <img src="shh.jpg" alt="Mountains" width="600" height="400">
                </a>
                <div class="desc">귀요미</div>  -->
        </div>
    </div><!-- end grycontainer -->

    <div>

        <span>작성자</span>
        <input type="text" name="writer" id="writer" value="${studyVO.writer}">
        <span><input type="text" name="content" id="content" value="댓글을 입력해 주세요."></span>
        <input type="checkbox" >비밀글 <input type="button" id="addBtn" value="댓글작성"><br>
        
                      댓글 테스트
        <ul id="replies"> </ul>
        

        
    </br></br>
    
    	신청하는 사람
        <input type="submit" value="신청하기">
        <input type="submit" class="preee" value="목록으로">
        <!-- 로그인시 --> </br></br>
        
                     등록한 사람   
        <input type="submit" class="preee" value="목록">
        <input type="submit" value="수정">
        <input type="submit" class="delete" value="삭제">
        <input type="submit" value="스터디완료">
    </div>
<!-- <script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<div class="timeline-item">
<span class="time">
{{prettifyDate regdate}}
</span>
<h3 class="timeline-header"><strong>{{rno}}</strong> -{{writer}}</h3>
<div class="timeline-body">{{content}}</div>
<div class="timeline-footer">
<a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
</div>
</div>
</li>
{{each}}
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
 -->

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
	
});
</script>   
 
        <script>
    
        var bno = 4934;

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
        				getAllList();
        			}
        		}
        	});
        });
        
        function getAllList() {
            
            $.getJSON("/study/replies/all/" + bno, function(data){
            	
            	console.log(bno);
            	
            	var str="";
            	console.log(data.length);
            	
            	$(data).each(
            			function(){
     						str += "<li data-rno='"+this.rno+"' class='replyLi'>"
     						    + this.rno + ":" + this.content
     						    + "</li>";
            			});
            	
            		$("#replies").html(str);
            	});
           }    
        </script>    
</body>
</html>
