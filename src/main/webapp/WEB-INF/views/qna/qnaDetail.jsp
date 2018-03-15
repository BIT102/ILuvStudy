<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <!-- Bootstrap 3.3.4 -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<style>
body {margin-left:50px;}

#repliesDiv{font-size:40px; border:2px dotted black;}
</style>
</head>
<body>
	
	<form role="form" action="listPage" method="post">
		<input type='hidden' name='bno' value="${qnaVO.bno}">
		<input type='hidden' name='page' value="${cri.page}">  <!-- page, perPageNum추가 -->
		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	</form>
	
	<div>
		
		<div>
			<label>Title</label><input type="text" name="title" value="${qnaVO.title}" readonly="readonly">
		</div>
		
		<div>
			<label>Content</label><textarea name="content" rows="3" readonly="readonly">${qnaVO.content}</textarea> 
		</div>
		
		<div>
			<label>Writer</label><input type="text" name="writer" value="${qnaVO.writer}" readonly="readonly">
		</div>
	
	</div>
	
	<div>
		<button type="submit" class="btn-warning modifyBtn">MODIFY</button>
		<button type="submit" class="btn-danger ">REMOVE</button><!-- 삭제는 POST방식으로 조회화면에서 처리 (controller에서 /remove를 매핑) -->
		<button type="submit" class="btn-primary goListBtn">LIST ALL</button>
	</div>
	
	<div class="row">
		<div>
		
			<div>
				<div>
					<h3>ADD NEW REPLY</h3>

				</div>
				<div>
					<label for="newReplyWriter">Writer</label>
						<input type="text" placeholder="USER ID" id="newReplyWriter">
						<label for="newReplyText">ReplyText</label>
						<input type="text" placeholder="REPLY TEXT" id="newReplyText">
				</div>
				<!-- box body -->
				<div class="box-footer">
					<button type="submit" id="replyAddBtn">ADD REPLY</button>
				</div>
			</div>
			
			<!-- 댓글목록 페이징 -->
			
			<ul class="timeline">
			<!-- time line label -->
				<li class="time-label" id="repliesDiv">
				<span class="bg-green">
				Replies List <small id='replycntSmall'>[ ${boardVO.replycnt} ]</small>
				</span>
				</li>
			</ul>
			
			<div>
				<ul class="pagination">
				
				</ul>
			</div>
			
		</div>
	</div>
	
	<!-- Modal -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content -->
			<div class="modal-content">
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<p><input type="text" id="replytext" class="form-control"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">Delete</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			
			</div>		
		</div>
	</div>
	
	<script>
	$(document).ready(function(){
	
	var formObj = $("form[role='form']"); 
	
	console.log(formObj);

	$(".modifyBtn").on("click", function(){
		formObj.attr("action", "/qna/modify");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	$(".btn-danger").on("click", function(){
		formObj.attr("action", "/qna/remove");
		formObj.submit();
	});
	
	$(".goListBtn").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/qna/listPage");
		formObj.submit();
	});
	
	
	});
</script>

<script id="template" type="text/x-handelbars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
	<i></i>
	<div class="timeline-item">
		<span class="time">
			<i></i>{{prettifyDate regdate}}
		</span>
		<h3 class="timeline-header"><string>{{rno}}</strong> - {{replyer}}</h3>
		<div class="timeline-body">{{content}}</div>
			<div class="timeline-footer">
				<a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">Modify</a>
			</div>
	</div>
</li>
{{/each}}
</script>

<!-- handlebars helper -->
<script>
Handlebars.registerHelper("prettifyDate", function(timeValue){
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() + 1;
	var date = dateObj.getDate();
	return year+"/"+month+"/"+date;
});

var printData = function (replyArr, target, templateObject){
	
	var template = Handlebars.compile(templateObject.html());

	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
}

	//핸들바템플릿을이용
	var bno = ${qnaVO.bno};
	
	var replyPage = 1;
	//특정한 게시물에 대한 페이징 처리를 위해서 호출되는 함수. jQuery를 이용해서 JSON타입의 데이터를 처리.
	function getPage(pageInfo){
		$.getJSON(pageInfo, function(data){
			printData(data.list, $("#repliesDiv") ,$("#template"));
			printPaging(data.pageMaker, $(".pagination"));
			
			$("#modifyModal").modal('hide');
		});
	}
	
	var printPaging = function(pageMaker, target){
		var str = "";
		
		if(pageMaker.prev){
			str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
		}
		for(var i=pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
			var strClass=pageMaker.cri.page == i?'class=active':'';
			str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
		}
		if(pageMaker.next){
			str+="<li><a href='"+(pageMaker.endPage + 1)+"'> >> </a></li>";
		}
		
		target.html(str);
	};
	
	//Reply List 버튼 구현
	$("#repliesDiv").on("click", function(){
		
	if($(".timeline li").size() > 1){
		return;
	}
	getPage("/replies/" + bno + "/1");
	
	});
	
	//댓글 페이징 이벤트 처리
	$(".pagination").on("click", "li a", function(event){
		event.preventDefault();
	
		replyPage = $(this).attr("href");
		
		getPage("/replies/"+bno+"/"+replyPage);
	});
	
	//ADD REPLY버튼
	$("#replyAddBtn").on("click", function(){
		var replyerObj = $("#newReplyWriter");
		
		var replytextObj = $("#newReplyText");
		var replyer = replyerObj.val();
		var content = replytextObj.val();
		
		$.ajax({ 		//Asyncronized javascript and XML
			type:'post',
			url:'/replies/',
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "POST" },
			dataType:'text',
			data: JSON.stringify({bqBno:bno, replyer:replyer, content:content}),
			success:function(result){
				console.log("result: " + result);
				if(result == 'SUCCESS'){
					alert("등록 되었습니다.");
					replyPage = 1;
					getPage("/replies/"+bno+"/"+replyPage);
					replyerObj.val("");
					replytextObj.val("");
				}
			}
		});
	});
	
	$(".timeline").on("click", ".replyLi", function(event){
		
		var reply = $(this);
		
		$("#replytext").val(reply.find('timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));
		
	});
	
	
	
	//modal footer에 replymod 버튼
	$("#replyModBtn").on("click", function(){
		var rno = $(".modal-title").html();
		var content = $("#replytext").val();
		
		$.ajax({
			type:'put',
			url:'/replies/'+rno,
			headers:{
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "PUT" },
			data:JSON.stringify({content:content}),
			dataType:'text',
			success:function(result){
				console.log("result:" +result);
				if(result == 'SUCCESS'){
					alert("수정 되었습니다.");
					getPage("/replies/"+bno+"/"+replyPage);
				}
			}});
	});
	
	//modal footer에 replyDelBtn 버튼
	$("#replyDelBtn").on("click", function(){
		var rno = $(".modal-title").html();
		var content = $("#replytext").val();
		
		$.ajax({
			type:'delete',
			url:'/replies/'+rno,
			headers: {
				"Content-Type": "application.json",
				"X-HTTP-Method-Override": "DELETE"},
			dataType:'text',
			success:function(result){
				console.log("result:" + result);
				if(result == 'SUCCESS'){
					alert("삭제 되었다.");
					getPage("/replies/"+bno+"/"+replyPage);
				}
			}});
	});
	</script>
<!-- 부트스트랩 JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
>>>>>>> branch 'HGKWON' of https://github.com/BIT102/ILuvStudy.git
</body>
</html>