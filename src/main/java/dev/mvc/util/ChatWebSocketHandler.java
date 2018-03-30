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
	
	//������ ������ ����ڵ� ����
	public ChatWebSocketHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
		loginList = new ArrayList<String>();
	}

	// ���� ���� �̺�Ʈ �޼ҵ� 
	// @param websocketsession ���� �����
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		Map<String, Object> map = session.getAttributes(); 	
		UserVO login = (UserVO) map.get("login");
			
		users.put(session.getId(), session);
		connectedUsers.add(session);
		logger.info("1");
		
		loginList.add(login.getEmail());
		
		logger.info("2");
		
		logger.info(login.getEmail() +"�� ����");
		logger.info("���� ip : "+session.getRemoteAddress().getHostName());
	}
	
	// Ŭ���̾�Ʈ�� ������ ���� ����
	// @param websocketsession ������ ���� Ŭ���̾�Ʈ
	// @param closestatus ���� ����(Ȯ�� �ʿ�)
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		logger.info(session.getId()+" �� ���� ����");
		
		connectedUsers.remove(session);
		users.remove(session.getId());

	}

	// 2���� �̺�Ʈ ó��
	// 1.send : Ŭ���̾�Ʈ�� �������� �޽��� ����
	// 2.emit : ������ ����Ǿ� �ִ� Ŭ���̾�Ʈ���� �޽��� ����
	// @param websocketsession �޽����� ���� Ŭ���̾�Ʈ
	// @param textmessage �޽����� ����
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
    	//HttpSession�� ����� ���� ������
 		Map<String, Object> map = null;
		
		//payload = ����ڰ� ���� �޽���
		//logger.info(session.getId()+ " ���� �޽��� ���� "+message.getPayload());
		
		MessageVO messageVO = MessageVO.converMessage(message.getPayload());
	    String hostName = "";
	     
	   //����� ��� Ŭ���̾�Ʈ���� �޽��� ����
	     for (WebSocketSession webSocketSession : connectedUsers) {
	    	 
	    	//HttpSession�� ����� ���� ������ 
	    	map = session.getAttributes();
			UserVO login = (UserVO) map.get("login");
	 		
			//UserVO vo = new UserVO();
			
			System.out.println("1---------");
			System.out.println(loginList);
			System.out.println("2-----------");
			System.out.println(connectedUsers);
			System.out.println();
			
	 		//logger.info("�α��� �� ���̵� : "+ login.getEmail());
	 		
	    	//logger.info(login.getEmail()+ " ���� �޽��� ���� "+messageVO.getMessage());
	    	
	 		//��ü �������� ���
	         if (messageVO.getType().equals("all")) {
	        	 
	        	//���� ����ڴ� ���� �ʱ� ���� ���ǹ�
	            if (!session.getId().equals(webSocketSession.getId())) {
	                 webSocketSession.sendMessage(
	                         new TextMessage(
	                        		 "<span style='color:green;'> ��ü : "
	                        		+ messageVO.getEmail() + " �� " + messageVO.getMessage()
	                        		+ "</span>"));
	            }
	             
	         } else { //�ӼӸ��� ���
	             hostName = webSocketSession.getRemoteAddress().getHostName();
	        	 
	        	 //logger.info(login.getEmail());
	             //logger.info(messageVO.getTo());
	             //to�� �Է��� �ؽ�Ʈ�� �̸����� ���� ��� ����
	             //System.out.println("1111111111111111111111");
	             //System.out.println(loginList);
	             
	             for(int i=0;i<loginList.size();i++){
	            	 logger.info("2222222222222222222");
	            	 logger.info(loginList.get(i));
	            	 logger.info(messageVO.getTo());
	            	 logger.info(login.getEmail());
	            	 logger.info("======================");
	            	 //to�� ��� ���� loginList�� �ִ� ����� ���� ���
	            	 if (messageVO.getTo().equals(loginList.get(i).equals(login.getEmail()))) {
	            		 logger.info("33333333333");
	            		 logger.info(messageVO.getTo());
	            		 logger.info(loginList.get(i));
	            		 logger.info("------------------------");
	            		 
	            		 //to�� �ۼ��� ������׸� �޽��� ���۵ǵ��� ó�� �ʿ�
	            		 
	            		 webSocketSession.sendMessage(
	            				 new TextMessage(
	            						 "<span style='color:red; font-weight: bold;' > �ӼӸ� : "
	            								 + messageVO.getEmail() + "�� " + messageVO.getMessage()
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
	      roomVO.setCLASS_class_id(messageVO.getCLASS_class_id()); //Ŭ����
	      roomVO.setTUTOR_USER_user_id(messageVO.getTUTOR_USER_user_id()); //Ʃ��
	      roomVO.setUSER_user_id(messageVO.getUSER_user_id()); //����

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

	         //�޴»��
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

		log(session.getId() + " �ͼ��� �߻�: " + exception.getMessage());

	}

	private void log(String logmsg) {

		System.out.println(new Date() + " : " + logmsg);

	}

}