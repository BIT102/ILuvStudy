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
			<ul>
				<li id="repliesDiv"><span>Replies List</span>
			</ul>
			
			<div>
				<ul id="pagination" class="pagination">
				
				</ul>
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
<li data-rno={{rno}}>
	<i></i>
	<div>
		<span>
			<i></i>{{prettifyDate regdate}}
		</span>
		<h3><string>{{rno}}><strong> -{{replyer}}</h3>
		<div>{{replytext}}</div>
			<div>
				<a data-toggle="modal" data-target="#modifyModal">Modify</a>
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
	
	var template = Handlebars.complie(templateObject.html());

	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
}

	//핸들바템플릿을이용
	var bno = ${replyVO.bqBno};
	
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
	getPage("/qna/" + bno + "/1");
	
	});
	
	//댓글 페이징 이벤트 처리
	$(".pagination").on("click", "li a", function(event){
		event.preventDefault();
	
		replyPage = $(this).attr("href");
		
		getPage("/replies/"+bno+"/"+replyPage);
	});
	</script>
</body>
</html>