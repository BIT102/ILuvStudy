<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>

</head>

<body>
<%@ include file="../nav.jsp" %>

<h4>chatting page</h4>
메시지 내용 : <input type="text" id="message">
귓속말 대상 : <input type="text" id="to">
<input type="button" id="sendMessage" value="메시지 보내기">

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
		message = {};
		message.message = "접속하였습니다.";
		message.type="all";
		message.to = "all";
		message.email = "${login.email}";
		
		//메시지 전송
		sock.send(JSON.stringify(message));
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
			message.type = "all";
			message.to = "all";
			message.email = "${login.email}";
			
			var to = $('#to').val();
			
			if(to!=""){
				message.type="one";
				message.to = to;
			}
			
			console.log(to);
			//메시지 전송
			sock.send(JSON.stringify(message));
			
			$('#chatMessage').append(message.type + ' / 나 -> ' + $('#message').val() + '<br/>');
			$('#message').val("");
		}
		
	});
	
})
</script>  
</body>
</html>