<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/resources/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="/resources/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="/resources/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="/resources/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/resources/img/favicon.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/resources/js/upload.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/resources/scripts/klorofil-common.js"></script>
<style>

#chatClick{
	position:fixed;
	bottom:5%;
	right:5%;
	z-index:999;
}

/* chat */
#chat{
	position:fixed;
	bottom:100;
	right:99;
	z-index:999;
}

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
  position: relative;
  overflow: hidden;
  height:41px;
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
.input-group > span {
	height:50px;
}   

/*---*CHAT*-----*/
#chat .panel-heading{
    background: #519D9E;
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
    background: #D1B6E1;
    border-radius: 8px 8px 0px 8px;
    -webkit-border-radius: 8px 8px 0px 8px;
    color: #fff;
    border-bottom:1px solid #D1B6E1;
}
#chat .base_sent::after{
    top:0px;
    width: 0;
    height: 0;
    border-top:10px solid transparent;
    border-left: 10px solid #D1B6E1;
    
    border-bottom: 0px solid transparent;
    
}
#chat .base_receive .messages{
    background: #9DC8C8;
    border-radius: 0 8px 8px 8px;
    border-bottom:1px solid #9DC8C8;
    color:#fff;
    
}
#chat .base_receive::before{
    width: 0;
    height: 0;
    border-top: 0px solid transparent;
    border-right: 10px solid #9DC8C8;
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

#btn-chat{
	background: #519D9E;
	border: none;
	height: 44px;
	margin-left: 5px;
}
</style>


<body>
<!--헤더-->
<div class="navbar navbar-default navbar-fixed-top">
			<div class="brand" style="height:80px; padding:22px 35px;">
				<a href="userList" style="font-size:24px;">I luv Study</a> 
			</div>
			<div class="container-fluid" style="height:80px;">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>
				
				<!-- =============== 문의 채팅 시작 ====================== -->
<%-- <jsp:include page="/WEB-INF/views/chatting/chatAdmin22.jsp" flush="false" /> --%>
<div id="chatClick" onclick="getChat()" style="cursor:pointer;"><img src="/resources/img/chatchat.png"></div> 

<div class="chatNone" id="chat">      
    <div class="row chat-window col-xs-5 col-md-3" id="chat_window_1" style="margin-left:10px;">
        <div class="col-xs-12 col-md-12">
         	<div class="panel panel-default">
                <div class="panel-heading top-bar" style="padding:0;">
                	<div style="height:40px; line-height:40px;padding-left:20px;">
                		<h4 class="panel-title" style="height:40px; line-height:40px;"><span class="glyphicon glyphicon-comment"></span>&nbsp;1:1 문의하기</h4>
                	</div>
            	</div>
            	
            	<!-- 내용이당 -->
            	<div class="panel-body msg_container_base">
          <!-- ===========예전 내용 가져온당 ============ -->  		
            	
          <!--========== 다 가져왓땅 =============-->  
                </div>
                <!-- 내용끝났땅 -->
                
                <!-- 메시지 작성부분이당 -->
                <div class="panel-footer">
                    <div class="input-group">
<!--                         <input id="btn-input" type="text" class="form-control input-sm chat_input" /> -->
                        <textarea id="btn-input" class="form-control input-sm chat_input"></textarea>
                        <span class="input-group-btn">
                        <button class="btn btn-primary btn-sm" id="btn-chat">전송</button>
                        </span>
                    </div>
                </div>
			</div>
		</div>
	</div>
</div>

<!-- =============== 문의 채팅 끝 ======================  -->
				
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span>${login.id} 님</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="adminDetail?bno=${login.bno}"><i class="lnr lnr-user"></i> <span>정보수정</span></a></li>
								<li><a href="/adminLogout"><i class="lnr lnr-envelope"></i> <span>로그아웃</span></a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
</div>
    <!--메뉴-->

		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<div>
					<ul class="nav">
						<li><a id="userListnav" href="userList" class=""><i class="lnr lnr-user"></i> <span>회원관리</span></a></li>
						<li>
							<a href="#subPages" data-toggle="collapse" class="collapsed" id="studyListsuv"><i class="lnr lnr-pencil"></i> <span>스터디관리</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse">
								<ul class="nav">
									<li><a href="studyList" id="studyListnav">스터디 목록</a></li>
									<li><a href="replyList" id="replyListnav">댓글 관리</a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href="#subPages2" data-toggle="collapse" class="collapsed" id="qnaListsuv"><i class="lnr lnr-cog"></i> <span>사이트관리</span> <i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages2" class="collapse">
								<ul class="nav">
									<li><a href="qnaList" id="qnaListnav">QNA 관리</a></li>
									<li><a href="noticeList" id="noticeListnav">공지사항 등록</a></li>
								</ul>
							</div>
						</li>
						<li><a id="statisticnav" href="statistic" class=""><i class="lnr lnr-chart-bars"></i> <span>통계관리</span></a></li>
						<li><a id="adminListnav" href="adminList" class=""><i class="lnr lnr-text-format"></i> <span>Admin관리</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
 
<script src="/resources/js/sockjs.js"></script>
<script src="/resources/js/sockjs.min.js"></script>



<script>
var receiver="";
function getChat(){
	$.ajax({ 
		type:'POST',
		url:'/chatting/chatAdmin',
			headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"}, 
		dataType:'json',
		data:JSON.stringify({
			
		}),
		success:function(result){ 
			console.log("데려왔따");
			console.log(result);
			
			console.log(result[0].msgRegist);
			
			var message = "";
			
			for(var i=0;i<result.length;i++){
				if(result[i].email != "admin"){
					receiver = result[i].email;
					message = "<div class='row msg_container base_receive'><div class='col-md-10 col-xs-10' style='padding:0;'><div class='messages msg_receive'>"
						+ result[i].message + "<br><time>"
						+ result[i].msgRegist + "</time></div></div></div>";
					$('.msg_container_base').append(message);
				}else{
					message = "<div class='row msg_container base_sent'><div class='col-md-10 col-xs-10' style='padding:0;'><div class='messages msg_sent'>"
						+ result[i].message + "<br><time>"
						+ result[i].msgRegist + "</time></div></div></div>";
					$('.msg_container_base').append(message);
				}
				
				$('.msg_container_base').scrollTop(9999);
			}
		}
	}); //$.ajax 끝
}


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
		$('.msg_container_base').append(evt.data + "<br/>");
		$('.msg_container_base').scrollTop(9999);
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
			message.receiver = receiver;
			message.email = "admin";
			
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

</script>
 
 
</body>
</html>