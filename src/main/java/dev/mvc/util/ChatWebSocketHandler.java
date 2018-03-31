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

	private List<WebSocketSession> connectedUsers;

	private Map<String, String> users = new ConcurrentHashMap<String, String>();
	
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
		UserVO login = (UserVO) map.get("login");
		
		//�� ���� ������ ���̵�, �α����� ����� ���̵� ����ش�
		users.put(session.getId(), login.getEmail());
		connectedUsers.add(session);
		
		logger.info(login.getEmail() +"�� ����");
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
	        	 	if (messageVO.getTo().equals(users.get(webSocketSession.getId()))) {
	            		 webSocketSession.sendMessage(
	            				 new TextMessage(
	            						 "<span style='color:red; font-weight: bold;' > �ӼӸ� : "
	            								 + messageVO.getEmail() + "�� " + messageVO.getMessage()
	            								 + "</span>"));
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