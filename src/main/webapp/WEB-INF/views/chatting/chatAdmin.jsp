<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<style>
.chatadmin{
margin-left:200px;
}
</style>
</head>

<body>

<%@ include file="../admin/nav.jsp" %>

<h4>chatting page</h4>
메시지 내용 : <input type="text" id="message">
<input type="button" id="sendMessage" value="메시지 보내기">

<c:forEach items="${list}" var="messageVO">
	<c:if test="${messageVO.email ne 'admin'}">
		<div>${messageVO.message}</div>
		<div><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${messageVO.registDate}"/></div>
	<c:set var = "receiver" value="${messageVO.email}" />
	</c:if>
	
	<c:if test="${messageVO.email eq 'admin'}">
		<div class="chatadmin">${messageVO.message}</div>
		<div class="chatadmin"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${messageVO.registDate}"/></div>
	</c:if>
	
</c:forEach>

<div id="chatMessage" style="overFlow: auto; max-height:500px;"></div>

<script type="text/javascript" src="/resources/js/sockjs.js"></script>
<script type="text/javascript" src="/resources/js/sockjs.min.js"></script>
<script>

var sock = null;
var message = {};

$(document).ready(function(){
	
	
	//웹 소켓을 지정한 url로 연결
	sock = new SockJS("/chat");
	
	//웹 소켓이 열리면 호출
	sock.onopen = function(){

	}
	
	//메시지가 도착하면 호출
	sock.onmessage = function(evt){
		$('#chatMessage').append(evt.data + "<br/>");
	}
	
	//웹 소켓이 닫히면 호출
	sock.onclose = function(){
		//메시지 전송
		sock.send('채팅을 종료합니다.');
	}
	
	$("#message").keydown(function (key) {
        if (key.keyCode == 13) {
           $("#sendMessage").click();
        }
    });

	$('#sendMessage').click(function(){
		
		if($('#message').val() != ""){
			
			message = {};
			message.message = $('#message').val();
			message.type = "to";
			message.receiver = '<c:out value="${receiver}"/>';
			message.email = "admin";
			
			var time = new Date();
			
			//메시지 전송
			sock.send(JSON.stringify(message));
			
			$('#chatMessage').append('<div class="chatadmin"> ' + $('#message').val() + '</div> <div class="chatadmin">'+ 
					time.getHours() + ":" + time.getMinutes() + '</div>');
			$('#message').val("");
		}
		
	});
	
})
</script>  
</body>
</html>