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
import dev.mvc.domain.UserVO;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	private Logger logger = LoggerFactory.getLogger(ChatWebSocketHandler.class);
	
/*	@Inject
	private ChatDAO dao;*/

	private List<WebSocketSession> connectedUsers;

	private List<String> loginList;
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	//서버에 연결한 사용자들 저장
	public ChatWebSocketHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
		loginList = new ArrayList<String>();
	}

	// 접속 관련 이벤트 메소드 
	// @param websocketsession 접속 사용자
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		Map<String, Object> map = session.getAttributes(); 	
		UserVO login = (UserVO) map.get("login");
			
		users.put(session.getId(), session);
		connectedUsers.add(session);
		logger.info("1");
		
		loginList.add(login.getEmail());
		
		logger.info("2");
		
		logger.info(login.getEmail() +"님 접속");
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
		
    	//HttpSession에 저장된 정보 가져옴
 		Map<String, Object> map = null;
		
		//payload = 사용자가 보낸 메시지
		//logger.info(session.getId()+ " 님이 메시지 전송 "+message.getPayload());
		
		MessageVO messageVO = MessageVO.converMessage(message.getPayload());
	    String hostName = "";
	     
	   //연결된 모든 클라이언트에게 메시지 전송
	     for (WebSocketSession webSocketSession : connectedUsers) {
	    	 
	    	//HttpSession에 저장된 정보 가져옴 
	    	map = session.getAttributes();
			UserVO login = (UserVO) map.get("login");
	 		
			//UserVO vo = new UserVO();
			
			System.out.println("1---------");
			System.out.println(loginList);
			System.out.println("2-----------");
			System.out.println(connectedUsers);
			System.out.println();
			
	 		//logger.info("로그인 한 아이디 : "+ login.getEmail());
	 		
	    	//logger.info(login.getEmail()+ " 님이 메시지 전송 "+messageVO.getMessage());
	    	
	 		//전체 보내기인 경우
	         if (messageVO.getType().equals("all")) {
	        	 
	        	//보낸 사용자는 받지 않기 위한 조건문
	            if (!session.getId().equals(webSocketSession.getId())) {
	                 webSocketSession.sendMessage(
	                         new TextMessage(
	                        		 "<span style='color:green;'> 전체 : "
	                        		+ messageVO.getEmail() + " ▶ " + messageVO.getMessage()
	                        		+ "</span>"));
	            }
	             
	         } else { //귓속말인 경우
	             hostName = webSocketSession.getRemoteAddress().getHostName();
	        	 
	        	 //logger.info(login.getEmail());
	             //logger.info(messageVO.getTo());
	             //to에 입력한 텍스트와 이메일이 같은 경우 전송
	             //System.out.println("1111111111111111111111");
	             //System.out.println(loginList);
	             
	             for(int i=0;i<loginList.size();i++){
	            	 logger.info("2222222222222222222");
	            	 logger.info(loginList.get(i));
	            	 logger.info(messageVO.getTo());
	            	 logger.info(login.getEmail());
	            	 logger.info("======================");
	            	 //to에 담김 대상과 loginList에 있는 대상이 같은 경우
	            	 if (messageVO.getTo().equals(loginList.get(i).equals(login.getEmail()))) {
	            		 logger.info("33333333333");
	            		 logger.info(messageVO.getTo());
	            		 logger.info(loginList.get(i));
	            		 logger.info("------------------------");
	            		 
	            		 //to에 작성한 사람한테만 메시지 전송되도록 처리 필요
	            		 
	            		 webSocketSession.sendMessage(
	            				 new TextMessage(
	            						 "<span style='color:red; font-weight: bold;' > 귓속말 : "
	            								 + messageVO.getEmail() + "▶ " + messageVO.getMessage()
	            								 + "</span>"));
	            		 break;
	            	 }
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



	    	  if(dao.isRoom(roomVO) == null ) {
	    		  dao.createRoom(roomVO);
	    		  croom = dao.isRoom(roomVO);

	    	  }else {
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