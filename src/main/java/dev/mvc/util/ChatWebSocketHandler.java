package dev.mvc.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import dev.mvc.domain.AdminVO;
import dev.mvc.domain.MessageVO;
import dev.mvc.domain.UserVO;
import dev.mvc.persistence.MessageDAO;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	private Logger logger = LoggerFactory.getLogger(ChatWebSocketHandler.class);

	private List<WebSocketSession> connectedUsers;

	private Map<String, String> users = new ConcurrentHashMap<String, String>();
	
	@Inject
	private MessageDAO dao;
	
	//������ ������ ����ڵ� ����
	public ChatWebSocketHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
	}

	// ���� ���� �̺�Ʈ �޼ҵ� 
	// @param websocketsession ���� �����
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		//HttpSession ������ �����´�
		Map<String, Object> map = session.getAttributes(); 	

		//������ �������� ��� ����
		if(map.get("login") instanceof UserVO){
			System.out.println("user==========");
			UserVO login = (UserVO) map.get("login");
			users.put(session.getId(), login.getEmail());			
			logger.info(login.getEmail() +"�� ����");
		}else{
			AdminVO admin = (AdminVO) map.get("login");
			System.out.println("admin=========================");
			System.out.println(admin);
			users.put(session.getId(), admin.getId());
			logger.info(admin.getId() +"�� ����");
		}
		
		//�� ���� ������ ���̵�, �α����� ����� ���̵� ����ش�
		connectedUsers.add(session);
		
	//	logger.info("���� ip : "+session.getRemoteAddress().getHostName());
	}
	
	// Ŭ���̾�Ʈ�� ������ ���� ����
	// @param websocketsession ������ ���� Ŭ���̾�Ʈ
	// @param closestatus ���� ����(Ȯ�� �ʿ�)
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		logger.info(users.get(session.getId())+" �� ���� ����");
		
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
		
		//payload = ����ڰ� ���� �޽���
		MessageVO messageVO = MessageVO.converMessage(message.getPayload());
		
		logger.info("0");
		
		messageVO.setEmail(users.get(session.getId()));
		messageVO.setMessage(messageVO.getMessage());
		messageVO.setReceiver(messageVO.getReceiver());
		
		logger.info("1");
		
		//�޽��� ���� DB ����
		dao.send(messageVO);
	    
		logger.info("2");
		
	    //����� ��� Ŭ���̾�Ʈ���� �޽��� ����
	     for (WebSocketSession webSocketSession : connectedUsers) {
	    	 
	 		//logger.info("�α��� �� ���̵� : "+ login.getEmail());
	    	//logger.info(login.getEmail()+ " ���� �޽��� ���� "+messageVO.getMessage());
	    	
	 		//��ü �������� ���===========================================
	         if (messageVO.getType().equals("all")) {
	        	//���� ����ڴ� ���� �ʱ� ���� ���ǹ�
	            if (!session.getId().equals(webSocketSession.getId())) {
	                 webSocketSession.sendMessage(
	                         new TextMessage(
	                        		 "<span style='color:green;'> ��ü : "
	                        		+ messageVO.getEmail() + " �� " + messageVO.getMessage()
	                        		+ "</span>"));
	            }
	        //�ӼӸ��� ���===============================================
	         } else { 
	        	 	//to�� ���� users�� �����Ͼ��̵�� ��Ī�� �̸��� ���� �����ͼ� ��
	        	 	if (messageVO.getReceiver().equals(users.get(webSocketSession.getId()))) {
	            		 webSocketSession.sendMessage(
	            				 new TextMessage(
	            						 "<div>" + messageVO.getMessage() + "</div>"));
	            		 break;
	            	 }
	          }
	         //else �� ===================================
	      }
	   }

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {

		log(session.getId() + " �ͼ��� �߻�: " + exception.getMessage());

	}

	private void log(String logmsg) {

		System.out.println(new Date() + " : " + logmsg);

	}

}