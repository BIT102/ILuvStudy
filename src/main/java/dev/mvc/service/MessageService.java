package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.MessageVO;

public interface MessageService {
	
	public List<MessageVO> adminMessage(String id) throws Exception;
	public List<MessageVO> adminMessageView(int bno) throws Exception;
	public List<MessageVO> adminMessageList() throws Exception;
	
}
