<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>

</head>

<body>
<%@ include file="nav.jsp" %>

<h4>chatting page</h4>
<input type="text" id="message">
<input type="button" id="sendMessage" value="메시지 보내기">

<div id="chatMessage" style="overFlow: auto; max-height:500px;"></div>

<script type="text/javascript" src="/resources/js/sockjs.js"></script>
<script type="text/javascript" src="/resources/js/sockjs.min.js"></script>
<script>

var sock = null;

$(document).ready(function(){
	
	sock = new SockJS("/chat");
	sock.onopen = function(){
		alert("하이 하이");
	}
	sock.onmessage = function(evt){
		$('#chatMessage').append(evt.data + "<br/>");
	}
	sock.onclose = function(){
		sock.send('10.225.152.165 퇴장');
	}
	$('#sendMessage').click(function(){
		if($('#message').val() != ""){
			sock.send("하이하이하이");
			$('#chatMessage').append('나 -> ' + $('#message').val() + '<br/>');
			
			$('#message').val("");
		}
	})
})
</script>  
</body>
</html>