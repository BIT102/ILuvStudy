<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
 <title>채팅 문의 관리</title>
<style>

 
/* chat */
#chat{
	float:right;
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
  background: #00AAFF;
  color: white;
  position: relative;
  overflow: hidden;
  height:41px;
  padding:0;
  box-shadow:0 1px 1px;
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
    background: #00AAFF;
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
    background: #40b4e5;
    border-radius: 8px 8px 0px 8px;
    -webkit-border-radius: 8px 8px 0px 8px;
    color: #fff;
    border-bottom:1px solid #40b4e5;
}
#chat .base_sent::after{
    top:0px;
    width: 0;
    height: 0;
    border-top:10px solid transparent;
    border-left: 10px solid #40b4e5;
    
    border-bottom: 0px solid transparent;
    
}
#chat .base_receive .messages{
    background: #EEF1F4;
    border-radius: 0 8px 8px 8px;
    border-bottom:1px solid #EEF1F4;
    color:#516378;
    
}
#chat .base_receive::before{
    width: 0;
    height: 0;
    border-top: 0px solid transparent;
    border-right: 10px solid #EEF1F4;
    border-bottom: 10px solid transparent;
}


#chat .msg_container_base{
    background:#fff;
}
.msg_receive > time{
	color:#516378;
	font-style: italic;
}
.msg_sent > time{
	color:#fff;
	font-style: italic;
}

.chatBlock{
display:block;
}

.chatNone{
display:none;
}

#btn-chat{
	background: #00AAFF;
	border: none;
	height: 44px;
	margin-left: 5px;
}
.chatClick{
cursor:pointer;
text-aligh:left;
padding:8px 10px 5px;
border-bottom:1px solid #ddd;
}

.msg_container_base{
height:400px;
}
.chat-list{
height:475px;
overflow:auto;
}
</style>
</head>

<body>
<div id="wrapper">
<%@ include file="../admin/nav.jsp" %>
<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">채팅문의 관리</h3>
					<div class="row">
						<div class="col-md-12">
    						<div class="panel">

<!-- 			<div class="panel-heading">
				<h3 class="panel-title">1:1문의 관리</h3>
			</div> -->

			<div class="panel-body">
			
<!--========= 문의 채팅 리스트 ============-->
    <div class="row chat-window col-xs-12 col-md-12" id="chat_window_1" style="margin-left:10px;">
         <div class="col-md-5" style="padding:0;">
         	  <div class="top-bar">
                	<div style="height:40px; line-height:40px;padding-left:20px;">
                		<h4 class="panel-title" style="height:40px; line-height:40px;">문의 리스트</h4>
                	</div>
              </div>
			<div class="chat-list">
		<!-- DB데이터 가져옴 -->
			<c:forEach items="${list}" var="messageVO">
				<div class="chatClick" id="${messageVO.bno}">${messageVO.email}<span style="float:right;" class="badge">${messageVO.readCheck}</span></div>
			</c:forEach>
		<!--========= 리스트 끝 ==============-->
        	</div>
         </div>

<!-- =============== 문의 채팅 시작 ====================== -->
<div class="chatBlock col-md-7" id="chat" style="padding:0;">      
                <div class="top-bar">
                	<div style="height:40px; line-height:40px;padding-left:20px;">
                		<h4 class="panel-title" style="height:40px; line-height:40px;"><span class="glyphicon glyphicon-comment"></span>&nbsp;문의내용</h4>
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

<!-- =============== 문의 채팅 끝 ======================  -->
								</div>
							</div>
						</div>
					</div>
					</div>
				</div>
			<!-- END MAIN CONTENT -->
			</div>
		<!-- END MAIN -->
</div>
		
<script src="/resources/js/sockjs.js"></script>
<script src="/resources/js/sockjs.min.js"></script>

<script>
var receiver="";

var sock = null;
var message = {};

$(document).ready(function(){
	$("#qnaListsuv").attr("class", "active");
	$("#chatAdminnav").attr("class", "active");
	$("#subPages2").attr("class", "in");
	
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
	
	//리스트에서 아이디 클릭 시 액션
	$('.chatClick').click(function(){
		
			$('.msg_container_base').html("");  //기존 채팅창 내용 삭제
		//	$('#chat').addClass('chatBlock');	
			
			//ajax로 채팅창 내용 불러옴
			$.ajax({ 
				type:'POST',
				url:'/chatting/chatAdminView/'+$(this).attr('id'),
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"}, 
				dataType:'json',
				data:JSON.stringify({
					bno : $(this).attr('id') 		//클릭한 bno값을 가져감, 클릭한 아이디의 채팅목록 조회
				}),
				success:function(result){ 
					console.log("데려왔따");
					console.log(result);
					
					console.log(result[0].msgRegist);
					
					var message = "";
					
					//채팅 내용 추가
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
						
						$('.msg_container_base').scrollTop(9999);	//스크롤 가장 아래로 내리기
					}
				}
			}); //$.ajax 끝
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