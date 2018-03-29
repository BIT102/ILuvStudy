package dev.mvc.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import dev.mvc.domain.MessageVO;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	private Logger logger = LoggerFactory.getLogger(ChatWebSocketHandler.class);
	
/*	@Inject
	private ChatDAO dao;*/

	private List<WebSocketSession> connectedUsers;

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	
	//서버에 연결한 사용자들 저장
	public ChatWebSocketHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
	}

	// 접속 관련 이벤트 메소드 
	// @param websocketsession 접속 사용자
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		users.put(session.getId(), session);
		connectedUsers.add(session);

		logger.info(session.getId()+"님 접속");
		logger.info("연결 ip : "+session.getRemoteAddress().getHostName());
	}
	
	// 클라이언트가 서버와 연결 종료
	// @param websocketsession 연결을 끊은 클라이언트
	// @param closestatus 연결 상태(확인 필요)
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		logger.info(session.getId()+" 님 접속 종료");
		
		connectedUsers.remove(session);
		users.remove(session.getId());

	}

	// 2가지 이벤트 처리
	// 1.send : 클라이언트가 서버에게 메시지 보냄
	// 2.emit : 서버에 연결되어 있는 클라이언트에게 메시지 보냄
	// @param websocketsession 메시지를 보낸 클라이언트
	// @param textmessage 메시지의 내용
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//payload = 사용자가 보낸 메시지
		logger.info(session.getId()+ " 님이 메시지 전송 "+message.getPayload());
		
		 MessageVO messageVO = MessageVO.converMessage(message.getPayload());
	     String hostName = "";
	     
	   //연결된 모든 클라이언트에게 메시지 전송
	     for (WebSocketSession webSocketSession : connectedUsers) {
	         if (messageVO.getType().equals("all")) {
	        	//보낸 사용자는 받지 않기 위한 조건문
	             if (!session.getId().equals(webSocketSession.getId())) {
	                 webSocketSession.sendMessage(
	                         new TextMessage(session.getRemoteAddress().getHostName() + " ▶ " + messageVO.getMessage()));
	             }
	         } else {
	             hostName = webSocketSession.getRemoteAddress().getHostName();
	             if (messageVO.getTo().equals(hostName)) {
	                 webSocketSession.sendMessage(
	                         new TextMessage(
	                                 "<span style='color:red; font-weight: bold;' >"
	                                 + session.getRemoteAddress().getHostName() + "▶ " + messageVO.getMessage()
	                                 + "</span>") );
	                 break;
	              }
	          }
	      }


		
/*
		  Map<String, Object> map = null;

	      MessageVO messageVO = MessageVO.convertMessage(message.getPayload());

	      System.out.println("1 : " + messageVO.toString());


	      ChatRoomVO roomVO  = new ChatRoomVO();
	      roomVO.setCLASS_class_id(messageVO.getCLASS_class_id()); //클래스
	      roomVO.setTUTOR_USER_user_id(messageVO.getTUTOR_USER_user_id()); //튜터
	      roomVO.setUSER_user_id(messageVO.getUSER_user_id()); //유저

	      ChatRoomVO croom =null;
	      if(!messageVO.getUSER_user_id().equals(messageVO.getTUTOR_USER_user_id())) {
	    	  System.out.println("a");



	    	  if(dao.isRoom(roomVO) == null ) {
	    		  System.out.println("b");
	    		  dao.createRoom(roomVO);
	    		  System.out.println("d");
	    		  croom = dao.isRoom(roomVO);

	    	  }else {
	    		  System.out.println("C");
	    		  croom = dao.isRoom(roomVO);
	    	  }
	      }else {

    		  croom = dao.isRoom(roomVO);
    	  }

	      messageVO.setCHATROOM_chatroom_id(croom.getChatroom_id());
	      if(croom.getUSER_user_id().equals(messageVO.getMessage_sender())) {

	    	  messageVO.setMessage_receiver(roomVO.getTUTOR_USER_user_id());
	      }else {
	    	  messageVO.setMessage_receiver(roomVO.getUSER_user_id());
	      }




	      for (WebSocketSession websocketSession : connectedUsers) {
	         map = websocketSession.getAttributes();
	         UserVO login = (UserVO) map.get("login");

	         //받는사람
	         if (login.getUser_id().equals(messageVO.getMessage_sender())) {

	            Gson gson = new Gson();
	            String msgJson = gson.toJson(messageVO);
	            websocketSession.sendMessage(new TextMessage(msgJson));
	         }


	      }
	      */
	   }

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {

		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}

	private void log(String logmsg) {

		System.out.println(new Date() + " : " + logmsg);

	}

}