package dev.mvc.util;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler { 
	
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	
	//�� ���� ������ ������ ����Ʈ ����
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	//WebSocketSession�� �Ű������� �ް� Ŭ���̾�Ʈ�� ����� �� �ش� Ŭ���̾�Ʈ ������ ������ �����۾� Ȯ��.
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		sessionList.add(session); //������ Ŭ���̾�Ʈ ������ sessionList�� add()�� �߰� 
		
		logger.info("{}�����", session.getId());
		
		System.out.println("ä�ù� ������: " + session.getPrincipal().getName());
	}
	
	//for������ ���Ǹ���Ʈ�� �ִ� ��� ���ǵ��� ���鼭 sendMessage()�� �̿��ؼ� �����͸� �ְ� �޴´�.
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		logger.info("{}�� ���� {} ����", session.getId(), message.getPayload());
		
		for(WebSocketSession sess : sessionList){
			sess.sendMessage(new TextMessage("session.getPrincipal().getName()" + "|" + message.getPayload()));
		}
	}
	
	//Ŭ���̾�Ʈ�� ������ ������ ���
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessionList.remove(session); //���Ǹ���Ʈ���� ����
		
		logger.info("{} ���� ����.", session.getId());
		
	}
	
	
	
//	@RequestMapping(value = "/chatting.do", method = RequestMethod.GET)
//	public ModelAndView chat(ModelAndView mv){
//		
//		mv.setViewName("chat/chattingView");
//		
////		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		
////		System.out.println("user name : " + user.getUsername());
//		
//		System.out.println("normal chat page");
//	
////		mv.addObject("userid", user.getUsername());
//		
//		return mv;
//	}
}
