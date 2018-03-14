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
	
	
	//웹 소켓 세션을 저장할 리스트 생성
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	//WebSocketSession을 매개변수로 받고 클라이언트가 연결된 후 해당 클라이언트 정보를 가져와 연결작업 확인.
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		sessionList.add(session); //접속한 클라이언트 세션을 sessionList에 add()로 추가 
		
		logger.info("{}연결됨", session.getId());
		
		System.out.println("채팅방 입장자: " + session.getPrincipal().getName());
	}
	
	//for문으로 세션리스트에 있는 모든 세션들을 돌면서 sendMessage()를 이용해서 데이터를 주고 받는다.
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		
		for(WebSocketSession sess : sessionList){
			sess.sendMessage(new TextMessage("session.getPrincipal().getName()" + "|" + message.getPayload()));
		}
	}
	
	//클라이언트와 연결이 끊어진 경우
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessionList.remove(session); //세션리스트에서 제거
		
		logger.info("{} 연결 끊김.", session.getId());
		
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
