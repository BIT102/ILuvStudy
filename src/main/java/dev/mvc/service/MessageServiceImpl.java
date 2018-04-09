package dev.mvc.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import dev.mvc.domain.MessageVO;
import dev.mvc.persistence.MessageDAO;

@Service
public class MessageServiceImpl implements MessageService{

	@Inject
	private MessageDAO dao;
	
	
	@Override
	public List<MessageVO> adminMessage(String id) throws Exception{
		return dao.adminMessage(id);
	}
	
	@Override
	public List<MessageVO> adminMessageView(int bno) throws Exception{
		return dao.adminMessageView(bno);
	}
	
	@Override
	public List<MessageVO> adminMessageList() throws Exception{
		return dao.adminMessageList();
	}

}
