<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
    width:350px;
}
.icon_minim{
    padding:2px 10px;
}
.msg_container_base{
  background: #e5e5e5;
  margin: 0;
  padding: 0 10px 10px;
  max-height:400px;
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
.messages {
    font-size: 13px;
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

.avatar {
    position: relative;
}
.base_receive > .avatar:after {
    content: "";
    position: absolute;
    top: 0;
    right: 0;
    width: 0;
    height: 0;
    border: 5px solid #FFF;
    border-left-color: rgba(0, 0, 0, 0);
    border-bottom-color: rgba(0, 0, 0, 0);
}

.base_sent {
  justify-content: flex-end;
  align-items: flex-end;
}
.base_sent > .avatar:after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    width: 0;
    height: 0;
    border: 5px solid white;
    border-right-color: transparent;
    border-top-color: transparent;
    box-shadow: 1px 1px 2px rgba(black, 0.2); 
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
.input-group > textarea {
	padding:5px;
	resize:none;
	height:70px;
	background-color:white;
}   
.input-group > span,button {
	height:50px;
}   

/*---*CHAT*-----*/
#chat .panel-heading{
    background-image: url(http://www.caixa.gov.br/Style%20Library/images/bg_destaqueInternas.jpg);
    background-position: center 30%;
}
#chat .panel-heading, #chat .panel-heading a {
    color:#fff ;
}
#chat .messages{
    box-shadow:none;
    background: #f3f5f9;
    
}
#chat .base_sent .messages{
    background: #2DADB0;
    border-radius: 8px 8px 0px 8px;
    -webkit-border-radius: 8px 8px 0px 8px;
    color: #fff;
    border-bottom:1px solid #108BB4;
}
#chat .base_sent::after{
    top:0px;
    width: 0;
    height: 0;
    border-top:10px solid transparent;
    border-left: 10px solid #2DADB0;
    border-bottom: 0px solid transparent;
    
}
#chat .base_receive .messages{
    background: #f3f5f9;
    border-radius: 0 8px 8px 8px;
    border-bottom:1px solid #ccc;
    
}
#chat .base_receive::before{
    width: 0;
    height: 0;
    border-top: 0px solid transparent;
    border-right: 10px solid #f3f5f9;
    border-bottom: 10px solid transparent;
}

#chat .msg_container_base{
    background:#fff;
}
#chat time{ color:#fff; font-style: italic; }


.chatBlock{
display:block;
}

.chatNone{
display:none;
}

</style>
</head>

<body>

<%-- <%@ include file="../nav.jsp"%>

<div id="chatClick"><img src="/resources/img/chatchat.png"></div> --%>

<div class="chatNone" id="chat">      
    <div class="row chat-window col-xs-5 col-md-3" id="chat_window_1" style="margin-left:10px;">
        <div class="col-xs-12 col-md-12">
         	<div class="panel panel-default">
                <div class="panel-heading top-bar">
                
                	<div style="display:inline;">
                		<h4 class="panel-title" style="display:inline;"><span class="glyphicon glyphicon-comment"></span>&nbsp;1:1 문의하기</h4>
                	</div>
                
          <!--       	<div style="display:inline; float: right;">
                		<a href="#"><span class="glyphicon glyphicon-minus icon_minim"></span></a>
                		<a href="#"><span class="glyphicon glyphicon-remove icon_close" data-id="chat_window_1"></span></a>
                	</div> -->
            	</div>
            	
            	<!-- 내용이당 -->
            	<div class="panel-body msg_container_base">
          <!-- ===========예전 내용 가져온당 ============ -->  		
            	<c:forEach items="${list}" var="messageVO">	
            		<!-- 보냈당 -->
            	  <c:if test="${messageVO.email ne 'admin'}">
                    <div class="row msg_container base_sent">
                    	<div class="col-md-10 col-xs-10" style="padding:0;">
                            <div class="messages msg_sent">
                                ${messageVO.message}<br>
                                <time><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${messageVO.registDate}"/></time>
                            </div>
                       </div>
                    </div>
                  </c:if>
                  
                     <!-- 받았당 -->   
                 <c:if test="${messageVO.email eq 'admin'}"> 
                    <div class="row msg_container base_receive">
                        <div class="col-md-10 col-xs-10" style="padding:0;">
                            <div class="messages msg_receive">
                                ${messageVO.message}<br>
                                <time style="color:black;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${messageVO.registDate}"/></time>
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
<!--                         <input id="btn-input" type="text" class="form-control input-sm chat_input" /> -->
                        <textarea id="btn-input" class="form-control input-sm chat_input"></textarea>
                        <span class="input-group-btn">
                        <button class="btn btn-primary btn-sm" id="btn-chat">Send</button>
                        </span>
                    </div>
                </div>
			</div>
		</div>
	</div>
</div>



<script src="/resources/js/sockjs.js"></script>
<script src="/resources/js/sockjs.min.js"></script>
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
           $("#btn-chat").click();
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
					'<div class="row msg_container base_sent"> <div class="col-md-10 col-xs-10" style="padding:0;"><div class="messages msg_sent">'
					+  $('#btn-input').val() +'<br><time>' + time.getHours() + ":" + time.getMinutes() +'</time></div></div></div>');
			$('#btn-input').val("");
			$('.msg_container_base').scrollTop(9999);
		}
		
	});
	
	$('#chatClick').click(function(){
		if($('#chat').hasClass('chatNone')){
			$('#chat').removeClass('chatNone');
			$('#chat').addClass('chatBlock');	
			$('.msg_container_base').scrollTop(9999);
		}else{
			$('#chat').removeClass('chatBlock');
			$('#chat').addClass('chatNone');	
		}
		
	});
	
	
})


//밑에서부터 테마테마테마
/* $(document).on('click', '.panel-heading span.icon_minim', function (e) { */
/* $(document).on('click', '.icon_minim', function (e) {
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
}); */
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
/* $(document).on('click', '.icon_close', function (e) {
    //$(this).parent().parent().parent().parent().remove();
    $( "#chat_window_1" ).remove();
}); */





</script>  
</body>
</html>