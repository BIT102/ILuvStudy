package dev.mvc.persistence;

import java.util.List;

import dev.mvc.domain.MessageVO;

public interface MessageDAO {
	public void send(MessageVO vo) throws Exception;
	public List<MessageVO> adminMessage(String id) throws Exception;
	public List<MessageVO> adminMessageView(int bno) throws Exception;
	public List<MessageVO> adminMessageList() throws Exception;
	public void adminMessageRead(int bno)throws Exception;
}
