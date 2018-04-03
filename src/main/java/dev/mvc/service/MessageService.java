package dev.mvc.service;

import java.util.List;

import dev.mvc.domain.MessageVO;

public interface MessageService {
	
	public List<MessageVO> adminMessage(String id) throws Exception;
	public List<MessageVO> adminMessageView() throws Exception;

}
