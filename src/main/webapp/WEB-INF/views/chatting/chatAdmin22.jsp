<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<style>
.col-md-2, .col-md-10{
    padding:0;
}
.panel{
    margin-bottom: 0px;
}
.chat-window{
    bottom:0;
    position:fixed;
    float:right;
    margin-left:10px;
}
.chat-window > div > .panel{
    border-radius: 5px 5px 0 0;
}
.icon_minim{
    padding:2px 10px;
}
.msg_container_base{
  background: #e5e5e5;
  margin: 0;
  padding: 0 10px 10px;
  max-height:300px;
  overflow-x:hidden;
}
.top-bar {
  background: #666;
  color: white;
  padding: 10px;
  position: relative;
  overflow: hidden;
}
.msg_receive{
    padding-left:0;
    margin-left:0;
}
.msg_sent{
    padding-bottom:20px !important;
    margin-right:0;
}
.messages {
  background: white;
  padding: 10px;
  border-radius: 2px;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
  max-width:100%;
}
.messages > p {
    font-size: 13px;
    margin: 0 0 0.2rem 0;
  }
.messages > time {
    font-size: 11px;
    color: #ccc;
}
.msg_container {
    padding: 10px;
    overflow: hidden;
    display: flex;
}
img {
    display: block;
    width: 100%;
}

.base_sent {
  justify-content: flex-end;
  align-items: flex-end;
}

.msg_sent > time{
    float: right;
}

.msg_container_base::-webkit-scrollbar-track
{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
    background-color: #F5F5F5;
}

.msg_container_base::-webkit-scrollbar
{
    width: 12px;
    background-color: #F5F5F5;
}

.msg_container_base::-webkit-scrollbar-thumb
{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
    background-color: #555;
}

.btn-group.dropup{
    position:fixed;
    left:0px;
    bottom:0;
}
</style>
</head>

<body>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<%@ include file="../nav.jsp" %>

<div class="container" style="width:1500px;">      
    <div class="row chat-window col-xs-5 col-md-3" id="chat_window_1">
        <div>
        	<div class="panel panel-default">
                <div class="panel-heading top-bar">
                
                	<div>
                		<h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span>&nbsp;1:1 문의하기</h3>
                	</div>
                
                	<div style="display:inline; float: right;">
                		<a href="#"><span id="minim_chat_window" class="glyphicon glyphicon-minus icon_minim"></span></a>
                		<a href="#"><span class="glyphicon glyphicon-remove icon_close" data-id="chat_window_1"></span></a>
                	</div>
            	</div>
            	
            	<!-- 내용이당 -->
            	<div class="panel-body msg_container_base" style="height:400px;">
          <!-- ===========예전 내용 가져온당 ============ -->  		
            	<c:forEach items="${list}" var="messageVO">	
            		<!-- 보냈당 -->
            	  <c:if test="${messageVO.email ne 'admin'}">
                    <div class="row msg_container base_sent">
                    	<div class="col-md-10 col-xs-10">
                            <div class="messages msg_sent">
                                ${messageVO.message}<br>
                                <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${messageVO.registDate}"/>
                            </div>
                        </div>
                    </div>
                  </c:if>
                     
                     <!-- 받았당 -->   
                 <c:if test="${messageVO.email eq 'admin'}"> 
                    <div class="row msg_container base_receive">
                        <div class="col-md-10 col-xs-10">
                            <div class="messages msg_receive">
                                ${messageVO.message}<br>
                                <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${messageVO.registDate}"/>
                            </div>
                        </div>
                    </div>
                  </c:if>  
              </c:forEach>      
          <!--========== 다 가져왓땅 =============-->  
                </div>
                <!-- 내용끝났땅 -->
                
                <!-- 메시지 작성부분이당 -->
                <div class="panel-footer">
                    <div class="input-group">
                        <input id="btn-input" type="text" class="form-control input-sm chat_input" />
                        <span class="input-group-btn">
                        <button class="btn btn-primary btn-sm" id="btn-chat">Send</button>
                        </span>
                    </div>
                </div>
<%--                 
<h4>chatting page</h4>
메시지 내용 : <input type="text" id="message">
<input type="button" id="sendMessage" value="메시지 보내기">

<c:forEach items="${list}" var="messageVO">
	<c:if test="${messageVO.email ne 'admin'}">
		<div class="chatadmin">${messageVO.message}</div>
		<div class="chatadmin"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${messageVO.registDate}"/></div>
	</c:if>
	
	<c:if test="${messageVO.email eq 'admin'}">
		<div>${messageVO.message}</div>
		<div><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${messageVO.registDate}"/></div>
	</c:if>
</c:forEach>

<div id="chatMessage" style="overFlow: auto; max-height:500px;"></div>

 --%>
				
			</div>
		</div>
	</div>
</div>



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
		/* message = {};
		message.message = "접속하였습니다.";
		message.type="all";
		message.receiver = "all";
		message.email = "${login.email}";
		
		//메시지 전송
		sock.send(JSON.stringify(message)); */
	}
	
	//메시지가 도착하면 호출
	sock.onmessage = function(evt){
		$('#msg_container_base').append(evt.data + "<br/>");
	}
	
	//웹 소켓이 닫히면 호출
	sock.onclose = function(){
		//메시지 전송
		sock.send('채팅을 종료합니다.');
	}
	
	$("#btn-input").keydown(function (key) {
        if (key.keyCode == 13) {
           $("#sendMessage").click();
        }
    });

	$('#btn-chat').click(function(){
		
		if($('#btn-input').val() != ""){
			
			message = {};
			message.message = $('#btn-input').val();
			message.type = "to";
			message.receiver = "admin";
			message.email = "${login.email}";
			
			var time = new Date();
			
			//메시지 전송
			sock.send(JSON.stringify(message));
			
			$('.msg_container_base').append(
					'<div class="row msg_container base_sent"> <div class="col-md-10 col-xs-10"><div class="messages msg_sent">'
					+  $('#btn-input').val() +'<br>' + time.getHours() + ":" + time.getMinutes() +'</div></div></div>');
			$('#btn-input').val("");
		}
		
	});
	
})


//밑에서부터 테마테마테마
$(document).on('click', '.panel-heading span.icon_minim', function (e) {
    var $this = $(this);
    if (!$this.hasClass('panel-collapsed')) {
        $this.parents('.panel').find('.panel-body').slideUp();
        $this.addClass('panel-collapsed');
        $this.removeClass('glyphicon-minus').addClass('glyphicon-plus');
    } else {
        $this.parents('.panel').find('.panel-body').slideDown();
        $this.removeClass('panel-collapsed');
        $this.removeClass('glyphicon-plus').addClass('glyphicon-minus');
    }
});
$(document).on('focus', '.panel-footer input.chat_input', function (e) {
    var $this = $(this);
    if ($('#minim_chat_window').hasClass('panel-collapsed')) {
        $this.parents('.panel').find('.panel-body').slideDown();
        $('#minim_chat_window').removeClass('panel-collapsed');
        $('#minim_chat_window').removeClass('glyphicon-plus').addClass('glyphicon-minus');
    }
});
$(document).on('click', '#new_chat', function (e) {
    var size = $( ".chat-window:last-child" ).css("margin-left");
     size_total = parseInt(size) + 400;
    alert(size_total);
    var clone = $( "#chat_window_1" ).clone().appendTo( ".container" );
    clone.css("margin-left", size_total);
});
$(document).on('click', '.icon_close', function (e) {
    //$(this).parent().parent().parent().parent().remove();
    $( "#chat_window_1" ).remove();
});


</script>  
</body>
</html>